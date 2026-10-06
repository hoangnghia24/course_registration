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
import '../../lecturer.dart' as _ismqsd72;
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class LecturerCourseClass
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  LecturerCourseClass._({
    this.id,
    required this.lecturerId,
    this.lecturer,
    required this.courseClassId,
    this.courseClass,
    DateTime? assignedAt,
  }) : assignedAt = assignedAt ?? DateTime.now();

  factory LecturerCourseClass({
    _isc.UuidValue? id,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? assignedAt,
  }) = _LecturerCourseClassImpl;

  factory LecturerCourseClass.fromJson(Map<String, dynamic> jsonSerialization) {
    return LecturerCourseClass(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      lecturerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      courseClassId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      assignedAt: jsonSerialization['assignedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['assignedAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  _isc.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  DateTime assignedAt;

  /// Returns a shallow copy of this [LecturerCourseClass]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  LecturerCourseClass copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    _isc.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? assignedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LecturerCourseClass',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'assignedAt': assignedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LecturerCourseClass',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'assignedAt': assignedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerCourseClassImpl extends LecturerCourseClass {
  _LecturerCourseClassImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? assignedAt,
  }) : super._(
         id: id,
         lecturerId: lecturerId,
         lecturer: lecturer,
         courseClassId: courseClassId,
         courseClass: courseClass,
         assignedAt: assignedAt,
       );

  /// Returns a shallow copy of this [LecturerCourseClass]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  LecturerCourseClass copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    _isc.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    DateTime? assignedAt,
  }) {
    return LecturerCourseClass(
      id: id is _isc.UuidValue? ? id : this.id,
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      assignedAt: assignedAt ?? this.assignedAt,
    );
  }
}
