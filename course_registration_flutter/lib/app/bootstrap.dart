import 'dart:async';

import 'package:course_registration_client/course_registration_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import '../core/database/app_database.dart';
import '../core/database/sync_manager.dart';
import '../features/authentication/data/auth_repository_impl.dart';
import '../features/authentication/data/serverpod_auth_gateway.dart';
import '../features/authentication/presentation/controllers/auth_state_controller.dart';

class BootstrapDependencies {
  const BootstrapDependencies({
    required this.client,
    required this.database,
    required this.authRepository,
    required this.authStateController,
    required this.syncManager,
  });

  final Client client;
  final AppDatabase database;
  final AuthRepositoryImpl authRepository;
  final AuthStateController authStateController;
  final SyncManager syncManager;
}

Future<BootstrapDependencies> bootstrap() async {
  final client = Client(await getServerUrl())
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();
  await client.auth.initialize();
  final database = AppDatabase();
  final syncManager = SyncManager(client, database);
  await syncManager.start();
  final repository = AuthRepositoryImpl(ServerpodAuthGateway(client));
  final authController = AuthStateController(
    repository,
    onAuthenticated: syncManager.synchronize,
  );
  await authController.restore();
  unawaited(syncManager.synchronize());
  return BootstrapDependencies(
    client: client,
    database: database,
    authRepository: repository,
    authStateController: authController,
    syncManager: syncManager,
  );
}
