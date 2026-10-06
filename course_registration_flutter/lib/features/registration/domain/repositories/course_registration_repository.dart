import 'package:course_registration_client/course_registration_client.dart';

abstract interface class CourseRegistrationRepository {
  Future<Semester> getCurrentSemester();

  Future<List<OpenCourseClassDto>> getOpenClasses(UuidValue semesterId);

  Future<List<RegisteredCourseDto>> getMyCourses(UuidValue semesterId);

  Future<EligibilityResultDto> checkEligibility(UuidValue courseClassId);

  Future<RegistrationResultDto> registerCourse(UuidValue courseClassId);

  Future<RegistrationResultDto> cancelCourse(UuidValue registrationId);

  Future<void> createOpeningRequest(UuidValue courseId, String reason);
}
