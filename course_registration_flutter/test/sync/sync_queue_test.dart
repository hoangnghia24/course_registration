import 'package:course_registration_flutter/core/database/app_database.dart';
import 'package:course_registration_flutter/core/sync/conflict_resolver.dart';
import 'package:course_registration_flutter/core/sync/retry_policy.dart';
import 'package:course_registration_flutter/core/sync/sync_models.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() => database = AppDatabase.forTesting(NativeDatabase.memory()));
  tearDown(() => database.close());

  test('queue preserves FIFO order and operation id uniqueness', () async {
    await database.enqueueOperation(
      id: 'one',
      action: 'REGISTER_COURSE',
      entity: 'COURSE_REGISTRATION',
      data: '{}',
    );
    await database.enqueueOperation(
      id: 'two',
      action: 'CANCEL_COURSE',
      entity: 'COURSE_REGISTRATION',
      data: '{}',
    );

    expect((await database.pendingOperations()).map((item) => item.id), [
      'one',
      'two',
    ]);
    expect(
      () => database.enqueueOperation(
        id: 'one',
        action: 'DUPLICATE',
        entity: 'COURSE_REGISTRATION',
        data: '{}',
      ),
      throwsA(anything),
    );
  });

  test('app restart recovers operations interrupted while syncing', () async {
    await database.enqueueOperation(
      id: 'restart',
      action: 'REGISTER_COURSE',
      entity: 'COURSE_REGISTRATION',
      data: '{}',
    );
    await database.markOperationSyncing('restart');
    await database.recoverInterruptedOperations();

    expect((await database.pendingOperations()).single.status, 'PENDING');
  });

  test('partial failure keeps successful operations committed', () async {
    for (final id in ['success', 'failure', 'remaining']) {
      await database.enqueueOperation(
        id: id,
        action: 'REGISTER_COURSE',
        entity: 'COURSE_REGISTRATION',
        data: '{}',
      );
    }
    await database.updateOperationResult(id: 'success', status: 'SYNCED');
    await database.updateOperationResult(
      id: 'failure',
      status: 'FAILED',
      errorCode: 'CLASS_FULL',
    );

    final rows = await database.watchOperations().first;
    expect(rows.firstWhere((item) => item.id == 'success').status, 'SYNCED');
    expect(rows.firstWhere((item) => item.id == 'failure').status, 'FAILED');
    expect(rows.firstWhere((item) => item.id == 'remaining').status, 'PENDING');
  });

  test('pull checkpoint is transactional', () async {
    expect(await database.lastSyncAt('user'), isNull);
    await expectLater(
      database.applyPullChanges(
        'user',
        DateTime.utc(2026, 10, 2),
        () async => throw StateError('rollback'),
      ),
      throwsStateError,
    );
    expect(await database.lastSyncAt('user'), isNull);
  });

  test('retry policy uses bounded exponential backoff', () {
    expect(RetryPolicy.delayForAttempt(0), const Duration(seconds: 5));
    expect(RetryPolicy.delayForAttempt(1), const Duration(seconds: 15));
    expect(RetryPolicy.delayForAttempt(2), const Duration(seconds: 30));
    expect(RetryPolicy.delayForAttempt(3), const Duration(seconds: 60));
    expect(RetryPolicy.delayForAttempt(99), const Duration(seconds: 60));
    expect(RetryPolicy.isBusinessError('CLASS_FULL'), isTrue);
    expect(RetryPolicy.isBusinessError('NETWORK_ERROR'), isFalse);
  });

  test('conflict resolver maps auth, version and business failures', () {
    expect(ConflictResolver.localStatus('SYNCED', null), 'SYNCED');
    expect(
      ConflictResolver.localStatus('FAILED', 'VERSION_CONFLICT'),
      'CONFLICT',
    );
    expect(
      ConflictResolver.localStatus('FAILED', 'AUTH_REQUIRED'),
      'AUTH_REQUIRED',
    );
    expect(
      ConflictResolver.userMessage('CLASS_FULL', null),
      contains('đủ sĩ số'),
    );
  });

  test(
    'network states and transitions trigger sync only when reconnecting',
    () {
      expect(NetworkStatus.online, isNot(NetworkStatus.offline));
      expect(
        NetworkTransition.triggersSync(
          NetworkStatus.online,
          NetworkStatus.offline,
        ),
        isFalse,
      );
      expect(
        NetworkTransition.triggersSync(
          NetworkStatus.offline,
          NetworkStatus.online,
        ),
        isTrue,
      );
    },
  );

  test('auth-required operation is retained for login recovery', () async {
    await database.enqueueOperation(
      id: 'auth',
      action: 'REGISTER_COURSE',
      entity: 'COURSE_REGISTRATION',
      data: '{}',
    );
    await database.updateOperationResult(
      id: 'auth',
      status: 'AUTH_REQUIRED',
      errorCode: 'AUTH_REQUIRED',
    );

    final operation = await database.operationById('auth');
    expect(operation, isNotNull);
    expect(operation?.status, 'AUTH_REQUIRED');
    expect((await database.pendingOperations()).single.id, 'auth');
  });
}
