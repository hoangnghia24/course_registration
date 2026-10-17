import 'package:course_registration_flutter/features/lecturer/presentation/pages/lecturer_dashboard_page.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/providers/lecturer_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'lecturer_fixtures.dart';

void main() {
  testWidgets('dashboard displays lecturer metrics and menus', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lecturerProvider.overrideWith((ref) async => lecturerProfile()),
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
          courseClassCountProvider.overrideWith((ref) async => 1),
          scheduleProvider.overrideWith((ref) async => []),
        ],
        child: const MaterialApp(home: LecturerDashboardPage()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Xin chào, Nguyễn Văn Giảng'), findsOneWidget);
    expect(find.text('45'), findsOneWidget);
    expect(find.text('Quản lý lớp'), findsOneWidget);
    expect(find.text('Nhu cầu mở lớp'), findsOneWidget);
  });

  for (final count in [0, 50, 51, 101]) {
    testWidgets('dashboard shows total $count beyond the first page', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            lecturerProvider.overrideWith((ref) async => lecturerProfile()),
            courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
            courseClassCountProvider.overrideWith((ref) async => count),
            scheduleProvider.overrideWith((ref) async => []),
          ],
          child: const MaterialApp(home: LecturerDashboardPage()),
        ),
      );
      await tester.pumpAndSettle();
      final metric = find
          .ancestor(
            of: find.text('Lớp đang dạy'),
            matching: find.byType(Column),
          )
          .first;
      expect(
        find.descendant(of: metric, matching: find.text('$count')),
        findsOneWidget,
      );
    });
  }

  testWidgets('dashboard does not show a cached page size as total offline', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lecturerProvider.overrideWith((ref) async => lecturerProfile()),
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
          courseClassCountProvider.overrideWith((ref) async => null),
          scheduleProvider.overrideWith((ref) async => []),
        ],
        child: const MaterialApp(home: LecturerDashboardPage()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('—'), findsOneWidget);
  });
}
