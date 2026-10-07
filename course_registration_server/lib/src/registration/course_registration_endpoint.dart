import 'package:serverpod/serverpod.dart';

import '../auth/role_guards.dart';
import '../generated/protocol.dart';
import 'services/course_registration_service.dart';

class CourseRegistrationEndpoint extends StudentGuard {
  Future<Semester> getCurrentSemester(Session session) =>
      CourseRegistrationService.getCurrentSemester(session);

  Future<RegistrationPeriodDto> getRegistrationPeriod(
    Session session, {
    required UuidValue semesterId,
  }) => CourseRegistrationService.getRegistrationPeriod(
    session,
    semesterId: semesterId,
  );

  Future<List<OpenCourseClassDto>> getOpenClasses(
    Session session, {
    required UuidValue semesterId,
    int? page,
    int? pageSize,
  }) => CourseRegistrationService.getOpenClasses(
    session,
    semesterId: semesterId,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );

  Future<EligibilityResultDto> checkEligibility(
    Session session, {
    UuidValue? studentId,
    required UuidValue courseClassId,
  }) => CourseRegistrationService.checkEligibility(
    session,
    studentId: studentId,
    courseClassId: courseClassId,
  );

  Future<RegistrationResultDto> registerCourse(
    Session session, {
    UuidValue? studentId,
    required UuidValue courseClassId,
    String? deviceInfo,
  }) => CourseRegistrationService.registerCourse(
    session,
    studentId: studentId,
    courseClassId: courseClassId,
    deviceInfo: deviceInfo,
  );

  Future<RegistrationResultDto> cancelCourse(
    Session session, {
    required UuidValue registrationId,
    String? deviceInfo,
  }) => CourseRegistrationService.cancelCourse(
    session,
    registrationId: registrationId,
    deviceInfo: deviceInfo,
  );

  Future<List<RegisteredCourseDto>> getMyCourses(
    Session session, {
    UuidValue? semesterId,
    int? page,
    int? pageSize,
  }) => CourseRegistrationService.getMyCourses(
    session,
    semesterId: semesterId,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );

  Future<CourseOpeningRequest> createOpeningRequest(
    Session session, {
    required UuidValue courseId,
    required String reason,
  }) => CourseRegistrationService.createOpeningRequest(
    session,
    courseId: courseId,
    reason: reason,
  );
}
