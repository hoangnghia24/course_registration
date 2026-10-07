import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:course_registration_server/src/seed/demo_data_seed.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  late EmailIdp emailIdp;

  setUp(() {
    AuthServices.set(
      tokenManagerBuilders: [
        ServerSideSessionsConfig(sessionKeyHashPepper: 'demo-test-pepper'),
      ],
      identityProviderBuilders: [
        EmailIdpConfig(secretHashPepper: 'demo-email-test-pepper'),
      ],
    );
    emailIdp = AuthServices.getIdentityProvider<EmailIdp>();
  });

  withServerpod(
    'Demo data seed',
    (sessionBuilder, _) {
      test('seeds every application area and is safe to run twice', () async {
        final session = sessionBuilder.build();

        expect(await DemoDataSeed.run(session, emailIdp), isTrue);
        expect(await DemoDataSeed.run(session, emailIdp), isFalse);

        expect(await AppUser.db.count(session), 14);
        expect(await Student.db.count(session), 10);
        expect(await Lecturer.db.count(session), 3);
        expect(await Admin.db.count(session), 1);
        expect(
          await AdminPermission.db.count(session),
          greaterThanOrEqualTo(5),
        );
        expect(await Course.db.count(session), 41);
        final program = await TrainingProgram.db.findFirstRow(session);
        expect(program?.semesterCount, 8);
        expect(program?.status, TrainingProgramStatus.active);
        final mappings = await TrainingProgramCourse.db.find(session);
        expect(mappings.map((item) => item.semesterNumber).toSet(), {
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
        });
        expect(await CourseClass.db.count(session), 8);
        expect(await Registration.db.count(session), 18);
        expect(await RegistrationHistory.db.count(session), 2);
        final transcripts = await StudentTranscript.db.find(session);
        expect(transcripts, hasLength(3));
        expect(
          transcripts.every(
            (transcript) => transcript.score >= 0 && transcript.score <= 4,
          ),
          isTrue,
        );
        expect(await SystemAuditLog.db.count(session), 1);
        expect(await ProcessedSyncOperation.db.count(session), 1);
        expect(await SyncChange.db.count(session), 1);
        expect(await SyncLog.db.count(session), 1);

        final login = await emailIdp.login(
          session,
          email: 'phongdaotao@namviet.edu.vn',
          password: DemoDataSeed.password,
        );
        expect(login.authUserId, isNotNull);
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
  );
}
