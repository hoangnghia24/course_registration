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
import 'package:serverpod/serverpod.dart' as _is;
import '../../student/models/transcript_status.dart' as _ipjkcfjo;

abstract class TranscriptDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  TranscriptDto._({
    required this.transcriptId,
    required this.courseId,
    required this.courseCode,
    required this.courseName,
    required this.credits,
    required this.semester,
    required this.score,
    required this.letterGrade,
    required this.status,
    required this.attemptNumber,
  });

  factory TranscriptDto({
    required _is.UuidValue transcriptId,
    required _is.UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int credits,
    required String semester,
    required double score,
    required String letterGrade,
    required _ipjkcfjo.TranscriptStatus status,
    required int attemptNumber,
  }) = _TranscriptDtoImpl;

  factory TranscriptDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TranscriptDto(
      transcriptId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['transcriptId'],
      ),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      credits: jsonSerialization['credits'] as int,
      semester: jsonSerialization['semester'] as String,
      score: (jsonSerialization['score'] as num).toDouble(),
      letterGrade: jsonSerialization['letterGrade'] as String,
      status: _ipjkcfjo.TranscriptStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      attemptNumber: jsonSerialization['attemptNumber'] as int,
    );
  }

  _is.UuidValue transcriptId;

  _is.UuidValue courseId;

  String courseCode;

  String courseName;

  int credits;

  String semester;

  double score;

  String letterGrade;

  _ipjkcfjo.TranscriptStatus status;

  int attemptNumber;

  /// Returns a shallow copy of this [TranscriptDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  TranscriptDto copyWith({
    _is.UuidValue? transcriptId,
    _is.UuidValue? courseId,
    String? courseCode,
    String? courseName,
    int? credits,
    String? semester,
    double? score,
    String? letterGrade,
    _ipjkcfjo.TranscriptStatus? status,
    int? attemptNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TranscriptDto',
      'transcriptId': transcriptId.toJson(),
      'courseId': courseId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'semester': semester,
      'score': score,
      'letterGrade': letterGrade,
      'status': status.toJson(),
      'attemptNumber': attemptNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TranscriptDto',
      'transcriptId': transcriptId.toJson(),
      'courseId': courseId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'semester': semester,
      'score': score,
      'letterGrade': letterGrade,
      'status': status.toJson(),
      'attemptNumber': attemptNumber,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _TranscriptDtoImpl extends TranscriptDto {
  _TranscriptDtoImpl({
    required _is.UuidValue transcriptId,
    required _is.UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int credits,
    required String semester,
    required double score,
    required String letterGrade,
    required _ipjkcfjo.TranscriptStatus status,
    required int attemptNumber,
  }) : super._(
         transcriptId: transcriptId,
         courseId: courseId,
         courseCode: courseCode,
         courseName: courseName,
         credits: credits,
         semester: semester,
         score: score,
         letterGrade: letterGrade,
         status: status,
         attemptNumber: attemptNumber,
       );

  /// Returns a shallow copy of this [TranscriptDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  TranscriptDto copyWith({
    _is.UuidValue? transcriptId,
    _is.UuidValue? courseId,
    String? courseCode,
    String? courseName,
    int? credits,
    String? semester,
    double? score,
    String? letterGrade,
    _ipjkcfjo.TranscriptStatus? status,
    int? attemptNumber,
  }) {
    return TranscriptDto(
      transcriptId: transcriptId ?? this.transcriptId,
      courseId: courseId ?? this.courseId,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      credits: credits ?? this.credits,
      semester: semester ?? this.semester,
      score: score ?? this.score,
      letterGrade: letterGrade ?? this.letterGrade,
      status: status ?? this.status,
      attemptNumber: attemptNumber ?? this.attemptNumber,
    );
  }
}
