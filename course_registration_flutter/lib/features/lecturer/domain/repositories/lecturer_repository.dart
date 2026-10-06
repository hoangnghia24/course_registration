import 'package:course_registration_client/course_registration_client.dart';

abstract interface class LecturerRepository {
  Future<LecturerProfileDto> getProfile();
  Future<List<LecturerCourseClassDto>> getClasses();
  Future<List<TeachingScheduleProposal>> getSchedule();
  Future<List<ClassStudentDto>> getStudents(UuidValue courseClassId);
  Future<List<ClassDemandDto>> getDemand();
  Future<List<Course>> getCourses();
  Future<List<Semester>> getSemesters();
  Future<LecturerCourseClassDto> createClass({
    required UuidValue courseId,
    required UuidValue semesterId,
    required String classCode,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  });
  Future<LecturerCourseClassDto> updateClass({
    required UuidValue courseClassId,
    required String classCode,
    required int capacity,
    required CourseClassStatus status,
  });
  Future<void> deleteClass(UuidValue courseClassId);
}
