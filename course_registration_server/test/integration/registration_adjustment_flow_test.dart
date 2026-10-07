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
        ServerSideSessionsConfig(sessionKeyHashPepper: 'adjustment-pepper'),
      ],
      identityProviderBuilders: [
        EmailIdpConfig(secretHashPepper: 'adjustment-email-pepper'),
      ],
    );
  });

  withServerpod('Registration period and class adjustment flow', (
    sessionBuilder,
    endpoints,
  ) {
    test('backend enforces registration and cancellation period', () async {
      final session = sessionBuilder.build();
      final seed = await seedPhase8(session);
      final admin = _auth(sessionBuilder, seed.adminAuthId, AppScopes.admin);
      final student = _auth(
        sessionBuilder,
        seed.studentAuthIds.first,
        AppScopes.student,
      );
      final now = DateTime.now().toUtc();

      await expectLater(
        endpoints.admin.updateRegistrationPeriod(
          admin,
          semesterId: seed.semester.id!,
          startTime: now,
          endTime: now,
        ),
        throwsA(
          isA<AppException>().having(
            (error) => error.code,
            'code',
            'invalid_registration_period',
          ),
        ),
      );
      await endpoints.admin.updateRegistrationPeriod(
        admin,
        semesterId: seed.semester.id!,
        startTime: now.add(const Duration(days: 1)),
        endTime: now.add(const Duration(days: 2)),
      );
      final registration = await Registration.db.findFirstRow(
        session,
        where: (table) => table.studentId.equals(seed.students.first.id),
      );
      final blockedCancel = await endpoints.courseRegistration.cancelCourse(
        student,
        registrationId: registration!.id!,
      );
      final blockedRegister = await endpoints.courseRegistration.registerCourse(
        student,
        courseClassId: seed.courseClass.id!,
      );
      expect(blockedCancel.success, isFalse);
      expect(blockedCancel.message, 'Chưa đến thời gian đăng ký học phần.');
      expect(blockedRegister.success, isFalse);
      expect(blockedRegister.message, 'Chưa đến thời gian đăng ký học phần.');

      await endpoints.admin.updateRegistrationPeriod(
        admin,
        semesterId: seed.semester.id!,
        startTime: now.subtract(const Duration(days: 1)),
        endTime: now.add(const Duration(days: 1)),
        lecturerStartTime: now.subtract(const Duration(days: 1)),
        lecturerEndTime: now.add(const Duration(days: 1)),
        status: RegistrationPeriodStatus.active,
      );
      final cancelled = await endpoints.courseRegistration.cancelCourse(
        student,
        registrationId: registration.id!,
      );
      final registered = await endpoints.courseRegistration.registerCourse(
        student,
        courseClassId: seed.courseClass.id!,
      );
      expect(cancelled.success, isTrue);
      expect(registered.success, isTrue);
    });

    test('adjustment stays pending until admin approves or rejects', () async {
      final session = sessionBuilder.build();
      final seed = await seedPhase8(session);
      final admin = _auth(sessionBuilder, seed.adminAuthId, AppScopes.admin);
      final lecturer = _auth(
        sessionBuilder,
        seed.lecturerAuthId,
        AppScopes.lecturer,
      );
      final now = DateTime.now().toUtc();
      await endpoints.admin.updateRegistrationPeriod(
        admin,
        semesterId: seed.semester.id!,
        startTime: now.add(const Duration(days: 1)),
        endTime: now.add(const Duration(days: 2)),
        lecturerStartTime: now.subtract(const Duration(days: 1)),
        lecturerEndTime: now.add(const Duration(days: 1)),
        status: RegistrationPeriodStatus.active,
      );

      final request = await endpoints.lecturer.updateCourseClass(
        lecturer,
        courseClassId: seed.courseClass.id!,
        capacity: 40,
        schedules: [
          ClassScheduleDto(
            dayOfWeek: 3,
            startPeriod: 4,
            endPeriod: 6,
            room: 'A101',
          ),
        ],
      );
      final beforeApproval = await CourseClass.db.findById(
        session,
        seed.courseClass.id!,
      );
      final visible = await endpoints.admin.getAdjustmentRequests(
        admin,
        status: ClassAdjustmentStatus.pending,
      );
      expect(request.status, ClassAdjustmentStatus.pending);
      expect(beforeApproval!.capacity, 30);
      expect(
        visible.map((item) => item.requestId),
        contains(request.requestId),
      );

      final approved = await endpoints.admin.decideAdjustmentRequest(
        admin,
        requestId: request.requestId,
        approve: true,
      );
      final afterApproval = await CourseClass.db.findById(
        session,
        seed.courseClass.id!,
      );
      final approvedSchedule = await ClassSchedule.db.findFirstRow(
        session,
        where: (table) => table.courseClassId.equals(seed.courseClass.id),
      );
      expect(approved.status, ClassAdjustmentStatus.approved);
      expect(afterApproval!.capacity, 40);
      expect(approvedSchedule!.dayOfWeek, 3);

      final rejectedRequest = await endpoints.lecturer.updateCourseClass(
        lecturer,
        courseClassId: seed.courseClass.id!,
        capacity: 45,
        schedules: approved.newSchedules,
      );
      final rejected = await endpoints.admin.decideAdjustmentRequest(
        admin,
        requestId: rejectedRequest.requestId,
        approve: false,
        rejectReason: 'Phòng học chưa phù hợp',
      );
      final afterRejection = await CourseClass.db.findById(
        session,
        seed.courseClass.id!,
      );
      expect(rejected.status, ClassAdjustmentStatus.rejected);
      expect(rejected.rejectReason, 'Phòng học chưa phù hợp');
      expect(afterRejection!.capacity, 40);
    });

    test(
      'lecturer ownership, time gate and delete transaction are enforced',
      () async {
        final session = sessionBuilder.build();
        final seed = await seedPhase8(session);
        final admin = _auth(sessionBuilder, seed.adminAuthId, AppScopes.admin);
        final lecturer = _auth(
          sessionBuilder,
          seed.lecturerAuthId,
          AppScopes.lecturer,
        );
        final otherAuthId = UuidValue.withValidation(
          '018f0000-0000-7000-8000-000000000899',
        );
        final otherUser = await AppUser.db.insertRow(
          session,
          AppUser(
            authUserId: otherAuthId,
            email: 'other-lecturer@example.edu',
            fullName: 'Other Lecturer',
            role: UserRole.lecturer,
          ),
        );
        await Lecturer.db.insertRow(
          session,
          Lecturer(userId: otherUser.id!, lecturerCode: 'OTHER-LECTURER'),
        );
        final otherLecturer = _auth(
          sessionBuilder,
          otherAuthId,
          AppScopes.lecturer,
        );
        final schedule = ClassScheduleDto(
          dayOfWeek: 3,
          startPeriod: 4,
          endPeriod: 6,
          room: 'A101',
        );
        await expectLater(
          endpoints.lecturer.updateCourseClass(
            otherLecturer,
            courseClassId: seed.courseClass.id!,
            capacity: 40,
            schedules: [schedule],
          ),
          throwsA(
            isA<AppException>().having(
              (error) => error.code,
              'code',
              'forbidden',
            ),
          ),
        );

        final now = DateTime.now().toUtc();
        await endpoints.admin.updateRegistrationPeriod(
          admin,
          semesterId: seed.semester.id!,
          startTime: now.subtract(const Duration(days: 1)),
          endTime: now.add(const Duration(days: 1)),
          lecturerStartTime: now.subtract(const Duration(days: 2)),
          lecturerEndTime: now.subtract(const Duration(days: 1)),
          status: RegistrationPeriodStatus.active,
        );
        await expectLater(
          endpoints.lecturer.updateCourseClass(
            lecturer,
            courseClassId: seed.courseClass.id!,
            capacity: 40,
            schedules: [schedule],
          ),
          throwsA(
            isA<AppException>().having(
              (error) => error.code,
              'code',
              'lecturer_editing_closed',
            ),
          ),
        );

        await endpoints.admin.updateRegistrationPeriod(
          admin,
          semesterId: seed.semester.id!,
          startTime: now.subtract(const Duration(days: 1)),
          endTime: now.add(const Duration(days: 1)),
          lecturerStartTime: now.subtract(const Duration(days: 1)),
          lecturerEndTime: now.add(const Duration(days: 1)),
          status: RegistrationPeriodStatus.active,
        );
        for (var index = 1; index < 10; index++) {
          final user = await AppUser.db.insertRow(
            session,
            AppUser(
              authUserId: UuidValue.withValidation(
                '018f0000-0000-7000-8000-0000000009${index.toString().padLeft(2, '0')}',
              ),
              email: 'delete-student-$index@example.edu',
              fullName: 'Delete Student $index',
              role: UserRole.student,
            ),
          );
          final student = await Student.db.insertRow(
            session,
            Student(
              userId: user.id!,
              studentCode: 'DELETE-STUDENT-$index',
              academicYear: 2026,
            ),
          );
          await Registration.db.insertRow(
            session,
            Registration(
              studentId: student.id!,
              courseClassId: seed.courseClass.id!,
              status: RegistrationStatus.registered,
            ),
          );
          await RegistrationHistory.db.insertRow(
            session,
            RegistrationHistory(
              studentId: student.id!,
              courseClassId: seed.courseClass.id!,
              action: RegistrationAction.register,
            ),
          );
        }
        await CourseClass.db.updateRow(
          session,
          seed.courseClass.copyWith(registeredCount: 10),
        );
        expect(
          await Registration.db.count(
            session,
            where: (table) => table.courseClassId.equals(seed.courseClass.id),
          ),
          10,
        );
        await expectLater(
          endpoints.lecturer.deleteCourseClass(
            lecturer,
            courseClassId: seed.courseClass.id!,
          ),
          throwsA(
            isA<AppException>().having(
              (error) => error.code,
              'code',
              'class_has_registration_history',
            ),
          ),
        );
        expect(
          await Registration.db.find(
            session,
            where: (table) => table.courseClassId.equals(seed.courseClass.id),
          ),
          hasLength(10),
        );
        expect(
          await RegistrationHistory.db.find(
            session,
            where: (table) => table.courseClassId.equals(seed.courseClass.id),
          ),
          hasLength(10),
        );
        expect(
          await CourseClass.db.findById(session, seed.courseClass.id!),
          isNotNull,
        );
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
