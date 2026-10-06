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

abstract class CoursePrerequisite
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CoursePrerequisite._({
    this.id,
    required this.courseId,
    required this.prerequisiteId,
  });

  factory CoursePrerequisite({
    _isc.UuidValue? id,
    required _isc.UuidValue courseId,
    required _isc.UuidValue prerequisiteId,
  }) = _CoursePrerequisiteImpl;

  factory CoursePrerequisite.fromJson(Map<String, dynamic> jsonSerialization) {
    return CoursePrerequisite(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      prerequisiteId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['prerequisiteId'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue courseId;

  _isc.UuidValue prerequisiteId;

  /// Returns a shallow copy of this [CoursePrerequisite]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CoursePrerequisite copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? courseId,
    _isc.UuidValue? prerequisiteId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CoursePrerequisite',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'prerequisiteId': prerequisiteId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CoursePrerequisite',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'prerequisiteId': prerequisiteId.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CoursePrerequisiteImpl extends CoursePrerequisite {
  _CoursePrerequisiteImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue courseId,
    required _isc.UuidValue prerequisiteId,
  }) : super._(
         id: id,
         courseId: courseId,
         prerequisiteId: prerequisiteId,
       );

  /// Returns a shallow copy of this [CoursePrerequisite]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CoursePrerequisite copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? courseId,
    _isc.UuidValue? prerequisiteId,
  }) {
    return CoursePrerequisite(
      id: id is _isc.UuidValue? ? id : this.id,
      courseId: courseId ?? this.courseId,
      prerequisiteId: prerequisiteId ?? this.prerequisiteId,
    );
  }
}
