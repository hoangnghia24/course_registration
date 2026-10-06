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
import '../../registration/models/opening_request_status.dart' as _ioohnrmm;
import '../../student.dart' as _io7vu6m1;
import '../../student/models/course.dart' as _ibp0tzhj;

abstract class CourseOpeningRequest
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CourseOpeningRequest._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseId,
    this.course,
    required this.reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) : createdAt = createdAt ?? DateTime.now(),
       status = status ?? _ioohnrmm.OpeningRequestStatus.pending;

  factory CourseOpeningRequest({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) = _CourseOpeningRequestImpl;

  factory CourseOpeningRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseOpeningRequest(
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
      courseId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      course: jsonSerialization['course'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ibp0tzhj.Course>(
              jsonSerialization['course'],
            ),
      reason: jsonSerialization['reason'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      status: jsonSerialization['status'] == null
          ? null
          : _ioohnrmm.OpeningRequestStatus.fromJson(
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

  _isc.UuidValue courseId;

  _ibp0tzhj.Course? course;

  String reason;

  DateTime createdAt;

  _ioohnrmm.OpeningRequestStatus status;

  /// Returns a shallow copy of this [CourseOpeningRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CourseOpeningRequest copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _isc.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    String? reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseOpeningRequest',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'reason': reason,
      'createdAt': createdAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseOpeningRequest',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'reason': reason,
      'createdAt': createdAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseOpeningRequestImpl extends CourseOpeningRequest {
  _CourseOpeningRequestImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseId: courseId,
         course: course,
         reason: reason,
         createdAt: createdAt,
         status: status,
       );

  /// Returns a shallow copy of this [CourseOpeningRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CourseOpeningRequest copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? studentId,
    Object? student = _Undefined,
    _isc.UuidValue? courseId,
    Object? course = _Undefined,
    String? reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) {
    return CourseOpeningRequest(
      id: id is _isc.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }
}
