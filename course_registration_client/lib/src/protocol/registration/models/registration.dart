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
import '../../registration/models/registration_status.dart' as _iqegjhnz;
import '../../student.dart' as _io7vu6m1;

abstract class Registration
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Registration._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseClassId,
    this.courseClass,
    DateTime? registeredAt,
    required this.status,
  }) : registeredAt = registeredAt ?? DateTime.now();

  factory Registration({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? registeredAt,
    required _iqegjhnz.RegistrationStatus status,
  }) = _RegistrationImpl;

  factory Registration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Registration(
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
      registeredAt: jsonSerialization['registeredAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['registeredAt'],
            ),
      status: _iqegjhnz.RegistrationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
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

  DateTime registeredAt;

  _iqegjhnz.RegistrationStatus status;

  /// Returns a shallow copy of this [Registration]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Registration copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _isc.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? registeredAt,
    _iqegjhnz.RegistrationStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Registration',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'registeredAt': registeredAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Registration',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'registeredAt': registeredAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationImpl extends Registration {
  _RegistrationImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? registeredAt,
    required _iqegjhnz.RegistrationStatus status,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseClassId: courseClassId,
         courseClass: courseClass,
         registeredAt: registeredAt,
         status: status,
       );

  /// Returns a shallow copy of this [Registration]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Registration copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? studentId,
    Object? student = _Undefined,
    _isc.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    DateTime? registeredAt,
    _iqegjhnz.RegistrationStatus? status,
  }) {
    return Registration(
      id: id is _isc.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      registeredAt: registeredAt ?? this.registeredAt,
      status: status ?? this.status,
    );
  }
}
