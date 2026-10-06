import 'package:course_registration_flutter/shared/widgets/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('logout requires confirmation before invoking callback', (
    tester,
  ) async {
    var logoutCalls = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              AppLogoutButton(
                onLogout: () async => logoutCalls++,
              ),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    expect(find.text('Xác nhận đăng xuất'), findsOneWidget);

    await tester.tap(find.byKey(const Key('logout-cancel')));
    await tester.pumpAndSettle();
    expect(logoutCalls, 0);

    await tester.tap(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('logout-confirm')));
    await tester.pumpAndSettle();
    expect(logoutCalls, 1);
  });
}
