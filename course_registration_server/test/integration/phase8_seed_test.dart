import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import '../support/phase8_seed.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Phase 8 isolated seed', (sessionBuilder, _) {
    test(
      'creates complete synthetic test data without production data',
      () async {
        final session = sessionBuilder.build();
        final seed = await seedPhase8(session);

        expect(seed.students, hasLength(2));
        expect(await Lecturer.db.count(session), 1);
        expect(await Admin.db.count(session), 1);
        expect(await Course.db.count(session), 3);
        expect(await CoursePrerequisite.db.count(session), 1);
        expect(await CourseEquivalent.db.count(session), 1);
        expect(await Registration.db.count(session), 1);
        expect(await StudentTranscript.db.count(session), 1);
      },
    );
  });
}
