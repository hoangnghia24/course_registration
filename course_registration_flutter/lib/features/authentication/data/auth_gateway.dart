import 'package:course_registration_client/course_registration_client.dart';

abstract interface class AuthGateway {
  bool get isAuthenticated;
  Future<void> signIn(String email, String password);
  Future<AppUser> currentProfile({String? fullName});
  Future<void> signOut();
}
