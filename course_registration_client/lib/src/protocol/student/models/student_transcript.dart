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
import '../../student.dart' as _io7vu6m1;
import '../../student/models/course.dart' as _ibp0tzhj;
import '../../student/models/transcript_status.dart' as _ipjkcfjo;

abstract class StudentTranscript
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  StudentTranscript._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseId,
    this.course,
    required this.semester,
    this.midtermScore,
    this.finalScore,
    required this.score,
    required this.letterGrade,
    required this.status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : attemptNumber = attemptNumber ?? 1,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory StudentTranscript({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String semester,
    double? midtermScore,
    double? finalScore,
    required double score,
    required String letterGrade,
    required _ipjkcfjo.TranscriptStatus status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _StudentTranscriptImpl;

  factory StudentTranscript.fromJson(Map<String, dynamic> jsonSerialization) {
    return StudentTranscript(
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
      semester: jsonSerialization['semester'] as String,
      midtermScore: (jsonSerialization['midtermScore'] as num?)?.toDouble(),
      finalScore: (jsonSerialization['finalScore'] as num?)?.toDouble(),
      score: (jsonSerialization['score'] as num).toDouble(),
      letterGrade: jsonSerialization['letterGrade'] as String,
      status: _ipjkcfjo.TranscriptStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      attemptNumber: jsonSerialization['attemptNumber'] as int?,
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

  _isc.UuidValue studentId;

  _io7vu6m1.Student? student;

  _isc.UuidValue courseId;

  _ibp0tzhj.Course? course;

  String semester;

  double? midtermScore;

  double? finalScore;

  double score;

  String letterGrade;

  _ipjkcfjo.TranscriptStatus status;

  int attemptNumber;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StudentTranscript]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  StudentTranscript copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _isc.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    String? semester,
    double? midtermScore,
    double? finalScore,
    double? score,
    String? letterGrade,
    _ipjkcfjo.TranscriptStatus? status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StudentTranscript',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'semester': semester,
      if (midtermScore != null) 'midtermScore': midtermScore,
      if (finalScore != null) 'finalScore': finalScore,
      'score': score,
      'letterGrade': letterGrade,
      'status': status.toJson(),
      'attemptNumber': attemptNumber,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StudentTranscript',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'semester': semester,
      if (midtermScore != null) 'midtermScore': midtermScore,
      if (finalScore != null) 'finalScore': finalScore,
      'score': score,
      'letterGrade': letterGrade,
      'status': status.toJson(),
      'attemptNumber': attemptNumber,
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

class _StudentTranscriptImpl extends StudentTranscript {
  _StudentTranscriptImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String semester,
    double? midtermScore,
    double? finalScore,
    required double score,
    required String letterGrade,
    required _ipjkcfjo.TranscriptStatus status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseId: courseId,
         course: course,
         semester: semester,
         midtermScore: midtermScore,
         finalScore: finalScore,
         score: score,
         letterGrade: letterGrade,
         status: status,
         attemptNumber: attemptNumber,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StudentTranscript]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  StudentTranscript copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? studentId,
    Object? student = _Undefined,
    _isc.UuidValue? courseId,
    Object? course = _Undefined,
    String? semester,
    Object? midtermScore = _Undefined,
    Object? finalScore = _Undefined,
    double? score,
    String? letterGrade,
    _ipjkcfjo.TranscriptStatus? status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StudentTranscript(
      id: id is _isc.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      semester: semester ?? this.semester,
      midtermScore: midtermScore is double? ? midtermScore : this.midtermScore,
      finalScore: finalScore is double? ? finalScore : this.finalScore,
      score: score ?? this.score,
      letterGrade: letterGrade ?? this.letterGrade,
      status: status ?? this.status,
      attemptNumber: attemptNumber ?? this.attemptNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
