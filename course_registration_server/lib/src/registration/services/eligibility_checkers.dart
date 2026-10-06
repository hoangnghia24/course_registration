class ScheduleSlot {
  const ScheduleSlot({
    required this.dayOfWeek,
    required this.startPeriod,
    required this.endPeriod,
  });

  final int dayOfWeek;
  final int startPeriod;
  final int endPeriod;
}

abstract final class PrerequisiteChecker {
  static bool isSatisfied({
    required Set<String> prerequisites,
    required Set<String> passedCourses,
    required Map<String, Set<String>> equivalents,
  }) => prerequisites.every(
    (requiredCourse) =>
        passedCourses.contains(requiredCourse) ||
        (equivalents[requiredCourse] ?? const <String>{}).any(
          passedCourses.contains,
        ),
  );
}

abstract final class ScheduleConflictChecker {
  static bool hasConflict(
    Iterable<ScheduleSlot> candidate,
    Iterable<ScheduleSlot> registered,
  ) {
    for (final next in candidate) {
      for (final current in registered) {
        if (next.dayOfWeek == current.dayOfWeek &&
            next.startPeriod <= current.endPeriod &&
            current.startPeriod <= next.endPeriod) {
          return true;
        }
      }
    }
    return false;
  }
}

abstract final class CreditLimitChecker {
  static const minimumCredits = 10;
  static const maximumCredits = 25;

  static bool canAdd({
    required int currentCredits,
    required int courseCredits,
  }) => currentCredits + courseCredits <= maximumCredits;
}

abstract final class CapacityChecker {
  static bool hasSeat({
    required int capacity,
    required int registeredCount,
  }) => capacity > 0 && registeredCount < capacity;
}

abstract final class RegistrationWindowPolicy {
  static bool isOpen({
    required bool statusOpen,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime now,
  }) {
    final current = now.toUtc();
    return statusOpen &&
        !current.isBefore(startDate.toUtc()) &&
        !current.isAfter(endDate.toUtc());
  }
}

abstract final class ProgramChecker {
  static bool matches({
    required String? programMajorId,
    required String? studentMajorId,
    required bool containsCourse,
  }) =>
      programMajorId != null &&
      programMajorId == studentMajorId &&
      containsCourse;
}

abstract final class EquivalentCourseChecker {
  static bool canRegister({
    required String courseId,
    required Set<String> passedCourses,
    required Set<String> equivalentCourseIds,
  }) =>
      !passedCourses.contains(courseId) &&
      equivalentCourseIds.intersection(passedCourses).isEmpty;
}

abstract final class DuplicateRegistrationChecker {
  static bool isDuplicate(
    String courseId,
    Iterable<String> registeredCourseIds,
  ) => registeredCourseIds.contains(courseId);
}
