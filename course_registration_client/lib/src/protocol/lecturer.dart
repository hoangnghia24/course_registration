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
import 'app_user.dart' as _i2j2xfrn;

abstract class Lecturer
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Lecturer._({
    this.id,
    required this.userId,
    this.user,
    required this.lecturerCode,
    this.facultyId,
    this.academicDegree,
    this.department,
    this.academicTitle,
    this.specialization,
  });

  factory Lecturer({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String lecturerCode,
    _isc.UuidValue? facultyId,
    String? academicDegree,
    String? department,
    String? academicTitle,
    String? specialization,
  }) = _LecturerImpl;

  factory Lecturer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Lecturer(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i2j2xfrn.AppUser>(
              jsonSerialization['user'],
            ),
      lecturerCode: jsonSerialization['lecturerCode'] as String,
      facultyId: jsonSerialization['facultyId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['facultyId'],
            ),
      academicDegree: jsonSerialization['academicDegree'] as String?,
      department: jsonSerialization['department'] as String?,
      academicTitle: jsonSerialization['academicTitle'] as String?,
      specialization: jsonSerialization['specialization'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue userId;

  _i2j2xfrn.AppUser? user;

  String lecturerCode;

  _isc.UuidValue? facultyId;

  String? academicDegree;

  String? department;

  String? academicTitle;

  String? specialization;

  /// Returns a shallow copy of this [Lecturer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Lecturer copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? userId,
    _i2j2xfrn.AppUser? user,
    String? lecturerCode,
    _isc.UuidValue? facultyId,
    String? academicDegree,
    String? department,
    String? academicTitle,
    String? specialization,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Lecturer',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'lecturerCode': lecturerCode,
      if (facultyId != null) 'facultyId': facultyId?.toJson(),
      if (academicDegree != null) 'academicDegree': academicDegree,
      if (department != null) 'department': department,
      if (academicTitle != null) 'academicTitle': academicTitle,
      if (specialization != null) 'specialization': specialization,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Lecturer',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'lecturerCode': lecturerCode,
      if (facultyId != null) 'facultyId': facultyId?.toJson(),
      if (academicDegree != null) 'academicDegree': academicDegree,
      if (department != null) 'department': department,
      if (academicTitle != null) 'academicTitle': academicTitle,
      if (specialization != null) 'specialization': specialization,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerImpl extends Lecturer {
  _LecturerImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String lecturerCode,
    _isc.UuidValue? facultyId,
    String? academicDegree,
    String? department,
    String? academicTitle,
    String? specialization,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         lecturerCode: lecturerCode,
         facultyId: facultyId,
         academicDegree: academicDegree,
         department: department,
         academicTitle: academicTitle,
         specialization: specialization,
       );

  /// Returns a shallow copy of this [Lecturer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Lecturer copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? userId,
    Object? user = _Undefined,
    String? lecturerCode,
    Object? facultyId = _Undefined,
    Object? academicDegree = _Undefined,
    Object? department = _Undefined,
    Object? academicTitle = _Undefined,
    Object? specialization = _Undefined,
  }) {
    return Lecturer(
      id: id is _isc.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2j2xfrn.AppUser? ? user : this.user?.copyWith(),
      lecturerCode: lecturerCode ?? this.lecturerCode,
      facultyId: facultyId is _isc.UuidValue? ? facultyId : this.facultyId,
      academicDegree: academicDegree is String?
          ? academicDegree
          : this.academicDegree,
      department: department is String? ? department : this.department,
      academicTitle: academicTitle is String?
          ? academicTitle
          : this.academicTitle,
      specialization: specialization is String?
          ? specialization
          : this.specialization,
    );
  }
}
