import 'package:serverpod/serverpod.dart';

import 'role_guards.dart';

class StudentAccessEndpoint extends StudentGuard {
  Future<String> ping(Session session) async => 'student';
}

class LecturerAccessEndpoint extends LecturerGuard {
  Future<String> ping(Session session) async => 'lecturer';
}

class AdminAccessEndpoint extends AdminGuard {
  Future<String> ping(Session session) async => 'admin';
}
