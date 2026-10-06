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
import '../../student/models/course_progress_status.dart' as _idmb4s8d;
import '../../student/models/course_type.dart' as _is8najfw;

abstract class TrainingProgramCourseDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  TrainingProgramCourseDto._({
    required this.courseId,
    required this.courseCode,
    required this.courseName,
    required this.credits,
    required this.semesterNumber,
    required this.isRequired,
    required this.courseType,
    required this.progressStatus,
  });

  factory TrainingProgramCourseDto({
    required _isc.UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int credits,
    required int semesterNumber,
    required bool isRequired,
    required _is8najfw.CourseType courseType,
    required _idmb4s8d.CourseProgressStatus progressStatus,
  }) = _TrainingProgramCourseDtoImpl;

  factory TrainingProgramCourseDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TrainingProgramCourseDto(
      courseId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      credits: jsonSerialization['credits'] as int,
      semesterNumber: jsonSerialization['semesterNumber'] as int,
      isRequired: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isRequired'],
      ),
      courseType: _is8najfw.CourseType.fromJson(
        (jsonSerialization['courseType'] as String),
      ),
      progressStatus: _idmb4s8d.CourseProgressStatus.fromJson(
        (jsonSerialization['progressStatus'] as String),
      ),
    );
  }

  _isc.UuidValue courseId;

  String courseCode;

  String courseName;

  int credits;

  int semesterNumber;

  bool isRequired;

  _is8najfw.CourseType courseType;

  _idmb4s8d.CourseProgressStatus progressStatus;

  /// Returns a shallow copy of this [TrainingProgramCourseDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  TrainingProgramCourseDto copyWith({
    _isc.UuidValue? courseId,
    String? courseCode,
    String? courseName,
    int? credits,
    int? semesterNumber,
    bool? isRequired,
    _is8najfw.CourseType? courseType,
    _idmb4s8d.CourseProgressStatus? progressStatus,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrainingProgramCourseDto',
      'courseId': courseId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'semesterNumber': semesterNumber,
      'isRequired': isRequired,
      'courseType': courseType.toJson(),
      'progressStatus': progressStatus.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TrainingProgramCourseDto',
      'courseId': courseId.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      'semesterNumber': semesterNumber,
      'isRequired': isRequired,
      'courseType': courseType.toJson(),
      'progressStatus': progressStatus.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _TrainingProgramCourseDtoImpl extends TrainingProgramCourseDto {
  _TrainingProgramCourseDtoImpl({
    required _isc.UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int credits,
    required int semesterNumber,
    required bool isRequired,
    required _is8najfw.CourseType courseType,
    required _idmb4s8d.CourseProgressStatus progressStatus,
  }) : super._(
         courseId: courseId,
         courseCode: courseCode,
         courseName: courseName,
         credits: credits,
         semesterNumber: semesterNumber,
         isRequired: isRequired,
         courseType: courseType,
         progressStatus: progressStatus,
       );

  /// Returns a shallow copy of this [TrainingProgramCourseDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  TrainingProgramCourseDto copyWith({
    _isc.UuidValue? courseId,
    String? courseCode,
    String? courseName,
    int? credits,
    int? semesterNumber,
    bool? isRequired,
    _is8najfw.CourseType? courseType,
    _idmb4s8d.CourseProgressStatus? progressStatus,
  }) {
    return TrainingProgramCourseDto(
      courseId: courseId ?? this.courseId,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      credits: credits ?? this.credits,
      semesterNumber: semesterNumber ?? this.semesterNumber,
      isRequired: isRequired ?? this.isRequired,
      courseType: courseType ?? this.courseType,
      progressStatus: progressStatus ?? this.progressStatus,
    );
  }
}
