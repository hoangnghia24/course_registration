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
import '../../registration/models/registration_status.dart' as _iqegjhnz;

abstract class ClassStudentDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  ClassStudentDto._({
    required this.studentId,
    required this.studentCode,
    required this.fullName,
    required this.majorName,
    required this.email,
    required this.registrationStatus,
  });

  factory ClassStudentDto({
    required _is.UuidValue studentId,
    required String studentCode,
    required String fullName,
    required String majorName,
    required String email,
    required _iqegjhnz.RegistrationStatus registrationStatus,
  }) = _ClassStudentDtoImpl;

  factory ClassStudentDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClassStudentDto(
      studentId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['studentId'],
      ),
      studentCode: jsonSerialization['studentCode'] as String,
      fullName: jsonSerialization['fullName'] as String,
      majorName: jsonSerialization['majorName'] as String,
      email: jsonSerialization['email'] as String,
      registrationStatus: _iqegjhnz.RegistrationStatus.fromJson(
        (jsonSerialization['registrationStatus'] as String),
      ),
    );
  }

  _is.UuidValue studentId;

  String studentCode;

  String fullName;

  String majorName;

  String email;

  _iqegjhnz.RegistrationStatus registrationStatus;

  /// Returns a shallow copy of this [ClassStudentDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClassStudentDto copyWith({
    _is.UuidValue? studentId,
    String? studentCode,
    String? fullName,
    String? majorName,
    String? email,
    _iqegjhnz.RegistrationStatus? registrationStatus,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassStudentDto',
      'studentId': studentId.toJson(),
      'studentCode': studentCode,
      'fullName': fullName,
      'majorName': majorName,
      'email': email,
      'registrationStatus': registrationStatus.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassStudentDto',
      'studentId': studentId.toJson(),
      'studentCode': studentCode,
      'fullName': fullName,
      'majorName': majorName,
      'email': email,
      'registrationStatus': registrationStatus.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _ClassStudentDtoImpl extends ClassStudentDto {
  _ClassStudentDtoImpl({
    required _is.UuidValue studentId,
    required String studentCode,
    required String fullName,
    required String majorName,
    required String email,
    required _iqegjhnz.RegistrationStatus registrationStatus,
  }) : super._(
         studentId: studentId,
         studentCode: studentCode,
         fullName: fullName,
         majorName: majorName,
         email: email,
         registrationStatus: registrationStatus,
       );

  /// Returns a shallow copy of this [ClassStudentDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClassStudentDto copyWith({
    _is.UuidValue? studentId,
    String? studentCode,
    String? fullName,
    String? majorName,
    String? email,
    _iqegjhnz.RegistrationStatus? registrationStatus,
  }) {
    return ClassStudentDto(
      studentId: studentId ?? this.studentId,
      studentCode: studentCode ?? this.studentCode,
      fullName: fullName ?? this.fullName,
      majorName: majorName ?? this.majorName,
      email: email ?? this.email,
      registrationStatus: registrationStatus ?? this.registrationStatus,
    );
  }
}
