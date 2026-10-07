import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:course_registration_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('admin registration period renders on a 320px emulator', (
    tester,
  ) async {
    await app.main();
    await _ensureLoginScreen(tester);
    await tester.enterText(
      find.byKey(const Key('login-email')),
      'phongdaotao@namviet.edu.vn',
    );
    await tester.enterText(
      find.byKey(const Key('login-password')),
      'HocVu@2026',
    );
    await tester.tap(find.byKey(const Key('login-submit')));
    await _waitFor(tester, find.text('Quản trị hệ thống'), attempts: 80);

    await _scrollToTextAndTap(tester, 'Thời gian đăng ký');
    await _waitFor(tester, find.text('Thời gian đăng ký học phần'));
    await _waitFor(tester, find.text('Học kỳ 1 năm học 2026–2027'));

    expect(find.textContaining('2026–2027 2026'), findsNothing);
    expect(find.text('Sinh viên bắt đầu'), findsOneWidget);
    expect(find.text('Giảng viên kết thúc chỉnh sửa'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

Future<void> _ensureLoginScreen(WidgetTester tester) async {
  final login = find.byKey(const Key('login-email'));
  final logout = find.byKey(const Key('logout-button'));
  for (var attempt = 0; attempt < 80; attempt++) {
    await tester.pump(const Duration(milliseconds: 250));
    if (login.evaluate().isNotEmpty) return;
    if (logout.evaluate().isNotEmpty) {
      await tester.tap(logout);
      await tester.pump(const Duration(milliseconds: 300));
      await tester.tap(find.byKey(const Key('logout-confirm')));
      await _waitFor(tester, login, attempts: 80);
      return;
    }
  }
  fail('Timed out waiting for the login screen.');
}

Future<void> _scrollToTextAndTap(WidgetTester tester, String text) async {
  final finder = find.text(text);
  for (var attempt = 0; attempt < 12 && finder.evaluate().isEmpty; attempt++) {
    final scrollable = find.byType(ListView);
    if (scrollable.evaluate().isEmpty) break;
    await tester.drag(
      scrollable.last,
      const Offset(0, -260),
      warnIfMissed: false,
    );
    await tester.pump(const Duration(milliseconds: 300));
  }
  await _waitFor(tester, finder);
  await tester.ensureVisible(finder);
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 750));
}

Future<void> _waitFor(
  WidgetTester tester,
  Finder finder, {
  int attempts = 40,
}) async {
  for (var attempt = 0; attempt < attempts; attempt++) {
    await tester.pump(const Duration(milliseconds: 250));
    if (finder.evaluate().isNotEmpty) return;
  }
  fail('Timed out waiting for $finder');
}
