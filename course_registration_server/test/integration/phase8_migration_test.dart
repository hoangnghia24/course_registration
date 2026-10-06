import 'dart:io';

import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import '../support/phase8_seed.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Phase 8 migration schema', (sessionBuilder, endpoints) {
    test(
      'latest schema has new indexes and preserves seeded domain data',
      () async {
        final session = sessionBuilder.build();
        final seed = await seedPhase8(session);
        final indexes = await session.db.unsafeQuery('''
        SELECT indexname
        FROM pg_indexes
        WHERE schemaname = 'public'
          AND indexname IN (
            'course_classes_course_idx',
            'course_equivalents_equivalent_idx',
            'registrations_class_status_idx'
          )
        ORDER BY indexname;
      ''');
        final names = indexes
            .map((row) => row.toColumnMap()['indexname'])
            .toSet();

        expect(
          names,
          containsAll({
            'course_classes_course_idx',
            'course_equivalents_equivalent_idx',
            'registrations_class_status_idx',
          }),
        );
        expect(
          await Student.db.findById(session, seed.students.first.id!),
          isNotNull,
        );
        expect(await Course.db.findById(session, seed.course.id!), isNotNull);
        expect(
          await Registration.db.findFirstRow(
            session,
            where: (table) => table.studentId.equals(seed.students.first.id),
          ),
          isNotNull,
        );
      },
    );

    test(
      'generated migration contains no destructive data operation',
      () async {
        final sql = await File(
          'migrations/20261002093747385-phase-8-quality/migration.sql',
        ).readAsString();
        expect(sql, contains('CREATE INDEX "course_classes_course_idx"'));
        expect(
          sql,
          isNot(matches(RegExp(r'\b(DROP TABLE|TRUNCATE|DELETE FROM)\b'))),
        );
      },
    );
  });
}
