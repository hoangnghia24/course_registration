import 'package:course_registration_client/course_registration_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import 'auth_gateway.dart';

class ServerpodAuthGateway implements AuthGateway {
  ServerpodAuthGateway(this._client);
  final Client _client;

  @override
  bool get isAuthenticated => _client.auth.isAuthenticated;
  @override
  Future<void> signIn(String email, String password) async {
    final result = await _client.emailIdp.login(
      email: email.trim().toLowerCase(),
      password: password,
    );
    await _client.auth.updateSignedInUser(result);
  }

  @override
  Future<AppUser> currentProfile({String? fullName}) =>
      _client.profile.ensureProfile(fullName: fullName);
  @override
  Future<void> signOut() => _client.auth.signOutDevice();
}
