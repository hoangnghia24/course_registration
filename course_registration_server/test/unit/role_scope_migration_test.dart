import 'dart:io';

import 'package:test/test.dart';

void main() {
  test(
    'role scope migration normalizes users, sessions and refresh tokens',
    () async {
      final sql = await File(
        'migrations/20261008001228094-role-scope-consistency/migration.sql',
      ).readAsString();

      expect(sql, contains('UPDATE "serverpod_auth_core_user"'));
      expect(sql, contains('UPDATE "serverpod_auth_core_session"'));
      expect(sql, contains('UPDATE "serverpod_auth_core_jwt_refresh_token"'));
      expect(
        RegExp(r'FROM "users" AS app_user').allMatches(sql).length,
        3,
      );
      expect(sql, isNot(contains('FROM "app_users" AS app_user')));
      expect(sql, contains('json_build_array(app_user."role")'));
      expect(sql, isNot(contains('DELETE FROM')));
    },
  );
}
