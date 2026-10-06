import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../support/phase8_seed.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Phase 8 authentication and authorization', (
    sessionBuilder,
    endpoints,
  ) {
    late Phase8Seed seed;

    setUp(() async {
      seed = await seedPhase8(sessionBuilder.build());
    });

    test('protected role endpoints reject unauthenticated access', () async {
      await expectLater(
        endpoints.student.getProfile(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
      await expectLater(
        endpoints.lecturer.getMyProfile(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
      await expectLater(
        endpoints.admin.getUsers(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });

    test('student and lecturer cannot call admin APIs', () async {
      await expectLater(
        endpoints.admin.getUsers(
          _auth(sessionBuilder, seed.studentAuthIds.first, AppScopes.student),
        ),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
      await expectLater(
        endpoints.admin.getUsers(
          _auth(sessionBuilder, seed.lecturerAuthId, AppScopes.lecturer),
        ),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test('student cannot call lecturer APIs or mutate admin courses', () async {
      final student = _auth(
        sessionBuilder,
        seed.studentAuthIds.first,
        AppScopes.student,
      );
      await expectLater(
        endpoints.lecturer.getMyCourseClasses(student),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
      await expectLater(
        endpoints.admin.createCourse(
          student,
          courseName: 'Forbidden mutation',
          credits: 3,
          courseType: CourseType.compulsory,
        ),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test(
      'student IDOR attempts against another student are rejected',
      () async {
        final student = _auth(
          sessionBuilder,
          seed.studentAuthIds.first,
          AppScopes.student,
        );
        final otherId = seed.students.last.id!;

        for (final request in <Future<Object?> Function()>[
          () => endpoints.student.getProfile(student, studentId: otherId),
          () => endpoints.student.getTranscript(student, studentId: otherId),
          () => endpoints.courseRegistration.checkEligibility(
            student,
            studentId: otherId,
            courseClassId: seed.courseClass.id!,
          ),
        ]) {
          await expectLater(
            request(),
            throwsA(
              isA<AppException>().having(
                (error) => error.code,
                'code',
                'forbidden',
              ),
            ),
          );
        }
      },
    );

    test('disabled account is rejected even with a valid role scope', () async {
      final session = sessionBuilder.build();
      final user = await AppUser.db.findFirstRow(
        session,
        where: (table) => table.authUserId.equals(seed.studentAuthIds.first),
      );
      await AppUser.db.updateRow(session, user!.copyWith(isActive: false));

      final disabled = _auth(
        sessionBuilder,
        seed.studentAuthIds.first,
        AppScopes.student,
      );
      await expectLater(
        endpoints.student.getProfile(disabled),
        throwsA(
          isA<AppException>().having(
            (error) => error.code,
            'code',
            'account_disabled',
          ),
        ),
      );
    });

    test('correctly scoped users can access their own role APIs', () async {
      final student = await endpoints.student.getProfile(
        _auth(sessionBuilder, seed.studentAuthIds.first, AppScopes.student),
      );
      final lecturer = await endpoints.lecturer.getMyProfile(
        _auth(sessionBuilder, seed.lecturerAuthId, AppScopes.lecturer),
      );
      final users = await endpoints.admin.getUsers(
        _auth(sessionBuilder, seed.adminAuthId, AppScopes.admin),
      );

      expect(student.studentId, seed.students.first.id);
      expect(lecturer.lecturerId, seed.lecturer.id);
      expect(users, isNotEmpty);
    });
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
