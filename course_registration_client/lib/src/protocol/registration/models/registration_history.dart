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
import '../../registration/models/registration_action.dart' as _icvdo4c9;
import '../../student.dart' as _io7vu6m1;

abstract class RegistrationHistory
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RegistrationHistory._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseClassId,
    this.courseClass,
    required this.action,
    DateTime? createdAt,
    this.deviceInfo,
  }) : createdAt = createdAt ?? DateTime.now();

  factory RegistrationHistory({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _icvdo4c9.RegistrationAction action,
    DateTime? createdAt,
    String? deviceInfo,
  }) = _RegistrationHistoryImpl;

  factory RegistrationHistory.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegistrationHistory(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      studentId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['studentId'],
      ),
      student: jsonSerialization['student'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_io7vu6m1.Student>(
              jsonSerialization['student'],
            ),
      courseClassId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      action: _icvdo4c9.RegistrationAction.fromJson(
        (jsonSerialization['action'] as String),
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue studentId;

  _io7vu6m1.Student? student;

  _isc.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  _icvdo4c9.RegistrationAction action;

  DateTime createdAt;

  String? deviceInfo;

  /// Returns a shallow copy of this [RegistrationHistory]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RegistrationHistory copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _isc.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    _icvdo4c9.RegistrationAction? action,
    DateTime? createdAt,
    String? deviceInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegistrationHistory',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'action': action.toJson(),
      'createdAt': createdAt.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegistrationHistory',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'action': action.toJson(),
      'createdAt': createdAt.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationHistoryImpl extends RegistrationHistory {
  _RegistrationHistoryImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _icvdo4c9.RegistrationAction action,
    DateTime? createdAt,
    String? deviceInfo,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseClassId: courseClassId,
         courseClass: courseClass,
         action: action,
         createdAt: createdAt,
         deviceInfo: deviceInfo,
       );

  /// Returns a shallow copy of this [RegistrationHistory]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RegistrationHistory copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? studentId,
    Object? student = _Undefined,
    _isc.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    _icvdo4c9.RegistrationAction? action,
    DateTime? createdAt,
    Object? deviceInfo = _Undefined,
  }) {
    return RegistrationHistory(
      id: id is _isc.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      action: action ?? this.action,
      createdAt: createdAt ?? this.createdAt,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
    );
  }
}
