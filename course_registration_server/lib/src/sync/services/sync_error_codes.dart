abstract final class SyncErrorCodes {
  static const networkError = 'NETWORK_ERROR';
  static const authRequired = 'AUTH_REQUIRED';
  static const permissionDenied = 'PERMISSION_DENIED';
  static const validationError = 'VALIDATION_ERROR';
  static const prerequisiteNotMet = 'PREREQUISITE_NOT_MET';
  static const scheduleConflict = 'SCHEDULE_CONFLICT';
  static const creditLimitExceeded = 'CREDIT_LIMIT_EXCEEDED';
  static const classFull = 'CLASS_FULL';
  static const courseNotOpen = 'COURSE_NOT_OPEN';
  static const alreadyRegistered = 'ALREADY_REGISTERED';
  static const registrationNotFound = 'REGISTRATION_NOT_FOUND';
  static const versionConflict = 'VERSION_CONFLICT';
  static const alreadyProcessed = 'OPERATION_ALREADY_PROCESSED';
  static const serverError = 'SERVER_ERROR';

  static const businessErrors = {
    permissionDenied,
    validationError,
    prerequisiteNotMet,
    scheduleConflict,
    creditLimitExceeded,
    classFull,
    courseNotOpen,
    alreadyRegistered,
    registrationNotFound,
    versionConflict,
  };
}
