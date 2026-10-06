import 'dart:async';
import 'dart:convert';

import 'package:course_registration_client/course_registration_client.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/sync_manager.dart';
import '../domain/repositories/course_registration_repository.dart';

class CourseRegistrationRepositoryImpl implements CourseRegistrationRepository {
  CourseRegistrationRepositoryImpl(
    this._client,
    this._database,
    this._syncManager,
  );

  final Client _client;
  final AppDatabase _database;
  final SyncManager _syncManager;

  @override
  Future<Semester> getCurrentSemester() async {
    final cached = await _database.readCurrentSemester();
    if (cached != null) {
      unawaited(_syncManager.synchronize());
      return Semester.fromJson(
        jsonDecode(cached.payload) as Map<String, dynamic>,
      );
    }
    try {
      final semester = await _client.courseRegistration.getCurrentSemester();
      await _database.cacheCurrentSemester(jsonEncode(semester.toJson()));
      return semester;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<OpenCourseClassDto>> getOpenClasses(
    UuidValue semesterId,
  ) async {
    final key = semesterId.toString();
    final cached = await _database.readOpenClasses(key);
    if (cached != null) {
      unawaited(_syncManager.synchronize());
      return _decodeList(cached.payload, OpenCourseClassDto.fromJson);
    }
    try {
      final classes = await _client.courseRegistration.getOpenClasses(
        semesterId: semesterId,
      );
      await _database.cacheOpenClasses(
        key,
        jsonEncode(classes.map((item) => item.toJson()).toList()),
      );
      return classes;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<RegisteredCourseDto>> getMyCourses(
    UuidValue semesterId,
  ) async {
    final key = semesterId.toString();
    final cached = await _database.readRegisteredCourses(key);
    if (cached != null) {
      unawaited(_syncManager.synchronize());
      return _decodeList(cached.payload, RegisteredCourseDto.fromJson);
    }
    try {
      final courses = await _client.courseRegistration.getMyCourses(
        semesterId: semesterId,
      );
      await _database.cacheRegisteredCourses(
        key,
        jsonEncode(courses.map((item) => item.toJson()).toList()),
      );
      return courses;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<EligibilityResultDto> checkEligibility(
    UuidValue courseClassId,
  ) async {
    if (await _syncManager.isOnline) {
      return await _client.courseRegistration.checkEligibility(
        courseClassId: courseClassId,
      );
    }
    final semester = await getCurrentSemester();
    final classesCache = await _database.readOpenClasses(
      semester.id.toString(),
    );
    final registeredCache = await _database.readRegisteredCourses(
      semester.id.toString(),
    );
    if (classesCache == null || registeredCache == null) {
      throw StateError('Không có dữ liệu cache để kiểm tra offline.');
    }
    final classes = _decodeList(
      classesCache.payload,
      OpenCourseClassDto.fromJson,
    );
    final courseClass = classes.firstWhere(
      (item) => item.courseClassId == courseClassId,
    );
    final registered = _decodeList(
      registeredCache.payload,
      RegisteredCourseDto.fromJson,
    );
    return _cachedEligibility(courseClass, registered);
  }

  @override
  Future<RegistrationResultDto> registerCourse(UuidValue courseClassId) async {
    final online = await _syncManager.isOnline;
    final operationId = await _syncManager.enqueue(
      action: 'REGISTER_COURSE',
      entity: 'COURSE_REGISTRATION',
      entityId: courseClassId.toString(),
      operationType: 'CREATE',
      data: {'courseClassId': courseClassId.toString()},
      registrationAction: true,
    );
    if (online) await _syncManager.synchronize();
    final operation = await _database.operationById(operationId);
    if (operation?.status == 'SYNCED') {
      return RegistrationResultDto(
        success: true,
        message: 'Đăng ký học phần thành công.',
      );
    }
    if (operation?.status == 'FAILED' || operation?.status == 'CONFLICT') {
      return RegistrationResultDto(
        success: false,
        errorCode: operation?.errorCode,
        message: operation?.lastError ?? 'Yêu cầu đăng ký bị từ chối.',
      );
    }
    return RegistrationResultDto(
      success: false,
      errorCode: 'PENDING_SYNC',
      message: 'Yêu cầu đăng ký đang chờ đồng bộ.',
    );
  }

  @override
  Future<RegistrationResultDto> cancelCourse(UuidValue registrationId) async {
    final online = await _syncManager.isOnline;
    final operationId = await _syncManager.enqueue(
      action: 'CANCEL_COURSE',
      entity: 'COURSE_REGISTRATION',
      entityId: registrationId.toString(),
      registrationId: registrationId.toString(),
      operationType: 'DELETE',
      data: {'registrationId': registrationId.toString()},
      registrationAction: true,
    );
    if (online) await _syncManager.synchronize();
    final operation = await _database.operationById(operationId);
    if (operation?.status == 'SYNCED') {
      return RegistrationResultDto(
        success: true,
        message: 'Hủy đăng ký học phần thành công.',
      );
    }
    if (operation?.status == 'FAILED' || operation?.status == 'CONFLICT') {
      return RegistrationResultDto(
        success: false,
        errorCode: operation?.errorCode,
        message: operation?.lastError ?? 'Yêu cầu hủy bị từ chối.',
      );
    }
    return RegistrationResultDto(
      success: false,
      errorCode: 'CANCEL_PENDING',
      message: 'Yêu cầu hủy đang chờ đồng bộ.',
    );
  }

  @override
  Future<void> createOpeningRequest(UuidValue courseId, String reason) async {
    await _client.courseRegistration.createOpeningRequest(
      courseId: courseId,
      reason: reason,
    );
  }

  List<T> _decodeList<T>(
    String payload,
    T Function(Map<String, dynamic>) fromJson,
  ) => (jsonDecode(payload) as List<dynamic>)
      .map((item) => fromJson(item as Map<String, dynamic>))
      .toList(growable: false);

  EligibilityResultDto _cachedEligibility(
    OpenCourseClassDto courseClass,
    List<RegisteredCourseDto> registered,
  ) {
    final currentCredits = registered.fold<int>(
      0,
      (total, item) => total + item.credits,
    );
    final capacityAvailable =
        courseClass.remainingSeats > 0 &&
        courseClass.status == CourseClassStatus.open;
    final withinCreditLimit = currentCredits + courseClass.credits <= 25;
    final duplicate = registered.any(
      (item) => item.courseCode == courseClass.courseCode,
    );
    final scheduleAvailable = !registered.any(
      (item) => item.schedules.any(
        (current) => courseClass.schedules.any(
          (next) =>
              current.dayOfWeek == next.dayOfWeek &&
              next.startPeriod <= current.endPeriod &&
              current.startPeriod <= next.endPeriod,
        ),
      ),
    );
    final messages = <String>[
      if (!capacityAvailable) 'Lớp học đã đủ sĩ số.',
      if (!withinCreditLimit) 'Đã vượt quá số tín chỉ tối đa.',
      if (duplicate) 'Bạn đã đăng ký môn học này.',
      if (!scheduleAvailable) 'Môn học bị trùng lịch.',
      if (!courseClass.inTrainingProgram)
        'Môn học không thuộc ngành hoặc chương trình đào tạo.',
    ];
    return EligibilityResultDto(
      eligible: messages.isEmpty,
      prerequisitePassed: true,
      scheduleAvailable: scheduleAvailable,
      withinCreditLimit: withinCreditLimit,
      inTrainingProgram: courseClass.inTrainingProgram,
      equivalentAvailable: true,
      capacityAvailable: capacityAvailable,
      currentCredits: currentCredits,
      projectedCredits: currentCredits + courseClass.credits,
      minimumCredits: 10,
      maximumCredits: 25,
      messages: messages,
    );
  }
}
