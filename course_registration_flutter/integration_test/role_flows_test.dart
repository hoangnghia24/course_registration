import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:course_registration_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('admin, lecturer and student real backend flows', (tester) async {
    await app.main();
    await _ensureLoginScreen(tester);

    await _login(
      tester,
      email: 'phongdaotao@namviet.edu.vn',
      password: 'HocVu@2026',
      homeTitle: 'Quản trị hệ thống',
    );
    expect(find.text('Tổng quan hệ thống'), findsOneWidget);

    await _scrollToTextAndTap(tester, 'Đào tạo');
    await _waitFor(tester, find.text('Chương trình đào tạo'));
    final program = find.textContaining('CNTT-2026').first;
    await _waitFor(tester, program);
    expect(find.textContaining('8 học kỳ'), findsOneWidget);
    expect(find.textContaining('130 tín chỉ'), findsOneWidget);

    await _tapVisible(tester, find.byTooltip('Back'));
    await _waitFor(tester, find.text('Quản trị hệ thống'));
    await _scrollToTextAndTap(tester, 'Thời gian đăng ký');
    await _waitFor(tester, find.text('Thời gian đăng ký học phần'));
    expect(find.text('Sinh viên bắt đầu'), findsOneWidget);
    expect(find.text('Sinh viên kết thúc'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Giảng viên kết thúc chỉnh sửa'),
      250,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('Giảng viên bắt đầu chỉnh sửa'), findsOneWidget);
    expect(find.text('Giảng viên kết thúc chỉnh sửa'), findsOneWidget);
    expect(find.byKey(const Key('registration-period-status')), findsOneWidget);

    await _tapVisible(tester, find.byTooltip('Back'));
    await _logout(tester);

    await _login(
      tester,
      email: 'minh.tran@namviet.edu.vn',
      password: 'HocVu@2026',
      homeTitle: 'Trang giảng viên',
    );
    expect(find.text('Không gian quản lý giảng dạy'), findsOneWidget);
    await _scrollToTextAndTap(tester, 'Quản lý lớp');
    await _waitFor(tester, find.text('Quản lý lớp học phần'));
    await _waitFor(tester, find.text('Chi tiết').first);
    expect(find.text('Sửa'), findsWidgets);
    expect(find.text('Xóa'), findsWidgets);

    await _tapVisible(tester, find.byTooltip('Back'));
    await _logout(tester);

    await _login(
      tester,
      email: '26cntt001@namviet.edu.vn',
      password: 'HocVu@2026',
      homeTitle: 'Trang sinh viên',
    );
    expect(find.text('26CNTT001'), findsOneWidget);
    await _scrollToTextAndTap(tester, 'Chương trình đào tạo');
    await _waitFor(tester, find.text('Học kỳ 1'));
    expect(find.text('Tất cả'), findsOneWidget);

    await _tapVisible(tester, find.byTooltip('Back'));
    await _scrollToTextAndTap(tester, 'Đăng ký học phần');
    await _waitFor(tester, find.text('Học kỳ hiện tại'));
    expect(
      find.textContaining('Đang trong thời gian đăng ký học phần.'),
      findsOneWidget,
    );
    expect(find.text('Danh sách đã đăng ký'), findsOneWidget);
    expect(find.text('Lịch học'), findsOneWidget);
  });
}

Future<void> _ensureLoginScreen(WidgetTester tester) async {
  final login = find.byKey(const Key('login-email'));
  final logout = find.byKey(const Key('logout-button'));
  for (var attempt = 0; attempt < 160; attempt++) {
    await tester.pump(const Duration(milliseconds: 250));
    if (login.evaluate().isNotEmpty) return;
    if (logout.evaluate().isNotEmpty) {
      await _logout(tester);
      return;
    }
  }
  fail('Timed out waiting for the login or authenticated home screen.');
}

Future<void> _login(
  WidgetTester tester, {
  required String email,
  required String password,
  required String homeTitle,
}) async {
  await _waitFor(tester, find.byKey(const Key('login-email')));
  await tester.enterText(find.byKey(const Key('login-email')), email);
  await tester.enterText(find.byKey(const Key('login-password')), password);
  await tester.tap(find.byKey(const Key('login-submit')));
  await _waitFor(tester, find.text(homeTitle), attempts: 80);
}

Future<void> _logout(WidgetTester tester) async {
  await _waitFor(tester, find.byKey(const Key('logout-button')));
  await tester.tap(find.byKey(const Key('logout-button')));
  await tester.pump(const Duration(milliseconds: 500));
  await tester.tap(find.byKey(const Key('logout-confirm')));
  await _waitFor(tester, find.byKey(const Key('login-email')), attempts: 80);
}

Future<void> _tapVisible(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump(const Duration(milliseconds: 250));
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 750));
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
  await _tapVisible(tester, finder);
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
