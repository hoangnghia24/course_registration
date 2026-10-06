import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../../generated/protocol.dart';
import '../../registration/services/course_registration_service.dart';
import 'conflict_resolver.dart';
import 'sync_error_codes.dart';

abstract final class SyncService {
  static Future<List<SyncOperationResultDto>> pushOperations(
    Session session,
    List<SyncOperationInputDto> operations,
  ) async {
    final ordered = [...operations];
    final results = <SyncOperationResultDto>[];
    for (final operation in ordered) {
      results.add(await _processOne(session, operation));
    }
    return results;
  }

  static Future<SyncOperationResultDto> _processOne(
    Session session,
    SyncOperationInputDto operation,
  ) async {
    final duplicate = await ProcessedSyncOperation.db.findFirstRow(
      session,
      where: (table) => table.operationId.equals(operation.operationId),
    );
    if (duplicate != null) return _resultFromStored(duplicate);

    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      return _errorResult(
        operation.operationId,
        SyncErrorCodes.authRequired,
        'Phiên đăng nhập đã hết hạn.',
      );
    }
    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (user?.id == null || !user!.isActive) {
      return _errorResult(
        operation.operationId,
        SyncErrorCodes.authRequired,
        'Tài khoản không còn khả dụng.',
      );
    }

    try {
      return await session.db.transaction((transaction) async {
        final concurrentDuplicate = await ProcessedSyncOperation.db
            .findFirstRow(
              session,
              transaction: transaction,
              where: (table) => table.operationId.equals(operation.operationId),
              lockMode: LockMode.forUpdate,
            );
        if (concurrentDuplicate != null) {
          return _resultFromStored(concurrentDuplicate);
        }

        if (operation.baseVersion != null && operation.entityId != null) {
          final priorChanges = await SyncChange.db.find(
            session,
            transaction: transaction,
            where: (table) =>
                table.entityType.equals(operation.entityType) &
                table.entityId.equals(operation.entityId!),
          );
          priorChanges.sort((a, b) => b.changedAt.compareTo(a.changedAt));
          if (priorChanges.isNotEmpty &&
              priorChanges.first.serverVersion != operation.baseVersion) {
            return _persistResult(
              session,
              transaction,
              user,
              operation,
              status: SyncOperationStatus.CONFLICT,
              errorCode: SyncErrorCodes.versionConflict,
              errorMessage: 'Dữ liệu máy chủ đã thay đổi từ lần đồng bộ trước.',
            );
          }
        }

        final student = await Student.db.findFirstRow(
          session,
          transaction: transaction,
          where: (table) => table.userId.equals(user.id),
        );
        if (student?.id == null) {
          return _persistResult(
            session,
            transaction,
            user,
            operation,
            status: SyncOperationStatus.FAILED,
            errorCode: SyncErrorCodes.permissionDenied,
            errorMessage: 'Chỉ sinh viên được đồng bộ đăng ký học phần.',
          );
        }

        final payload = jsonDecode(operation.payload) as Map<String, dynamic>;
        RegistrationResultDto mutationResult;
        if (operation.entityType == 'COURSE_REGISTRATION' &&
            operation.operationType == 'CREATE') {
          mutationResult =
              await CourseRegistrationService.registerCourseInTransaction(
                session,
                transaction: transaction,
                student: student!,
                courseClassId: UuidValue.withValidation(
                  payload['courseClassId'] as String,
                ),
                deviceInfo: 'sync:${operation.clientId}',
              );
        } else if (operation.entityType == 'COURSE_REGISTRATION' &&
            operation.operationType == 'DELETE') {
          mutationResult =
              await CourseRegistrationService.cancelCourseInTransaction(
                session,
                transaction: transaction,
                student: student!,
                registrationId: UuidValue.withValidation(
                  payload['registrationId'] as String,
                ),
                deviceInfo: 'sync:${operation.clientId}',
              );
        } else {
          return _persistResult(
            session,
            transaction,
            user,
            operation,
            status: SyncOperationStatus.FAILED,
            errorCode: SyncErrorCodes.validationError,
            errorMessage: 'Loại thao tác đồng bộ không được hỗ trợ.',
          );
        }

        final errorCode = mutationResult.success
            ? null
            : mutationResult.errorCode ?? SyncErrorCodes.validationError;
        return _persistResult(
          session,
          transaction,
          user,
          operation,
          status: ConflictResolver.statusFor(errorCode),
          resultPayload: jsonEncode(mutationResult.toJson()),
          errorCode: errorCode,
          errorMessage: mutationResult.success ? null : mutationResult.message,
          changeEntityId:
              mutationResult.registration?.registrationId.toString() ??
              operation.entityId,
        );
      });
    } on AppException catch (error) {
      final code = _normalizeAppError(error.code);
      return _storeFailure(session, user, operation, code, error.message);
    } catch (error) {
      final duplicateAfterRace = await ProcessedSyncOperation.db.findFirstRow(
        session,
        where: (table) => table.operationId.equals(operation.operationId),
      );
      if (duplicateAfterRace != null) {
        return _resultFromStored(duplicateAfterRace);
      }
      return _errorResult(
        operation.operationId,
        SyncErrorCodes.serverError,
        error.toString(),
      );
    }
  }

  static Future<SyncOperationResultDto> _persistResult(
    Session session,
    Transaction transaction,
    AppUser user,
    SyncOperationInputDto operation, {
    required SyncOperationStatus status,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
    String? changeEntityId,
  }) async {
    final now = DateTime.now().toUtc();
    final version = now.microsecondsSinceEpoch;
    final stored = await ProcessedSyncOperation.db.insertRow(
      session,
      ProcessedSyncOperation(
        operationId: operation.operationId,
        userId: user.id!,
        entityType: operation.entityType,
        entityId: operation.entityId,
        operationType: operation.operationType,
        payload: operation.payload,
        status: status,
        resultPayload: resultPayload,
        errorCode: errorCode,
        errorMessage: errorMessage,
        serverVersion: version,
        createdAt: now,
        updatedAt: now,
      ),
      transaction: transaction,
    );
    await SyncLog.db.insertRow(
      session,
      SyncLog(
        operationId: operation.operationId,
        action: '${operation.operationType}:${operation.entityType}',
        status: status,
        startedAt: now,
        completedAt: now,
        errorCode: errorCode,
        errorMessage: errorMessage,
      ),
      transaction: transaction,
    );
    if (status == SyncOperationStatus.SYNCED && changeEntityId != null) {
      await SyncChange.db.insertRow(
        session,
        SyncChange(
          targetUserId: user.id!,
          entityType: operation.entityType,
          entityId: changeEntityId,
          changeType: operation.operationType,
          payload: resultPayload,
          serverVersion: version,
          changedAt: now,
        ),
        transaction: transaction,
      );
    }
    return _resultFromStored(stored);
  }

  static Future<SyncOperationResultDto> _storeFailure(
    Session session,
    AppUser user,
    SyncOperationInputDto operation,
    String code,
    String message,
  ) => session.db.transaction(
    (transaction) => _persistResult(
      session,
      transaction,
      user,
      operation,
      status: ConflictResolver.statusFor(code),
      errorCode: code,
      errorMessage: message,
    ),
  );

  static Future<PullSyncResultDto> pullChanges(
    Session session, {
    DateTime? lastSyncAt,
  }) async {
    final user = await _authorizedUser(session);
    final changes = await SyncChange.db.find(
      session,
      where: (table) => lastSyncAt == null
          ? table.targetUserId.equals(user.id)
          : table.targetUserId.equals(user.id) & (table.changedAt > lastSyncAt),
      orderBy: (table) => table.changedAt,
    );
    final deleted = changes
        .where((item) => item.changeType == 'DELETE')
        .map((item) => '${item.entityType}:${item.entityId}')
        .toList(growable: false);
    return PullSyncResultDto(
      changes: changes
          .map(
            (item) => SyncChangeDto(
              entityType: item.entityType,
              entityId: item.entityId,
              changeType: item.changeType,
              payload: item.payload,
              serverVersion: item.serverVersion,
              changedAt: item.changedAt,
            ),
          )
          .toList(growable: false),
      deletedEntities: deleted,
      serverTimestamp: DateTime.now().toUtc(),
    );
  }

  static Future<SyncStatusDto> getSyncStatus(Session session) async {
    final user = await _authorizedUser(session);
    final values = await ProcessedSyncOperation.db.find(
      session,
      where: (table) => table.userId.equals(user.id),
    );
    int count(SyncOperationStatus status) =>
        values.where((item) => item.status == status).length;
    values.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return SyncStatusDto(
      pending: count(SyncOperationStatus.PENDING),
      syncing: count(SyncOperationStatus.SYNCING),
      synced: count(SyncOperationStatus.SYNCED),
      failed: count(SyncOperationStatus.FAILED),
      conflict: count(SyncOperationStatus.CONFLICT),
      lastProcessedAt: values.firstOrNull?.updatedAt,
    );
  }

  static Future<SyncOperationResultDto> retryOperation(
    Session session,
    UuidValue operationId,
  ) async {
    final user = await _authorizedUser(session);
    final value = await ProcessedSyncOperation.db.findFirstRow(
      session,
      where: (table) =>
          table.operationId.equals(operationId) & table.userId.equals(user.id),
    );
    if (value == null) {
      return _errorResult(
        operationId,
        SyncErrorCodes.validationError,
        'Không tìm thấy thao tác đồng bộ.',
      );
    }
    return _resultFromStored(value);
  }

  static Future<AppUser> _authorizedUser(Session session) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw AppException(
        code: 'unauthenticated',
        message: 'Phiên đăng nhập đã hết hạn.',
      );
    }
    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (user?.id == null || !user!.isActive) {
      throw AppException(
        code: 'unauthenticated',
        message: 'Tài khoản không còn khả dụng.',
      );
    }
    return user;
  }

  static SyncOperationResultDto _resultFromStored(
    ProcessedSyncOperation value,
  ) => SyncOperationResultDto(
    operationId: value.operationId,
    status: value.status,
    serverVersion: value.serverVersion,
    resultPayload: value.resultPayload,
    errorCode: value.errorCode,
    errorMessage: value.errorMessage,
  );

  static SyncOperationResultDto _errorResult(
    UuidValue operationId,
    String code,
    String message,
  ) => SyncOperationResultDto(
    operationId: operationId,
    status: ConflictResolver.statusFor(code),
    errorCode: code,
    errorMessage: message,
  );

  static String _normalizeAppError(String code) => switch (code) {
    'unauthenticated' || 'account_disabled' => SyncErrorCodes.authRequired,
    'forbidden' || 'student_not_found' => SyncErrorCodes.permissionDenied,
    'class_not_found' => SyncErrorCodes.courseNotOpen,
    _ => SyncErrorCodes.validationError,
  };
}
