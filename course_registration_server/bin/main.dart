import 'package:course_registration_server/server.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) {
  run(_developmentArgs(args));
}

/// Development data must always match the generated protocol. Without this,
/// adding a model field can leave the local database on the previous schema
/// and every endpoint touching that table will return HTTP 500.
List<String> _developmentArgs(List<String> args) {
  final modeIndex = args.indexOf('--mode');
  final explicitMode = modeIndex >= 0 && modeIndex + 1 < args.length
      ? args[modeIndex + 1]
      : args
            .where((value) => value.startsWith('--mode='))
            .map((value) => value.substring('--mode='.length))
            .firstOrNull;
  final isDevelopment = explicitMode == null || explicitMode == 'development';
  final managesMigrations =
      args.contains('--apply-migrations') ||
      args.contains('--apply-repair-migration');
  return isDevelopment && !managesMigrations
      ? [...args, '--apply-migrations']
      : args;
}
