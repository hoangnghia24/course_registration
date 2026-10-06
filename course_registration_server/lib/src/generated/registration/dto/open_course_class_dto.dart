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
import '../../registration/dto/class_schedule_dto.dart' as _ib1jm4me;
import '../../registration/models/course_class_status.dart' as _i5mo64p9;

abstract class OpenCourseClassDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  OpenCourseClassDto._({
    required this.courseClassId,
    required this.courseId,
    required this.semesterId,
    required this.classCode,
    required this.courseCode,
    required this.courseName,
    required this.credits,
    required this.lecturerName,
    required this.capacity,
    required this.registeredCount,
    required this.remainingSeats,
    required this.status,
    required this.inTrainingProgram,
    required this.schedules,
  });

  factory OpenCourseClassDto({
    required _is.UuidValue courseClassId,
    required _is.UuidValue courseId,
    required _is.UuidValue semesterId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required int credits,
    required String lecturerName,
    required int capacity,
    required int registeredCount,
    required int remainingSeats,
    required _i5mo64p9.CourseClassStatus status,
    required bool inTrainingProgram,
    required List<_ib1jm4me.ClassScheduleDto> schedules,
  }) = _OpenCourseClassDtoImpl;

  factory OpenCourseClassDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return OpenCourseClassDto(
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      semesterId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      classCode: jsonSerialization['classCode'] as String,
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      credits: jsonSerialization['credits'] as int,
      lecturerName: jsonSerialization['lecturerName'] as String,
      capacity: jsonSerialization['capacity'] as int,
      registeredCount: jsonSerialization['registeredCount'] as int,
      remainingSeats: jsonSerialization['remainingSeats'] as int,
      status: _i5mo64p9.CourseClassStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      inTrainingProgram: _is.BoolJsonExtension.fromJson(
        jsonSerialization['inTrainingProgram'],
      ),
      schedules: _i9p8z86v.Protocol()
          .deserialize<List<_ib1jm4me.ClassScheduleDto>>(
            jsonSerialization['schedules'],
          ),
    );
  }

  _is.UuidValue courseClassId;

  _is.UuidValue courseId;

  _is.UuidValue semesterId;

  String classCode;

  String courseCode;

  String courseName;

  int credits;

  String lecturerName;

  int capacity;

  int registeredCount;

  int remainingSeats;

  _i5mo64p9.CourseClassStatus status;

  bool inTrainingProgram;

  List<_ib1jm4me.ClassScheduleDto> schedules;

  /// Returns a shallow copy of this [OpenCourseClassDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  OpenCourseClassDto copyWith({
    _is.UuidValue? courseClassId,
    _is.UuidValue? courseId,
    _is.UuidValue? semesterId,
    String? classCode,
    String? courseCode,
    String? courseName,
    int? credits,
    String? lecturerName,
    int? capacity,
    int? registeredCount,
    int? remainingSeats,
    _i5mo64p9.CourseClassStatus? status,
    bool? inTrainingProgram,
    List<_ib1jm4me.ClassScheduleDto>? schedules,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OpenCourseClassDto',
      'courseClassId': courseClassId.toJson(),
      'courseId': courseId.toJson(),
      'semesterId': semesterId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'lecturerName': lecturerName,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'remainingSeats': remainingSeats,
      'status': status.toJson(),
      'inTrainingProgram': inTrainingProgram,
      'schedules': schedules.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OpenCourseClassDto',
      'courseClassId': courseClassId.toJson(),
      'courseId': courseId.toJson(),
      'semesterId': semesterId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'lecturerName': lecturerName,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'remainingSeats': remainingSeats,
      'status': status.toJson(),
      'inTrainingProgram': inTrainingProgram,
      'schedules': schedules.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _OpenCourseClassDtoImpl extends OpenCourseClassDto {
  _OpenCourseClassDtoImpl({
    required _is.UuidValue courseClassId,
    required _is.UuidValue courseId,
    required _is.UuidValue semesterId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required int credits,
    required String lecturerName,
    required int capacity,
    required int registeredCount,
    required int remainingSeats,
    required _i5mo64p9.CourseClassStatus status,
    required bool inTrainingProgram,
    required List<_ib1jm4me.ClassScheduleDto> schedules,
  }) : super._(
         courseClassId: courseClassId,
         courseId: courseId,
         semesterId: semesterId,
         classCode: classCode,
         courseCode: courseCode,
         courseName: courseName,
         credits: credits,
         lecturerName: lecturerName,
         capacity: capacity,
         registeredCount: registeredCount,
         remainingSeats: remainingSeats,
         status: status,
         inTrainingProgram: inTrainingProgram,
         schedules: schedules,
       );

  /// Returns a shallow copy of this [OpenCourseClassDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  OpenCourseClassDto copyWith({
    _is.UuidValue? courseClassId,
    _is.UuidValue? courseId,
    _is.UuidValue? semesterId,
    String? classCode,
    String? courseCode,
    String? courseName,
    int? credits,
    String? lecturerName,
    int? capacity,
    int? registeredCount,
    int? remainingSeats,
    _i5mo64p9.CourseClassStatus? status,
    bool? inTrainingProgram,
    List<_ib1jm4me.ClassScheduleDto>? schedules,
  }) {
    return OpenCourseClassDto(
      courseClassId: courseClassId ?? this.courseClassId,
      courseId: courseId ?? this.courseId,
      semesterId: semesterId ?? this.semesterId,
      classCode: classCode ?? this.classCode,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      credits: credits ?? this.credits,
      lecturerName: lecturerName ?? this.lecturerName,
      capacity: capacity ?? this.capacity,
      registeredCount: registeredCount ?? this.registeredCount,
      remainingSeats: remainingSeats ?? this.remainingSeats,
      status: status ?? this.status,
      inTrainingProgram: inTrainingProgram ?? this.inTrainingProgram,
      schedules:
          schedules ?? this.schedules.map((e0) => e0.copyWith()).toList(),
    );
  }
}
