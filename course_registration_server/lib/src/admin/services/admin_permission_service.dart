import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

abstract final class AdminPermissionService {
  static bool isAllowed(Set<String> granted, String required) =>
      granted.isEmpty || granted.contains(required);

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
