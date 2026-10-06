import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../support/phase8_seed.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Phase 8 input validation and audit logging', (
    sessionBuilder,
    endpoints,
  ) {
    late Session session;
    late Phase8Seed seed;

    setUp(() async {
      session = sessionBuilder.build();
      seed = await seedPhase8(session);
    });

    test(
      'server rejects empty, negative, invalid and oversized input',
      () async {
        final admin = _auth(sessionBuilder, seed.adminAuthId, AppScopes.admin);
        final lecturer = _auth(
          sessionBuilder,
          seed.lecturerAuthId,
          AppScopes.lecturer,
        );
        final student = _auth(
          sessionBuilder,
          seed.studentAuthIds.first,
          AppScopes.student,
        );

        await _expectCode(
          endpoints.admin.createCourse(
            admin,
            courseCode: '',
            courseName: 'Invalid',
            credits: -1,
            courseType: CourseType.compulsory,
          ),
          'invalid_course',
        );
        await _expectCode(
          endpoints.admin.updateCourse(
            admin,
            courseId: seed.course.id!,
            courseCode: seed.course.courseCode,
            courseName: seed.course.courseName,
            credits: 11,
            courseType: seed.course.courseType,
          ),
          'invalid_course',
        );
        await _expectCode(
          endpoints.admin.createCourse(
            admin,
            courseCode: 'X' * 33,
            courseName: 'Oversized',
            credits: 3,
            courseType: CourseType.compulsory,
          ),
          'invalid_course',
        );
        await _expectCode(
          endpoints.admin.createTrainingProgram(
            admin,
            majorId: seed.major.id!,
            name: '',
            academicYear: 1900,
            totalCredits: -1,
          ),
          'invalid_program',
        );
        await _expectCode(
          endpoints.admin.setProgramCourse(
            admin,
            programId: seed.program.id!,
            courseId: seed.course.id!,
            semesterNumber: 0,
            isRequired: true,
          ),
          'invalid_semester',
        );
        await _expectCode(
          endpoints.lecturer.createCourseClass(
            lecturer,
            courseId: seed.course.id!,
            semesterId: seed.semester.id!,
            classCode: '',
            capacity: -1,
            schedules: const [],
          ),
          'invalid_class',
        );
        await _expectCode(
          endpoints.lecturer.createCourseClass(
            lecturer,
            courseId: seed.course.id!,
            semesterId: seed.semester.id!,
            classCode: 'P8-INVALID-SCHEDULE',
            capacity: 20,
            schedules: [
              ClassScheduleDto(
                dayOfWeek: 9,
                startPeriod: 0,
                endPeriod: 30,
                room: 'X' * 81,
              ),
            ],
          ),
          'invalid_schedule',
        );
        await _expectCode(
          endpoints.courseRegistration.createOpeningRequest(
            student,
            courseId: seed.course.id!,
            reason: 'X' * 1001,
          ),
          'invalid_reason',
        );
        await _expectCode(
          endpoints.profile.ensureProfile(student, fullName: 'X' * 121),
          'invalid_full_name',
        );
      },
    );

    test(
      'critical student, lecturer and admin actions create audit records',
      () async {
        final student = _auth(
          sessionBuilder,
          seed.studentAuthIds.first,
          AppScopes.student,
        );
        final lecturer = _auth(
          sessionBuilder,
          seed.lecturerAuthId,
          AppScopes.lecturer,
        );
        final admin = _auth(sessionBuilder, seed.adminAuthId, AppScopes.admin);
        final registration = await Registration.db.findFirstRow(
          session,
          where: (table) => table.studentId.equals(seed.students.first.id),
        );
        await endpoints.courseRegistration.cancelCourse(
          student,
          registrationId: registration!.id!,
        );
        await endpoints.courseRegistration.registerCourse(
          student,
          courseClassId: seed.courseClass.id!,
        );

        final createdClass = await endpoints.lecturer.createCourseClass(
          lecturer,
          courseId: seed.course.id!,
          semesterId: seed.semester.id!,
          classCode: 'P8-AUDIT-CLASS',
          capacity: 20,
          schedules: [
            ClassScheduleDto(
              dayOfWeek: 6,
              startPeriod: 1,
              endPeriod: 3,
              room: 'P8-AUDIT',
            ),
          ],
        );
        await endpoints.lecturer.updateCourseClass(
          lecturer,
          courseClassId: createdClass.courseClassId,
          classCode: 'P8-AUDIT-CLASS-UPDATED',
          capacity: 25,
          status: CourseClassStatus.closed,
        );
        await endpoints.lecturer.deleteCourseClass(
          lecturer,
          courseClassId: createdClass.courseClassId,
        );

        await endpoints.admin.updateCourse(
          admin,
          courseId: seed.course.id!,
          courseCode: seed.course.courseCode,
          courseName: 'Phase 8 Course Updated',
          credits: seed.course.credits,
          courseType: seed.course.courseType,
        );
        await endpoints.admin.updateTrainingProgram(
          admin,
          programId: seed.program.id!,
          name: 'Phase 8 Program Updated',
          academicYear: 2026,
          totalCredits: 130,
        );
        final disabledUser = await AppUser.db.findFirstRow(
          session,
          where: (table) => table.authUserId.equals(seed.studentAuthIds.last),
        );
        await endpoints.admin.disableUser(admin, userId: disabledUser!.id!);

        final approveClass = await _pendingClass(
          session,
          seed,
          'P8-AUDIT-APPROVE',
        );
        final rejectClass = await _pendingClass(
          session,
          seed,
          'P8-AUDIT-REJECT',
        );
        await endpoints.admin.approveClass(
          admin,
          courseClassId: approveClass.id!,
          comment: 'approved',
        );
        await endpoints.admin.rejectClass(
          admin,
          courseClassId: rejectClass.id!,
          comment: 'rejected',
        );

        final history = await RegistrationHistory.db.find(session);
        final lecturerLogs = await LecturerActivityLog.db.find(session);
        final adminLogs = await SystemAuditLog.db.find(session);
        expect(
          history.map((item) => item.action).toSet(),
          containsAll([RegistrationAction.register, RegistrationAction.cancel]),
        );
        expect(
          lecturerLogs.map((item) => item.action).toSet(),
          containsAll(['CREATE_CLASS', 'UPDATE_CLASS', 'DELETE_CLASS']),
        );
        expect(
          adminLogs.map((item) => item.action).toSet(),
          containsAll([
            'UPDATE_COURSE',
            'UPDATE_PROGRAM',
            'DISABLE_USER',
            'APPROVE_CLASS',
            'REJECT_CLASS',
          ]),
        );
        expect(
          adminLogs.every(
            (item) =>
                !(item.oldValue ?? '').toLowerCase().contains('password') &&
                !(item.newValue ?? '').toLowerCase().contains('access_token'),
          ),
          isTrue,
        );
      },
    );
  });
}

Future<void> _expectCode(Future<Object?> call, String code) => expectLater(
  call,
  throwsA(isA<AppException>().having((error) => error.code, 'code', code)),
);

TestSessionBuilder _auth(
  TestSessionBuilder builder,
  UuidValue authUserId,
  Scope scope,
) => builder.copyWith(
  authentication: AuthenticationOverride.authenticationInfo(
    authUserId.toString(),
    {scope},
  ),
);

Future<CourseClass> _pendingClass(
  Session session,
  Phase8Seed seed,
  String classCode,
) async {
  final courseClass = await CourseClass.db.insertRow(
    session,
    CourseClass(
      courseId: seed.course.id!,
      lecturerId: seed.lecturer.id!,
      semesterId: seed.semester.id!,
      classCode: classCode,
      capacity: 20,
      registeredCount: 0,
      status: CourseClassStatus.closed,
    ),
  );
  await TeachingScheduleProposal.db.insertRow(
    session,
    TeachingScheduleProposal(
      lecturerId: seed.lecturer.id!,
      courseClassId: courseClass.id!,
      dayOfWeek: classCode.endsWith('APPROVE') ? 4 : 5,
      startPeriod: 1,
      endPeriod: 3,
      room: 'P8-AUDIT',
      status: TeachingScheduleStatus.pending,
    ),
  );
  return courseClass;
}
