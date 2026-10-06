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
import '../../registration/models/course_class_status.dart' as _i5mo64p9;
import '../../registration/models/semester.dart' as _i975wtvt;
import '../../student/models/course.dart' as _ibp0tzhj;

abstract class CourseClass
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CourseClass._({
    this.id,
    required this.courseId,
    this.course,
    required this.lecturerId,
    this.lecturer,
    required this.semesterId,
    this.semester,
    required this.classCode,
    required this.capacity,
    int? registeredCount,
    required this.status,
  }) : registeredCount = registeredCount ?? 0;

  factory CourseClass({
    _isc.UuidValue? id,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _isc.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required String classCode,
    required int capacity,
    int? registeredCount,
    required _i5mo64p9.CourseClassStatus status,
  }) = _CourseClassImpl;

  factory CourseClass.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseClass(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      course: jsonSerialization['course'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ibp0tzhj.Course>(
              jsonSerialization['course'],
            ),
      lecturerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      semesterId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      semester: jsonSerialization['semester'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i975wtvt.Semester>(
              jsonSerialization['semester'],
            ),
      classCode: jsonSerialization['classCode'] as String,
      capacity: jsonSerialization['capacity'] as int,
      registeredCount: jsonSerialization['registeredCount'] as int?,
      status: _i5mo64p9.CourseClassStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue courseId;

  _ibp0tzhj.Course? course;

  _isc.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  _isc.UuidValue semesterId;

  _i975wtvt.Semester? semester;

  String classCode;

  int capacity;

  int registeredCount;

  _i5mo64p9.CourseClassStatus status;

  /// Returns a shallow copy of this [CourseClass]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CourseClass copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    _isc.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    _isc.UuidValue? semesterId,
    _i975wtvt.Semester? semester,
    String? classCode,
    int? capacity,
    int? registeredCount,
    _i5mo64p9.CourseClassStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseClass',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJson(),
      'classCode': classCode,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseClass',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJsonForProtocol(),
      'classCode': classCode,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseClassImpl extends CourseClass {
  _CourseClassImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _isc.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required String classCode,
    required int capacity,
    int? registeredCount,
    required _i5mo64p9.CourseClassStatus status,
  }) : super._(
         id: id,
         courseId: courseId,
         course: course,
         lecturerId: lecturerId,
         lecturer: lecturer,
         semesterId: semesterId,
         semester: semester,
         classCode: classCode,
         capacity: capacity,
         registeredCount: registeredCount,
         status: status,
       );

  /// Returns a shallow copy of this [CourseClass]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CourseClass copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? courseId,
    Object? course = _Undefined,
    _isc.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    _isc.UuidValue? semesterId,
    Object? semester = _Undefined,
    String? classCode,
    int? capacity,
    int? registeredCount,
    _i5mo64p9.CourseClassStatus? status,
  }) {
    return CourseClass(
      id: id is _isc.UuidValue? ? id : this.id,
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      semesterId: semesterId ?? this.semesterId,
      semester: semester is _i975wtvt.Semester?
          ? semester
          : this.semester?.copyWith(),
      classCode: classCode ?? this.classCode,
      capacity: capacity ?? this.capacity,
      registeredCount: registeredCount ?? this.registeredCount,
      status: status ?? this.status,
    );
  }
}
