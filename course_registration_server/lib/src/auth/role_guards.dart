import 'package:serverpod/serverpod.dart';

import 'app_scopes.dart';

abstract class StudentGuard extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {AppScopes.student};
}

abstract class LecturerGuard extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {AppScopes.lecturer};
}

abstract class AdminGuard extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => {AppScopes.admin};
}
