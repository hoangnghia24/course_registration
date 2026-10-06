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

abstract class CourseEquivalent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CourseEquivalent._({
    this.id,
    required this.courseId,
    required this.equivalentId,
  });

  factory CourseEquivalent({
    _isc.UuidValue? id,
    required _isc.UuidValue courseId,
    required _isc.UuidValue equivalentId,
  }) = _CourseEquivalentImpl;

  factory CourseEquivalent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseEquivalent(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      equivalentId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['equivalentId'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue courseId;

  _isc.UuidValue equivalentId;

  /// Returns a shallow copy of this [CourseEquivalent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CourseEquivalent copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? courseId,
    _isc.UuidValue? equivalentId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseEquivalent',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'equivalentId': equivalentId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseEquivalent',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'equivalentId': equivalentId.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseEquivalentImpl extends CourseEquivalent {
  _CourseEquivalentImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue courseId,
    required _isc.UuidValue equivalentId,
  }) : super._(
         id: id,
         courseId: courseId,
         equivalentId: equivalentId,
       );

  /// Returns a shallow copy of this [CourseEquivalent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CourseEquivalent copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? courseId,
    _isc.UuidValue? equivalentId,
  }) {
    return CourseEquivalent(
      id: id is _isc.UuidValue? ? id : this.id,
      courseId: courseId ?? this.courseId,
      equivalentId: equivalentId ?? this.equivalentId,
    );
  }
}
