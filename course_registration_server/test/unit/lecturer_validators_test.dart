import 'package:course_registration_server/src/lecturer/services/lecturer_validators.dart';
import 'package:course_registration_server/src/registration/services/eligibility_checkers.dart';
import 'package:test/test.dart';

void main() {
  test('create class validator requires code and valid capacity', () {
    expect(
      LecturerClassValidator.validForCreate(
        classCode: 'IT101-01',
        capacity: 50,
      ),
      isTrue,
    );
    expect(
      LecturerClassValidator.validForCreate(classCode: '', capacity: 50),
      isFalse,
    );
  });

  test('update class validator accepts capacity above enrollment', () {
    expect(
      LecturerClassValidator.validForUpdate(
        capacity: 60,
        registeredCount: 45,
      ),
      isTrue,
    );
  });

  test('schedule checker rejects overlapping teaching periods', () {
    const candidate = ScheduleSlot(
      dayOfWeek: 3,
      startPeriod: 2,
      endPeriod: 4,
    );
    const existing = ScheduleSlot(
      dayOfWeek: 3,
      startPeriod: 4,
      endPeriod: 6,
    );
    expect(
      TeachingConflictChecker.hasConflict([candidate], [existing]),
      isTrue,
    );
  });

  test('capacity validation rejects values below registered count', () {
    expect(
      LecturerClassValidator.validForUpdate(
        capacity: 44,
        registeredCount: 45,
      ),
      isFalse,
    );
  });
}
