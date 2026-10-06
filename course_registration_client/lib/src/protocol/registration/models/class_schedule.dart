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
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class ClassSchedule
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ClassSchedule._({
    this.id,
    required this.courseClassId,
    this.courseClass,
    required this.dayOfWeek,
    required this.startPeriod,
    required this.endPeriod,
    required this.room,
  });

  factory ClassSchedule({
    _isc.UuidValue? id,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
  }) = _ClassScheduleImpl;

  factory ClassSchedule.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClassSchedule(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseClassId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      dayOfWeek: jsonSerialization['dayOfWeek'] as int,
      startPeriod: jsonSerialization['startPeriod'] as int,
      endPeriod: jsonSerialization['endPeriod'] as int,
      room: jsonSerialization['room'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  int dayOfWeek;

  int startPeriod;

  int endPeriod;

  String room;

  /// Returns a shallow copy of this [ClassSchedule]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ClassSchedule copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassSchedule',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassSchedule',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClassScheduleImpl extends ClassSchedule {
  _ClassScheduleImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
  }) : super._(
         id: id,
         courseClassId: courseClassId,
         courseClass: courseClass,
         dayOfWeek: dayOfWeek,
         startPeriod: startPeriod,
         endPeriod: endPeriod,
         room: room,
       );

  /// Returns a shallow copy of this [ClassSchedule]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ClassSchedule copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
  }) {
    return ClassSchedule(
      id: id is _isc.UuidValue? ? id : this.id,
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      room: room ?? this.room,
    );
  }
}
