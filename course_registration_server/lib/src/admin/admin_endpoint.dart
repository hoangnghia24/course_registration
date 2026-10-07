import 'package:serverpod/serverpod.dart';

import '../auth/role_guards.dart';
import '../generated/protocol.dart';
import 'services/admin_service.dart';

class AdminEndpoint extends AdminGuard {
  Future<List<AdminUserDto>> getUsers(
    Session session, {
    int? page,
    int? pageSize,
  }) => AdminService.getUsers(
    session,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );
  Future<AdminUserDto> createUser(
    Session session, {
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phone,
    int? academicYear,
    UuidValue? majorId,
    UuidValue? trainingProgramId,
  }) => AdminService.createUser(
    session,
    email: email,
    password: password,
    fullName: fullName,
    role: role,
    phone: phone,
    academicYear: academicYear,
    majorId: majorId,
    trainingProgramId: trainingProgramId,
  );
  Future<AdminUserDto> updateUser(
    Session session, {
    required UuidValue userId,
    required String fullName,
    String? phone,
  }) => AdminService.updateUser(
    session,
    userId: userId,
    fullName: fullName,
    phone: phone,
  );
  Future<bool> disableUser(Session session, {required UuidValue userId}) =>
      AdminService.disableUser(session, userId);
  Future<bool> enableUser(Session session, {required UuidValue userId}) =>
      AdminService.enableUser(session, userId);

  Future<List<Course>> getCourses(
    Session session, {
    int? page,
    int? pageSize,
  }) => AdminService.getCourses(
    session,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );
  Future<Course> createCourse(
    Session session, {
    required String courseName,
    required int credits,
    required CourseType courseType,
    String? description,
    UuidValue? categoryId,
  }) => AdminService.createCourse(
    session,
    courseName: courseName,
    credits: credits,
    courseType: courseType,
    description: description,
    categoryId: categoryId,
  );
  Future<Course> updateCourse(
    Session session, {
    required UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int credits,
    required CourseType courseType,
    String? description,
    UuidValue? categoryId,
  }) => AdminService.updateCourse(
    session,
    courseId: courseId,
    courseCode: courseCode,
    courseName: courseName,
    credits: credits,
    courseType: courseType,
    description: description,
    categoryId: categoryId,
  );
  Future<bool> deleteCourse(Session session, {required UuidValue courseId}) =>
      AdminService.deleteCourse(session, courseId);

  Future<List<TrainingProgram>> getTrainingPrograms(Session session) =>
      AdminService.getTrainingPrograms(session);
  Future<List<Major>> getMajors(Session session) =>
      AdminService.getMajors(session);
  Future<List<TrainingProgramCourse>> getProgramCourses(
    Session session, {
    required UuidValue programId,
  }) => AdminService.getProgramCourses(session, programId);
  Future<List<CoursePrerequisite>> getPrerequisites(Session session) =>
      AdminService.getPrerequisites(session);
  Future<List<CourseEquivalent>> getEquivalents(Session session) =>
      AdminService.getEquivalents(session);
  Future<TrainingProgram> createTrainingProgram(
    Session session, {
    required UuidValue majorId,
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
  }) => AdminService.createTrainingProgram(
    session,
    majorId: majorId,
    name: name,
    academicYear: academicYear,
    totalCredits: totalCredits,
    description: description,
  );
  Future<TrainingProgram> updateTrainingProgram(
    Session session, {
    required UuidValue programId,
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
  }) => AdminService.updateTrainingProgram(
    session,
    programId: programId,
    name: name,
    academicYear: academicYear,
    totalCredits: totalCredits,
    description: description,
  );
  Future<TrainingProgramCourse> setProgramCourse(
    Session session, {
    required UuidValue programId,
    required UuidValue courseId,
    required int semesterNumber,
    required bool isRequired,
  }) => AdminService.setProgramCourse(
    session,
    programId: programId,
    courseId: courseId,
    semesterNumber: semesterNumber,
    isRequired: isRequired,
  );

  Future<CoursePrerequisite> addPrerequisite(
    Session session, {
    required UuidValue courseId,
    required UuidValue requiredCourseId,
  }) => AdminService.addPrerequisite(session, courseId, requiredCourseId);
  Future<bool> removePrerequisite(
    Session session, {
    required UuidValue prerequisiteId,
  }) => AdminService.removePrerequisite(session, prerequisiteId);
  Future<CourseEquivalent> addEquivalent(
    Session session, {
    required UuidValue courseId,
    required UuidValue equivalentCourseId,
  }) => AdminService.addEquivalent(session, courseId, equivalentCourseId);
  Future<bool> removeEquivalent(
    Session session, {
    required UuidValue equivalentId,
  }) => AdminService.removeEquivalent(session, equivalentId);

  Future<List<PendingClassApprovalDto>> getPendingClasses(Session session) =>
      AdminService.getPendingClasses(session);
  Future<ClassApproval> approveClass(
    Session session, {
    required UuidValue courseClassId,
    String? comment,
  }) => AdminService.decideClass(session, courseClassId, true, comment);
  Future<ClassApproval> rejectClass(
    Session session, {
    required UuidValue courseClassId,
    String? comment,
  }) => AdminService.decideClass(session, courseClassId, false, comment);
  Future<List<CourseOpeningRequest>> getOpeningRequests(Session session) =>
      AdminService.getOpeningRequests(session);
  Future<CourseOpeningRequest> decideOpeningRequest(
    Session session, {
    required UuidValue requestId,
    required bool approve,
  }) => AdminService.decideOpeningRequest(session, requestId, approve);

  Future<List<ClassAdjustmentRequestDto>> getAdjustmentRequests(
    Session session, {
    ClassAdjustmentStatus? status,
  }) => AdminService.getAdjustmentRequests(session, status: status);

  Future<ClassAdjustmentRequestDto> decideAdjustmentRequest(
    Session session, {
    required UuidValue requestId,
    required bool approve,
    String? rejectReason,
  }) => AdminService.decideAdjustmentRequest(
    session,
    requestId: requestId,
    approve: approve,
    rejectReason: rejectReason,
  );

  Future<List<RegistrationPeriodDto>> getRegistrationPeriods(
    Session session,
  ) => AdminService.getRegistrationPeriods(session);

  Future<RegistrationPeriodDto> updateRegistrationPeriod(
    Session session, {
    required UuidValue semesterId,
    required DateTime startTime,
    required DateTime endTime,
  }) => AdminService.updateRegistrationPeriod(
    session,
    semesterId: semesterId,
    startTime: startTime,
    endTime: endTime,
  );

  Future<AnalyticsReportDto> getReports(Session session) =>
      AdminService.getReports(session);
  Future<List<AuditLogDto>> getAuditLogs(
    Session session, {
    int? page,
    int? pageSize,
  }) => AdminService.getAuditLogs(
    session,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );
  Future<List<AdminPermission>> getPermissions(
    Session session, {
    required UuidValue adminId,
  }) => AdminService.getPermissions(session, adminId);
  Future<AdminPermission> grantPermission(
    Session session, {
    required UuidValue adminId,
    required String permission,
  }) => AdminService.grantPermission(session, adminId, permission);
}
