import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

abstract final class AdminPermissionService {
  static const fullAccessLevel = 9;

  static const defaultPermissions = <String>{
    'MANAGE_USER',
    'MANAGE_COURSE',
    'MANAGE_PROGRAM',
    'APPROVE_CLASS',
    'VIEW_REPORT',
    'VIEW_AUDIT',
  };

  static bool isAllowed(Set<String> granted, String required) =>
      granted.contains(required);

  static Future<List<AdminPermission>> grantDefaultPermissions(
    Session session, {
    required UuidValue adminId,
    Transaction? transaction,
  }) => AdminPermission.db.upsert(
    session,
    defaultPermissions
        .map(
          (permission) => AdminPermission(
            adminId: adminId,
            permissionName: permission,
          ),
        )
        .toList(growable: false),
    conflictColumns: (table) => [table.adminId, table.permissionName],
    transaction: transaction,
  );

  static Future<void> require(
    Session session,
    Admin admin,
    String permission,
  ) async {
    final rows = await AdminPermission.db.find(
      session,
      where: (table) => table.adminId.equals(admin.id),
    );
    final granted = rows.map((row) => row.permissionName).toSet();
    if (!isAllowed(granted, permission)) {
      throw AppException(
        code: 'permission_denied',
        message: 'Bạn không có quyền $permission.',
      );
    }
  }
}
