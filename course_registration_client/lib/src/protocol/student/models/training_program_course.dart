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
import '../../student/models/course.dart' as _ibp0tzhj;
import '../../student/models/training_program.dart' as _i1ofsz02;

abstract class TrainingProgramCourse
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  TrainingProgramCourse._({
    this.id,
    required this.trainingProgramId,
    this.trainingProgram,
    required this.courseId,
    this.course,
    required this.semesterNumber,
    required this.isRequired,
  });

  factory TrainingProgramCourse({
    _isc.UuidValue? id,
    required _isc.UuidValue trainingProgramId,
    _i1ofsz02.TrainingProgram? trainingProgram,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required int semesterNumber,
    required bool isRequired,
  }) = _TrainingProgramCourseImpl;

  factory TrainingProgramCourse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TrainingProgramCourse(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      trainingProgramId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['trainingProgramId'],
      ),
      trainingProgram: jsonSerialization['trainingProgram'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i1ofsz02.TrainingProgram>(
              jsonSerialization['trainingProgram'],
            ),
      courseId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      course: jsonSerialization['course'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ibp0tzhj.Course>(
              jsonSerialization['course'],
            ),
      semesterNumber: jsonSerialization['semesterNumber'] as int,
      isRequired: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isRequired'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue trainingProgramId;

  _i1ofsz02.TrainingProgram? trainingProgram;

  _isc.UuidValue courseId;

  _ibp0tzhj.Course? course;

  int semesterNumber;

  bool isRequired;

  /// Returns a shallow copy of this [TrainingProgramCourse]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  TrainingProgramCourse copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? trainingProgramId,
    _i1ofsz02.TrainingProgram? trainingProgram,
    _isc.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    int? semesterNumber,
    bool? isRequired,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrainingProgramCourse',
      if (id != null) 'id': id?.toJson(),
      'trainingProgramId': trainingProgramId.toJson(),
      if (trainingProgram != null) 'trainingProgram': trainingProgram?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'semesterNumber': semesterNumber,
      'isRequired': isRequired,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TrainingProgramCourse',
      if (id != null) 'id': id?.toJson(),
      'trainingProgramId': trainingProgramId.toJson(),
      if (trainingProgram != null)
        'trainingProgram': trainingProgram?.toJsonForProtocol(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'semesterNumber': semesterNumber,
      'isRequired': isRequired,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrainingProgramCourseImpl extends TrainingProgramCourse {
  _TrainingProgramCourseImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue trainingProgramId,
    _i1ofsz02.TrainingProgram? trainingProgram,
    required _isc.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required int semesterNumber,
    required bool isRequired,
  }) : super._(
         id: id,
         trainingProgramId: trainingProgramId,
         trainingProgram: trainingProgram,
         courseId: courseId,
         course: course,
         semesterNumber: semesterNumber,
         isRequired: isRequired,
       );

  /// Returns a shallow copy of this [TrainingProgramCourse]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  TrainingProgramCourse copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? trainingProgramId,
    Object? trainingProgram = _Undefined,
    _isc.UuidValue? courseId,
    Object? course = _Undefined,
    int? semesterNumber,
    bool? isRequired,
  }) {
    return TrainingProgramCourse(
      id: id is _isc.UuidValue? ? id : this.id,
      trainingProgramId: trainingProgramId ?? this.trainingProgramId,
      trainingProgram: trainingProgram is _i1ofsz02.TrainingProgram?
          ? trainingProgram
          : this.trainingProgram?.copyWith(),
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      semesterNumber: semesterNumber ?? this.semesterNumber,
      isRequired: isRequired ?? this.isRequired,
    );
  }
}
