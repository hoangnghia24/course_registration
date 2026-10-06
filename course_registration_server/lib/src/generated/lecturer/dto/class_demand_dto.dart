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

abstract class ClassDemandDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  ClassDemandDto._({
    required this.courseId,
    required this.courseCode,
    required this.courseName,
    required this.requestCount,
    required this.recommendation,
  });

  factory ClassDemandDto({
    required _is.UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int requestCount,
    required String recommendation,
  }) = _ClassDemandDtoImpl;

  factory ClassDemandDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClassDemandDto(
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      requestCount: jsonSerialization['requestCount'] as int,
      recommendation: jsonSerialization['recommendation'] as String,
    );
  }

  _is.UuidValue courseId;

  String courseCode;

  String courseName;

  int requestCount;

  String recommendation;

  /// Returns a shallow copy of this [ClassDemandDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClassDemandDto copyWith({
    _is.UuidValue? courseId,
    String? courseCode,
    String? courseName,
    int? requestCount,
    String? recommendation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassDemandDto',
      'courseId': courseId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'requestCount': requestCount,
      'recommendation': recommendation,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassDemandDto',
      'courseId': courseId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'requestCount': requestCount,
      'recommendation': recommendation,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _ClassDemandDtoImpl extends ClassDemandDto {
  _ClassDemandDtoImpl({
    required _is.UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int requestCount,
    required String recommendation,
  }) : super._(
         courseId: courseId,
         courseCode: courseCode,
         courseName: courseName,
         requestCount: requestCount,
         recommendation: recommendation,
       );

  /// Returns a shallow copy of this [ClassDemandDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClassDemandDto copyWith({
    _is.UuidValue? courseId,
    String? courseCode,
    String? courseName,
    int? requestCount,
    String? recommendation,
  }) {
    return ClassDemandDto(
      courseId: courseId ?? this.courseId,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      requestCount: requestCount ?? this.requestCount,
      recommendation: recommendation ?? this.recommendation,
    );
  }
}
