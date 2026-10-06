import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import '../support/phase8_seed.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Phase 8 registration concurrency', (
    sessionBuilder,
    endpoints,
  ) {
    test(
      'two students racing for the last seat cannot exceed capacity',
      () async {
        final session = sessionBuilder.build();
        final seed = await seedPhase8(session);
        final existing = await Registration.db.findFirstRow(
          session,
          where: (table) =>
              table.studentId.equals(seed.students.first.id) &
              table.courseClassId.equals(seed.courseClass.id),
        );
        await Registration.db.updateRow(
          session,
          existing!.copyWith(status: RegistrationStatus.cancelled),
        );
        await CourseClass.db.updateRow(
          session,
          seed.courseClass.copyWith(
            capacity: 1,
            registeredCount: 0,
            status: CourseClassStatus.open,
          ),
        );
        final prerequisite = await CoursePrerequisite.db.findFirstRow(
          session,
          where: (table) => table.courseId.equals(seed.course.id),
        );
        await StudentTranscript.db.insertRow(
          session,
          StudentTranscript(
            studentId: seed.students.last.id!,
            courseId: prerequisite!.prerequisiteId,
            semester: '2025-2',
            score: 3,
            letterGrade: 'B',
            status: TranscriptStatus.passed,
          ),
        );

        final calls = <Future<RegistrationResultDto>>[];
        for (var index = 0; index < 2; index++) {
          calls.add(
            endpoints.courseRegistration.registerCourse(
              _student(sessionBuilder, seed, index),
              courseClassId: seed.courseClass.id!,
              deviceInfo: 'phase8-race-$index',
            ),
          );
        }
        final results = await Future.wait(calls);

        expect(results.where((result) => result.success), hasLength(1));
        expect(
          results.singleWhere((result) => !result.success).errorCode,
          'CLASS_FULL',
        );
        final updated = await CourseClass.db.findById(
          session,
          seed.courseClass.id!,
        );
        final active = await Registration.db.find(
          session,
          where: (table) =>
              table.courseClassId.equals(seed.courseClass.id) &
              table.status.equals(RegistrationStatus.registered),
        );
        expect(updated?.registeredCount, 1);
        expect(active, hasLength(1));
        expect(updated!.registeredCount <= updated.capacity, isTrue);
      },
    );
  }, rollbackDatabase: RollbackDatabase.disabled);
}

TestSessionBuilder _student(
  TestSessionBuilder builder,
  Phase8Seed seed,
  int index,
) => builder.copyWith(
  authentication: AuthenticationOverride.authenticationInfo(
    seed.studentAuthIds[index].toString(),
    {AppScopes.student},
  ),
);
