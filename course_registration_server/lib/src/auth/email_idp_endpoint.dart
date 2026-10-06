import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {
  /// Public self-registration is intentionally disabled. Accounts are
  /// provisioned by the university and can still use login/password reset.
  @override
  Future<UuidValue> startRegistration(
    Session session, {
    required String email,
  }) {
    throw EmailAccountRequestException(
      reason: EmailAccountRequestExceptionReason.invalid,
    );
  }

  @override
  Future<String> verifyRegistrationCode(
    Session session, {
    required UuidValue accountRequestId,
    required String verificationCode,
  }) {
    throw EmailAccountRequestException(
      reason: EmailAccountRequestExceptionReason.invalid,
    );
  }

  @override
  Future<AuthSuccess> finishRegistration(
    Session session, {
    required String registrationToken,
    required String password,
  }) {
    throw EmailAccountRequestException(
      reason: EmailAccountRequestExceptionReason.invalid,
    );
  }
}
