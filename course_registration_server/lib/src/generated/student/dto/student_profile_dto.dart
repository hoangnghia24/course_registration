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

abstract class StudentProfileDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  StudentProfileDto._({
    required this.studentId,
    required this.fullName,
    required this.email,
    this.phone,
    this.avatar,
    required this.studentCode,
    required this.majorName,
    required this.facultyName,
    required this.trainingProgramName,
    required this.academicYear,
    required this.enrollmentYear,
    required this.currentSemester,
    required this.gpa,
    required this.totalCredits,
    required this.programTotalCredits,
  });

  factory StudentProfileDto({
    required _is.UuidValue studentId,
    required String fullName,
    required String email,
    String? phone,
    String? avatar,
    required String studentCode,
    required String majorName,
    required String facultyName,
    required String trainingProgramName,
    required int academicYear,
    required int enrollmentYear,
    required int currentSemester,
    required double gpa,
    required int totalCredits,
    required int programTotalCredits,
  }) = _StudentProfileDtoImpl;

  factory StudentProfileDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return StudentProfileDto(
      studentId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['studentId'],
      ),
      fullName: jsonSerialization['fullName'] as String,
      email: jsonSerialization['email'] as String,
      phone: jsonSerialization['phone'] as String?,
      avatar: jsonSerialization['avatar'] as String?,
      studentCode: jsonSerialization['studentCode'] as String,
      majorName: jsonSerialization['majorName'] as String,
      facultyName: jsonSerialization['facultyName'] as String,
      trainingProgramName: jsonSerialization['trainingProgramName'] as String,
      academicYear: jsonSerialization['academicYear'] as int,
      enrollmentYear: jsonSerialization['enrollmentYear'] as int,
      currentSemester: jsonSerialization['currentSemester'] as int,
      gpa: (jsonSerialization['gpa'] as num).toDouble(),
      totalCredits: jsonSerialization['totalCredits'] as int,
      programTotalCredits: jsonSerialization['programTotalCredits'] as int,
    );
  }

  _is.UuidValue studentId;

  String fullName;

  String email;

  String? phone;

  String? avatar;

  String studentCode;

  String majorName;

  String facultyName;

  String trainingProgramName;

  int academicYear;

  int enrollmentYear;

  int currentSemester;

  double gpa;

  int totalCredits;

  int programTotalCredits;

  /// Returns a shallow copy of this [StudentProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  StudentProfileDto copyWith({
    _is.UuidValue? studentId,
    String? fullName,
    String? email,
    String? phone,
    String? avatar,
    String? studentCode,
    String? majorName,
    String? facultyName,
    String? trainingProgramName,
    int? academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
    int? programTotalCredits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StudentProfileDto',
      'studentId': studentId.toJson(),
      'fullName': fullName,
      'email': email,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      'studentCode': studentCode,
      'majorName': majorName,
      'facultyName': facultyName,
      'trainingProgramName': trainingProgramName,
      'academicYear': academicYear,
      'enrollmentYear': enrollmentYear,
      'currentSemester': currentSemester,
      'gpa': gpa,
      'totalCredits': totalCredits,
      'programTotalCredits': programTotalCredits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StudentProfileDto',
      'studentId': studentId.toJson(),
      'fullName': fullName,
      'email': email,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      'studentCode': studentCode,
      'majorName': majorName,
      'facultyName': facultyName,
      'trainingProgramName': trainingProgramName,
      'academicYear': academicYear,
      'enrollmentYear': enrollmentYear,
      'currentSemester': currentSemester,
      'gpa': gpa,
      'totalCredits': totalCredits,
      'programTotalCredits': programTotalCredits,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudentProfileDtoImpl extends StudentProfileDto {
  _StudentProfileDtoImpl({
    required _is.UuidValue studentId,
    required String fullName,
    required String email,
    String? phone,
    String? avatar,
    required String studentCode,
    required String majorName,
    required String facultyName,
    required String trainingProgramName,
    required int academicYear,
    required int enrollmentYear,
    required int currentSemester,
    required double gpa,
    required int totalCredits,
    required int programTotalCredits,
  }) : super._(
         studentId: studentId,
         fullName: fullName,
         email: email,
         phone: phone,
         avatar: avatar,
         studentCode: studentCode,
         majorName: majorName,
         facultyName: facultyName,
         trainingProgramName: trainingProgramName,
         academicYear: academicYear,
         enrollmentYear: enrollmentYear,
         currentSemester: currentSemester,
         gpa: gpa,
         totalCredits: totalCredits,
         programTotalCredits: programTotalCredits,
       );

  /// Returns a shallow copy of this [StudentProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  StudentProfileDto copyWith({
    _is.UuidValue? studentId,
    String? fullName,
    String? email,
    Object? phone = _Undefined,
    Object? avatar = _Undefined,
    String? studentCode,
    String? majorName,
    String? facultyName,
    String? trainingProgramName,
    int? academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
    int? programTotalCredits,
  }) {
    return StudentProfileDto(
      studentId: studentId ?? this.studentId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone is String? ? phone : this.phone,
      avatar: avatar is String? ? avatar : this.avatar,
      studentCode: studentCode ?? this.studentCode,
      majorName: majorName ?? this.majorName,
      facultyName: facultyName ?? this.facultyName,
      trainingProgramName: trainingProgramName ?? this.trainingProgramName,
      academicYear: academicYear ?? this.academicYear,
      enrollmentYear: enrollmentYear ?? this.enrollmentYear,
      currentSemester: currentSemester ?? this.currentSemester,
      gpa: gpa ?? this.gpa,
      totalCredits: totalCredits ?? this.totalCredits,
      programTotalCredits: programTotalCredits ?? this.programTotalCredits,
    );
  }
}
