import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/admin/domain/repositories/admin_repository.dart';
import 'package:course_registration_flutter/features/admin/presentation/pages/class_approval_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAdminRepository extends Mock implements AdminRepository {}

void main() {
  testWidgets(
    'rejecting an adjustment closes its dialog without widget errors',
    (
      tester,
    ) async {
      final requestId = UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000601',
      );
      final request = ClassAdjustmentRequestDto(
        requestId: requestId,
        courseClassId: UuidValue.withValidation(
          '018f0000-0000-7000-8000-000000000602',
        ),
        classCode: 'CNTT102-01',
        courseCode: 'CNTT102',
        courseName: 'Lập trình hướng đối tượng',
        lecturerName: 'TS. Trần Quang Minh',
        oldCapacity: 35,
        newCapacity: 36,
        oldSchedules: const [],
        newSchedules: const [],
        status: ClassAdjustmentStatus.pending,
        createdAt: DateTime.utc(2026, 10, 17),
      );
      final repository = _MockAdminRepository();
      when(
        () => repository.decideAdjustmentRequest(
          requestId: requestId,
          approve: false,
          rejectReason: 'Kiểm thử',
        ),
      ).thenAnswer((_) async => request);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            adminRepositoryProvider.overrideWithValue(repository),
            approvalProvider.overrideWith((ref) async => []),
            adjustmentRequestsProvider(
              ClassAdjustmentStatus.pending,
            ).overrideWith((ref) async => [request]),
          ],
          child: const MaterialApp(home: ClassApprovalPage()),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('ĐIỀU CHỈNH'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('TỪ CHỐI'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).last, 'Kiểm thử');
      await tester.tap(find.text('Từ chối'));
      await tester.pumpAndSettle();

      verify(
        () => repository.decideAdjustmentRequest(
          requestId: requestId,
          approve: false,
          rejectReason: 'Kiểm thử',
        ),
      ).called(1);
      expect(tester.takeException(), isNull);
    },
  );
}
