import 'package:course_registration_flutter/features/admin/presentation/pages/user_management_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'admin_fixtures.dart';

void main() {
  testWidgets('user management lists and filters users', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userManagementProvider.overrideWith(
            (ref) async => [adminStudent()],
          ),
        ],
        child: const MaterialApp(home: UserManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Admin Test Student'), findsOneWidget);
    expect(find.text('Vô hiệu hóa'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('admin-user-search')),
      'missing',
    );
    await tester.pump();
    expect(find.text('Admin Test Student'), findsNothing);
  });
}
