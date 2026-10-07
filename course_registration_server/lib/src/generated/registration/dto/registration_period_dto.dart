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
import 'package:serverpod/serverpod.dart' as _is;

abstract class RegistrationPeriodDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  RegistrationPeriodDto._({
    this.registrationPeriodId,
    required this.semesterId,
    required this.semesterName,
    required this.academicYear,
    required this.startTime,
    required this.endTime,
    required this.configured,
    required this.isOpen,
  });

  factory RegistrationPeriodDto({
    _is.UuidValue? registrationPeriodId,
    required _is.UuidValue semesterId,
    required String semesterName,
    required int academicYear,
    required DateTime startTime,
    required DateTime endTime,
    required bool configured,
    required bool isOpen,
  }) = _RegistrationPeriodDtoImpl;

  factory RegistrationPeriodDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RegistrationPeriodDto(
      registrationPeriodId: jsonSerialization['registrationPeriodId'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['registrationPeriodId'],
            ),
      semesterId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      semesterName: jsonSerialization['semesterName'] as String,
      academicYear: jsonSerialization['academicYear'] as int,
      startTime: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _is.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      configured: _is.BoolJsonExtension.fromJson(
        jsonSerialization['configured'],
      ),
      isOpen: _is.BoolJsonExtension.fromJson(jsonSerialization['isOpen']),
    );
  }

  _is.UuidValue? registrationPeriodId;

  _is.UuidValue semesterId;

  String semesterName;

  int academicYear;

  DateTime startTime;

  DateTime endTime;

  bool configured;

  bool isOpen;

  /// Returns a shallow copy of this [RegistrationPeriodDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RegistrationPeriodDto copyWith({
    _is.UuidValue? registrationPeriodId,
    _is.UuidValue? semesterId,
    String? semesterName,
    int? academicYear,
    DateTime? startTime,
    DateTime? endTime,
    bool? configured,
    bool? isOpen,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegistrationPeriodDto',
      if (registrationPeriodId != null)
        'registrationPeriodId': registrationPeriodId?.toJson(),
      'semesterId': semesterId.toJson(),
      'semesterName': semesterName,
      'academicYear': academicYear,
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      'configured': configured,
      'isOpen': isOpen,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegistrationPeriodDto',
      if (registrationPeriodId != null)
        'registrationPeriodId': registrationPeriodId?.toJson(),
      'semesterId': semesterId.toJson(),
      'semesterName': semesterName,
      'academicYear': academicYear,
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      'configured': configured,
      'isOpen': isOpen,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationPeriodDtoImpl extends RegistrationPeriodDto {
  _RegistrationPeriodDtoImpl({
    _is.UuidValue? registrationPeriodId,
    required _is.UuidValue semesterId,
    required String semesterName,
    required int academicYear,
    required DateTime startTime,
    required DateTime endTime,
    required bool configured,
    required bool isOpen,
  }) : super._(
         registrationPeriodId: registrationPeriodId,
         semesterId: semesterId,
         semesterName: semesterName,
         academicYear: academicYear,
         startTime: startTime,
         endTime: endTime,
         configured: configured,
         isOpen: isOpen,
       );

  /// Returns a shallow copy of this [RegistrationPeriodDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RegistrationPeriodDto copyWith({
    Object? registrationPeriodId = _Undefined,
    _is.UuidValue? semesterId,
    String? semesterName,
    int? academicYear,
    DateTime? startTime,
    DateTime? endTime,
    bool? configured,
    bool? isOpen,
  }) {
    return RegistrationPeriodDto(
      registrationPeriodId: registrationPeriodId is _is.UuidValue?
          ? registrationPeriodId
          : this.registrationPeriodId,
      semesterId: semesterId ?? this.semesterId,
      semesterName: semesterName ?? this.semesterName,
      academicYear: academicYear ?? this.academicYear,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      configured: configured ?? this.configured,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}
