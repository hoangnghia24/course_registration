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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class Faculty
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Faculty._({
    this.id,
    required this.name,
    required this.code,
    this.description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Faculty({
    _isc.UuidValue? id,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FacultyImpl;

  factory Faculty.fromJson(Map<String, dynamic> jsonSerialization) {
    return Faculty(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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

  String name;

  String code;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Faculty]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Faculty copyWith({
    _isc.UuidValue? id,
    String? name,
    String? code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Faculty',
      if (id != null) 'id': id?.toJson(),
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
      '__className__': 'Faculty',
      if (id != null) 'id': id?.toJson(),
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

class _FacultyImpl extends Faculty {
  _FacultyImpl({
    _isc.UuidValue? id,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         code: code,
         description: description,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Faculty]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Faculty copyWith({
    Object? id = _Undefined,
    String? name,
    String? code,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Faculty(
      id: id is _isc.UuidValue? ? id : this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
