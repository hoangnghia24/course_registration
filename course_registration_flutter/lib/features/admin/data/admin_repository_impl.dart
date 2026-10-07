import 'dart:convert';

import 'package:course_registration_client/course_registration_client.dart';

import '../../../core/database/app_database.dart';
import '../domain/repositories/admin_repository.dart';

class AdminRepositoryImpl implements AdminRepository {
  AdminRepositoryImpl(this._client, this._database);
  final Client _client;
  final AppDatabase _database;

  @override
  Future<List<AdminUserDto>> getUsers() => _client.admin.getUsers();
  @override
  Future<AdminUserDto> createUser({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phone,
  }) => _client.admin.createUser(
    email: email,
    password: password,
    fullName: fullName,
    role: role,
    phone: phone,
  );
  @override
  Future<AdminUserDto> updateUser(
    UuidValue userId,
    String fullName,
    String? phone,
  ) => _client.admin.updateUser(
    userId: userId,
    fullName: fullName,
    phone: phone,
  );
  @override
  Future<bool> disableUser(UuidValue userId) =>
      _client.admin.disableUser(userId: userId);
  @override
  Future<bool> enableUser(UuidValue userId) =>
      _client.admin.enableUser(userId: userId);

  @override
  Future<List<Course>> getCourses() async {
    try {
      final values = await _client.admin.getCourses();
      await _database.cacheAdminCourses(_encode(values));
      return values;
    } catch (_) {
      final cached = await _database.readAdminCourses();
      if (cached == null) rethrow;
      return _decode(cached.payload, Course.fromJson);
    }
  }

  @override
  Future<Course> createCourse(
    String name,
    int credits,
    CourseType type,
  ) => _client.admin.createCourse(
    courseName: name,
    credits: credits,
    courseType: type,
  );

  @override
  Future<Course> updateCourse(Course course) => _client.admin.updateCourse(
    courseId: course.id!,
    courseCode: course.courseCode,
    courseName: course.courseName,
    credits: course.credits,
    courseType: course.courseType,
    description: course.description,
    categoryId: course.categoryId,
  );

  @override
  Future<bool> deleteCourse(UuidValue courseId) =>
      _client.admin.deleteCourse(courseId: courseId);
  @override
  Future<List<TrainingProgram>> getPrograms() =>
      _client.admin.getTrainingPrograms();
  @override
  Future<List<Major>> getMajors() => _client.admin.getMajors();
  @override
  Future<List<TrainingProgramCourse>> getProgramCourses(UuidValue programId) =>
      _client.admin.getProgramCourses(programId: programId);
  @override
  Future<List<CoursePrerequisite>> getPrerequisites() =>
      _client.admin.getPrerequisites();
  @override
  Future<List<CourseEquivalent>> getEquivalents() =>
      _client.admin.getEquivalents();
  @override
  Future<List<PendingClassApprovalDto>> getPendingClasses() =>
      _client.admin.getPendingClasses();
  @override
  Future<void> decideClass(
    UuidValue classId,
    bool approve,
    String? comment,
  ) async {
    if (approve) {
      await _client.admin.approveClass(
        courseClassId: classId,
        comment: comment,
      );
    } else {
      await _client.admin.rejectClass(
        courseClassId: classId,
        comment: comment,
      );
    }
  }

  @override
  Future<List<ClassAdjustmentRequestDto>> getAdjustmentRequests({
    ClassAdjustmentStatus? status,
  }) => _client.admin.getAdjustmentRequests(status: status);

  @override
  Future<ClassAdjustmentRequestDto> decideAdjustmentRequest({
    required UuidValue requestId,
    required bool approve,
    String? rejectReason,
  }) => _client.admin.decideAdjustmentRequest(
    requestId: requestId,
    approve: approve,
    rejectReason: rejectReason,
  );

  @override
  Future<List<RegistrationPeriodDto>> getRegistrationPeriods() =>
      _client.admin.getRegistrationPeriods();

  @override
  Future<RegistrationPeriodDto> updateRegistrationPeriod({
    required UuidValue semesterId,
    required DateTime startTime,
    required DateTime endTime,
  }) => _client.admin.updateRegistrationPeriod(
    semesterId: semesterId,
    startTime: startTime,
    endTime: endTime,
  );

  @override
  Future<AnalyticsReportDto> getReports() async {
    try {
      final value = await _client.admin.getReports();
      final payload = jsonEncode(value.toJson());
      await _database.cacheAdminReport(payload);
      await _database.cacheAdminDashboard(payload);
      return value;
    } catch (_) {
      final cached = await _database.readAdminReport();
      if (cached == null) rethrow;
      return AnalyticsReportDto.fromJson(
        jsonDecode(cached.payload) as Map<String, dynamic>,
      );
    }
  }

  @override
  Future<List<AuditLogDto>> getAuditLogs() => _client.admin.getAuditLogs();

  String _encode(List<dynamic> values) =>
      jsonEncode(values.map((value) => value.toJson()).toList());
  List<T> _decode<T>(String payload, T Function(Map<String, dynamic>) parser) =>
      (jsonDecode(payload) as List<dynamic>)
          .map((value) => parser(value as Map<String, dynamic>))
          .toList(growable: false);
}
