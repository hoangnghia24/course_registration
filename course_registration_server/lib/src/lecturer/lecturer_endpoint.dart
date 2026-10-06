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
    required String classCode,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) => LecturerService.createCourseClass(
    session,
    courseId: courseId,
    semesterId: semesterId,
    classCode: classCode,
    capacity: capacity,
    schedules: schedules,
  );

  Future<LecturerCourseClassDto> updateCourseClass(
    Session session, {
    required UuidValue courseClassId,
    required String classCode,
    required int capacity,
    required CourseClassStatus status,
  }) => LecturerService.updateCourseClass(
    session,
    courseClassId: courseClassId,
    classCode: classCode,
    capacity: capacity,
    status: status,
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
}
