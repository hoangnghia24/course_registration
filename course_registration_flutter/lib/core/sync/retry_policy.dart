abstract final class RetryPolicy {
  static const delays = [
    Duration(seconds: 5),
    Duration(seconds: 15),
    Duration(seconds: 30),
    Duration(seconds: 60),
  ];

  static int get maxRetries => delays.length;

  static Duration delayForAttempt(int attempt) =>
      delays[attempt.clamp(0, delays.length - 1)];

  static bool isBusinessError(String? code) => const {
    'PERMISSION_DENIED',
    'VALIDATION_ERROR',
    'PREREQUISITE_NOT_MET',
    'SCHEDULE_CONFLICT',
    'CREDIT_LIMIT_EXCEEDED',
    'CLASS_FULL',
    'COURSE_NOT_OPEN',
    'ALREADY_REGISTERED',
    'REGISTRATION_NOT_FOUND',
    'VERSION_CONFLICT',
  }.contains(code);
}
