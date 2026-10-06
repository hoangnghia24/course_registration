import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/database/app_database.dart';
import '../../core/database/sync_manager.dart';
import '../../core/sync/sync_models.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/presentation/controllers/auth_state_controller.dart';

final clientProvider = Provider<Client>(
  (ref) => throw StateError('Client must be initialized during bootstrap.'),
);
final databaseProvider = Provider<AppDatabase>(
  (ref) => throw StateError('Database must be initialized during bootstrap.'),
);
final syncManagerProvider = Provider<SyncManager>(
  (ref) => throw StateError('Sync manager must be initialized.'),
);
final networkStatusProvider = StreamProvider<NetworkStatus>((ref) async* {
  final manager = ref.watch(syncManagerProvider);
  yield manager.networkStatus;
  yield* manager.networkStatuses;
});
final syncStatusProvider = StreamProvider<SyncStatusState>((ref) async* {
  final manager = ref.watch(syncManagerProvider);
  yield manager.status;
  yield* manager.statuses;
});
final pendingOperationsProvider = StreamProvider<List<SyncQueueData>>(
  (ref) => ref.watch(databaseProvider).watchOperations(),
);
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw StateError('Auth repository must be initialized.'),
);
final authStateControllerProvider = Provider<AuthStateController>(
  (ref) => throw StateError('Auth controller must be initialized.'),
);
