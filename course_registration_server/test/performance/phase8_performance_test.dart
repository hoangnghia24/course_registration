import 'dart:convert';

import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/core/pagination.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../integration/test_tools/serverpod_test_tools.dart';
import '../support/phase8_seed.dart';

void main() {
  test('pagination clamps invalid and oversized requests', () {
    expect(Pagination.window(page: -1, pageSize: 0), (limit: 1, offset: 0));
    expect(
      Pagination.window(page: 3, pageSize: 1000),
      (limit: 100, offset: 200),
    );
  });

  withServerpod('Phase 8 performance baseline', (sessionBuilder, endpoints) {
    test('measures paginated APIs on a synthetic 1000-row dataset', () async {
      final session = sessionBuilder.build();
      final seed = await seedPhase8(session);
      final users = List.generate(
        1000,
        (index) => AppUser(
          authUserId: const Uuid().v4obj(),
          email: 'perf-user-$index@example.edu',
          fullName: 'Performance User ${index.toString().padLeft(4, '0')}',
          role: UserRole.student,
        ),
      );
      final courses = List.generate(
        1000,
        (index) => Course(
          courseCode: 'PERF-${index.toString().padLeft(4, '0')}',
          courseName: 'Performance Course $index',
          credits: 3,
          courseType: CourseType.compulsory,
        ),
      );
      final insertWatch = Stopwatch()..start();
      await AppUser.db.insert(session, users);
      await Course.db.insert(session, courses);
      insertWatch.stop();

      final authenticated = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          seed.adminAuthId.toString(),
          {AppScopes.admin},
        ),
      );
      final userWatch = Stopwatch()..start();
      final userPage = await endpoints.admin.getUsers(
        authenticated,
        page: 5,
        pageSize: 100,
      );
      userWatch.stop();
      final courseWatch = Stopwatch()..start();
      final coursePage = await endpoints.admin.getCourses(
        authenticated,
        page: 5,
        pageSize: 100,
      );
      courseWatch.stop();
      final databaseWatch = Stopwatch()..start();
      final rawPage = await Course.db.find(
        session,
        orderBy: (table) => table.courseCode,
        limit: 100,
        offset: 400,
      );
      databaseWatch.stop();
      final registration = await Registration.db.findFirstRow(
        session,
        where: (table) => table.studentId.equals(seed.students.first.id),
      );
      final studentSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          seed.studentAuthIds.first.toString(),
          {AppScopes.student},
        ),
      );
      final syncWatch = Stopwatch()..start();
      final syncResult = await endpoints.sync.pushOperations(
        studentSession,
        operations: [
          SyncOperationInputDto(
            operationId: const Uuid().v4obj(),
            entityType: 'COURSE_REGISTRATION',
            entityId: registration!.id.toString(),
            operationType: 'DELETE',
            payload: jsonEncode({
              'registrationId': registration.id.toString(),
            }),
            clientId: 'performance-test',
          ),
        ],
      );
      syncWatch.stop();

      expect(userPage, hasLength(100));
      expect(coursePage, hasLength(100));
      expect(rawPage, hasLength(100));
      expect(syncResult.single.status, SyncOperationStatus.SYNCED);
      // ignore: avoid_print
      print(
        'PERF server insert_2000=${insertWatch.elapsedMicroseconds}us '
        'users_page=${userWatch.elapsedMicroseconds}us '
        'courses_page=${courseWatch.elapsedMicroseconds}us '
        'db_course_page=${databaseWatch.elapsedMicroseconds}us '
        'sync_one=${syncWatch.elapsedMicroseconds}us',
      );
    });
  });
}
