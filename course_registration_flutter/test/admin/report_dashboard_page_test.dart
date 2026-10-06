import 'package:course_registration_flutter/features/admin/presentation/pages/report_dashboard_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'admin_fixtures.dart';

void main() {
  testWidgets('report dashboard renders analytics sections', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          adminProvider.overrideWith((ref) async => adminReport()),
        ],
        child: const MaterialApp(home: ReportDashboardPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Software Engineering: 80'), findsOneWidget);
    expect(find.text('Calculus'), findsOneWidget);
    expect(find.text('CS101 - Programming'), findsOneWidget);
    expect(find.text('3.25'), findsOneWidget);
  });
}
