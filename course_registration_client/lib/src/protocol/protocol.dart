/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:course_registration_client/src/protocol/admin/dto/admin_user_dto.dart'
    as _iitlaycf;
import 'package:course_registration_client/src/protocol/admin/dto/audit_log_dto.dart'
    as _iaxc31e6;
import 'package:course_registration_client/src/protocol/admin/dto/pending_class_approval_dto.dart'
    as _iiom1wy7;
import 'package:course_registration_client/src/protocol/admin/models/admin_permission.dart'
    as _i3lq6s0i;
import 'package:course_registration_client/src/protocol/lecturer/dto/class_adjustment_request_dto.dart'
    as _ifivxqc8;
import 'package:course_registration_client/src/protocol/lecturer/dto/class_demand_dto.dart'
    as _in85cpl6;
import 'package:course_registration_client/src/protocol/lecturer/dto/class_student_dto.dart'
    as _i0ncgxlw;
import 'package:course_registration_client/src/protocol/lecturer/dto/lecturer_course_class_dto.dart'
    as _ibein0b1;
import 'package:course_registration_client/src/protocol/lecturer/models/teaching_schedule_proposal.dart'
    as _i81hb12m;
import 'package:course_registration_client/src/protocol/registration/dto/class_schedule_dto.dart'
    as _iff0ymco;
import 'package:course_registration_client/src/protocol/registration/dto/open_course_class_dto.dart'
    as _ilyiw8j3;
import 'package:course_registration_client/src/protocol/registration/dto/registered_course_dto.dart'
    as _irdda7pa;
import 'package:course_registration_client/src/protocol/registration/dto/registration_period_dto.dart'
    as _iofzf6to;
import 'package:course_registration_client/src/protocol/registration/models/course_equivalent.dart'
    as _i67xlk2c;
import 'package:course_registration_client/src/protocol/registration/models/course_opening_request.dart'
    as _i095tu7a;
import 'package:course_registration_client/src/protocol/registration/models/course_prerequisite.dart'
    as _i5zv3u4e;
import 'package:course_registration_client/src/protocol/registration/models/semester.dart'
    as _iu5keruo;
import 'package:course_registration_client/src/protocol/student/dto/training_program_course_dto.dart'
    as _ic40qcjp;
import 'package:course_registration_client/src/protocol/student/dto/transcript_dto.dart'
    as _iwasio4x;
import 'package:course_registration_client/src/protocol/student/models/course.dart'
    as _ihzhjg22;
import 'package:course_registration_client/src/protocol/student/models/major.dart'
    as _i2uuv4ic;
import 'package:course_registration_client/src/protocol/student/models/training_program.dart'
    as _iiopdple;
import 'package:course_registration_client/src/protocol/student/models/training_program_course.dart'
    as _ijwatpay;
import 'package:course_registration_client/src/protocol/sync/dto/sync_operation_input_dto.dart'
    as _igbyh0qh;
import 'package:course_registration_client/src/protocol/sync/dto/sync_operation_result_dto.dart'
    as _ikwxjn0j;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'admin.dart' as _irtsa1cb;
import 'admin/dto/admin_user_dto.dart' as _ilq3ip1w;
import 'admin/dto/analytics_report_dto.dart' as _iud5fcio;
import 'admin/dto/audit_log_dto.dart' as _idhpgcsg;
import 'admin/dto/course_gpa_dto.dart' as _i78ov9ny;
import 'admin/dto/named_count_dto.dart' as _ioqh38vf;
import 'admin/dto/pending_class_approval_dto.dart' as _ii94yimq;
import 'admin/models/admin_permission.dart' as _iqtm76wd;
import 'admin/models/class_approval.dart' as _ikq6rbq0;
import 'admin/models/class_approval_status.dart' as _iwu8lwz6;
import 'admin/models/course_category.dart' as _immuk475;
import 'admin/models/system_audit_log.dart' as _ifcme4qk;
import 'app_exception.dart' as _it4z223c;
import 'app_user.dart' as _i2j2xfrn;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'lecturer.dart' as _itbetnwi;
import 'lecturer/dto/class_adjustment_request_dto.dart' as _iq4gfhz6;
import 'lecturer/dto/class_demand_dto.dart' as _iq0ly2ak;
import 'lecturer/dto/class_student_dto.dart' as _io3zsf6b;
import 'lecturer/dto/lecturer_course_class_dto.dart' as _iqyoloat;
import 'lecturer/dto/lecturer_profile_dto.dart' as _ipt2hr1k;
import 'lecturer/models/class_adjustment_request.dart' as _ipucqiai;
import 'lecturer/models/class_adjustment_status.dart' as _iv9225wt;
import 'lecturer/models/lecturer_activity_log.dart' as _im5rikfg;
import 'lecturer/models/lecturer_course_class.dart' as _iokj3d6r;
import 'lecturer/models/teaching_schedule_proposal.dart' as _irv87c2y;
import 'lecturer/models/teaching_schedule_status.dart' as _il6xaj9m;
import 'registration/dto/class_schedule_dto.dart' as _ib3wa59y;
import 'registration/dto/eligibility_result_dto.dart' as _iaaclq68;
import 'registration/dto/open_course_class_dto.dart' as _ipozmldp;
import 'registration/dto/registered_course_dto.dart' as _ilcih2k6;
import 'registration/dto/registration_period_dto.dart' as _i1fn64hq;
import 'registration/dto/registration_result_dto.dart' as _ii8dcq83;
import 'registration/models/class_schedule.dart' as _ivo6ya0v;
import 'registration/models/course_class.dart' as _intqjpio;
import 'registration/models/course_class_status.dart' as _i6111ktp;
import 'registration/models/course_equivalent.dart' as _ivq6o0sg;
import 'registration/models/course_opening_request.dart' as _iagk693e;
import 'registration/models/course_prerequisite.dart' as _i7f5kvdx;
import 'registration/models/opening_request_status.dart' as _i9ek3ou2;
import 'registration/models/registration.dart' as _isg2rjz0;
import 'registration/models/registration_action.dart' as _ick1ofaw;
import 'registration/models/registration_history.dart' as _io6lhm66;
import 'registration/models/registration_period.dart' as _i3fi4yfy;
import 'registration/models/registration_period_status.dart' as _iryum3b8;
import 'registration/models/registration_status.dart' as _ienvemo7;
import 'registration/models/semester.dart' as _iz7vluge;
import 'registration/models/semester_status.dart' as _inuj73nk;
import 'student.dart' as _iwzlgl4r;
import 'student/dto/gpa_dto.dart' as _igzwjm5d;
import 'student/dto/student_profile_dto.dart' as _iwyne1wa;
import 'student/dto/training_program_course_dto.dart' as _iiy6nwja;
import 'student/dto/transcript_dto.dart' as _ia9f4ste;
import 'student/models/course.dart' as _iysyfyey;
import 'student/models/course_progress_status.dart' as _inmihsz6;
import 'student/models/course_type.dart' as _iajbyi83;
import 'student/models/faculty.dart' as _iehbjec4;
import 'student/models/major.dart' as _iqe9gc9z;
import 'student/models/student_transcript.dart' as _iw15wxpt;
import 'student/models/training_program.dart' as _ige2gcz9;
import 'student/models/training_program_course.dart' as _im8ku9lz;
import 'student/models/training_program_status.dart' as _i7qv1iv3;
import 'student/models/transcript_status.dart' as _i3gkq2t9;
import 'sync/dto/pull_sync_result_dto.dart' as _i8xfjltp;
import 'sync/dto/sync_change_dto.dart' as _ih97hn2e;
import 'sync/dto/sync_operation_input_dto.dart' as _ijhls20r;
import 'sync/dto/sync_operation_result_dto.dart' as _i0c46qnp;
import 'sync/dto/sync_status_dto.dart' as _i2e8b5z3;
import 'sync/models/processed_sync_operation.dart' as _iyxfog5l;
import 'sync/models/sync_change.dart' as _ijoocq8q;
import 'sync/models/sync_log.dart' as _irvfms91;
import 'sync/models/sync_operation_status.dart' as _ipxryt3x;
import 'user_role.dart' as _ir0y0iu6;
export 'admin.dart';
export 'admin/dto/admin_user_dto.dart';
export 'admin/dto/analytics_report_dto.dart';
export 'admin/dto/audit_log_dto.dart';
export 'admin/dto/course_gpa_dto.dart';
export 'admin/dto/named_count_dto.dart';
export 'admin/dto/pending_class_approval_dto.dart';
export 'admin/models/admin_permission.dart';
export 'admin/models/class_approval.dart';
export 'admin/models/class_approval_status.dart';
export 'admin/models/course_category.dart';
export 'admin/models/system_audit_log.dart';
export 'app_exception.dart';
export 'app_user.dart';
export 'greetings/greeting.dart';
export 'lecturer.dart';
export 'lecturer/dto/class_adjustment_request_dto.dart';
export 'lecturer/dto/class_demand_dto.dart';
export 'lecturer/dto/class_student_dto.dart';
export 'lecturer/dto/lecturer_course_class_dto.dart';
export 'lecturer/dto/lecturer_profile_dto.dart';
export 'lecturer/models/class_adjustment_request.dart';
export 'lecturer/models/class_adjustment_status.dart';
export 'lecturer/models/lecturer_activity_log.dart';
export 'lecturer/models/lecturer_course_class.dart';
export 'lecturer/models/teaching_schedule_proposal.dart';
export 'lecturer/models/teaching_schedule_status.dart';
export 'registration/dto/class_schedule_dto.dart';
export 'registration/dto/eligibility_result_dto.dart';
export 'registration/dto/open_course_class_dto.dart';
export 'registration/dto/registered_course_dto.dart';
export 'registration/dto/registration_period_dto.dart';
export 'registration/dto/registration_result_dto.dart';
export 'registration/models/class_schedule.dart';
export 'registration/models/course_class.dart';
export 'registration/models/course_class_status.dart';
export 'registration/models/course_equivalent.dart';
export 'registration/models/course_opening_request.dart';
export 'registration/models/course_prerequisite.dart';
export 'registration/models/opening_request_status.dart';
export 'registration/models/registration.dart';
export 'registration/models/registration_action.dart';
export 'registration/models/registration_history.dart';
export 'registration/models/registration_period.dart';
export 'registration/models/registration_period_status.dart';
export 'registration/models/registration_status.dart';
export 'registration/models/semester.dart';
export 'registration/models/semester_status.dart';
export 'student.dart';
export 'student/dto/gpa_dto.dart';
export 'student/dto/student_profile_dto.dart';
export 'student/dto/training_program_course_dto.dart';
export 'student/dto/transcript_dto.dart';
export 'student/models/course.dart';
export 'student/models/course_progress_status.dart';
export 'student/models/course_type.dart';
export 'student/models/faculty.dart';
export 'student/models/major.dart';
export 'student/models/student_transcript.dart';
export 'student/models/training_program.dart';
export 'student/models/training_program_course.dart';
export 'student/models/training_program_status.dart';
export 'student/models/transcript_status.dart';
export 'sync/dto/pull_sync_result_dto.dart';
export 'sync/dto/sync_change_dto.dart';
export 'sync/dto/sync_operation_input_dto.dart';
export 'sync/dto/sync_operation_result_dto.dart';
export 'sync/dto/sync_status_dto.dart';
export 'sync/models/processed_sync_operation.dart';
export 'sync/models/sync_change.dart';
export 'sync/models/sync_log.dart';
export 'sync/models/sync_operation_status.dart';
export 'user_role.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _irtsa1cb.Admin) {
      return _irtsa1cb.Admin.fromJson(data) as T;
    }
    if (t == _ilq3ip1w.AdminUserDto) {
      return _ilq3ip1w.AdminUserDto.fromJson(data) as T;
    }
    if (t == _iud5fcio.AnalyticsReportDto) {
      return _iud5fcio.AnalyticsReportDto.fromJson(data) as T;
    }
    if (t == _idhpgcsg.AuditLogDto) {
      return _idhpgcsg.AuditLogDto.fromJson(data) as T;
    }
    if (t == _i78ov9ny.CourseGpaDto) {
      return _i78ov9ny.CourseGpaDto.fromJson(data) as T;
    }
    if (t == _ioqh38vf.NamedCountDto) {
      return _ioqh38vf.NamedCountDto.fromJson(data) as T;
    }
    if (t == _ii94yimq.PendingClassApprovalDto) {
      return _ii94yimq.PendingClassApprovalDto.fromJson(data) as T;
    }
    if (t == _iqtm76wd.AdminPermission) {
      return _iqtm76wd.AdminPermission.fromJson(data) as T;
    }
    if (t == _ikq6rbq0.ClassApproval) {
      return _ikq6rbq0.ClassApproval.fromJson(data) as T;
    }
    if (t == _iwu8lwz6.ClassApprovalStatus) {
      return _iwu8lwz6.ClassApprovalStatus.fromJson(data) as T;
    }
    if (t == _immuk475.CourseCategory) {
      return _immuk475.CourseCategory.fromJson(data) as T;
    }
    if (t == _ifcme4qk.SystemAuditLog) {
      return _ifcme4qk.SystemAuditLog.fromJson(data) as T;
    }
    if (t == _it4z223c.AppException) {
      return _it4z223c.AppException.fromJson(data) as T;
    }
    if (t == _i2j2xfrn.AppUser) {
      return _i2j2xfrn.AppUser.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _itbetnwi.Lecturer) {
      return _itbetnwi.Lecturer.fromJson(data) as T;
    }
    if (t == _iq4gfhz6.ClassAdjustmentRequestDto) {
      return _iq4gfhz6.ClassAdjustmentRequestDto.fromJson(data) as T;
    }
    if (t == _iq0ly2ak.ClassDemandDto) {
      return _iq0ly2ak.ClassDemandDto.fromJson(data) as T;
    }
    if (t == _io3zsf6b.ClassStudentDto) {
      return _io3zsf6b.ClassStudentDto.fromJson(data) as T;
    }
    if (t == _iqyoloat.LecturerCourseClassDto) {
      return _iqyoloat.LecturerCourseClassDto.fromJson(data) as T;
    }
    if (t == _ipt2hr1k.LecturerProfileDto) {
      return _ipt2hr1k.LecturerProfileDto.fromJson(data) as T;
    }
    if (t == _ipucqiai.ClassAdjustmentRequest) {
      return _ipucqiai.ClassAdjustmentRequest.fromJson(data) as T;
    }
    if (t == _iv9225wt.ClassAdjustmentStatus) {
      return _iv9225wt.ClassAdjustmentStatus.fromJson(data) as T;
    }
    if (t == _im5rikfg.LecturerActivityLog) {
      return _im5rikfg.LecturerActivityLog.fromJson(data) as T;
    }
    if (t == _iokj3d6r.LecturerCourseClass) {
      return _iokj3d6r.LecturerCourseClass.fromJson(data) as T;
    }
    if (t == _irv87c2y.TeachingScheduleProposal) {
      return _irv87c2y.TeachingScheduleProposal.fromJson(data) as T;
    }
    if (t == _il6xaj9m.TeachingScheduleStatus) {
      return _il6xaj9m.TeachingScheduleStatus.fromJson(data) as T;
    }
    if (t == _ib3wa59y.ClassScheduleDto) {
      return _ib3wa59y.ClassScheduleDto.fromJson(data) as T;
    }
    if (t == _iaaclq68.EligibilityResultDto) {
      return _iaaclq68.EligibilityResultDto.fromJson(data) as T;
    }
    if (t == _ipozmldp.OpenCourseClassDto) {
      return _ipozmldp.OpenCourseClassDto.fromJson(data) as T;
    }
    if (t == _ilcih2k6.RegisteredCourseDto) {
      return _ilcih2k6.RegisteredCourseDto.fromJson(data) as T;
    }
    if (t == _i1fn64hq.RegistrationPeriodDto) {
      return _i1fn64hq.RegistrationPeriodDto.fromJson(data) as T;
    }
    if (t == _ii8dcq83.RegistrationResultDto) {
      return _ii8dcq83.RegistrationResultDto.fromJson(data) as T;
    }
    if (t == _ivo6ya0v.ClassSchedule) {
      return _ivo6ya0v.ClassSchedule.fromJson(data) as T;
    }
    if (t == _intqjpio.CourseClass) {
      return _intqjpio.CourseClass.fromJson(data) as T;
    }
    if (t == _i6111ktp.CourseClassStatus) {
      return _i6111ktp.CourseClassStatus.fromJson(data) as T;
    }
    if (t == _ivq6o0sg.CourseEquivalent) {
      return _ivq6o0sg.CourseEquivalent.fromJson(data) as T;
    }
    if (t == _iagk693e.CourseOpeningRequest) {
      return _iagk693e.CourseOpeningRequest.fromJson(data) as T;
    }
    if (t == _i7f5kvdx.CoursePrerequisite) {
      return _i7f5kvdx.CoursePrerequisite.fromJson(data) as T;
    }
    if (t == _i9ek3ou2.OpeningRequestStatus) {
      return _i9ek3ou2.OpeningRequestStatus.fromJson(data) as T;
    }
    if (t == _isg2rjz0.Registration) {
      return _isg2rjz0.Registration.fromJson(data) as T;
    }
    if (t == _ick1ofaw.RegistrationAction) {
      return _ick1ofaw.RegistrationAction.fromJson(data) as T;
    }
    if (t == _io6lhm66.RegistrationHistory) {
      return _io6lhm66.RegistrationHistory.fromJson(data) as T;
    }
    if (t == _i3fi4yfy.RegistrationPeriod) {
      return _i3fi4yfy.RegistrationPeriod.fromJson(data) as T;
    }
    if (t == _iryum3b8.RegistrationPeriodStatus) {
      return _iryum3b8.RegistrationPeriodStatus.fromJson(data) as T;
    }
    if (t == _ienvemo7.RegistrationStatus) {
      return _ienvemo7.RegistrationStatus.fromJson(data) as T;
    }
    if (t == _iz7vluge.Semester) {
      return _iz7vluge.Semester.fromJson(data) as T;
    }
    if (t == _inuj73nk.SemesterStatus) {
      return _inuj73nk.SemesterStatus.fromJson(data) as T;
    }
    if (t == _iwzlgl4r.Student) {
      return _iwzlgl4r.Student.fromJson(data) as T;
    }
    if (t == _igzwjm5d.GpaDto) {
      return _igzwjm5d.GpaDto.fromJson(data) as T;
    }
    if (t == _iwyne1wa.StudentProfileDto) {
      return _iwyne1wa.StudentProfileDto.fromJson(data) as T;
    }
    if (t == _iiy6nwja.TrainingProgramCourseDto) {
      return _iiy6nwja.TrainingProgramCourseDto.fromJson(data) as T;
    }
    if (t == _ia9f4ste.TranscriptDto) {
      return _ia9f4ste.TranscriptDto.fromJson(data) as T;
    }
    if (t == _iysyfyey.Course) {
      return _iysyfyey.Course.fromJson(data) as T;
    }
    if (t == _inmihsz6.CourseProgressStatus) {
      return _inmihsz6.CourseProgressStatus.fromJson(data) as T;
    }
    if (t == _iajbyi83.CourseType) {
      return _iajbyi83.CourseType.fromJson(data) as T;
    }
    if (t == _iehbjec4.Faculty) {
      return _iehbjec4.Faculty.fromJson(data) as T;
    }
    if (t == _iqe9gc9z.Major) {
      return _iqe9gc9z.Major.fromJson(data) as T;
    }
    if (t == _iw15wxpt.StudentTranscript) {
      return _iw15wxpt.StudentTranscript.fromJson(data) as T;
    }
    if (t == _ige2gcz9.TrainingProgram) {
      return _ige2gcz9.TrainingProgram.fromJson(data) as T;
    }
    if (t == _im8ku9lz.TrainingProgramCourse) {
      return _im8ku9lz.TrainingProgramCourse.fromJson(data) as T;
    }
    if (t == _i7qv1iv3.TrainingProgramStatus) {
      return _i7qv1iv3.TrainingProgramStatus.fromJson(data) as T;
    }
    if (t == _i3gkq2t9.TranscriptStatus) {
      return _i3gkq2t9.TranscriptStatus.fromJson(data) as T;
    }
    if (t == _i8xfjltp.PullSyncResultDto) {
      return _i8xfjltp.PullSyncResultDto.fromJson(data) as T;
    }
    if (t == _ih97hn2e.SyncChangeDto) {
      return _ih97hn2e.SyncChangeDto.fromJson(data) as T;
    }
    if (t == _ijhls20r.SyncOperationInputDto) {
      return _ijhls20r.SyncOperationInputDto.fromJson(data) as T;
    }
    if (t == _i0c46qnp.SyncOperationResultDto) {
      return _i0c46qnp.SyncOperationResultDto.fromJson(data) as T;
    }
    if (t == _i2e8b5z3.SyncStatusDto) {
      return _i2e8b5z3.SyncStatusDto.fromJson(data) as T;
    }
    if (t == _iyxfog5l.ProcessedSyncOperation) {
      return _iyxfog5l.ProcessedSyncOperation.fromJson(data) as T;
    }
    if (t == _ijoocq8q.SyncChange) {
      return _ijoocq8q.SyncChange.fromJson(data) as T;
    }
    if (t == _irvfms91.SyncLog) {
      return _irvfms91.SyncLog.fromJson(data) as T;
    }
    if (t == _ipxryt3x.SyncOperationStatus) {
      return _ipxryt3x.SyncOperationStatus.fromJson(data) as T;
    }
    if (t == _ir0y0iu6.UserRole) {
      return _ir0y0iu6.UserRole.fromJson(data) as T;
    }
    if (t == _isc.getType<_irtsa1cb.Admin?>()) {
      return (data != null ? _irtsa1cb.Admin.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ilq3ip1w.AdminUserDto?>()) {
      return (data != null ? _ilq3ip1w.AdminUserDto.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iud5fcio.AnalyticsReportDto?>()) {
      return (data != null ? _iud5fcio.AnalyticsReportDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_idhpgcsg.AuditLogDto?>()) {
      return (data != null ? _idhpgcsg.AuditLogDto.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i78ov9ny.CourseGpaDto?>()) {
      return (data != null ? _i78ov9ny.CourseGpaDto.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ioqh38vf.NamedCountDto?>()) {
      return (data != null ? _ioqh38vf.NamedCountDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ii94yimq.PendingClassApprovalDto?>()) {
      return (data != null
              ? _ii94yimq.PendingClassApprovalDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_iqtm76wd.AdminPermission?>()) {
      return (data != null ? _iqtm76wd.AdminPermission.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ikq6rbq0.ClassApproval?>()) {
      return (data != null ? _ikq6rbq0.ClassApproval.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iwu8lwz6.ClassApprovalStatus?>()) {
      return (data != null
              ? _iwu8lwz6.ClassApprovalStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_immuk475.CourseCategory?>()) {
      return (data != null ? _immuk475.CourseCategory.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ifcme4qk.SystemAuditLog?>()) {
      return (data != null ? _ifcme4qk.SystemAuditLog.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_it4z223c.AppException?>()) {
      return (data != null ? _it4z223c.AppException.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2j2xfrn.AppUser?>()) {
      return (data != null ? _i2j2xfrn.AppUser.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_itbetnwi.Lecturer?>()) {
      return (data != null ? _itbetnwi.Lecturer.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iq4gfhz6.ClassAdjustmentRequestDto?>()) {
      return (data != null
              ? _iq4gfhz6.ClassAdjustmentRequestDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_iq0ly2ak.ClassDemandDto?>()) {
      return (data != null ? _iq0ly2ak.ClassDemandDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_io3zsf6b.ClassStudentDto?>()) {
      return (data != null ? _io3zsf6b.ClassStudentDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iqyoloat.LecturerCourseClassDto?>()) {
      return (data != null
              ? _iqyoloat.LecturerCourseClassDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ipt2hr1k.LecturerProfileDto?>()) {
      return (data != null ? _ipt2hr1k.LecturerProfileDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ipucqiai.ClassAdjustmentRequest?>()) {
      return (data != null
              ? _ipucqiai.ClassAdjustmentRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_iv9225wt.ClassAdjustmentStatus?>()) {
      return (data != null
              ? _iv9225wt.ClassAdjustmentStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_im5rikfg.LecturerActivityLog?>()) {
      return (data != null
              ? _im5rikfg.LecturerActivityLog.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_iokj3d6r.LecturerCourseClass?>()) {
      return (data != null
              ? _iokj3d6r.LecturerCourseClass.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_irv87c2y.TeachingScheduleProposal?>()) {
      return (data != null
              ? _irv87c2y.TeachingScheduleProposal.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_il6xaj9m.TeachingScheduleStatus?>()) {
      return (data != null
              ? _il6xaj9m.TeachingScheduleStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ib3wa59y.ClassScheduleDto?>()) {
      return (data != null ? _ib3wa59y.ClassScheduleDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iaaclq68.EligibilityResultDto?>()) {
      return (data != null
              ? _iaaclq68.EligibilityResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ipozmldp.OpenCourseClassDto?>()) {
      return (data != null ? _ipozmldp.OpenCourseClassDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ilcih2k6.RegisteredCourseDto?>()) {
      return (data != null
              ? _ilcih2k6.RegisteredCourseDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i1fn64hq.RegistrationPeriodDto?>()) {
      return (data != null
              ? _i1fn64hq.RegistrationPeriodDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ii8dcq83.RegistrationResultDto?>()) {
      return (data != null
              ? _ii8dcq83.RegistrationResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ivo6ya0v.ClassSchedule?>()) {
      return (data != null ? _ivo6ya0v.ClassSchedule.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_intqjpio.CourseClass?>()) {
      return (data != null ? _intqjpio.CourseClass.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i6111ktp.CourseClassStatus?>()) {
      return (data != null ? _i6111ktp.CourseClassStatus.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ivq6o0sg.CourseEquivalent?>()) {
      return (data != null ? _ivq6o0sg.CourseEquivalent.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iagk693e.CourseOpeningRequest?>()) {
      return (data != null
              ? _iagk693e.CourseOpeningRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i7f5kvdx.CoursePrerequisite?>()) {
      return (data != null ? _i7f5kvdx.CoursePrerequisite.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i9ek3ou2.OpeningRequestStatus?>()) {
      return (data != null
              ? _i9ek3ou2.OpeningRequestStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_isg2rjz0.Registration?>()) {
      return (data != null ? _isg2rjz0.Registration.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ick1ofaw.RegistrationAction?>()) {
      return (data != null ? _ick1ofaw.RegistrationAction.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_io6lhm66.RegistrationHistory?>()) {
      return (data != null
              ? _io6lhm66.RegistrationHistory.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i3fi4yfy.RegistrationPeriod?>()) {
      return (data != null ? _i3fi4yfy.RegistrationPeriod.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iryum3b8.RegistrationPeriodStatus?>()) {
      return (data != null
              ? _iryum3b8.RegistrationPeriodStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ienvemo7.RegistrationStatus?>()) {
      return (data != null ? _ienvemo7.RegistrationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iz7vluge.Semester?>()) {
      return (data != null ? _iz7vluge.Semester.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_inuj73nk.SemesterStatus?>()) {
      return (data != null ? _inuj73nk.SemesterStatus.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iwzlgl4r.Student?>()) {
      return (data != null ? _iwzlgl4r.Student.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_igzwjm5d.GpaDto?>()) {
      return (data != null ? _igzwjm5d.GpaDto.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iwyne1wa.StudentProfileDto?>()) {
      return (data != null ? _iwyne1wa.StudentProfileDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iiy6nwja.TrainingProgramCourseDto?>()) {
      return (data != null
              ? _iiy6nwja.TrainingProgramCourseDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ia9f4ste.TranscriptDto?>()) {
      return (data != null ? _ia9f4ste.TranscriptDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iysyfyey.Course?>()) {
      return (data != null ? _iysyfyey.Course.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_inmihsz6.CourseProgressStatus?>()) {
      return (data != null
              ? _inmihsz6.CourseProgressStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_iajbyi83.CourseType?>()) {
      return (data != null ? _iajbyi83.CourseType.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iehbjec4.Faculty?>()) {
      return (data != null ? _iehbjec4.Faculty.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iqe9gc9z.Major?>()) {
      return (data != null ? _iqe9gc9z.Major.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iw15wxpt.StudentTranscript?>()) {
      return (data != null ? _iw15wxpt.StudentTranscript.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ige2gcz9.TrainingProgram?>()) {
      return (data != null ? _ige2gcz9.TrainingProgram.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_im8ku9lz.TrainingProgramCourse?>()) {
      return (data != null
              ? _im8ku9lz.TrainingProgramCourse.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i7qv1iv3.TrainingProgramStatus?>()) {
      return (data != null
              ? _i7qv1iv3.TrainingProgramStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i3gkq2t9.TranscriptStatus?>()) {
      return (data != null ? _i3gkq2t9.TranscriptStatus.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i8xfjltp.PullSyncResultDto?>()) {
      return (data != null ? _i8xfjltp.PullSyncResultDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ih97hn2e.SyncChangeDto?>()) {
      return (data != null ? _ih97hn2e.SyncChangeDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ijhls20r.SyncOperationInputDto?>()) {
      return (data != null
              ? _ijhls20r.SyncOperationInputDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i0c46qnp.SyncOperationResultDto?>()) {
      return (data != null
              ? _i0c46qnp.SyncOperationResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i2e8b5z3.SyncStatusDto?>()) {
      return (data != null ? _i2e8b5z3.SyncStatusDto.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iyxfog5l.ProcessedSyncOperation?>()) {
      return (data != null
              ? _iyxfog5l.ProcessedSyncOperation.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ijoocq8q.SyncChange?>()) {
      return (data != null ? _ijoocq8q.SyncChange.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_irvfms91.SyncLog?>()) {
      return (data != null ? _irvfms91.SyncLog.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ipxryt3x.SyncOperationStatus?>()) {
      return (data != null
              ? _ipxryt3x.SyncOperationStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ir0y0iu6.UserRole?>()) {
      return (data != null ? _ir0y0iu6.UserRole.fromJson(data) : null) as T;
    }
    if (t == List<_ioqh38vf.NamedCountDto>) {
      return (data as List)
              .map((e) => deserialize<_ioqh38vf.NamedCountDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iq0ly2ak.ClassDemandDto>) {
      return (data as List)
              .map((e) => deserialize<_iq0ly2ak.ClassDemandDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i78ov9ny.CourseGpaDto>) {
      return (data as List)
              .map((e) => deserialize<_i78ov9ny.CourseGpaDto>(e))
              .toList()
          as T;
    }
    if (t == List<_irv87c2y.TeachingScheduleProposal>) {
      return (data as List)
              .map((e) => deserialize<_irv87c2y.TeachingScheduleProposal>(e))
              .toList()
          as T;
    }
    if (t == List<_ib3wa59y.ClassScheduleDto>) {
      return (data as List)
              .map((e) => deserialize<_ib3wa59y.ClassScheduleDto>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ih97hn2e.SyncChangeDto>) {
      return (data as List)
              .map((e) => deserialize<_ih97hn2e.SyncChangeDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iitlaycf.AdminUserDto>) {
      return (data as List)
              .map((e) => deserialize<_iitlaycf.AdminUserDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ihzhjg22.Course>) {
      return (data as List)
              .map((e) => deserialize<_ihzhjg22.Course>(e))
              .toList()
          as T;
    }
    if (t == List<_iiopdple.TrainingProgram>) {
      return (data as List)
              .map((e) => deserialize<_iiopdple.TrainingProgram>(e))
              .toList()
          as T;
    }
    if (t == List<_i2uuv4ic.Major>) {
      return (data as List).map((e) => deserialize<_i2uuv4ic.Major>(e)).toList()
          as T;
    }
    if (t == List<_ijwatpay.TrainingProgramCourse>) {
      return (data as List)
              .map((e) => deserialize<_ijwatpay.TrainingProgramCourse>(e))
              .toList()
          as T;
    }
    if (t == List<_i5zv3u4e.CoursePrerequisite>) {
      return (data as List)
              .map((e) => deserialize<_i5zv3u4e.CoursePrerequisite>(e))
              .toList()
          as T;
    }
    if (t == List<_i67xlk2c.CourseEquivalent>) {
      return (data as List)
              .map((e) => deserialize<_i67xlk2c.CourseEquivalent>(e))
              .toList()
          as T;
    }
    if (t == List<_iiom1wy7.PendingClassApprovalDto>) {
      return (data as List)
              .map((e) => deserialize<_iiom1wy7.PendingClassApprovalDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i095tu7a.CourseOpeningRequest>) {
      return (data as List)
              .map((e) => deserialize<_i095tu7a.CourseOpeningRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_ifivxqc8.ClassAdjustmentRequestDto>) {
      return (data as List)
              .map((e) => deserialize<_ifivxqc8.ClassAdjustmentRequestDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iofzf6to.RegistrationPeriodDto>) {
      return (data as List)
              .map((e) => deserialize<_iofzf6to.RegistrationPeriodDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iaxc31e6.AuditLogDto>) {
      return (data as List)
              .map((e) => deserialize<_iaxc31e6.AuditLogDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i3lq6s0i.AdminPermission>) {
      return (data as List)
              .map((e) => deserialize<_i3lq6s0i.AdminPermission>(e))
              .toList()
          as T;
    }
    if (t == List<_iu5keruo.Semester>) {
      return (data as List)
              .map((e) => deserialize<_iu5keruo.Semester>(e))
              .toList()
          as T;
    }
    if (t == List<_ibein0b1.LecturerCourseClassDto>) {
      return (data as List)
              .map((e) => deserialize<_ibein0b1.LecturerCourseClassDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iff0ymco.ClassScheduleDto>) {
      return (data as List)
              .map((e) => deserialize<_iff0ymco.ClassScheduleDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i81hb12m.TeachingScheduleProposal>) {
      return (data as List)
              .map((e) => deserialize<_i81hb12m.TeachingScheduleProposal>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i0ncgxlw.ClassStudentDto>) {
      return (data as List)
              .map((e) => deserialize<_i0ncgxlw.ClassStudentDto>(e))
              .toList()
          as T;
    }
    if (t == List<_in85cpl6.ClassDemandDto>) {
      return (data as List)
              .map((e) => deserialize<_in85cpl6.ClassDemandDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ilyiw8j3.OpenCourseClassDto>) {
      return (data as List)
              .map((e) => deserialize<_ilyiw8j3.OpenCourseClassDto>(e))
              .toList()
          as T;
    }
    if (t == List<_irdda7pa.RegisteredCourseDto>) {
      return (data as List)
              .map((e) => deserialize<_irdda7pa.RegisteredCourseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ic40qcjp.TrainingProgramCourseDto>) {
      return (data as List)
              .map((e) => deserialize<_ic40qcjp.TrainingProgramCourseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iwasio4x.TranscriptDto>) {
      return (data as List)
              .map((e) => deserialize<_iwasio4x.TranscriptDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ikwxjn0j.SyncOperationResultDto>) {
      return (data as List)
              .map((e) => deserialize<_ikwxjn0j.SyncOperationResultDto>(e))
              .toList()
          as T;
    }
    if (t == List<_igbyh0qh.SyncOperationInputDto>) {
      return (data as List)
              .map((e) => deserialize<_igbyh0qh.SyncOperationInputDto>(e))
              .toList()
          as T;
    }
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _irtsa1cb.Admin => 'Admin',
      _ilq3ip1w.AdminUserDto => 'AdminUserDto',
      _iud5fcio.AnalyticsReportDto => 'AnalyticsReportDto',
      _idhpgcsg.AuditLogDto => 'AuditLogDto',
      _i78ov9ny.CourseGpaDto => 'CourseGpaDto',
      _ioqh38vf.NamedCountDto => 'NamedCountDto',
      _ii94yimq.PendingClassApprovalDto => 'PendingClassApprovalDto',
      _iqtm76wd.AdminPermission => 'AdminPermission',
      _ikq6rbq0.ClassApproval => 'ClassApproval',
      _iwu8lwz6.ClassApprovalStatus => 'ClassApprovalStatus',
      _immuk475.CourseCategory => 'CourseCategory',
      _ifcme4qk.SystemAuditLog => 'SystemAuditLog',
      _it4z223c.AppException => 'AppException',
      _i2j2xfrn.AppUser => 'AppUser',
      _izw8z7ou.Greeting => 'Greeting',
      _itbetnwi.Lecturer => 'Lecturer',
      _iq4gfhz6.ClassAdjustmentRequestDto => 'ClassAdjustmentRequestDto',
      _iq0ly2ak.ClassDemandDto => 'ClassDemandDto',
      _io3zsf6b.ClassStudentDto => 'ClassStudentDto',
      _iqyoloat.LecturerCourseClassDto => 'LecturerCourseClassDto',
      _ipt2hr1k.LecturerProfileDto => 'LecturerProfileDto',
      _ipucqiai.ClassAdjustmentRequest => 'ClassAdjustmentRequest',
      _iv9225wt.ClassAdjustmentStatus => 'ClassAdjustmentStatus',
      _im5rikfg.LecturerActivityLog => 'LecturerActivityLog',
      _iokj3d6r.LecturerCourseClass => 'LecturerCourseClass',
      _irv87c2y.TeachingScheduleProposal => 'TeachingScheduleProposal',
      _il6xaj9m.TeachingScheduleStatus => 'TeachingScheduleStatus',
      _ib3wa59y.ClassScheduleDto => 'ClassScheduleDto',
      _iaaclq68.EligibilityResultDto => 'EligibilityResultDto',
      _ipozmldp.OpenCourseClassDto => 'OpenCourseClassDto',
      _ilcih2k6.RegisteredCourseDto => 'RegisteredCourseDto',
      _i1fn64hq.RegistrationPeriodDto => 'RegistrationPeriodDto',
      _ii8dcq83.RegistrationResultDto => 'RegistrationResultDto',
      _ivo6ya0v.ClassSchedule => 'ClassSchedule',
      _intqjpio.CourseClass => 'CourseClass',
      _i6111ktp.CourseClassStatus => 'CourseClassStatus',
      _ivq6o0sg.CourseEquivalent => 'CourseEquivalent',
      _iagk693e.CourseOpeningRequest => 'CourseOpeningRequest',
      _i7f5kvdx.CoursePrerequisite => 'CoursePrerequisite',
      _i9ek3ou2.OpeningRequestStatus => 'OpeningRequestStatus',
      _isg2rjz0.Registration => 'Registration',
      _ick1ofaw.RegistrationAction => 'RegistrationAction',
      _io6lhm66.RegistrationHistory => 'RegistrationHistory',
      _i3fi4yfy.RegistrationPeriod => 'RegistrationPeriod',
      _iryum3b8.RegistrationPeriodStatus => 'RegistrationPeriodStatus',
      _ienvemo7.RegistrationStatus => 'RegistrationStatus',
      _iz7vluge.Semester => 'Semester',
      _inuj73nk.SemesterStatus => 'SemesterStatus',
      _iwzlgl4r.Student => 'Student',
      _igzwjm5d.GpaDto => 'GpaDto',
      _iwyne1wa.StudentProfileDto => 'StudentProfileDto',
      _iiy6nwja.TrainingProgramCourseDto => 'TrainingProgramCourseDto',
      _ia9f4ste.TranscriptDto => 'TranscriptDto',
      _iysyfyey.Course => 'Course',
      _inmihsz6.CourseProgressStatus => 'CourseProgressStatus',
      _iajbyi83.CourseType => 'CourseType',
      _iehbjec4.Faculty => 'Faculty',
      _iqe9gc9z.Major => 'Major',
      _iw15wxpt.StudentTranscript => 'StudentTranscript',
      _ige2gcz9.TrainingProgram => 'TrainingProgram',
      _im8ku9lz.TrainingProgramCourse => 'TrainingProgramCourse',
      _i7qv1iv3.TrainingProgramStatus => 'TrainingProgramStatus',
      _i3gkq2t9.TranscriptStatus => 'TranscriptStatus',
      _i8xfjltp.PullSyncResultDto => 'PullSyncResultDto',
      _ih97hn2e.SyncChangeDto => 'SyncChangeDto',
      _ijhls20r.SyncOperationInputDto => 'SyncOperationInputDto',
      _i0c46qnp.SyncOperationResultDto => 'SyncOperationResultDto',
      _i2e8b5z3.SyncStatusDto => 'SyncStatusDto',
      _iyxfog5l.ProcessedSyncOperation => 'ProcessedSyncOperation',
      _ijoocq8q.SyncChange => 'SyncChange',
      _irvfms91.SyncLog => 'SyncLog',
      _ipxryt3x.SyncOperationStatus => 'SyncOperationStatus',
      _ir0y0iu6.UserRole => 'UserRole',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'course_registration.',
        '',
      );
    }

    switch (data) {
      case _irtsa1cb.Admin():
        return 'Admin';
      case _ilq3ip1w.AdminUserDto():
        return 'AdminUserDto';
      case _iud5fcio.AnalyticsReportDto():
        return 'AnalyticsReportDto';
      case _idhpgcsg.AuditLogDto():
        return 'AuditLogDto';
      case _i78ov9ny.CourseGpaDto():
        return 'CourseGpaDto';
      case _ioqh38vf.NamedCountDto():
        return 'NamedCountDto';
      case _ii94yimq.PendingClassApprovalDto():
        return 'PendingClassApprovalDto';
      case _iqtm76wd.AdminPermission():
        return 'AdminPermission';
      case _ikq6rbq0.ClassApproval():
        return 'ClassApproval';
      case _iwu8lwz6.ClassApprovalStatus():
        return 'ClassApprovalStatus';
      case _immuk475.CourseCategory():
        return 'CourseCategory';
      case _ifcme4qk.SystemAuditLog():
        return 'SystemAuditLog';
      case _it4z223c.AppException():
        return 'AppException';
      case _i2j2xfrn.AppUser():
        return 'AppUser';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _itbetnwi.Lecturer():
        return 'Lecturer';
      case _iq4gfhz6.ClassAdjustmentRequestDto():
        return 'ClassAdjustmentRequestDto';
      case _iq0ly2ak.ClassDemandDto():
        return 'ClassDemandDto';
      case _io3zsf6b.ClassStudentDto():
        return 'ClassStudentDto';
      case _iqyoloat.LecturerCourseClassDto():
        return 'LecturerCourseClassDto';
      case _ipt2hr1k.LecturerProfileDto():
        return 'LecturerProfileDto';
      case _ipucqiai.ClassAdjustmentRequest():
        return 'ClassAdjustmentRequest';
      case _iv9225wt.ClassAdjustmentStatus():
        return 'ClassAdjustmentStatus';
      case _im5rikfg.LecturerActivityLog():
        return 'LecturerActivityLog';
      case _iokj3d6r.LecturerCourseClass():
        return 'LecturerCourseClass';
      case _irv87c2y.TeachingScheduleProposal():
        return 'TeachingScheduleProposal';
      case _il6xaj9m.TeachingScheduleStatus():
        return 'TeachingScheduleStatus';
      case _ib3wa59y.ClassScheduleDto():
        return 'ClassScheduleDto';
      case _iaaclq68.EligibilityResultDto():
        return 'EligibilityResultDto';
      case _ipozmldp.OpenCourseClassDto():
        return 'OpenCourseClassDto';
      case _ilcih2k6.RegisteredCourseDto():
        return 'RegisteredCourseDto';
      case _i1fn64hq.RegistrationPeriodDto():
        return 'RegistrationPeriodDto';
      case _ii8dcq83.RegistrationResultDto():
        return 'RegistrationResultDto';
      case _ivo6ya0v.ClassSchedule():
        return 'ClassSchedule';
      case _intqjpio.CourseClass():
        return 'CourseClass';
      case _i6111ktp.CourseClassStatus():
        return 'CourseClassStatus';
      case _ivq6o0sg.CourseEquivalent():
        return 'CourseEquivalent';
      case _iagk693e.CourseOpeningRequest():
        return 'CourseOpeningRequest';
      case _i7f5kvdx.CoursePrerequisite():
        return 'CoursePrerequisite';
      case _i9ek3ou2.OpeningRequestStatus():
        return 'OpeningRequestStatus';
      case _isg2rjz0.Registration():
        return 'Registration';
      case _ick1ofaw.RegistrationAction():
        return 'RegistrationAction';
      case _io6lhm66.RegistrationHistory():
        return 'RegistrationHistory';
      case _i3fi4yfy.RegistrationPeriod():
        return 'RegistrationPeriod';
      case _iryum3b8.RegistrationPeriodStatus():
        return 'RegistrationPeriodStatus';
      case _ienvemo7.RegistrationStatus():
        return 'RegistrationStatus';
      case _iz7vluge.Semester():
        return 'Semester';
      case _inuj73nk.SemesterStatus():
        return 'SemesterStatus';
      case _iwzlgl4r.Student():
        return 'Student';
      case _igzwjm5d.GpaDto():
        return 'GpaDto';
      case _iwyne1wa.StudentProfileDto():
        return 'StudentProfileDto';
      case _iiy6nwja.TrainingProgramCourseDto():
        return 'TrainingProgramCourseDto';
      case _ia9f4ste.TranscriptDto():
        return 'TranscriptDto';
      case _iysyfyey.Course():
        return 'Course';
      case _inmihsz6.CourseProgressStatus():
        return 'CourseProgressStatus';
      case _iajbyi83.CourseType():
        return 'CourseType';
      case _iehbjec4.Faculty():
        return 'Faculty';
      case _iqe9gc9z.Major():
        return 'Major';
      case _iw15wxpt.StudentTranscript():
        return 'StudentTranscript';
      case _ige2gcz9.TrainingProgram():
        return 'TrainingProgram';
      case _im8ku9lz.TrainingProgramCourse():
        return 'TrainingProgramCourse';
      case _i7qv1iv3.TrainingProgramStatus():
        return 'TrainingProgramStatus';
      case _i3gkq2t9.TranscriptStatus():
        return 'TranscriptStatus';
      case _i8xfjltp.PullSyncResultDto():
        return 'PullSyncResultDto';
      case _ih97hn2e.SyncChangeDto():
        return 'SyncChangeDto';
      case _ijhls20r.SyncOperationInputDto():
        return 'SyncOperationInputDto';
      case _i0c46qnp.SyncOperationResultDto():
        return 'SyncOperationResultDto';
      case _i2e8b5z3.SyncStatusDto():
        return 'SyncStatusDto';
      case _iyxfog5l.ProcessedSyncOperation():
        return 'ProcessedSyncOperation';
      case _ijoocq8q.SyncChange():
        return 'SyncChange';
      case _irvfms91.SyncLog():
        return 'SyncLog';
      case _ipxryt3x.SyncOperationStatus():
        return 'SyncOperationStatus';
      case _ir0y0iu6.UserRole():
        return 'UserRole';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Admin') {
      return deserialize<_irtsa1cb.Admin>(data['data']);
    }
    if (dataClassName == 'AdminUserDto') {
      return deserialize<_ilq3ip1w.AdminUserDto>(data['data']);
    }
    if (dataClassName == 'AnalyticsReportDto') {
      return deserialize<_iud5fcio.AnalyticsReportDto>(data['data']);
    }
    if (dataClassName == 'AuditLogDto') {
      return deserialize<_idhpgcsg.AuditLogDto>(data['data']);
    }
    if (dataClassName == 'CourseGpaDto') {
      return deserialize<_i78ov9ny.CourseGpaDto>(data['data']);
    }
    if (dataClassName == 'NamedCountDto') {
      return deserialize<_ioqh38vf.NamedCountDto>(data['data']);
    }
    if (dataClassName == 'PendingClassApprovalDto') {
      return deserialize<_ii94yimq.PendingClassApprovalDto>(data['data']);
    }
    if (dataClassName == 'AdminPermission') {
      return deserialize<_iqtm76wd.AdminPermission>(data['data']);
    }
    if (dataClassName == 'ClassApproval') {
      return deserialize<_ikq6rbq0.ClassApproval>(data['data']);
    }
    if (dataClassName == 'ClassApprovalStatus') {
      return deserialize<_iwu8lwz6.ClassApprovalStatus>(data['data']);
    }
    if (dataClassName == 'CourseCategory') {
      return deserialize<_immuk475.CourseCategory>(data['data']);
    }
    if (dataClassName == 'SystemAuditLog') {
      return deserialize<_ifcme4qk.SystemAuditLog>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_it4z223c.AppException>(data['data']);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i2j2xfrn.AppUser>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Lecturer') {
      return deserialize<_itbetnwi.Lecturer>(data['data']);
    }
    if (dataClassName == 'ClassAdjustmentRequestDto') {
      return deserialize<_iq4gfhz6.ClassAdjustmentRequestDto>(data['data']);
    }
    if (dataClassName == 'ClassDemandDto') {
      return deserialize<_iq0ly2ak.ClassDemandDto>(data['data']);
    }
    if (dataClassName == 'ClassStudentDto') {
      return deserialize<_io3zsf6b.ClassStudentDto>(data['data']);
    }
    if (dataClassName == 'LecturerCourseClassDto') {
      return deserialize<_iqyoloat.LecturerCourseClassDto>(data['data']);
    }
    if (dataClassName == 'LecturerProfileDto') {
      return deserialize<_ipt2hr1k.LecturerProfileDto>(data['data']);
    }
    if (dataClassName == 'ClassAdjustmentRequest') {
      return deserialize<_ipucqiai.ClassAdjustmentRequest>(data['data']);
    }
    if (dataClassName == 'ClassAdjustmentStatus') {
      return deserialize<_iv9225wt.ClassAdjustmentStatus>(data['data']);
    }
    if (dataClassName == 'LecturerActivityLog') {
      return deserialize<_im5rikfg.LecturerActivityLog>(data['data']);
    }
    if (dataClassName == 'LecturerCourseClass') {
      return deserialize<_iokj3d6r.LecturerCourseClass>(data['data']);
    }
    if (dataClassName == 'TeachingScheduleProposal') {
      return deserialize<_irv87c2y.TeachingScheduleProposal>(data['data']);
    }
    if (dataClassName == 'TeachingScheduleStatus') {
      return deserialize<_il6xaj9m.TeachingScheduleStatus>(data['data']);
    }
    if (dataClassName == 'ClassScheduleDto') {
      return deserialize<_ib3wa59y.ClassScheduleDto>(data['data']);
    }
    if (dataClassName == 'EligibilityResultDto') {
      return deserialize<_iaaclq68.EligibilityResultDto>(data['data']);
    }
    if (dataClassName == 'OpenCourseClassDto') {
      return deserialize<_ipozmldp.OpenCourseClassDto>(data['data']);
    }
    if (dataClassName == 'RegisteredCourseDto') {
      return deserialize<_ilcih2k6.RegisteredCourseDto>(data['data']);
    }
    if (dataClassName == 'RegistrationPeriodDto') {
      return deserialize<_i1fn64hq.RegistrationPeriodDto>(data['data']);
    }
    if (dataClassName == 'RegistrationResultDto') {
      return deserialize<_ii8dcq83.RegistrationResultDto>(data['data']);
    }
    if (dataClassName == 'ClassSchedule') {
      return deserialize<_ivo6ya0v.ClassSchedule>(data['data']);
    }
    if (dataClassName == 'CourseClass') {
      return deserialize<_intqjpio.CourseClass>(data['data']);
    }
    if (dataClassName == 'CourseClassStatus') {
      return deserialize<_i6111ktp.CourseClassStatus>(data['data']);
    }
    if (dataClassName == 'CourseEquivalent') {
      return deserialize<_ivq6o0sg.CourseEquivalent>(data['data']);
    }
    if (dataClassName == 'CourseOpeningRequest') {
      return deserialize<_iagk693e.CourseOpeningRequest>(data['data']);
    }
    if (dataClassName == 'CoursePrerequisite') {
      return deserialize<_i7f5kvdx.CoursePrerequisite>(data['data']);
    }
    if (dataClassName == 'OpeningRequestStatus') {
      return deserialize<_i9ek3ou2.OpeningRequestStatus>(data['data']);
    }
    if (dataClassName == 'Registration') {
      return deserialize<_isg2rjz0.Registration>(data['data']);
    }
    if (dataClassName == 'RegistrationAction') {
      return deserialize<_ick1ofaw.RegistrationAction>(data['data']);
    }
    if (dataClassName == 'RegistrationHistory') {
      return deserialize<_io6lhm66.RegistrationHistory>(data['data']);
    }
    if (dataClassName == 'RegistrationPeriod') {
      return deserialize<_i3fi4yfy.RegistrationPeriod>(data['data']);
    }
    if (dataClassName == 'RegistrationPeriodStatus') {
      return deserialize<_iryum3b8.RegistrationPeriodStatus>(data['data']);
    }
    if (dataClassName == 'RegistrationStatus') {
      return deserialize<_ienvemo7.RegistrationStatus>(data['data']);
    }
    if (dataClassName == 'Semester') {
      return deserialize<_iz7vluge.Semester>(data['data']);
    }
    if (dataClassName == 'SemesterStatus') {
      return deserialize<_inuj73nk.SemesterStatus>(data['data']);
    }
    if (dataClassName == 'Student') {
      return deserialize<_iwzlgl4r.Student>(data['data']);
    }
    if (dataClassName == 'GpaDto') {
      return deserialize<_igzwjm5d.GpaDto>(data['data']);
    }
    if (dataClassName == 'StudentProfileDto') {
      return deserialize<_iwyne1wa.StudentProfileDto>(data['data']);
    }
    if (dataClassName == 'TrainingProgramCourseDto') {
      return deserialize<_iiy6nwja.TrainingProgramCourseDto>(data['data']);
    }
    if (dataClassName == 'TranscriptDto') {
      return deserialize<_ia9f4ste.TranscriptDto>(data['data']);
    }
    if (dataClassName == 'Course') {
      return deserialize<_iysyfyey.Course>(data['data']);
    }
    if (dataClassName == 'CourseProgressStatus') {
      return deserialize<_inmihsz6.CourseProgressStatus>(data['data']);
    }
    if (dataClassName == 'CourseType') {
      return deserialize<_iajbyi83.CourseType>(data['data']);
    }
    if (dataClassName == 'Faculty') {
      return deserialize<_iehbjec4.Faculty>(data['data']);
    }
    if (dataClassName == 'Major') {
      return deserialize<_iqe9gc9z.Major>(data['data']);
    }
    if (dataClassName == 'StudentTranscript') {
      return deserialize<_iw15wxpt.StudentTranscript>(data['data']);
    }
    if (dataClassName == 'TrainingProgram') {
      return deserialize<_ige2gcz9.TrainingProgram>(data['data']);
    }
    if (dataClassName == 'TrainingProgramCourse') {
      return deserialize<_im8ku9lz.TrainingProgramCourse>(data['data']);
    }
    if (dataClassName == 'TrainingProgramStatus') {
      return deserialize<_i7qv1iv3.TrainingProgramStatus>(data['data']);
    }
    if (dataClassName == 'TranscriptStatus') {
      return deserialize<_i3gkq2t9.TranscriptStatus>(data['data']);
    }
    if (dataClassName == 'PullSyncResultDto') {
      return deserialize<_i8xfjltp.PullSyncResultDto>(data['data']);
    }
    if (dataClassName == 'SyncChangeDto') {
      return deserialize<_ih97hn2e.SyncChangeDto>(data['data']);
    }
    if (dataClassName == 'SyncOperationInputDto') {
      return deserialize<_ijhls20r.SyncOperationInputDto>(data['data']);
    }
    if (dataClassName == 'SyncOperationResultDto') {
      return deserialize<_i0c46qnp.SyncOperationResultDto>(data['data']);
    }
    if (dataClassName == 'SyncStatusDto') {
      return deserialize<_i2e8b5z3.SyncStatusDto>(data['data']);
    }
    if (dataClassName == 'ProcessedSyncOperation') {
      return deserialize<_iyxfog5l.ProcessedSyncOperation>(data['data']);
    }
    if (dataClassName == 'SyncChange') {
      return deserialize<_ijoocq8q.SyncChange>(data['data']);
    }
    if (dataClassName == 'SyncLog') {
      return deserialize<_irvfms91.SyncLog>(data['data']);
    }
    if (dataClassName == 'SyncOperationStatus') {
      return deserialize<_ipxryt3x.SyncOperationStatus>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_ir0y0iu6.UserRole>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iacc.Protocol().registerHostProtocol('course_registration', this);
    _iaic.Protocol().registerHostProtocol('course_registration', this);
  }

  @override
  String getModuleName() => 'course_registration';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
