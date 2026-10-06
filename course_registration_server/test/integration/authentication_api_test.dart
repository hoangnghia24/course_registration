import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  late EmailIdp emailIdp;

  setUp(() {
    AuthServices.set(
      tokenManagerBuilders: [
        ServerSideSessionsConfig(sessionKeyHashPepper: 'test-session-pepper'),
      ],
      identityProviderBuilders: [
        EmailIdpConfig(
          secretHashPepper: 'test-email-pepper',
        ),
      ],
    );
    emailIdp = AuthServices.getIdentityProvider<EmailIdp>();
  });

  withServerpod('Authentication API', (sessionBuilder, endpoints) {
    test('rejects public email registration', () async {
      final email =
          'student-${DateTime.now().microsecondsSinceEpoch}@example.edu';
      expect(
        () => endpoints.emailIdp.startRegistration(
          sessionBuilder,
          email: email,
        ),
        throwsA(isA<EmailAccountRequestException>()),
      );
    });

    test(
      'accepts provisioned credentials and rejects a wrong password',
      () async {
        final email =
            'login-${DateTime.now().microsecondsSinceEpoch}@example.edu';
        const password = 'Valid-pass-123!';
        final session = sessionBuilder.build();
        final authUser = await AuthServices.instance.authUsers.create(
          session,
          scopes: {AppScopes.student},
        );
        await emailIdp.admin.createEmailAuthentication(
          session,
          authUserId: authUser.id,
          email: email,
          password: password,
        );

        final success = await endpoints.emailIdp.login(
          sessionBuilder,
          email: email,
          password: password,
        );
        expect(success.authStrategy, isNotEmpty);
        expect(
          () => endpoints.emailIdp.login(
            sessionBuilder,
            email: email,
            password: 'Incorrect-pass-123!',
          ),
          throwsA(anything),
        );
      },
    );

    test('rejects an unknown email account', () async {
      expect(
        () => endpoints.emailIdp.login(
          sessionBuilder,
          email: 'missing-${DateTime.now().microsecondsSinceEpoch}@example.edu',
          password: 'Incorrect-pass-123!',
        ),
        throwsA(anything),
      );
    });

    test('rejects unauthenticated profile access', () async {
      expect(
        () => endpoints.profile.current(sessionBuilder),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });

    test('student scope can access student endpoint only', () async {
      final studentSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          const Uuid().v4().toString(),
          {AppScopes.student},
        ),
      );
      expect(await endpoints.studentAccess.ping(studentSession), 'student');
      expect(
        () => endpoints.adminAccess.ping(studentSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });
  }, rollbackDatabase: RollbackDatabase.disabled);
}
