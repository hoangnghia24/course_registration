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
}
