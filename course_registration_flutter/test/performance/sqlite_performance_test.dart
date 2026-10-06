import 'package:course_registration_flutter/core/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'measures SQLite write and pending queue query for 10000 rows',
    () async {
      final database = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(database.close);
      final now = DateTime.utc(2026, 10, 2);
      final insertWatch = Stopwatch()..start();
      await database.batch((batch) {
        batch.insertAll(
          database.syncQueue,
          List.generate(
            10000,
            (index) => SyncQueueCompanion.insert(
              id: 'perf-$index',
              action: 'REGISTER_COURSE',
              entity: 'COURSE_REGISTRATION',
              data: '{}',
              status: Value(index.isEven ? 'PENDING' : 'SYNCED'),
              createdAt: now.add(Duration(microseconds: index)),
              updatedAt: Value(now),
            ),
          ),
        );
      });
      insertWatch.stop();
      final queryWatch = Stopwatch()..start();
      final pending = await database.pendingOperations();
      queryWatch.stop();

      expect(pending, hasLength(5000));
      expect(pending.first.id, 'perf-0');
      // ignore: avoid_print
      print(
        'PERF sqlite insert_10000=${insertWatch.elapsedMicroseconds}us '
        'pending_5000=${queryWatch.elapsedMicroseconds}us',
      );
    },
  );
}
