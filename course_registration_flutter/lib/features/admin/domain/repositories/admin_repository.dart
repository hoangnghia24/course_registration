import 'package:course_registration_client/course_registration_client.dart';

abstract interface class AdminRepository {
  Future<List<AdminUserDto>> getUsers();
  Future<AdminUserDto> createUser({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phone,
  });
  Future<AdminUserDto> updateUser(
    UuidValue userId,
    String fullName,
    String? phone,
  );
  Future<bool> disableUser(UuidValue userId);
  Future<bool> enableUser(UuidValue userId);
  Future<List<Course>> getCourses();
  Future<Course> createCourse(
    String name,
    int credits,
    CourseType type,
  );
  Future<Course> updateCourse(Course course);
  Future<bool> deleteCourse(UuidValue courseId);
  Future<List<TrainingProgram>> getPrograms();
  Future<List<Major>> getMajors();
  Future<List<TrainingProgramCourse>> getProgramCourses(UuidValue programId);
  Future<List<CoursePrerequisite>> getPrerequisites();
  Future<List<CourseEquivalent>> getEquivalents();
  Future<List<PendingClassApprovalDto>> getPendingClasses();
  Future<void> decideClass(UuidValue classId, bool approve, String? comment);
  Future<AnalyticsReportDto> getReports();
  Future<List<AuditLogDto>> getAuditLogs();
}
