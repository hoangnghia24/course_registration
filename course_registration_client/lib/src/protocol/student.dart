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
import 'app_user.dart' as _i2j2xfrn;
import 'student/models/major.dart' as _iqe9gc9z;
import 'student/models/training_program.dart' as _ige2gcz9;

abstract class Student
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Student._({
    this.id,
    required this.userId,
    this.user,
    required this.studentCode,
    this.majorId,
    this.major,
    this.trainingProgramId,
    this.trainingProgram,
    required this.academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) : enrollmentYear = enrollmentYear ?? 0,
       currentSemester = currentSemester ?? 1,
       gpa = gpa ?? 0.0,
       totalCredits = totalCredits ?? 0;

  factory Student({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String studentCode,
    _isc.UuidValue? majorId,
    _iqe9gc9z.Major? major,
    _isc.UuidValue? trainingProgramId,
    _ige2gcz9.TrainingProgram? trainingProgram,
    required int academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) = _StudentImpl;

  factory Student.fromJson(Map<String, dynamic> jsonSerialization) {
    return Student(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i2j2xfrn.AppUser>(
              jsonSerialization['user'],
            ),
      studentCode: jsonSerialization['studentCode'] as String,
      majorId: jsonSerialization['majorId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['majorId']),
      major: jsonSerialization['major'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_iqe9gc9z.Major>(
              jsonSerialization['major'],
            ),
      trainingProgramId: jsonSerialization['trainingProgramId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['trainingProgramId'],
            ),
      trainingProgram: jsonSerialization['trainingProgram'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ige2gcz9.TrainingProgram>(
              jsonSerialization['trainingProgram'],
            ),
      academicYear: jsonSerialization['academicYear'] as int,
      enrollmentYear: jsonSerialization['enrollmentYear'] as int?,
      currentSemester: jsonSerialization['currentSemester'] as int?,
      gpa: (jsonSerialization['gpa'] as num?)?.toDouble(),
      totalCredits: jsonSerialization['totalCredits'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue userId;

  _i2j2xfrn.AppUser? user;

  String studentCode;

  _isc.UuidValue? majorId;

  _iqe9gc9z.Major? major;

  _isc.UuidValue? trainingProgramId;

  _ige2gcz9.TrainingProgram? trainingProgram;

  int academicYear;

  int enrollmentYear;

  int currentSemester;

  double gpa;

  int totalCredits;

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Student copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? userId,
    _i2j2xfrn.AppUser? user,
    String? studentCode,
    _isc.UuidValue? majorId,
    _iqe9gc9z.Major? major,
    _isc.UuidValue? trainingProgramId,
    _ige2gcz9.TrainingProgram? trainingProgram,
    int? academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Student',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'studentCode': studentCode,
      if (majorId != null) 'majorId': majorId?.toJson(),
      if (major != null) 'major': major?.toJson(),
      if (trainingProgramId != null)
        'trainingProgramId': trainingProgramId?.toJson(),
      if (trainingProgram != null) 'trainingProgram': trainingProgram?.toJson(),
      'academicYear': academicYear,
      'enrollmentYear': enrollmentYear,
      'currentSemester': currentSemester,
      'gpa': gpa,
      'totalCredits': totalCredits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Student',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'studentCode': studentCode,
      if (majorId != null) 'majorId': majorId?.toJson(),
      if (major != null) 'major': major?.toJsonForProtocol(),
      if (trainingProgramId != null)
        'trainingProgramId': trainingProgramId?.toJson(),
      if (trainingProgram != null)
        'trainingProgram': trainingProgram?.toJsonForProtocol(),
      'academicYear': academicYear,
      'enrollmentYear': enrollmentYear,
      'currentSemester': currentSemester,
      'gpa': gpa,
      'totalCredits': totalCredits,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudentImpl extends Student {
  _StudentImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String studentCode,
    _isc.UuidValue? majorId,
    _iqe9gc9z.Major? major,
    _isc.UuidValue? trainingProgramId,
    _ige2gcz9.TrainingProgram? trainingProgram,
    required int academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         studentCode: studentCode,
         majorId: majorId,
         major: major,
         trainingProgramId: trainingProgramId,
         trainingProgram: trainingProgram,
         academicYear: academicYear,
         enrollmentYear: enrollmentYear,
         currentSemester: currentSemester,
         gpa: gpa,
         totalCredits: totalCredits,
       );

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Student copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? userId,
    Object? user = _Undefined,
    String? studentCode,
    Object? majorId = _Undefined,
    Object? major = _Undefined,
    Object? trainingProgramId = _Undefined,
    Object? trainingProgram = _Undefined,
    int? academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) {
    return Student(
      id: id is _isc.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2j2xfrn.AppUser? ? user : this.user?.copyWith(),
      studentCode: studentCode ?? this.studentCode,
      majorId: majorId is _isc.UuidValue? ? majorId : this.majorId,
      major: major is _iqe9gc9z.Major? ? major : this.major?.copyWith(),
      trainingProgramId: trainingProgramId is _isc.UuidValue?
          ? trainingProgramId
          : this.trainingProgramId,
      trainingProgram: trainingProgram is _ige2gcz9.TrainingProgram?
          ? trainingProgram
          : this.trainingProgram?.copyWith(),
      academicYear: academicYear ?? this.academicYear,
      enrollmentYear: enrollmentYear ?? this.enrollmentYear,
      currentSemester: currentSemester ?? this.currentSemester,
      gpa: gpa ?? this.gpa,
      totalCredits: totalCredits ?? this.totalCredits,
    );
  }
}
