import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../support/phase8_seed.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Phase 8 registration business rules', (
    sessionBuilder,
    endpoints,
  ) {
    late Session session;
    late Phase8Seed seed;

    setUp(() async {
      session = sessionBuilder.build();
      seed = await seedPhase8(session);
    });

    test(
      'eligible student registers and all related data stays consistent',
      () async {
        await _grantPrerequisite(session, seed, seed.students.last);
        final result = await endpoints.courseRegistration.registerCourse(
          _studentSession(sessionBuilder, seed, 1),
          courseClassId: seed.courseClass.id!,
          deviceInfo: 'phase8-eligible',
        );

        expect(result.success, isTrue);
        final courseClass = await CourseClass.db.findById(
          session,
          seed.courseClass.id!,
        );
        final registrations = await Registration.db.find(
          session,
          where: (table) =>
              table.courseClassId.equals(seed.courseClass.id) &
              table.status.equals(RegistrationStatus.registered),
        );
        final history = await RegistrationHistory.db.find(
          session,
          where: (table) =>
              table.studentId.equals(seed.students.last.id) &
              table.action.equals(RegistrationAction.register),
        );
        expect(courseClass?.registeredCount, registrations.length);
        expect(courseClass?.registeredCount, 2);
        expect(history.single.deviceInfo, 'phase8-eligible');
      },
    );

    test('missing prerequisite is rejected', () async {
      final result = await endpoints.courseRegistration.registerCourse(
        _studentSession(sessionBuilder, seed, 1),
        courseClassId: seed.courseClass.id!,
      );
      expect(result.success, isFalse);
      expect(result.errorCode, 'PREREQUISITE_NOT_MET');
    });

    test('schedule conflict is rejected', () async {
      final student = seed.students.last;
      await _grantPrerequisite(session, seed, student);
      await _addExistingRegistration(
        session,
        seed,
        student,
        code: 'P8-CONFLICT',
        credits: 3,
        schedule: const _Schedule(2, 2, 4),
      );

      final eligibility = await endpoints.courseRegistration.checkEligibility(
        _studentSession(sessionBuilder, seed, 1),
        courseClassId: seed.courseClass.id!,
      );
      expect(eligibility.eligible, isFalse);
      expect(eligibility.scheduleAvailable, isFalse);
    });

    test('credit total above 25 is rejected', () async {
      final student = seed.students.last;
      await _grantPrerequisite(session, seed, student);
      for (var index = 0; index < 8; index++) {
        await _addExistingRegistration(
          session,
          seed,
          student,
          code: 'P8-CREDIT-$index',
          credits: 3,
        );
      }

      final eligibility = await endpoints.courseRegistration.checkEligibility(
        _studentSession(sessionBuilder, seed, 1),
        courseClassId: seed.courseClass.id!,
      );
      expect(eligibility.currentCredits, 24);
      expect(eligibility.projectedCredits, 27);
      expect(eligibility.withinCreditLimit, isFalse);
    });

    test('course outside student program or major is rejected', () async {
      final student = seed.students.last;
      await _grantPrerequisite(session, seed, student);
      final otherMajor = await Major.db.insertRow(
        session,
        Major(
          facultyId: seed.major.facultyId,
          name: 'Other Phase 8 Major',
          code: 'P8-OTHER-MAJOR',
        ),
      );
      final otherProgram = await TrainingProgram.db.insertRow(
        session,
        TrainingProgram(
          majorId: otherMajor.id!,
          code: 'P8-OTHER',
          name: 'Other Phase 8 Program',
          academicYear: 2026,
          totalCredits: 120,
          semesterCount: 8,
        ),
      );
      await Student.db.updateRow(
        session,
        student.copyWith(trainingProgramId: otherProgram.id),
      );

      final eligibility = await endpoints.courseRegistration.checkEligibility(
        _studentSession(sessionBuilder, seed, 1),
        courseClassId: seed.courseClass.id!,
      );
      expect(eligibility.inTrainingProgram, isFalse);
      expect(eligibility.eligible, isFalse);
    });

    test('passed equivalent course is rejected', () async {
      final existing = await Course.db.insertRow(
        session,
        Course(
          courseCode: 'P8-TARGET-EQV',
          courseName: 'Target equivalent',
          credits: 3,
          courseType: CourseType.compulsory,
        ),
      );
      await CourseEquivalent.db.insertRow(
        session,
        CourseEquivalent(
          courseId: seed.course.id!,
          equivalentId: existing.id!,
        ),
      );
      await StudentTranscript.db.insertRow(
        session,
        StudentTranscript(
          studentId: seed.students.last.id!,
          courseId: existing.id!,
          semester: '2025-2',
          score: 3,
          letterGrade: 'B',
          status: TranscriptStatus.passed,
        ),
      );
      await _grantPrerequisite(session, seed, seed.students.last);

      final eligibility = await endpoints.courseRegistration.checkEligibility(
        _studentSession(sessionBuilder, seed, 1),
        courseClassId: seed.courseClass.id!,
      );
      expect(eligibility.equivalentAvailable, isFalse);
      expect(eligibility.eligible, isFalse);
    });

    test('full class and already registered course are rejected', () async {
      final duplicate = await endpoints.courseRegistration.registerCourse(
        _studentSession(sessionBuilder, seed, 0),
        courseClassId: seed.courseClass.id!,
      );
      expect(duplicate.success, isFalse);
      expect(duplicate.errorCode, 'ALREADY_REGISTERED');

      await _grantPrerequisite(session, seed, seed.students.last);
      await CourseClass.db.updateRow(
        session,
        seed.courseClass.copyWith(
          capacity: 1,
          registeredCount: 1,
          status: CourseClassStatus.full,
        ),
      );
      final full = await endpoints.courseRegistration.registerCourse(
        _studentSession(sessionBuilder, seed, 1),
        courseClassId: seed.courseClass.id!,
      );
      expect(full.success, isFalse);
      expect(full.errorCode, 'CLASS_FULL');
    });

    test(
      'closed semester and elapsed registration deadline are rejected',
      () async {
        await _grantPrerequisite(session, seed, seed.students.last);
        await Semester.db.updateRow(
          session,
          seed.semester.copyWith(status: SemesterStatus.closed),
        );
        final closed = await endpoints.courseRegistration.registerCourse(
          _studentSession(sessionBuilder, seed, 1),
          courseClassId: seed.courseClass.id!,
        );
        expect(closed.success, isFalse);
        expect(closed.errorCode, 'COURSE_NOT_OPEN');

        await Semester.db.updateRow(
          session,
          seed.semester.copyWith(
            status: SemesterStatus.open,
            startDate: DateTime.utc(2020),
            endDate: DateTime.utc(2020, 12, 31),
          ),
        );
        final period = await RegistrationPeriod.db.findFirstRow(
          session,
          where: (table) => table.semesterId.equals(seed.semester.id),
        );
        await RegistrationPeriod.db.updateRow(
          session,
          period!.copyWith(
            startTime: DateTime.utc(2020),
            endTime: DateTime.utc(2020, 12, 31),
          ),
        );
        final expired = await endpoints.courseRegistration.registerCourse(
          _studentSession(sessionBuilder, seed, 1),
          courseClassId: seed.courseClass.id!,
        );
        expect(expired.success, isFalse);
        expect(expired.errorCode, 'COURSE_NOT_OPEN');
      },
    );

    test(
      'cancellation succeeds once and preserves count and history',
      () async {
        final registration = await _seedRegistration(session, seed);
        final authenticated = _studentSession(sessionBuilder, seed, 0);
        final first = await endpoints.courseRegistration.cancelCourse(
          authenticated,
          registrationId: registration.id!,
          deviceInfo: 'phase8-cancel',
        );
        final duplicate = await endpoints.courseRegistration.cancelCourse(
          authenticated,
          registrationId: registration.id!,
        );

        expect(first.success, isTrue);
        expect(duplicate.success, isFalse);
        expect(duplicate.errorCode, 'REGISTRATION_NOT_FOUND');
        final courseClass = await CourseClass.db.findById(
          session,
          seed.courseClass.id!,
        );
        final history = await RegistrationHistory.db.find(
          session,
          where: (table) =>
              table.studentId.equals(seed.students.first.id) &
              table.action.equals(RegistrationAction.cancel),
        );
        expect(courseClass?.registeredCount, 0);
        expect(history.single.deviceInfo, 'phase8-cancel');
      },
    );

    test('foreign or nonexistent cancellation is rejected', () async {
      final registration = await _seedRegistration(session, seed);
      final otherStudent = _studentSession(sessionBuilder, seed, 1);
      await expectLater(
        endpoints.courseRegistration.cancelCourse(
          otherStudent,
          registrationId: registration.id!,
        ),
        throwsA(isA<AppException>().having((e) => e.code, 'code', 'forbidden')),
      );
      await expectLater(
        endpoints.courseRegistration.cancelCourse(
          otherStudent,
          registrationId: const Uuid().v4obj(),
        ),
        throwsA(isA<AppException>().having((e) => e.code, 'code', 'forbidden')),
      );
    });

    test('cancellation after deadline is rejected without mutation', () async {
      final registration = await _seedRegistration(session, seed);
      await Semester.db.updateRow(
        session,
        seed.semester.copyWith(
          startDate: DateTime.utc(2020),
          endDate: DateTime.utc(2020, 12, 31),
        ),
      );
      final period = await RegistrationPeriod.db.findFirstRow(
        session,
        where: (table) => table.semesterId.equals(seed.semester.id),
      );
      await RegistrationPeriod.db.updateRow(
        session,
        period!.copyWith(
          startTime: DateTime.utc(2020),
          endTime: DateTime.utc(2020, 12, 31),
        ),
      );
      final result = await endpoints.courseRegistration.cancelCourse(
        _studentSession(sessionBuilder, seed, 0),
        registrationId: registration.id!,
      );
      expect(result.success, isFalse);
      expect(result.errorCode, 'COURSE_NOT_OPEN');
      await Semester.db.updateRow(
        session,
        seed.semester.copyWith(
          status: SemesterStatus.closed,
          startDate: DateTime.utc(2026, 1),
          endDate: DateTime.utc(2027, 12, 31),
        ),
      );
      final closed = await endpoints.courseRegistration.cancelCourse(
        _studentSession(sessionBuilder, seed, 0),
        registrationId: registration.id!,
      );
      expect(closed.success, isFalse);
      expect(closed.errorCode, 'COURSE_NOT_OPEN');
      expect(
        (await Registration.db.findById(session, registration.id!))?.status,
        RegistrationStatus.registered,
      );
      expect(
        (await CourseClass.db.findById(
          session,
          seed.courseClass.id!,
        ))?.registeredCount,
        1,
      );
    });
  });
}

TestSessionBuilder _studentSession(
  TestSessionBuilder builder,
  Phase8Seed seed,
  int index,
) => builder.copyWith(
  authentication: AuthenticationOverride.authenticationInfo(
    seed.studentAuthIds[index].toString(),
    {AppScopes.student},
  ),
);

Future<void> _grantPrerequisite(
  Session session,
  Phase8Seed seed,
  Student student,
) async {
  final prerequisite = await CoursePrerequisite.db.findFirstRow(
    session,
    where: (table) => table.courseId.equals(seed.course.id),
  );
  await StudentTranscript.db.insertRow(
    session,
    StudentTranscript(
      studentId: student.id!,
      courseId: prerequisite!.prerequisiteId,
      semester: '2025-2',
      score: 3,
      letterGrade: 'B',
      status: TranscriptStatus.passed,
    ),
  );
}

Future<Registration> _seedRegistration(
  Session session,
  Phase8Seed seed,
) async => (await Registration.db.findFirstRow(
  session,
  where: (table) =>
      table.studentId.equals(seed.students.first.id) &
      table.courseClassId.equals(seed.courseClass.id),
))!;

Future<void> _addExistingRegistration(
  Session session,
  Phase8Seed seed,
  Student student, {
  required String code,
  required int credits,
  _Schedule? schedule,
}) async {
  final course = await Course.db.insertRow(
    session,
    Course(
      courseCode: code,
      courseName: code,
      credits: credits,
      courseType: CourseType.compulsory,
    ),
  );
  final courseClass = await CourseClass.db.insertRow(
    session,
    CourseClass(
      courseId: course.id!,
      lecturerId: seed.lecturer.id!,
      semesterId: seed.semester.id!,
      classCode: '$code-CLASS',
      capacity: 30,
      registeredCount: 1,
      status: CourseClassStatus.open,
    ),
  );
  if (schedule != null) {
    await ClassSchedule.db.insertRow(
      session,
      ClassSchedule(
        courseClassId: courseClass.id!,
        dayOfWeek: schedule.day,
        startPeriod: schedule.start,
        endPeriod: schedule.end,
        room: '$code-ROOM',
      ),
    );
  }
  await Registration.db.insertRow(
    session,
    Registration(
      studentId: student.id!,
      courseClassId: courseClass.id!,
      status: RegistrationStatus.registered,
    ),
  );
}

class _Schedule {
  const _Schedule(this.day, this.start, this.end);

  final int day;
  final int start;
  final int end;
}
