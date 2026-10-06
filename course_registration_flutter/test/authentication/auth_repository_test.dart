import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:course_registration_flutter/features/authentication/data/auth_gateway.dart';
import 'package:course_registration_flutter/features/authentication/data/auth_repository_impl.dart';

void main() {
  test('login delegates credentials and returns the current profile', () async {
    final gateway = _FakeAuthGateway();
    final repository = AuthRepositoryImpl(gateway);

    final profile = await repository.login(
      'student@example.edu',
      'password123',
    );

    expect(gateway.lastEmail, 'student@example.edu');
    expect(gateway.lastPassword, 'password123');
    expect(profile.role, UserRole.student);
    expect(repository.isAuthenticated, isTrue);
  });

  test('restore does not request a profile when signed out', () async {
    final gateway = _FakeAuthGateway();
    final repository = AuthRepositoryImpl(gateway);

    expect(await repository.restore(), isNull);
    expect(gateway.profileRequests, 0);
  });

  test('restore returns the session profile when signed in', () async {
    final gateway = _FakeAuthGateway()..signedIn = true;
    final repository = AuthRepositoryImpl(gateway);

    final profile = await repository.restore();

    expect(profile?.email, 'student@example.edu');
    expect(gateway.profileRequests, 1);
  });

  test('logout clears the authenticated session', () async {
    final gateway = _FakeAuthGateway()..signedIn = true;
    final repository = AuthRepositoryImpl(gateway);

    await repository.logout();

    expect(repository.isAuthenticated, isFalse);
  });
}

class _FakeAuthGateway implements AuthGateway {
  bool signedIn = false;
  String? lastEmail;
  String? lastPassword;
  int profileRequests = 0;

  @override
  bool get isAuthenticated => signedIn;

  @override
  Future<void> signIn(String email, String password) async {
    lastEmail = email;
    lastPassword = password;
    signedIn = true;
  }

  @override
  Future<AppUser> currentProfile({String? fullName}) async {
    profileRequests++;
    return AppUser(
      authUserId: UuidValue.withValidation(
        '018f3e3e-7b5b-7cc1-9a16-6e8bf1664ca0',
      ),
      email: lastEmail ?? 'student@example.edu',
      fullName: fullName ?? 'Sinh viên',
    );
  }

  @override
  Future<void> signOut() async => signedIn = false;
}
