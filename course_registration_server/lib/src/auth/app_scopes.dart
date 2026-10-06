import 'package:serverpod/serverpod.dart';

abstract final class AppScopes {
  static const student = Scope('student');
  static const lecturer = Scope('lecturer');
  static const admin = Scope('admin');
}
