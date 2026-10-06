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

abstract class CourseGpaDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CourseGpaDto._({
    required this.courseCode,
    required this.courseName,
    required this.averageGpa,
  });

  factory CourseGpaDto({
    required String courseCode,
    required String courseName,
    required double averageGpa,
  }) = _CourseGpaDtoImpl;

  factory CourseGpaDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseGpaDto(
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      averageGpa: (jsonSerialization['averageGpa'] as num).toDouble(),
    );
  }

  String courseCode;

  String courseName;

  double averageGpa;

  /// Returns a shallow copy of this [CourseGpaDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CourseGpaDto copyWith({
    String? courseCode,
    String? courseName,
    double? averageGpa,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseGpaDto',
      'courseCode': courseCode,
      'courseName': courseName,
      'averageGpa': averageGpa,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseGpaDto',
      'courseCode': courseCode,
      'courseName': courseName,
      'averageGpa': averageGpa,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _CourseGpaDtoImpl extends CourseGpaDto {
  _CourseGpaDtoImpl({
    required String courseCode,
    required String courseName,
    required double averageGpa,
  }) : super._(
         courseCode: courseCode,
         courseName: courseName,
         averageGpa: averageGpa,
       );

  /// Returns a shallow copy of this [CourseGpaDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CourseGpaDto copyWith({
    String? courseCode,
    String? courseName,
    double? averageGpa,
  }) {
    return CourseGpaDto(
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      averageGpa: averageGpa ?? this.averageGpa,
    );
  }
}
