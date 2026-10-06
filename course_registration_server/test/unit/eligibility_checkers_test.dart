import 'package:course_registration_server/src/registration/services/eligibility_checkers.dart';
import 'package:test/test.dart';

void main() {
  test('prerequisite checker accepts a passed equivalent course', () {
    final result = PrerequisiteChecker.isSatisfied(
      prerequisites: {'CS100'},
      passedCourses: {'CS099'},
      equivalents: {
        'CS100': {'CS099'},
      },
    );
    expect(result, isTrue);
  });

  test('prerequisite checker rejects a missing prerequisite', () {
    expect(
      PrerequisiteChecker.isSatisfied(
        prerequisites: {'CS100'},
        passedCourses: const {},
        equivalents: const {},
      ),
      isFalse,
    );
  });

  test('schedule conflict checker detects overlapping periods', () {
    const candidate = ScheduleSlot(
      dayOfWeek: 2,
      startPeriod: 3,
      endPeriod: 5,
    );
    const registered = ScheduleSlot(
      dayOfWeek: 2,
      startPeriod: 1,
      endPeriod: 3,
    );
    expect(
      ScheduleConflictChecker.hasConflict([candidate], [registered]),
      isTrue,
    );
  });

  test('credit limit checker rejects totals above 25 credits', () {
    expect(
      CreditLimitChecker.canAdd(currentCredits: 24, courseCredits: 3),
      isFalse,
    );
    expect(
      CreditLimitChecker.canAdd(currentCredits: 22, courseCredits: 3),
      isTrue,
    );
  });

  test('capacity checker rejects a full class', () {
    expect(
      CapacityChecker.hasSeat(capacity: 50, registeredCount: 50),
      isFalse,
    );
    expect(
      CapacityChecker.hasSeat(capacity: 50, registeredCount: 49),
      isTrue,
    );
  });

  test(
    'registration window rejects before start, after end and closed status',
    () {
      final start = DateTime.utc(2026, 9, 1);
      final end = DateTime.utc(2026, 12, 31);
      expect(
        RegistrationWindowPolicy.isOpen(
          statusOpen: true,
          startDate: start,
          endDate: end,
          now: DateTime.utc(2026, 10, 2),
        ),
        isTrue,
      );
      for (final now in [DateTime.utc(2026, 8, 31), DateTime.utc(2027, 1, 1)]) {
        expect(
          RegistrationWindowPolicy.isOpen(
            statusOpen: true,
            startDate: start,
            endDate: end,
            now: now,
          ),
          isFalse,
        );
      }
      expect(
        RegistrationWindowPolicy.isOpen(
          statusOpen: false,
          startDate: start,
          endDate: end,
          now: DateTime.utc(2026, 10, 2),
        ),
        isFalse,
      );
    },
  );

  test('program checker rejects a course from another major', () {
    expect(
      ProgramChecker.matches(
        programMajorId: 'major-a',
        studentMajorId: 'major-b',
        containsCourse: true,
      ),
      isFalse,
    );
  });

  test('equivalent checker rejects an already passed equivalent', () {
    expect(
      EquivalentCourseChecker.canRegister(
        courseId: 'CS101',
        passedCourses: {'CS100'},
        equivalentCourseIds: {'CS100'},
      ),
      isFalse,
    );
  });

  test('duplicate checker rejects a registered course', () {
    expect(
      DuplicateRegistrationChecker.isDuplicate('CS101', ['CS101']),
      isTrue,
    );
  });
}
