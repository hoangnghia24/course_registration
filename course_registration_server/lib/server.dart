import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import 'src/generated/serverpod.dart';
import 'src/profile/profile_service.dart';

void run(List<String> args) async {
  final pod = Serverpod(args);

  pod.initializeAuthServices(
    tokenManagerBuilders: [JwtConfigFromPasswords()],
    identityProviderBuilders: [
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode: _sendRegistrationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
        onAfterAccountCreated:
            (
              session, {
              required email,
              required authUserId,
              required emailAccountId,
              required transaction,
            }) => ProfileService.createForEmailAccount(
              session,
              authUserId: authUserId,
              email: email,
              transaction: transaction,
            ),
      ),
    ],
  );

  await pod.start();
}

void _sendRegistrationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  session.log(
    '[EmailIdp] Registration verification requested.',
    level: LogLevel.info,
  );
}

void _sendPasswordResetCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  session.log(
    '[EmailIdp] Password reset verification requested.',
    level: LogLevel.info,
  );
}
