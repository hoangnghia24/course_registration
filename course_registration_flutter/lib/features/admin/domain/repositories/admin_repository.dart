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
  Future<TrainingProgram> createProgram({
    required UuidValue majorId,
    required String code,
    required String name,
    required int academicYear,
    required int totalCredits,
    required int semesterCount,
    required TrainingProgramStatus status,
    String? description,
  });
  Future<TrainingProgram> updateProgram(TrainingProgram program);
  Future<TrainingProgramCourse> setProgramCourse({
    required UuidValue programId,
    required UuidValue courseId,
    required int semesterNumber,
    required bool isRequired,
  });
  Future<List<CoursePrerequisite>> getPrerequisites();
  Future<List<CourseEquivalent>> getEquivalents();
  Future<List<PendingClassApprovalDto>> getPendingClasses();
  Future<void> decideClass(UuidValue classId, bool approve, String? comment);
  Future<List<ClassAdjustmentRequestDto>> getAdjustmentRequests({
    ClassAdjustmentStatus? status,
  });
  Future<ClassAdjustmentRequestDto> decideAdjustmentRequest({
    required UuidValue requestId,
    required bool approve,
    String? rejectReason,
  });
  Future<List<RegistrationPeriodDto>> getRegistrationPeriods();
  Future<RegistrationPeriodDto> updateRegistrationPeriod({
    required UuidValue semesterId,
    required DateTime startTime,
    required DateTime endTime,
    required DateTime lecturerStartTime,
    required DateTime lecturerEndTime,
    required RegistrationPeriodStatus status,
  });
  Future<AnalyticsReportDto> getReports();
  Future<List<AuditLogDto>> getAuditLogs();
}
