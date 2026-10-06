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

abstract class LecturerProfileDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  LecturerProfileDto._({
    required this.lecturerId,
    required this.lecturerCode,
    required this.fullName,
    required this.email,
    this.phone,
    this.avatar,
    this.department,
    this.academicTitle,
    this.academicDegree,
    this.specialization,
    this.facultyName,
  });

  factory LecturerProfileDto({
    required _is.UuidValue lecturerId,
    required String lecturerCode,
    required String fullName,
    required String email,
    String? phone,
    String? avatar,
    String? department,
    String? academicTitle,
    String? academicDegree,
    String? specialization,
    String? facultyName,
  }) = _LecturerProfileDtoImpl;

  factory LecturerProfileDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return LecturerProfileDto(
      lecturerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturerCode: jsonSerialization['lecturerCode'] as String,
      fullName: jsonSerialization['fullName'] as String,
      email: jsonSerialization['email'] as String,
      phone: jsonSerialization['phone'] as String?,
      avatar: jsonSerialization['avatar'] as String?,
      department: jsonSerialization['department'] as String?,
      academicTitle: jsonSerialization['academicTitle'] as String?,
      academicDegree: jsonSerialization['academicDegree'] as String?,
      specialization: jsonSerialization['specialization'] as String?,
      facultyName: jsonSerialization['facultyName'] as String?,
    );
  }

  _is.UuidValue lecturerId;

  String lecturerCode;

  String fullName;

  String email;

  String? phone;

  String? avatar;

  String? department;

  String? academicTitle;

  String? academicDegree;

  String? specialization;

  String? facultyName;

  /// Returns a shallow copy of this [LecturerProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  LecturerProfileDto copyWith({
    _is.UuidValue? lecturerId,
    String? lecturerCode,
    String? fullName,
    String? email,
    String? phone,
    String? avatar,
    String? department,
    String? academicTitle,
    String? academicDegree,
    String? specialization,
    String? facultyName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LecturerProfileDto',
      'lecturerId': lecturerId.toJson(),
      'lecturerCode': lecturerCode,
      'fullName': fullName,
      'email': email,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      if (department != null) 'department': department,
      if (academicTitle != null) 'academicTitle': academicTitle,
      if (academicDegree != null) 'academicDegree': academicDegree,
      if (specialization != null) 'specialization': specialization,
      if (facultyName != null) 'facultyName': facultyName,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LecturerProfileDto',
      'lecturerId': lecturerId.toJson(),
      'lecturerCode': lecturerCode,
      'fullName': fullName,
      'email': email,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      if (department != null) 'department': department,
      if (academicTitle != null) 'academicTitle': academicTitle,
      if (academicDegree != null) 'academicDegree': academicDegree,
      if (specialization != null) 'specialization': specialization,
      if (facultyName != null) 'facultyName': facultyName,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerProfileDtoImpl extends LecturerProfileDto {
  _LecturerProfileDtoImpl({
    required _is.UuidValue lecturerId,
    required String lecturerCode,
    required String fullName,
    required String email,
    String? phone,
    String? avatar,
    String? department,
    String? academicTitle,
    String? academicDegree,
    String? specialization,
    String? facultyName,
  }) : super._(
         lecturerId: lecturerId,
         lecturerCode: lecturerCode,
         fullName: fullName,
         email: email,
         phone: phone,
         avatar: avatar,
         department: department,
         academicTitle: academicTitle,
         academicDegree: academicDegree,
         specialization: specialization,
         facultyName: facultyName,
       );

  /// Returns a shallow copy of this [LecturerProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  LecturerProfileDto copyWith({
    _is.UuidValue? lecturerId,
    String? lecturerCode,
    String? fullName,
    String? email,
    Object? phone = _Undefined,
    Object? avatar = _Undefined,
    Object? department = _Undefined,
    Object? academicTitle = _Undefined,
    Object? academicDegree = _Undefined,
    Object? specialization = _Undefined,
    Object? facultyName = _Undefined,
  }) {
    return LecturerProfileDto(
      lecturerId: lecturerId ?? this.lecturerId,
      lecturerCode: lecturerCode ?? this.lecturerCode,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone is String? ? phone : this.phone,
      avatar: avatar is String? ? avatar : this.avatar,
      department: department is String? ? department : this.department,
      academicTitle: academicTitle is String?
          ? academicTitle
          : this.academicTitle,
      academicDegree: academicDegree is String?
          ? academicDegree
          : this.academicDegree,
      specialization: specialization is String?
          ? specialization
          : this.specialization,
      facultyName: facultyName is String? ? facultyName : this.facultyName,
    );
  }
}
