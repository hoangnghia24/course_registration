import 'package:course_registration_client/course_registration_client.dart';

abstract interface class AuthRepository {
  bool get isAuthenticated;
  Future<AppUser?> restore();
  Future<AppUser> login(String email, String password);
  Future<AppUser> completeProfile({String? fullName});
  Future<void> logout();
}
