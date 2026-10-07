/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:course_registration_client/src/protocol/admin/dto/admin_user_dto.dart'
    as _iitlaycf;
import 'package:course_registration_client/src/protocol/admin/dto/analytics_report_dto.dart'
    as _i76p16dt;
import 'package:course_registration_client/src/protocol/admin/dto/audit_log_dto.dart'
    as _iaxc31e6;
import 'package:course_registration_client/src/protocol/admin/dto/pending_class_approval_dto.dart'
    as _iiom1wy7;
import 'package:course_registration_client/src/protocol/admin/models/admin_permission.dart'
    as _i3lq6s0i;
import 'package:course_registration_client/src/protocol/admin/models/class_approval.dart'
    as _ivfrfn41;
import 'package:course_registration_client/src/protocol/app_user.dart'
    as _igznxkwp;
import 'package:course_registration_client/src/protocol/greetings/greeting.dart'
    as _iegjp1l2;
import 'package:course_registration_client/src/protocol/lecturer/dto/class_demand_dto.dart'
    as _in85cpl6;
import 'package:course_registration_client/src/protocol/lecturer/dto/class_student_dto.dart'
    as _i0ncgxlw;
import 'package:course_registration_client/src/protocol/lecturer/dto/lecturer_course_class_dto.dart'
    as _ibein0b1;
import 'package:course_registration_client/src/protocol/lecturer/dto/lecturer_profile_dto.dart'
    as _iaxps9pc;
import 'package:course_registration_client/src/protocol/lecturer/models/teaching_schedule_proposal.dart'
    as _i81hb12m;
import 'package:course_registration_client/src/protocol/registration/dto/class_schedule_dto.dart'
    as _iff0ymco;
import 'package:course_registration_client/src/protocol/registration/dto/eligibility_result_dto.dart'
    as _i9bwqx65;
import 'package:course_registration_client/src/protocol/registration/dto/open_course_class_dto.dart'
    as _ilyiw8j3;
import 'package:course_registration_client/src/protocol/registration/dto/registered_course_dto.dart'
    as _irdda7pa;
import 'package:course_registration_client/src/protocol/registration/dto/registration_result_dto.dart'
    as _iuabtiyn;
import 'package:course_registration_client/src/protocol/registration/models/course_equivalent.dart'
    as _i67xlk2c;
import 'package:course_registration_client/src/protocol/registration/models/course_opening_request.dart'
    as _i095tu7a;
import 'package:course_registration_client/src/protocol/registration/models/course_prerequisite.dart'
    as _i5zv3u4e;
import 'package:course_registration_client/src/protocol/registration/models/semester.dart'
    as _iu5keruo;
import 'package:course_registration_client/src/protocol/student/dto/gpa_dto.dart'
    as _ie7tm93i;
import 'package:course_registration_client/src/protocol/student/dto/student_profile_dto.dart'
    as _iwso8igi;
import 'package:course_registration_client/src/protocol/student/dto/training_program_course_dto.dart'
    as _ic40qcjp;
import 'package:course_registration_client/src/protocol/student/dto/transcript_dto.dart'
    as _iwasio4x;
import 'package:course_registration_client/src/protocol/student/models/course.dart'
    as _ihzhjg22;
import 'package:course_registration_client/src/protocol/student/models/course_type.dart'
    as _i3t21fbx;
import 'package:course_registration_client/src/protocol/student/models/major.dart'
    as _i2uuv4ic;
import 'package:course_registration_client/src/protocol/student/models/training_program.dart'
    as _iiopdple;
import 'package:course_registration_client/src/protocol/student/models/training_program_course.dart'
    as _ijwatpay;
import 'package:course_registration_client/src/protocol/sync/dto/pull_sync_result_dto.dart'
    as _iua1j9e4;
import 'package:course_registration_client/src/protocol/sync/dto/sync_operation_input_dto.dart'
    as _igbyh0qh;
import 'package:course_registration_client/src/protocol/sync/dto/sync_operation_result_dto.dart'
    as _ikwxjn0j;
import 'package:course_registration_client/src/protocol/sync/dto/sync_status_dto.dart'
    as _i2y24jsu;
import 'package:course_registration_client/src/protocol/user_role.dart'
    as _ib55lglj;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// {@category Endpoint}
class EndpointAdmin extends EndpointAdminGuard {
  EndpointAdmin(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _ida.Future<List<_iitlaycf.AdminUserDto>> getUsers({
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_iitlaycf.AdminUserDto>>(
    'admin',
    'getUsers',
    {
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<_iitlaycf.AdminUserDto> createUser({
    required String email,
    required String password,
    required String fullName,
    required _ib55lglj.UserRole role,
    String? phone,
    int? academicYear,
    _isc.UuidValue? majorId,
    _isc.UuidValue? trainingProgramId,
  }) => caller.callServerEndpoint<_iitlaycf.AdminUserDto>(
    'admin',
    'createUser',
    {
      'email': email,
      'password': password,
      'fullName': fullName,
      'role': role,
      'phone': phone,
      'academicYear': academicYear,
      'majorId': majorId,
      'trainingProgramId': trainingProgramId,
    },
  );

  _ida.Future<_iitlaycf.AdminUserDto> updateUser({
    required _isc.UuidValue userId,
    required String fullName,
    String? phone,
  }) => caller.callServerEndpoint<_iitlaycf.AdminUserDto>(
    'admin',
    'updateUser',
    {
      'userId': userId,
      'fullName': fullName,
      'phone': phone,
    },
  );

  _ida.Future<bool> disableUser({required _isc.UuidValue userId}) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'disableUser',
        {'userId': userId},
      );

  _ida.Future<bool> enableUser({required _isc.UuidValue userId}) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'enableUser',
        {'userId': userId},
      );

  _ida.Future<List<_ihzhjg22.Course>> getCourses({
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_ihzhjg22.Course>>(
    'admin',
    'getCourses',
    {
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<_ihzhjg22.Course> createCourse({
    required String courseName,
    required int credits,
    required _i3t21fbx.CourseType courseType,
    String? description,
    _isc.UuidValue? categoryId,
  }) => caller.callServerEndpoint<_ihzhjg22.Course>(
    'admin',
    'createCourse',
    {
      'courseName': courseName,
      'credits': credits,
      'courseType': courseType,
      'description': description,
      'categoryId': categoryId,
    },
  );

  _ida.Future<_ihzhjg22.Course> updateCourse({
    required _isc.UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int credits,
    required _i3t21fbx.CourseType courseType,
    String? description,
    _isc.UuidValue? categoryId,
  }) => caller.callServerEndpoint<_ihzhjg22.Course>(
    'admin',
    'updateCourse',
    {
      'courseId': courseId,
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'courseType': courseType,
      'description': description,
      'categoryId': categoryId,
    },
  );

  _ida.Future<bool> deleteCourse({required _isc.UuidValue courseId}) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'deleteCourse',
        {'courseId': courseId},
      );

  _ida.Future<List<_iiopdple.TrainingProgram>> getTrainingPrograms() =>
      caller.callServerEndpoint<List<_iiopdple.TrainingProgram>>(
        'admin',
        'getTrainingPrograms',
        {},
      );

  _ida.Future<List<_i2uuv4ic.Major>> getMajors() =>
      caller.callServerEndpoint<List<_i2uuv4ic.Major>>(
        'admin',
        'getMajors',
        {},
      );

  _ida.Future<List<_ijwatpay.TrainingProgramCourse>> getProgramCourses({
    required _isc.UuidValue programId,
  }) => caller.callServerEndpoint<List<_ijwatpay.TrainingProgramCourse>>(
    'admin',
    'getProgramCourses',
    {'programId': programId},
  );

  _ida.Future<List<_i5zv3u4e.CoursePrerequisite>> getPrerequisites() =>
      caller.callServerEndpoint<List<_i5zv3u4e.CoursePrerequisite>>(
        'admin',
        'getPrerequisites',
        {},
      );

  _ida.Future<List<_i67xlk2c.CourseEquivalent>> getEquivalents() =>
      caller.callServerEndpoint<List<_i67xlk2c.CourseEquivalent>>(
        'admin',
        'getEquivalents',
        {},
      );

  _ida.Future<_iiopdple.TrainingProgram> createTrainingProgram({
    required _isc.UuidValue majorId,
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
  }) => caller.callServerEndpoint<_iiopdple.TrainingProgram>(
    'admin',
    'createTrainingProgram',
    {
      'majorId': majorId,
      'name': name,
      'academicYear': academicYear,
      'totalCredits': totalCredits,
      'description': description,
    },
  );

  _ida.Future<_iiopdple.TrainingProgram> updateTrainingProgram({
    required _isc.UuidValue programId,
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
  }) => caller.callServerEndpoint<_iiopdple.TrainingProgram>(
    'admin',
    'updateTrainingProgram',
    {
      'programId': programId,
      'name': name,
      'academicYear': academicYear,
      'totalCredits': totalCredits,
      'description': description,
    },
  );

  _ida.Future<_ijwatpay.TrainingProgramCourse> setProgramCourse({
    required _isc.UuidValue programId,
    required _isc.UuidValue courseId,
    required int semesterNumber,
    required bool isRequired,
  }) => caller.callServerEndpoint<_ijwatpay.TrainingProgramCourse>(
    'admin',
    'setProgramCourse',
    {
      'programId': programId,
      'courseId': courseId,
      'semesterNumber': semesterNumber,
      'isRequired': isRequired,
    },
  );

  _ida.Future<_i5zv3u4e.CoursePrerequisite> addPrerequisite({
    required _isc.UuidValue courseId,
    required _isc.UuidValue requiredCourseId,
  }) => caller.callServerEndpoint<_i5zv3u4e.CoursePrerequisite>(
    'admin',
    'addPrerequisite',
    {
      'courseId': courseId,
      'requiredCourseId': requiredCourseId,
    },
  );

  _ida.Future<bool> removePrerequisite({
    required _isc.UuidValue prerequisiteId,
  }) => caller.callServerEndpoint<bool>(
    'admin',
    'removePrerequisite',
    {'prerequisiteId': prerequisiteId},
  );

  _ida.Future<_i67xlk2c.CourseEquivalent> addEquivalent({
    required _isc.UuidValue courseId,
    required _isc.UuidValue equivalentCourseId,
  }) => caller.callServerEndpoint<_i67xlk2c.CourseEquivalent>(
    'admin',
    'addEquivalent',
    {
      'courseId': courseId,
      'equivalentCourseId': equivalentCourseId,
    },
  );

  _ida.Future<bool> removeEquivalent({required _isc.UuidValue equivalentId}) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'removeEquivalent',
        {'equivalentId': equivalentId},
      );

  _ida.Future<List<_iiom1wy7.PendingClassApprovalDto>> getPendingClasses() =>
      caller.callServerEndpoint<List<_iiom1wy7.PendingClassApprovalDto>>(
        'admin',
        'getPendingClasses',
        {},
      );

  _ida.Future<_ivfrfn41.ClassApproval> approveClass({
    required _isc.UuidValue courseClassId,
    String? comment,
  }) => caller.callServerEndpoint<_ivfrfn41.ClassApproval>(
    'admin',
    'approveClass',
    {
      'courseClassId': courseClassId,
      'comment': comment,
    },
  );

  _ida.Future<_ivfrfn41.ClassApproval> rejectClass({
    required _isc.UuidValue courseClassId,
    String? comment,
  }) => caller.callServerEndpoint<_ivfrfn41.ClassApproval>(
    'admin',
    'rejectClass',
    {
      'courseClassId': courseClassId,
      'comment': comment,
    },
  );

  _ida.Future<List<_i095tu7a.CourseOpeningRequest>> getOpeningRequests() =>
      caller.callServerEndpoint<List<_i095tu7a.CourseOpeningRequest>>(
        'admin',
        'getOpeningRequests',
        {},
      );

  _ida.Future<_i095tu7a.CourseOpeningRequest> decideOpeningRequest({
    required _isc.UuidValue requestId,
    required bool approve,
  }) => caller.callServerEndpoint<_i095tu7a.CourseOpeningRequest>(
    'admin',
    'decideOpeningRequest',
    {
      'requestId': requestId,
      'approve': approve,
    },
  );

  _ida.Future<_i76p16dt.AnalyticsReportDto> getReports() =>
      caller.callServerEndpoint<_i76p16dt.AnalyticsReportDto>(
        'admin',
        'getReports',
        {},
      );

  _ida.Future<List<_iaxc31e6.AuditLogDto>> getAuditLogs({
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_iaxc31e6.AuditLogDto>>(
    'admin',
    'getAuditLogs',
    {
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<List<_i3lq6s0i.AdminPermission>> getPermissions({
    required _isc.UuidValue adminId,
  }) => caller.callServerEndpoint<List<_i3lq6s0i.AdminPermission>>(
    'admin',
    'getPermissions',
    {'adminId': adminId},
  );

  _ida.Future<_i3lq6s0i.AdminPermission> grantPermission({
    required _isc.UuidValue adminId,
    required String permission,
  }) => caller.callServerEndpoint<_i3lq6s0i.AdminPermission>(
    'admin',
    'grantPermission',
    {
      'adminId': adminId,
      'permission': permission,
    },
  );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Public self-registration is intentionally disabled. Accounts are
  /// provisioned by the university and can still use login/password reset.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// {@category Endpoint}
class EndpointStudentAccess extends EndpointStudentGuard {
  EndpointStudentAccess(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'studentAccess';

  _ida.Future<String> ping() => caller.callServerEndpoint<String>(
    'studentAccess',
    'ping',
    {},
  );
}

/// {@category Endpoint}
class EndpointLecturerAccess extends EndpointLecturerGuard {
  EndpointLecturerAccess(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'lecturerAccess';

  _ida.Future<String> ping() => caller.callServerEndpoint<String>(
    'lecturerAccess',
    'ping',
    {},
  );
}

/// {@category Endpoint}
class EndpointAdminAccess extends EndpointAdminGuard {
  EndpointAdminAccess(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'adminAccess';

  _ida.Future<String> ping() => caller.callServerEndpoint<String>(
    'adminAccess',
    'ping',
    {},
  );
}

/// {@category Endpoint}
abstract class EndpointStudentGuard extends _isc.EndpointRef {
  EndpointStudentGuard(_isc.EndpointCaller caller) : super(caller);
}

/// {@category Endpoint}
abstract class EndpointLecturerGuard extends _isc.EndpointRef {
  EndpointLecturerGuard(_isc.EndpointCaller caller) : super(caller);
}

/// {@category Endpoint}
abstract class EndpointAdminGuard extends _isc.EndpointRef {
  EndpointAdminGuard(_isc.EndpointCaller caller) : super(caller);
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _isc.EndpointRef {
  EndpointGreeting(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _ida.Future<_iegjp1l2.Greeting> hello(String name) =>
      caller.callServerEndpoint<_iegjp1l2.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointLecturer extends EndpointLecturerGuard {
  EndpointLecturer(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'lecturer';

  _ida.Future<_iaxps9pc.LecturerProfileDto> getMyProfile() =>
      caller.callServerEndpoint<_iaxps9pc.LecturerProfileDto>(
        'lecturer',
        'getMyProfile',
        {},
      );

  _ida.Future<List<_ihzhjg22.Course>> getCourses() =>
      caller.callServerEndpoint<List<_ihzhjg22.Course>>(
        'lecturer',
        'getCourses',
        {},
      );

  _ida.Future<List<_iu5keruo.Semester>> getSemesters() =>
      caller.callServerEndpoint<List<_iu5keruo.Semester>>(
        'lecturer',
        'getSemesters',
        {},
      );

  _ida.Future<List<_ibein0b1.LecturerCourseClassDto>> getMyCourseClasses({
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_ibein0b1.LecturerCourseClassDto>>(
    'lecturer',
    'getMyCourseClasses',
    {
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<_ibein0b1.LecturerCourseClassDto> createCourseClass({
    required _isc.UuidValue courseId,
    required _isc.UuidValue semesterId,
    required int capacity,
    required List<_iff0ymco.ClassScheduleDto> schedules,
  }) => caller.callServerEndpoint<_ibein0b1.LecturerCourseClassDto>(
    'lecturer',
    'createCourseClass',
    {
      'courseId': courseId,
      'semesterId': semesterId,
      'capacity': capacity,
      'schedules': schedules,
    },
  );

  _ida.Future<_ibein0b1.LecturerCourseClassDto> updateCourseClass({
    required _isc.UuidValue courseClassId,
    required int capacity,
    required List<_iff0ymco.ClassScheduleDto> schedules,
  }) => caller.callServerEndpoint<_ibein0b1.LecturerCourseClassDto>(
    'lecturer',
    'updateCourseClass',
    {
      'courseClassId': courseClassId,
      'capacity': capacity,
      'schedules': schedules,
    },
  );

  _ida.Future<bool> deleteCourseClass({
    required _isc.UuidValue courseClassId,
  }) => caller.callServerEndpoint<bool>(
    'lecturer',
    'deleteCourseClass',
    {'courseClassId': courseClassId},
  );

  _ida.Future<_i81hb12m.TeachingScheduleProposal> createTeachingSchedule({
    required _isc.UuidValue courseClassId,
    required _iff0ymco.ClassScheduleDto schedule,
  }) => caller.callServerEndpoint<_i81hb12m.TeachingScheduleProposal>(
    'lecturer',
    'createTeachingSchedule',
    {
      'courseClassId': courseClassId,
      'schedule': schedule,
    },
  );

  _ida.Future<List<_i81hb12m.TeachingScheduleProposal>> getMySchedule() =>
      caller.callServerEndpoint<List<_i81hb12m.TeachingScheduleProposal>>(
        'lecturer',
        'getMySchedule',
        {},
      );

  _ida.Future<List<String>> getAvailableRooms() =>
      caller.callServerEndpoint<List<String>>(
        'lecturer',
        'getAvailableRooms',
        {},
      );

  _ida.Future<List<_iff0ymco.ClassScheduleDto>> getAvailableScheduleSlots({
    required _isc.UuidValue semesterId,
    required String room,
  }) => caller.callServerEndpoint<List<_iff0ymco.ClassScheduleDto>>(
    'lecturer',
    'getAvailableScheduleSlots',
    {
      'semesterId': semesterId,
      'room': room,
    },
  );

  _ida.Future<List<_i0ncgxlw.ClassStudentDto>> getRegisteredStudents({
    required _isc.UuidValue courseClassId,
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_i0ncgxlw.ClassStudentDto>>(
    'lecturer',
    'getRegisteredStudents',
    {
      'courseClassId': courseClassId,
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<List<_in85cpl6.ClassDemandDto>> getClassDemand() =>
      caller.callServerEndpoint<List<_in85cpl6.ClassDemandDto>>(
        'lecturer',
        'getClassDemand',
        {},
      );

  _ida.Future<bool> updateStudentGrades({
    required _isc.UuidValue courseClassId,
    required _isc.UuidValue studentId,
    required double midtermScore,
    required double finalScore,
  }) => caller.callServerEndpoint<bool>(
    'lecturer',
    'updateStudentGrades',
    {
      'courseClassId': courseClassId,
      'studentId': studentId,
      'midtermScore': midtermScore,
      'finalScore': finalScore,
    },
  );
}

/// {@category Endpoint}
class EndpointProfile extends _isc.EndpointRef {
  EndpointProfile(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  _ida.Future<_igznxkwp.AppUser> current() =>
      caller.callServerEndpoint<_igznxkwp.AppUser>(
        'profile',
        'current',
        {},
      );

  _ida.Future<_igznxkwp.AppUser> ensureProfile({String? fullName}) =>
      caller.callServerEndpoint<_igznxkwp.AppUser>(
        'profile',
        'ensureProfile',
        {'fullName': fullName},
      );
}

/// {@category Endpoint}
class EndpointCourseRegistration extends EndpointStudentGuard {
  EndpointCourseRegistration(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'courseRegistration';

  _ida.Future<_iu5keruo.Semester> getCurrentSemester() =>
      caller.callServerEndpoint<_iu5keruo.Semester>(
        'courseRegistration',
        'getCurrentSemester',
        {},
      );

  _ida.Future<List<_ilyiw8j3.OpenCourseClassDto>> getOpenClasses({
    required _isc.UuidValue semesterId,
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_ilyiw8j3.OpenCourseClassDto>>(
    'courseRegistration',
    'getOpenClasses',
    {
      'semesterId': semesterId,
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<_i9bwqx65.EligibilityResultDto> checkEligibility({
    _isc.UuidValue? studentId,
    required _isc.UuidValue courseClassId,
  }) => caller.callServerEndpoint<_i9bwqx65.EligibilityResultDto>(
    'courseRegistration',
    'checkEligibility',
    {
      'studentId': studentId,
      'courseClassId': courseClassId,
    },
  );

  _ida.Future<_iuabtiyn.RegistrationResultDto> registerCourse({
    _isc.UuidValue? studentId,
    required _isc.UuidValue courseClassId,
    String? deviceInfo,
  }) => caller.callServerEndpoint<_iuabtiyn.RegistrationResultDto>(
    'courseRegistration',
    'registerCourse',
    {
      'studentId': studentId,
      'courseClassId': courseClassId,
      'deviceInfo': deviceInfo,
    },
  );

  _ida.Future<_iuabtiyn.RegistrationResultDto> cancelCourse({
    required _isc.UuidValue registrationId,
    String? deviceInfo,
  }) => caller.callServerEndpoint<_iuabtiyn.RegistrationResultDto>(
    'courseRegistration',
    'cancelCourse',
    {
      'registrationId': registrationId,
      'deviceInfo': deviceInfo,
    },
  );

  _ida.Future<List<_irdda7pa.RegisteredCourseDto>> getMyCourses({
    _isc.UuidValue? semesterId,
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_irdda7pa.RegisteredCourseDto>>(
    'courseRegistration',
    'getMyCourses',
    {
      'semesterId': semesterId,
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<_i095tu7a.CourseOpeningRequest> createOpeningRequest({
    required _isc.UuidValue courseId,
    required String reason,
  }) => caller.callServerEndpoint<_i095tu7a.CourseOpeningRequest>(
    'courseRegistration',
    'createOpeningRequest',
    {
      'courseId': courseId,
      'reason': reason,
    },
  );
}

/// {@category Endpoint}
class EndpointStudent extends EndpointStudentGuard {
  EndpointStudent(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'student';

  _ida.Future<_iwso8igi.StudentProfileDto> getProfile({
    _isc.UuidValue? studentId,
  }) => caller.callServerEndpoint<_iwso8igi.StudentProfileDto>(
    'student',
    'getProfile',
    {'studentId': studentId},
  );

  _ida.Future<List<_ic40qcjp.TrainingProgramCourseDto>> getTrainingProgram({
    _isc.UuidValue? studentId,
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_ic40qcjp.TrainingProgramCourseDto>>(
    'student',
    'getTrainingProgram',
    {
      'studentId': studentId,
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<List<_iwasio4x.TranscriptDto>> getTranscript({
    _isc.UuidValue? studentId,
    int? page,
    int? pageSize,
  }) => caller.callServerEndpoint<List<_iwasio4x.TranscriptDto>>(
    'student',
    'getTranscript',
    {
      'studentId': studentId,
      'page': page,
      'pageSize': pageSize,
    },
  );

  _ida.Future<_ie7tm93i.GpaDto> getGpa({
    _isc.UuidValue? studentId,
    String? semester,
  }) => caller.callServerEndpoint<_ie7tm93i.GpaDto>(
    'student',
    'getGpa',
    {
      'studentId': studentId,
      'semester': semester,
    },
  );
}

/// {@category Endpoint}
class EndpointSync extends _isc.EndpointRef {
  EndpointSync(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sync';

  _ida.Future<DateTime> ping() => caller.callServerEndpoint<DateTime>(
    'sync',
    'ping',
    {},
  );

  _ida.Future<List<_ikwxjn0j.SyncOperationResultDto>> pushOperations({
    required List<_igbyh0qh.SyncOperationInputDto> operations,
  }) => caller.callServerEndpoint<List<_ikwxjn0j.SyncOperationResultDto>>(
    'sync',
    'pushOperations',
    {'operations': operations},
  );

  _ida.Future<_iua1j9e4.PullSyncResultDto> pullChanges({
    DateTime? lastSyncAt,
  }) => caller.callServerEndpoint<_iua1j9e4.PullSyncResultDto>(
    'sync',
    'pullChanges',
    {'lastSyncAt': lastSyncAt},
  );

  _ida.Future<_i2y24jsu.SyncStatusDto> getSyncStatus() =>
      caller.callServerEndpoint<_i2y24jsu.SyncStatusDto>(
        'sync',
        'getSyncStatus',
        {},
      );

  _ida.Future<_ikwxjn0j.SyncOperationResultDto> retryOperation({
    required _isc.UuidValue operationId,
  }) => caller.callServerEndpoint<_ikwxjn0j.SyncOperationResultDto>(
    'sync',
    'retryOperation',
    {'operationId': operationId},
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_core = _iacc.Caller(client);
    serverpod_auth_idp = _iaic.Caller(client);
  }

  late final _iacc.Caller serverpod_auth_core;

  late final _iaic.Caller serverpod_auth_idp;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    admin = EndpointAdmin(this);
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    studentAccess = EndpointStudentAccess(this);
    lecturerAccess = EndpointLecturerAccess(this);
    adminAccess = EndpointAdminAccess(this);
    greeting = EndpointGreeting(this);
    lecturer = EndpointLecturer(this);
    profile = EndpointProfile(this);
    courseRegistration = EndpointCourseRegistration(this);
    student = EndpointStudent(this);
    sync = EndpointSync(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointStudentAccess studentAccess;

  late final EndpointLecturerAccess lecturerAccess;

  late final EndpointAdminAccess adminAccess;

  late final EndpointGreeting greeting;

  late final EndpointLecturer lecturer;

  late final EndpointProfile profile;

  late final EndpointCourseRegistration courseRegistration;

  late final EndpointStudent student;

  late final EndpointSync sync;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'admin': admin,
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'studentAccess': studentAccess,
    'lecturerAccess': lecturerAccess,
    'adminAccess': adminAccess,
    'greeting': greeting,
    'lecturer': lecturer,
    'profile': profile,
    'courseRegistration': courseRegistration,
    'student': student,
    'sync': sync,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_core': modules.serverpod_auth_core,
    'serverpod_auth_idp': modules.serverpod_auth_idp,
  };
}
