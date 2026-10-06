import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:course_registration_flutter/features/authentication/domain/repositories/auth_repository.dart';
import 'package:course_registration_flutter/features/authentication/presentation/controllers/auth_state_controller.dart';
import 'package:course_registration_flutter/features/authentication/presentation/pages/login_page.dart';
import 'package:course_registration_flutter/shared/services/providers.dart';

void main() {
  testWidgets('login form validates email and password', (tester) async {
    final controller = AuthStateController(_FakeAuthRepository());
    await controller.restore();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [authStateControllerProvider.overrideWithValue(controller)],
        child: const MaterialApp(home: LoginPage()),
      ),
    );

    await tester.enterText(find.byKey(const Key('login-email')), 'invalid');
    await tester.enterText(find.byKey(const Key('login-password')), 'short');
    await tester.tap(find.byKey(const Key('login-submit')));
    await tester.pump();

    expect(find.text('Vui lòng nhập email hợp lệ'), findsOneWidget);
    expect(find.text('Mật khẩu phải có ít nhất 8 ký tự'), findsOneWidget);
  });

  testWidgets('login form submits valid credentials', (tester) async {
    final repository = _FakeAuthRepository();
    final controller = AuthStateController(repository);
    await controller.restore();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [authStateControllerProvider.overrideWithValue(controller)],
        child: const MaterialApp(home: LoginPage()),
      ),
    );

    await tester.enterText(
      find.byKey(const Key('login-email')),
      'student@example.edu',
    );
    await tester.enterText(
      find.byKey(const Key('login-password')),
      'password123',
    );
    await tester.tap(find.byKey(const Key('login-submit')));
    await tester.pumpAndSettle();

    expect(repository.loginCalls, 1);
    expect(controller.isAuthenticated, isTrue);
  });

  testWidgets('login explains that accounts are provisioned', (tester) async {
    final controller = AuthStateController(_FakeAuthRepository());
    await controller.restore();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [authStateControllerProvider.overrideWithValue(controller)],
        child: const MaterialApp(home: LoginPage()),
      ),
    );

    expect(
      find.textContaining('Tài khoản do phòng đào tạo cấp'),
      findsOneWidget,
    );
    expect(find.textContaining('Đăng ký'), findsNothing);
  });
}

class _FakeAuthRepository implements AuthRepository {
  bool signedIn = false;
  int loginCalls = 0;

  AppUser get _profile => AppUser(
    authUserId: UuidValue.withValidation(
      '018f3e3e-7b5b-7cc1-9a16-6e8bf1664ca0',
    ),
    email: 'student@example.edu',
    fullName: 'Nguyễn Văn A',
  );

  @override
  bool get isAuthenticated => signedIn;
  @override
  Future<AppUser> completeProfile({String? fullName}) async => _profile;
  @override
  Future<AppUser> login(String email, String password) async {
    loginCalls++;
    signedIn = true;
    return _profile;
  }

  @override
  Future<void> logout() async => signedIn = false;
  @override
  Future<AppUser?> restore() async => signedIn ? _profile : null;
}
