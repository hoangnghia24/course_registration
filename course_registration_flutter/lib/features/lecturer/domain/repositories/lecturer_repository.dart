import 'package:course_registration_client/course_registration_client.dart';

abstract interface class LecturerRepository {
  Future<LecturerProfileDto> getProfile();
  Future<List<LecturerCourseClassDto>> getClasses();
  Future<List<TeachingScheduleProposal>> getSchedule();
  Future<List<ClassStudentDto>> getStudents(UuidValue courseClassId);
  Future<List<ClassDemandDto>> getDemand();
  Future<List<Course>> getCourses();
  Future<List<Semester>> getSemesters();
  Future<List<String>> getAvailableRooms();
  Future<RegistrationPeriodDto> getRegistrationPeriod(UuidValue semesterId);
  Future<List<ClassScheduleDto>> getAvailableScheduleSlots({
    required UuidValue semesterId,
    required String room,
  });
  Future<LecturerCourseClassDto> createClass({
    required UuidValue courseId,
    required UuidValue semesterId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  });
  Future<ClassAdjustmentRequestDto> updateClass({
    required UuidValue courseClassId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  });
  Future<void> deleteClass(UuidValue courseClassId);
  Future<void> updateStudentGrades({
    required UuidValue courseClassId,
    required UuidValue studentId,
    required double midtermScore,
    required double finalScore,
  });
}
