import 'dart:io';

import 'package:course_registration_server/src/generated/serverpod.dart';
import 'package:course_registration_server/src/seed/demo_data_seed.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

Future<void> main(List<String> args) async {
  final pod = Serverpod(args);
  pod.initializeAuthServices(
    tokenManagerBuilders: [JwtConfigFromPasswords()],
    identityProviderBuilders: [EmailIdpConfigFromPasswords()],
  );

  await pod.start();
  try {
    final created = await pod.withSession(
      (session) => DemoDataSeed.run(
        session,
        AuthServices.getIdentityProvider<EmailIdp>(),
      ),
      enableLogging: false,
    );
    stdout.writeln(
      created
          ? 'Da tao du lieu hoc vu va ${DemoDataSeed.accounts.length} tai khoan.'
          : 'Du lieu hoc vu da ton tai; da dat lai mat khau tai khoan.',
    );
    stdout.writeln('Mat khau chung: ${DemoDataSeed.password}');
    for (final account in DemoDataSeed.accounts) {
      stdout.writeln('${account.role.name}: ${account.email}');
    }
  } finally {
    await pod.shutdown(exitProcess: false);
  }
}
