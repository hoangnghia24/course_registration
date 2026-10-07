abstract final class InputValidator {
  static bool requiredText(String value, {required int maxLength}) {
    final normalized = value.trim();
    return normalized.isNotEmpty && normalized.length <= maxLength;
  }

  static bool optionalText(String? value, {required int maxLength}) =>
      value == null || value.trim().length <= maxLength;

  static bool email(String value) {
    final normalized = value.trim();
    return normalized.length <= 254 &&
        RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(normalized);
  }

  static bool academicYear(int value) => value >= 2000 && value <= 2100;

  static bool totalCredits(int value) => value >= 1 && value <= 300;

  static bool semesterNumber(int value) => value >= 1 && value <= 20;

  static bool programCode(String value) => RegExp(
    r'^[A-Z0-9][A-Z0-9_-]{2,29}$',
  ).hasMatch(value.trim().toUpperCase());

  static bool semesterCount(int value) => value >= 1 && value <= 20;
}
