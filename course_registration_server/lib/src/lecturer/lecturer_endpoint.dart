import 'package:serverpod/serverpod.dart';

import '../auth/role_guards.dart';
import '../generated/protocol.dart';
import 'services/lecturer_service.dart';

class LecturerEndpoint extends LecturerGuard {
  Future<LecturerProfileDto> getMyProfile(Session session) =>
      LecturerService.getProfile(session);

  Future<List<Course>> getCourses(Session session) =>
      LecturerService.getCourses(session);

  Future<List<Semester>> getSemesters(Session session) =>
      LecturerService.getSemesters(session);

  Future<List<LecturerCourseClassDto>> getMyCourseClasses(
    Session session, {
    int? page,
    int? pageSize,
  }) => LecturerService.getMyClasses(
    session,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );

  Future<LecturerCourseClassDto> createCourseClass(
    Session session, {
    required UuidValue courseId,
    required UuidValue semesterId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) => LecturerService.createCourseClass(
    session,
    courseId: courseId,
    semesterId: semesterId,
    capacity: capacity,
    schedules: schedules,
  );

  Future<ClassAdjustmentRequestDto> updateCourseClass(
    Session session, {
    required UuidValue courseClassId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) => LecturerService.updateCourseClass(
    session,
    courseClassId: courseClassId,
    capacity: capacity,
    schedules: schedules,
  );

  Future<bool> deleteCourseClass(
    Session session, {
    required UuidValue courseClassId,
  }) => LecturerService.deleteCourseClass(
    session,
    courseClassId: courseClassId,
  );

  Future<TeachingScheduleProposal> createTeachingSchedule(
    Session session, {
    required UuidValue courseClassId,
    required ClassScheduleDto schedule,
  }) => LecturerService.createTeachingSchedule(
    session,
    courseClassId: courseClassId,
    schedule: schedule,
  );

  Future<List<TeachingScheduleProposal>> getMySchedule(Session session) =>
      LecturerService.getMySchedule(session);

  Future<List<String>> getAvailableRooms(Session session) =>
      LecturerService.getAvailableRooms(session);

  Future<RegistrationPeriodDto> getRegistrationPeriod(
    Session session, {
    required UuidValue semesterId,
  }) => LecturerService.getRegistrationPeriod(
    session,
    semesterId: semesterId,
  );

  Future<List<ClassScheduleDto>> getAvailableScheduleSlots(
    Session session, {
    required UuidValue semesterId,
    required String room,
  }) => LecturerService.getAvailableScheduleSlots(
    session,
    semesterId: semesterId,
    room: room,
  );

  Future<List<ClassStudentDto>> getRegisteredStudents(
    Session session, {
    required UuidValue courseClassId,
    int? page,
    int? pageSize,
  }) => LecturerService.getRegisteredStudents(
    session,
    courseClassId: courseClassId,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );

  Future<List<ClassDemandDto>> getClassDemand(Session session) =>
      LecturerService.getClassDemand(session);

  Future<bool> updateStudentGrades(
    Session session, {
    required UuidValue courseClassId,
    required UuidValue studentId,
    required double midtermScore,
    required double finalScore,
  }) => LecturerService.updateStudentGrades(
    session,
    courseClassId: courseClassId,
    studentId: studentId,
    midtermScore: midtermScore,
    finalScore: finalScore,
  );
}
