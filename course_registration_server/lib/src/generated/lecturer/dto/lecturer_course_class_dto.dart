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
import 'package:course_registration_server/src/generated/protocol.dart'
    as _i9p8z86v;
import 'package:serverpod/serverpod.dart' as _is;
import '../../lecturer/dto/class_adjustment_request_dto.dart' as _io7ztl6x;
import '../../lecturer/models/teaching_schedule_proposal.dart' as _ir6p9ie4;
import '../../registration/dto/class_schedule_dto.dart' as _ib1jm4me;
import '../../registration/models/course_class_status.dart' as _i5mo64p9;

abstract class LecturerCourseClassDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  LecturerCourseClassDto._({
    required this.courseClassId,
    required this.courseId,
    required this.semesterId,
    required this.courseCode,
    required this.courseName,
    required this.semesterName,
    required this.academicYear,
    required this.classCode,
    required this.capacity,
    required this.registeredCount,
    required this.status,
    required this.schedules,
    required this.proposals,
    this.latestAdjustment,
  });

  factory LecturerCourseClassDto({
    required _is.UuidValue courseClassId,
    required _is.UuidValue courseId,
    required _is.UuidValue semesterId,
    required String courseCode,
    required String courseName,
    required String semesterName,
    required int academicYear,
    required String classCode,
    required int capacity,
    required int registeredCount,
    required _i5mo64p9.CourseClassStatus status,
    required List<_ib1jm4me.ClassScheduleDto> schedules,
    required List<_ir6p9ie4.TeachingScheduleProposal> proposals,
    _io7ztl6x.ClassAdjustmentRequestDto? latestAdjustment,
  }) = _LecturerCourseClassDtoImpl;

  factory LecturerCourseClassDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LecturerCourseClassDto(
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      semesterId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      semesterName: jsonSerialization['semesterName'] as String,
      academicYear: jsonSerialization['academicYear'] as int,
      classCode: jsonSerialization['classCode'] as String,
      capacity: jsonSerialization['capacity'] as int,
      registeredCount: jsonSerialization['registeredCount'] as int,
      status: _i5mo64p9.CourseClassStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      schedules: _i9p8z86v.Protocol()
          .deserialize<List<_ib1jm4me.ClassScheduleDto>>(
            jsonSerialization['schedules'],
          ),
      proposals: _i9p8z86v.Protocol()
          .deserialize<List<_ir6p9ie4.TeachingScheduleProposal>>(
            jsonSerialization['proposals'],
          ),
      latestAdjustment: jsonSerialization['latestAdjustment'] == null
          ? null
          : _i9p8z86v.Protocol()
                .deserialize<_io7ztl6x.ClassAdjustmentRequestDto>(
                  jsonSerialization['latestAdjustment'],
                ),
    );
  }

  _is.UuidValue courseClassId;

  _is.UuidValue courseId;

  _is.UuidValue semesterId;

  String courseCode;

  String courseName;

  String semesterName;

  int academicYear;

  String classCode;

  int capacity;

  int registeredCount;

  _i5mo64p9.CourseClassStatus status;

  List<_ib1jm4me.ClassScheduleDto> schedules;

  List<_ir6p9ie4.TeachingScheduleProposal> proposals;

  _io7ztl6x.ClassAdjustmentRequestDto? latestAdjustment;

  /// Returns a shallow copy of this [LecturerCourseClassDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  LecturerCourseClassDto copyWith({
    _is.UuidValue? courseClassId,
    _is.UuidValue? courseId,
    _is.UuidValue? semesterId,
    String? courseCode,
    String? courseName,
    String? semesterName,
    int? academicYear,
    String? classCode,
    int? capacity,
    int? registeredCount,
    _i5mo64p9.CourseClassStatus? status,
    List<_ib1jm4me.ClassScheduleDto>? schedules,
    List<_ir6p9ie4.TeachingScheduleProposal>? proposals,
    _io7ztl6x.ClassAdjustmentRequestDto? latestAdjustment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LecturerCourseClassDto',
      'courseClassId': courseClassId.toJson(),
      'courseId': courseId.toJson(),
      'semesterId': semesterId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'semesterName': semesterName,
      'academicYear': academicYear,
      'classCode': classCode,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'status': status.toJson(),
      'schedules': schedules.toJson(valueToJson: (v) => v.toJson()),
      'proposals': proposals.toJson(valueToJson: (v) => v.toJson()),
      if (latestAdjustment != null)
        'latestAdjustment': latestAdjustment?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LecturerCourseClassDto',
      'courseClassId': courseClassId.toJson(),
      'courseId': courseId.toJson(),
      'semesterId': semesterId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'semesterName': semesterName,
      'academicYear': academicYear,
      'classCode': classCode,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'status': status.toJson(),
      'schedules': schedules.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'proposals': proposals.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (latestAdjustment != null)
        'latestAdjustment': latestAdjustment?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerCourseClassDtoImpl extends LecturerCourseClassDto {
  _LecturerCourseClassDtoImpl({
    required _is.UuidValue courseClassId,
    required _is.UuidValue courseId,
    required _is.UuidValue semesterId,
    required String courseCode,
    required String courseName,
    required String semesterName,
    required int academicYear,
    required String classCode,
    required int capacity,
    required int registeredCount,
    required _i5mo64p9.CourseClassStatus status,
    required List<_ib1jm4me.ClassScheduleDto> schedules,
    required List<_ir6p9ie4.TeachingScheduleProposal> proposals,
    _io7ztl6x.ClassAdjustmentRequestDto? latestAdjustment,
  }) : super._(
         courseClassId: courseClassId,
         courseId: courseId,
         semesterId: semesterId,
         courseCode: courseCode,
         courseName: courseName,
         semesterName: semesterName,
         academicYear: academicYear,
         classCode: classCode,
         capacity: capacity,
         registeredCount: registeredCount,
         status: status,
         schedules: schedules,
         proposals: proposals,
         latestAdjustment: latestAdjustment,
       );

  /// Returns a shallow copy of this [LecturerCourseClassDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  LecturerCourseClassDto copyWith({
    _is.UuidValue? courseClassId,
    _is.UuidValue? courseId,
    _is.UuidValue? semesterId,
    String? courseCode,
    String? courseName,
    String? semesterName,
    int? academicYear,
    String? classCode,
    int? capacity,
    int? registeredCount,
    _i5mo64p9.CourseClassStatus? status,
    List<_ib1jm4me.ClassScheduleDto>? schedules,
    List<_ir6p9ie4.TeachingScheduleProposal>? proposals,
    Object? latestAdjustment = _Undefined,
  }) {
    return LecturerCourseClassDto(
      courseClassId: courseClassId ?? this.courseClassId,
      courseId: courseId ?? this.courseId,
      semesterId: semesterId ?? this.semesterId,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      semesterName: semesterName ?? this.semesterName,
      academicYear: academicYear ?? this.academicYear,
      classCode: classCode ?? this.classCode,
      capacity: capacity ?? this.capacity,
      registeredCount: registeredCount ?? this.registeredCount,
      status: status ?? this.status,
      schedules:
          schedules ?? this.schedules.map((e0) => e0.copyWith()).toList(),
      proposals:
          proposals ?? this.proposals.map((e0) => e0.copyWith()).toList(),
      latestAdjustment: latestAdjustment is _io7ztl6x.ClassAdjustmentRequestDto?
          ? latestAdjustment
          : this.latestAdjustment?.copyWith(),
    );
  }
}
