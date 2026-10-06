import 'dart:async';
import 'dart:convert';

import 'package:course_registration_client/course_registration_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../network/network_handler.dart';
import '../sync/conflict_resolver.dart';
import '../sync/retry_policy.dart';
import '../sync/sync_models.dart';
import 'app_database.dart';

class SyncManager {
  SyncManager(
    this._client,
    this._database, {
    NetworkHandler? networkHandler,
    String? clientId,
    DateTime Function()? clock,
  }) : _network = networkHandler ?? NetworkHandler(),
       clientId = clientId ?? const Uuid().v4(),
       _clock = clock ?? DateTime.now;

  final Client _client;
  final AppDatabase _database;
  final NetworkHandler _network;
  final DateTime Function() _clock;
  final String clientId;
  final _networkController = StreamController<NetworkStatus>.broadcast();
  final _statusController = StreamController<SyncStatusState>.broadcast();
  StreamSubscription<Object?>? _networkSubscription;
  StreamSubscription<List<SyncQueueData>>? _queueSubscription;
  bool _syncing = false;
  NetworkStatus _networkStatus = NetworkStatus.online;
  SyncStatusState _status = const SyncStatusState();

  Stream<NetworkStatus> get networkStatuses => _networkController.stream;
  Stream<SyncStatusState> get statuses => _statusController.stream;
  NetworkStatus get networkStatus => _networkStatus;
  SyncStatusState get status => _status;
  Future<bool> get isOnline => _network.hasNetwork;

  Future<void> start() async {
    await _database.recoverInterruptedOperations();
    await _publishNetworkStatus();
    _networkSubscription ??= _network.changes.listen((_) async {
      final wasOffline = _networkStatus == NetworkStatus.offline;
      await _publishNetworkStatus();
      if (NetworkTransition.triggersSync(
        wasOffline ? NetworkStatus.offline : NetworkStatus.online,
        _networkStatus,
      )) {
        unawaited(synchronize());
      }
    });
    _queueSubscription ??= _database.watchOperations().listen(_publishQueue);
  }

  Future<String> enqueue({
    required String action,
    required String entity,
    required String operationType,
    required Map<String, Object?> data,
    String? entityId,
    String userId = '',
    int? baseVersion,
    bool registrationAction = false,
    String? registrationId,
  }) async {
    final operationId = const Uuid().v4();
    final payload = jsonEncode(data);
    await _database.enqueueOperation(
      id: operationId,
      action: action,
      entity: entity,
      entityId: entityId,
      operationType: operationType,
      data: payload,
      clientId: clientId,
      userId: userId,
      baseVersion: baseVersion,
    );
    if (registrationAction) {
      await _database.savePendingRegistration(
        operationId: operationId,
        courseClassId: entityId ?? '',
        registrationId: registrationId,
        action: action,
        payload: payload,
      );
    }
    return operationId;
  }

  Future<void> synchronize() async {
    if (_syncing || !await _network.hasNetwork) return;
    await _publishNetworkStatus();
    if (!_client.auth.isAuthenticated) {
      await _markAuthRequired();
      return;
    }
    _syncing = true;
    _setStatus(_status.copyWith(running: true));
    try {
      final user = await _client.profile.current();
      await _cacheUser(user);
      await _pushPendingOperations();
      await _pullChanges(user.id.toString());
      await _refreshRoleCaches(user);
      _setStatus(
        _status.copyWith(
          lastSynchronized: _clock().toUtc(),
          running: false,
        ),
      );
    } catch (error) {
      if (_isAuthenticationError(error)) {
        final refreshed = await _refreshAuthentication();
        if (refreshed) {
          _syncing = false;
          return synchronize();
        }
        await _markAuthRequired();
      }
    } finally {
      _syncing = false;
      _setStatus(_status.copyWith(running: false));
    }
  }

  Future<void> retryOperation(String operationId) async {
    await _database.updateOperationResult(
      id: operationId,
      status: 'PENDING',
      nextRetryAt: _clock().toUtc(),
    );
    await synchronize();
  }

  Future<void> _pushPendingOperations() async {
    final now = _clock().toUtc();
    final pending = (await _database.pendingOperations())
        .where(
          (item) => item.nextRetryAt == null || !item.nextRetryAt!.isAfter(now),
        )
        .toList(growable: false);
    for (final local in pending) {
      await _database.markOperationSyncing(local.id);
      try {
        final results = await _client.sync.pushOperations(
          operations: [
            SyncOperationInputDto(
              operationId: UuidValue.withValidation(local.id),
              entityType: local.entity.toUpperCase(),
              entityId: local.entityId,
              operationType: local.operationType,
              payload: local.data,
              clientId: local.clientId,
              baseVersion: local.baseVersion,
            ),
          ],
        );
        final result = results.single;
        final status = ConflictResolver.localStatus(
          result.status.name,
          result.errorCode,
        );
        if (status == 'AUTH_REQUIRED') {
          final refreshed = await _refreshAuthentication();
          await _database.updateOperationResult(
            id: local.id,
            status: refreshed ? 'PENDING' : 'AUTH_REQUIRED',
            errorCode: result.errorCode,
            errorMessage: result.errorMessage,
          );
          continue;
        }
        await _database.updateOperationResult(
          id: local.id,
          status: status,
          errorCode: result.errorCode,
          errorMessage: ConflictResolver.userMessage(
            result.errorCode,
            result.errorMessage,
          ),
          serverVersion: result.serverVersion,
        );
      } catch (error) {
        await _handleTransientFailure(local, error);
      }
    }
  }

  Future<void> _handleTransientFailure(
    SyncQueueData operation,
    Object error,
  ) async {
    if (_isAuthenticationError(error)) {
      final refreshed = await _refreshAuthentication();
      await _database.updateOperationResult(
        id: operation.id,
        status: refreshed ? 'PENDING' : 'AUTH_REQUIRED',
        errorCode: 'AUTH_REQUIRED',
        errorMessage: 'Cần đăng nhập lại để tiếp tục đồng bộ.',
      );
      return;
    }
    final nextAttempt = operation.attemptCount + 1;
    final exhausted = nextAttempt >= RetryPolicy.maxRetries;
    await _database.updateOperationResult(
      id: operation.id,
      status: exhausted ? 'FAILED' : 'PENDING',
      errorCode: exhausted ? 'NETWORK_ERROR' : null,
      errorMessage: error.toString(),
      nextRetryAt: exhausted
          ? null
          : _clock().toUtc().add(
              RetryPolicy.delayForAttempt(operation.attemptCount),
            ),
      incrementRetry: true,
    );
  }

  Future<void> _pullChanges(String userId) async {
    final lastSyncAt = await _database.lastSyncAt(userId);
    final result = await _client.sync.pullChanges(lastSyncAt: lastSyncAt);
    await _database.applyPullChanges(
      userId,
      result.serverTimestamp,
      () async {
        if (result.changes.any(
          (item) => item.entityType == 'COURSE_REGISTRATION',
        )) {
          await _refreshRegistrationCache();
        }
      },
    );
  }

  Future<void> _cacheUser(AppUser user) async {
    await _database.cacheUser(
      id: user.id.toString(),
      authUserId: user.authUserId.toString(),
      email: user.email,
      fullName: user.fullName,
      phone: user.phone,
      avatar: user.avatar,
      role: user.role.name,
    );
    await _database.cacheSession(
      authUserId: user.authUserId.toString(),
      email: user.email,
      role: user.role.name,
    );
  }

  Future<void> _refreshRoleCaches(AppUser user) async {
    if (user.role == UserRole.student) {
      try {
        await _refreshRegistrationCache();
      } catch (_) {
        // A closed semester does not invalidate profile synchronization.
      }
    }
  }

  Future<void> _refreshRegistrationCache() async {
    final semester = await _client.courseRegistration.getCurrentSemester();
    final semesterId = semester.id!;
    final classes = await _client.courseRegistration.getOpenClasses(
      semesterId: semesterId,
    );
    final registrations = await _client.courseRegistration.getMyCourses(
      semesterId: semesterId,
    );
    await _database.cacheCurrentSemester(jsonEncode(semester.toJson()));
    await _database.cacheOpenClasses(
      semesterId.toString(),
      jsonEncode(classes.map((item) => item.toJson()).toList()),
    );
    await _database.cacheRegisteredCourses(
      semesterId.toString(),
      jsonEncode(registrations.map((item) => item.toJson()).toList()),
    );
  }

  Future<bool> _refreshAuthentication() async {
    try {
      final result = await _client.auth.refreshAuthKey(force: true);
      return result.name == 'success';
    } catch (_) {
      return false;
    }
  }

  Future<void> _markAuthRequired() async {
    for (final operation in await _database.pendingOperations()) {
      await _database.updateOperationResult(
        id: operation.id,
        status: 'AUTH_REQUIRED',
        errorCode: 'AUTH_REQUIRED',
        errorMessage: 'Cần đăng nhập lại để tiếp tục đồng bộ.',
      );
    }
  }

  bool _isAuthenticationError(Object error) {
    final text = error.toString().toLowerCase();
    return text.contains('unauthenticated') ||
        text.contains('unauthorized') ||
        text.contains('auth_required');
  }

  Future<void> _publishNetworkStatus() async {
    _networkStatus = await _network.hasNetwork
        ? NetworkStatus.online
        : NetworkStatus.offline;
    _networkController.add(_networkStatus);
  }

  void _publishQueue(List<SyncQueueData> values) {
    int count(String state) =>
        values.where((item) => item.status == state).length;
    _setStatus(
      _status.copyWith(
        pending: count('PENDING') + count('AUTH_REQUIRED'),
        syncing: count('SYNCING'),
        failed: count('FAILED'),
        synced: count('SYNCED'),
        conflict: count('CONFLICT'),
      ),
    );
  }

  void _setStatus(SyncStatusState value) {
    _status = value;
    _statusController.add(value);
  }

  Future<void> dispose() async {
    await _networkSubscription?.cancel();
    await _queueSubscription?.cancel();
    await _networkController.close();
    await _statusController.close();
  }
}
