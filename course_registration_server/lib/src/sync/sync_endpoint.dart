import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'services/sync_service.dart';

class SyncEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<DateTime> ping(Session session) async => DateTime.now().toUtc();

  Future<List<SyncOperationResultDto>> pushOperations(
    Session session, {
    required List<SyncOperationInputDto> operations,
  }) => SyncService.pushOperations(session, operations);

  Future<PullSyncResultDto> pullChanges(
    Session session, {
    DateTime? lastSyncAt,
  }) => SyncService.pullChanges(session, lastSyncAt: lastSyncAt);

  Future<SyncStatusDto> getSyncStatus(Session session) =>
      SyncService.getSyncStatus(session);

  Future<SyncOperationResultDto> retryOperation(
    Session session, {
    required UuidValue operationId,
  }) => SyncService.retryOperation(session, operationId);
}
