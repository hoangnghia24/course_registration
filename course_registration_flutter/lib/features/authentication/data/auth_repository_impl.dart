import 'package:course_registration_client/course_registration_client.dart';

import '../domain/repositories/auth_repository.dart';
import 'auth_gateway.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._gateway);
  final AuthGateway _gateway;
  @override
  bool get isAuthenticated => _gateway.isAuthenticated;
  @override
  Future<AppUser?> restore() async =>
      _gateway.isAuthenticated ? _gateway.currentProfile() : null;
  @override
  Future<AppUser> login(String email, String password) async {
    await _gateway.signIn(email, password);
    return _gateway.currentProfile();
  }

  @override
  Future<AppUser> completeProfile({String? fullName}) =>
      _gateway.currentProfile(fullName: fullName);
  @override
  Future<void> logout() => _gateway.signOut();
}
