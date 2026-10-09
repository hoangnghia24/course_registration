import 'dart:io';

import 'package:test/test.dart';

void main() {
  test(
    'permission repair only targets administrators with no permissions',
    () async {
      final sql = await File(
        'migrations/20261007235556599-admin-default-permissions/migration.sql',
      ).readAsString();

      expect(sql, contains('WHERE NOT EXISTS'));
      expect(sql, contains('ON CONFLICT ("adminId", "permissionName")'));
      expect(sql, isNot(contains('DELETE FROM')));
      expect(sql, isNot(contains('TRUNCATE')));
    },
  );
}
