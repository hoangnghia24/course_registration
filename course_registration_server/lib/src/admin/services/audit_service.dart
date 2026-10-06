import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

abstract final class AuditService {
  static Future<void> log(
    Session session, {
    required AppUser actor,
    required String action,
    required String entity,
    required UuidValue entityId,
    String? oldValue,
    String? newValue,
    Transaction? transaction,
  }) async {
    await SystemAuditLog.db.insertRow(
      session,
      SystemAuditLog(
        userId: actor.id!,
        action: action,
        entity: entity,
        entityId: entityId,
        oldValue: oldValue,
        newValue: newValue,
      ),
      transaction: transaction,
    );
  }
}
