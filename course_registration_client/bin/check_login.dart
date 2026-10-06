import 'dart:io';

import 'package:course_registration_client/course_registration_client.dart';

Future<void> main(List<String> args) async {
  if (args.length != 3) {
    stderr.writeln(
      'Usage: dart run bin/check_login.dart <server-url> <email> <password>',
    );
    exitCode = 64;
    return;
  }

  final client = Client(args[0]);
  try {
    final result = await client.emailIdp.login(
      email: args[1].trim().toLowerCase(),
      password: args[2],
    );
    stdout.writeln('LOGIN_OK');
    stdout.writeln('authUserId=${result.authUserId}');
    stdout.writeln('scopes=${result.scopeNames.toList()..sort()}');
  } catch (error) {
    stderr.writeln('LOGIN_FAILED: $error');
    exitCode = 1;
  } finally {
    client.close();
  }
}
