import '../../registration/services/eligibility_checkers.dart';
import '../../core/input_validator.dart';

abstract final class LecturerClassValidator {
  static bool validForCreate({
    required String classCode,
    required int capacity,
  }) =>
      InputValidator.requiredText(classCode, maxLength: 32) &&
      capacity > 0 &&
      capacity <= 500;

  static bool validForUpdate({
    required int capacity,
    required int registeredCount,
  }) => capacity > 0 && capacity <= 500 && capacity >= registeredCount;
}

abstract final class TeachingConflictChecker {
  static bool hasConflict(
    Iterable<ScheduleSlot> candidate,
    Iterable<ScheduleSlot> existing,
  ) => ScheduleConflictChecker.hasConflict(candidate, existing);
}
