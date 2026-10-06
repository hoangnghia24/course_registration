import 'package:course_registration_flutter/features/admin/presentation/pages/admin_dashboard_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'admin_fixtures.dart';

void main() {
  testWidgets('admin dashboard displays system metrics and navigation', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          adminProvider.overrideWith((ref) async => adminReport()),
        ],
        child: const MaterialApp(home: AdminDashboardPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('120'), findsOneWidget);
    expect(find.text('18'), findsOneWidget);
    expect(find.text('42'), findsOneWidget);
    expect(find.byIcon(Icons.manage_accounts), findsOneWidget);
    expect(find.byIcon(Icons.menu_book_outlined), findsOneWidget);
  });
}
