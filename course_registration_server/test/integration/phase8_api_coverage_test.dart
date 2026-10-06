import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import '../support/phase8_seed.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  setUp(() {
    AuthServices.set(
      tokenManagerBuilders: [
        ServerSideSessionsConfig(sessionKeyHashPepper: 'phase8-api-pepper'),
      ],
      identityProviderBuilders: [
        EmailIdpConfig(secretHashPepper: 'phase8-api-email-pepper'),
      ],
    );
  });

  withServerpod('Phase 8 API coverage', (sessionBuilder, endpoints) {
    test('student read, registration, cancellation and request APIs', () async {
      final session = sessionBuilder.build();
      final seed = await seedPhase8(session);
      final student = _auth(
        sessionBuilder,
        seed.studentAuthIds.first,
        AppScopes.student,
      );

      final profile = await endpoints.student.getProfile(student);
      final program = await endpoints.student.getTrainingProgram(student);
      final transcript = await endpoints.student.getTranscript(student);
      final gpa = await endpoints.student.getGpa(student);
      final semester = await endpoints.courseRegistration.getCurrentSemester(
        student,
      );
      final classes = await endpoints.courseRegistration.getOpenClasses(
        student,
        semesterId: semester.id!,
      );
      final initial = await endpoints.courseRegistration.getMyCourses(student);
      final cancelled = await endpoints.courseRegistration.cancelCourse(
        student,
        registrationId: initial.single.registrationId,
      );
      final registered = await endpoints.courseRegistration.registerCourse(
        student,
        courseClassId: seed.courseClass.id!,
      );
      final request = await endpoints.courseRegistration.createOpeningRequest(
        student,
        courseId: seed.course.id!,
        reason: 'Phase 8 API coverage',
      );

      expect(profile.studentCode, 'P8-STUDENT-0');
      expect(program, isNotEmpty);
      expect(transcript, hasLength(1));
      expect(gpa.cumulativeGpa, greaterThan(0));
      expect(classes, isNotEmpty);
      expect(cancelled.success, isTrue);
      expect(registered.success, isTrue);
      expect(request.status, OpeningRequestStatus.pending);
    });

    test(
      'lecturer profile, class, schedule, students and demand APIs',
      () async {
        final session = sessionBuilder.build();
        final seed = await seedPhase8(session);
        final lecturer = _auth(
          sessionBuilder,
          seed.lecturerAuthId,
          AppScopes.lecturer,
        );

        final profile = await endpoints.lecturer.getMyProfile(lecturer);
        final courses = await endpoints.lecturer.getCourses(lecturer);
        final semesters = await endpoints.lecturer.getSemesters(lecturer);
        final existing = await endpoints.lecturer.getMyCourseClasses(lecturer);
        final created = await endpoints.lecturer.createCourseClass(
          lecturer,
          courseId: seed.course.id!,
          semesterId: seed.semester.id!,
          classCode: 'P8-CREATED',
          capacity: 20,
          schedules: [
            ClassScheduleDto(
              dayOfWeek: 3,
              startPeriod: 4,
              endPeriod: 6,
              room: 'P8-B',
            ),
          ],
        );
        final updated = await endpoints.lecturer.updateCourseClass(
          lecturer,
          courseClassId: created.courseClassId,
          classCode: 'P8-UPDATED',
          capacity: 25,
          status: CourseClassStatus.closed,
        );
        final schedule = await endpoints.lecturer.getMySchedule(lecturer);
        final students = await endpoints.lecturer.getRegisteredStudents(
          lecturer,
          courseClassId: seed.courseClass.id!,
        );
        final demand = await endpoints.lecturer.getClassDemand(lecturer);
        final deleted = await endpoints.lecturer.deleteCourseClass(
          lecturer,
          courseClassId: created.courseClassId,
        );

        expect(profile.lecturerCode, 'P8-LECTURER');
        expect(courses, isNotEmpty);
        expect(semesters, isNotEmpty);
        expect(existing, isNotEmpty);
        expect(updated.classCode, 'P8-UPDATED');
        expect(schedule, isNotEmpty);
        expect(students.single.studentCode, 'P8-STUDENT-0');
        expect(demand, isA<List<ClassDemandDto>>());
        expect(deleted, isTrue);
      },
    );

    test(
      'admin user, course, program, approval, report and audit APIs',
      () async {
        final session = sessionBuilder.build();
        final seed = await seedPhase8(session);
        final admin = _auth(
          sessionBuilder,
          seed.adminAuthId,
          AppScopes.admin,
        );

        final users = await endpoints.admin.getUsers(admin);
        final createdUser = await endpoints.admin.createUser(
          admin,
          email: 'phase8-created-admin@example.edu',
          password: 'Initial-pass-123!',
          fullName: 'Created Admin',
          role: UserRole.admin,
        );
        final updatedUser = await endpoints.admin.updateUser(
          admin,
          userId: createdUser.userId,
          fullName: 'Updated Admin',
          phone: '0123456789',
        );
        final disabled = await endpoints.admin.disableUser(
          admin,
          userId: createdUser.userId,
        );
        final courses = await endpoints.admin.getCourses(admin);
        final createdCourse = await endpoints.admin.createCourse(
          admin,
          courseCode: 'P8-ADMIN-COURSE',
          courseName: 'Admin API Course',
          credits: 3,
          courseType: CourseType.elective,
        );
        final updatedCourse = await endpoints.admin.updateCourse(
          admin,
          courseId: createdCourse.id!,
          courseCode: createdCourse.courseCode,
          courseName: 'Updated Admin API Course',
          credits: 4,
          courseType: CourseType.elective,
        );
        final deletedCourse = await endpoints.admin.deleteCourse(
          admin,
          courseId: createdCourse.id!,
        );
        final programs = await endpoints.admin.getTrainingPrograms(admin);

        final approvalClass = await _pendingClass(
          session,
          seed,
          classCode: 'P8-APPROVE',
        );
        final rejectionClass = await _pendingClass(
          session,
          seed,
          classCode: 'P8-REJECT',
        );
        final pending = await endpoints.admin.getPendingClasses(admin);
        final approved = await endpoints.admin.approveClass(
          admin,
          courseClassId: approvalClass.id!,
          comment: 'Approved by Phase 8',
        );
        final rejected = await endpoints.admin.rejectClass(
          admin,
          courseClassId: rejectionClass.id!,
          comment: 'Rejected by Phase 8',
        );
        final reports = await endpoints.admin.getReports(admin);
        final logs = await endpoints.admin.getAuditLogs(admin);

        expect(users, isNotEmpty);
        expect(updatedUser.fullName, 'Updated Admin');
        expect(disabled, isTrue);
        expect(courses, isNotEmpty);
        expect(updatedCourse.credits, 4);
        expect(deletedCourse, isTrue);
        expect(programs, isNotEmpty);
        expect(pending.length, greaterThanOrEqualTo(2));
        expect(approved.status, ClassApprovalStatus.approved);
        expect(rejected.status, ClassApprovalStatus.rejected);
        expect(reports.totalStudents, greaterThanOrEqualTo(2));
        expect(logs, isNotEmpty);
      },
    );
  });
}

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
  Phase8Seed seed, {
  required String classCode,
}) async {
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
      room: 'P8-APPROVAL',
      status: TeachingScheduleStatus.pending,
    ),
  );
  return courseClass;
}
