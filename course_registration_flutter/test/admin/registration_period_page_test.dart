import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/core/theme/app_theme.dart';
import 'package:course_registration_flutter/features/admin/presentation/pages/registration_period_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('registration period is responsive on a 320px Android screen', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(320, 640));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          registrationPeriodsProvider.overrideWith(
            (ref) async => [_period()],
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          home: const RegistrationPeriodPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Học kỳ 1 năm học 2026–2027'), findsOneWidget);
    expect(find.textContaining('2026–2027 2026'), findsNothing);
    expect(find.text('Giảng viên kết thúc chỉnh sửa'), findsOneWidget);
  });

  testWidgets('registration period load failure can be retried', (
    tester,
  ) async {
    var calls = 0;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          registrationPeriodsProvider.overrideWith((ref) async {
            calls++;
            if (calls == 1) throw StateError('temporary failure');
            return [_period()];
          }),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          home: const RegistrationPeriodPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Thử lại'), findsOneWidget);
    await tester.tap(find.text('Thử lại'));
    await tester.pumpAndSettle();

    expect(calls, 2);
    expect(find.text('Học kỳ 1 năm học 2026–2027'), findsOneWidget);
  });
}

RegistrationPeriodDto _period() => RegistrationPeriodDto(
  semesterId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000921',
  ),
  semesterName: 'Học kỳ 1 năm học 2026–2027',
  academicYear: 2026,
  startTime: DateTime.utc(2026, 9),
  endTime: DateTime.utc(2026, 12, 31, 23, 59),
  lecturerStartTime: DateTime.utc(2026, 9),
  lecturerEndTime: DateTime.utc(2026, 12, 31, 23, 59),
  status: RegistrationPeriodStatus.active,
  configured: true,
  isOpen: true,
  isLecturerOpen: true,
);
