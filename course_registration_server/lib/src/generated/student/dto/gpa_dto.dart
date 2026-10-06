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

abstract class GpaDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  GpaDto._({
    this.semester,
    this.semesterGpa,
    required this.cumulativeGpa,
    required this.attemptedCredits,
    required this.earnedCredits,
  });

  factory GpaDto({
    String? semester,
    double? semesterGpa,
    required double cumulativeGpa,
    required int attemptedCredits,
    required int earnedCredits,
  }) = _GpaDtoImpl;

  factory GpaDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return GpaDto(
      semester: jsonSerialization['semester'] as String?,
      semesterGpa: (jsonSerialization['semesterGpa'] as num?)?.toDouble(),
      cumulativeGpa: (jsonSerialization['cumulativeGpa'] as num).toDouble(),
      attemptedCredits: jsonSerialization['attemptedCredits'] as int,
      earnedCredits: jsonSerialization['earnedCredits'] as int,
    );
  }

  String? semester;

  double? semesterGpa;

  double cumulativeGpa;

  int attemptedCredits;

  int earnedCredits;

  /// Returns a shallow copy of this [GpaDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  GpaDto copyWith({
    String? semester,
    double? semesterGpa,
    double? cumulativeGpa,
    int? attemptedCredits,
    int? earnedCredits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GpaDto',
      if (semester != null) 'semester': semester,
      if (semesterGpa != null) 'semesterGpa': semesterGpa,
      'cumulativeGpa': cumulativeGpa,
      'attemptedCredits': attemptedCredits,
      'earnedCredits': earnedCredits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GpaDto',
      if (semester != null) 'semester': semester,
      if (semesterGpa != null) 'semesterGpa': semesterGpa,
      'cumulativeGpa': cumulativeGpa,
      'attemptedCredits': attemptedCredits,
      'earnedCredits': earnedCredits,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GpaDtoImpl extends GpaDto {
  _GpaDtoImpl({
    String? semester,
    double? semesterGpa,
    required double cumulativeGpa,
    required int attemptedCredits,
    required int earnedCredits,
  }) : super._(
         semester: semester,
         semesterGpa: semesterGpa,
         cumulativeGpa: cumulativeGpa,
         attemptedCredits: attemptedCredits,
         earnedCredits: earnedCredits,
       );

  /// Returns a shallow copy of this [GpaDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  GpaDto copyWith({
    Object? semester = _Undefined,
    Object? semesterGpa = _Undefined,
    double? cumulativeGpa,
    int? attemptedCredits,
    int? earnedCredits,
  }) {
    return GpaDto(
      semester: semester is String? ? semester : this.semester,
      semesterGpa: semesterGpa is double? ? semesterGpa : this.semesterGpa,
      cumulativeGpa: cumulativeGpa ?? this.cumulativeGpa,
      attemptedCredits: attemptedCredits ?? this.attemptedCredits,
      earnedCredits: earnedCredits ?? this.earnedCredits,
    );
  }
}
