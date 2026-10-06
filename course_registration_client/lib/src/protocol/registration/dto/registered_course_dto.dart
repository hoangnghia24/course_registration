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
import 'package:course_registration_client/src/protocol/protocol.dart'
    as _iyxbdoua;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../../registration/dto/class_schedule_dto.dart' as _ib1jm4me;
import '../../registration/models/registration_status.dart' as _iqegjhnz;

abstract class RegisteredCourseDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RegisteredCourseDto._({
    required this.registrationId,
    required this.courseClassId,
    required this.semesterId,
    required this.classCode,
    required this.courseCode,
    required this.courseName,
    required this.credits,
    required this.lecturerName,
    required this.registeredAt,
    required this.status,
    required this.schedules,
  });

  factory RegisteredCourseDto({
    required _isc.UuidValue registrationId,
    required _isc.UuidValue courseClassId,
    required _isc.UuidValue semesterId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required int credits,
    required String lecturerName,
    required DateTime registeredAt,
    required _iqegjhnz.RegistrationStatus status,
    required List<_ib1jm4me.ClassScheduleDto> schedules,
  }) = _RegisteredCourseDtoImpl;

  factory RegisteredCourseDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegisteredCourseDto(
      registrationId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['registrationId'],
      ),
      courseClassId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      semesterId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      classCode: jsonSerialization['classCode'] as String,
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      credits: jsonSerialization['credits'] as int,
      lecturerName: jsonSerialization['lecturerName'] as String,
      registeredAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['registeredAt'],
      ),
      status: _iqegjhnz.RegistrationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      schedules: _iyxbdoua.Protocol()
          .deserialize<List<_ib1jm4me.ClassScheduleDto>>(
            jsonSerialization['schedules'],
          ),
    );
  }

  _isc.UuidValue registrationId;

  _isc.UuidValue courseClassId;

  _isc.UuidValue semesterId;

  String classCode;

  String courseCode;

  String courseName;

  int credits;

  String lecturerName;

  DateTime registeredAt;

  _iqegjhnz.RegistrationStatus status;

  List<_ib1jm4me.ClassScheduleDto> schedules;

  /// Returns a shallow copy of this [RegisteredCourseDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RegisteredCourseDto copyWith({
    _isc.UuidValue? registrationId,
    _isc.UuidValue? courseClassId,
    _isc.UuidValue? semesterId,
    String? classCode,
    String? courseCode,
    String? courseName,
    int? credits,
    String? lecturerName,
    DateTime? registeredAt,
    _iqegjhnz.RegistrationStatus? status,
    List<_ib1jm4me.ClassScheduleDto>? schedules,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegisteredCourseDto',
      'registrationId': registrationId.toJson(),
      'courseClassId': courseClassId.toJson(),
      'semesterId': semesterId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'lecturerName': lecturerName,
      'registeredAt': registeredAt.toJson(),
      'status': status.toJson(),
      'schedules': schedules.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegisteredCourseDto',
      'registrationId': registrationId.toJson(),
      'courseClassId': courseClassId.toJson(),
      'semesterId': semesterId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'lecturerName': lecturerName,
      'registeredAt': registeredAt.toJson(),
      'status': status.toJson(),
      'schedules': schedules.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _RegisteredCourseDtoImpl extends RegisteredCourseDto {
  _RegisteredCourseDtoImpl({
    required _isc.UuidValue registrationId,
    required _isc.UuidValue courseClassId,
    required _isc.UuidValue semesterId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required int credits,
    required String lecturerName,
    required DateTime registeredAt,
    required _iqegjhnz.RegistrationStatus status,
    required List<_ib1jm4me.ClassScheduleDto> schedules,
  }) : super._(
         registrationId: registrationId,
         courseClassId: courseClassId,
         semesterId: semesterId,
         classCode: classCode,
         courseCode: courseCode,
         courseName: courseName,
         credits: credits,
         lecturerName: lecturerName,
         registeredAt: registeredAt,
         status: status,
         schedules: schedules,
       );

  /// Returns a shallow copy of this [RegisteredCourseDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RegisteredCourseDto copyWith({
    _isc.UuidValue? registrationId,
    _isc.UuidValue? courseClassId,
    _isc.UuidValue? semesterId,
    String? classCode,
    String? courseCode,
    String? courseName,
    int? credits,
    String? lecturerName,
    DateTime? registeredAt,
    _iqegjhnz.RegistrationStatus? status,
    List<_ib1jm4me.ClassScheduleDto>? schedules,
  }) {
    return RegisteredCourseDto(
      registrationId: registrationId ?? this.registrationId,
      courseClassId: courseClassId ?? this.courseClassId,
      semesterId: semesterId ?? this.semesterId,
      classCode: classCode ?? this.classCode,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      credits: credits ?? this.credits,
      lecturerName: lecturerName ?? this.lecturerName,
      registeredAt: registeredAt ?? this.registeredAt,
      status: status ?? this.status,
      schedules:
          schedules ?? this.schedules.map((e0) => e0.copyWith()).toList(),
    );
  }
}
