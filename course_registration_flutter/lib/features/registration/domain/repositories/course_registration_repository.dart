import 'package:course_registration_client/course_registration_client.dart';

abstract interface class CourseRegistrationRepository {
  Future<Semester> getCurrentSemester();

  Future<RegistrationPeriodDto> getRegistrationPeriod(UuidValue semesterId);

  Future<List<OpenCourseClassDto>> getOpenClasses(
    UuidValue semesterId, {
    int page = 1,
    int pageSize = 50,
  });

  Future<List<RegisteredCourseDto>> getMyCourses(UuidValue semesterId);

  Future<EligibilityResultDto> checkEligibility(UuidValue courseClassId);

  Future<RegistrationResultDto> registerCourse(UuidValue courseClassId);

  Future<RegistrationResultDto> cancelCourse(UuidValue registrationId);

  Future<void> createOpeningRequest(UuidValue courseId, String reason);
}
