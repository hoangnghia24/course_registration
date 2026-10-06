import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/core/database/app_database.dart';
import 'package:course_registration_flutter/core/database/sync_manager.dart';
import 'package:course_registration_flutter/features/registration/data/course_registration_repository_impl.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockClient extends Mock implements Client {}

class _MockSyncManager extends Mock implements SyncManager {}

void main() {
  late AppDatabase database;
  late _MockSyncManager syncManager;
  late CourseRegistrationRepositoryImpl repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    syncManager = _MockSyncManager();
    repository = CourseRegistrationRepositoryImpl(
      _MockClient(),
      database,
      syncManager,
    );
    when(() => syncManager.isOnline).thenAnswer((_) async => false);
    when(
      () => syncManager.enqueue(
        action: any(named: 'action'),
        entity: any(named: 'entity'),
        operationType: any(named: 'operationType'),
        data: any(named: 'data'),
        entityId: any(named: 'entityId'),
        registrationAction: any(named: 'registrationAction'),
        registrationId: any(named: 'registrationId'),
      ),
    ).thenAnswer((_) async => 'operation-id');
  });

  tearDown(() => database.close());

  test(
    'offline registration is pending and never reported as successful',
    () async {
      final classId = UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000711',
      );
      final result = await repository.registerCourse(classId);

      expect(result.success, isFalse);
      expect(result.errorCode, 'PENDING_SYNC');
      expect(result.message, 'Yêu cầu đăng ký đang chờ đồng bộ.');
      verify(
        () => syncManager.enqueue(
          action: 'REGISTER_COURSE',
          entity: 'COURSE_REGISTRATION',
          entityId: classId.toString(),
          operationType: 'CREATE',
          data: {'courseClassId': classId.toString()},
          registrationAction: true,
        ),
      ).called(1);
    },
  );

  test('offline cancellation remains pending', () async {
    final registrationId = UuidValue.withValidation(
      '018f0000-0000-7000-8000-000000000712',
    );
    final result = await repository.cancelCourse(registrationId);

    expect(result.success, isFalse);
    expect(result.errorCode, 'CANCEL_PENDING');
  });
}
