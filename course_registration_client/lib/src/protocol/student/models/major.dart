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
import '../../student/models/faculty.dart' as _i97qkk0u;

abstract class Major
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Major._({
    this.id,
    required this.facultyId,
    this.faculty,
    required this.name,
    required this.code,
    this.description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Major({
    _isc.UuidValue? id,
    required _isc.UuidValue facultyId,
    _i97qkk0u.Faculty? faculty,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MajorImpl;

  factory Major.fromJson(Map<String, dynamic> jsonSerialization) {
    return Major(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      facultyId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['facultyId'],
      ),
      faculty: jsonSerialization['faculty'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i97qkk0u.Faculty>(
              jsonSerialization['faculty'],
            ),
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      description: jsonSerialization['description'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue facultyId;

  _i97qkk0u.Faculty? faculty;

  String name;

  String code;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Major]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Major copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? facultyId,
    _i97qkk0u.Faculty? faculty,
    String? name,
    String? code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Major',
      if (id != null) 'id': id?.toJson(),
      'facultyId': facultyId.toJson(),
      if (faculty != null) 'faculty': faculty?.toJson(),
      'name': name,
      'code': code,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Major',
      if (id != null) 'id': id?.toJson(),
      'facultyId': facultyId.toJson(),
      if (faculty != null) 'faculty': faculty?.toJsonForProtocol(),
      'name': name,
      'code': code,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MajorImpl extends Major {
  _MajorImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue facultyId,
    _i97qkk0u.Faculty? faculty,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         facultyId: facultyId,
         faculty: faculty,
         name: name,
         code: code,
         description: description,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Major]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Major copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? facultyId,
    Object? faculty = _Undefined,
    String? name,
    String? code,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Major(
      id: id is _isc.UuidValue? ? id : this.id,
      facultyId: facultyId ?? this.facultyId,
      faculty: faculty is _i97qkk0u.Faculty?
          ? faculty
          : this.faculty?.copyWith(),
      name: name ?? this.name,
      code: code ?? this.code,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
