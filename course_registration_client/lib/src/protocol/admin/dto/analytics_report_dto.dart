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
import '../../admin/dto/course_gpa_dto.dart' as _iko92chp;
import '../../admin/dto/named_count_dto.dart' as _ir3li6gj;
import '../../lecturer/dto/class_demand_dto.dart' as _ialr1zk7;

abstract class AnalyticsReportDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AnalyticsReportDto._({
    required this.totalStudents,
    required this.totalLecturers,
    required this.totalCourses,
    required this.openClasses,
    required this.fullClasses,
    required this.closedClasses,
    required this.studentsByFaculty,
    required this.studentsByMajor,
    required this.courseDemand,
    required this.failedCourses,
    required this.courseGpas,
  });

  factory AnalyticsReportDto({
    required int totalStudents,
    required int totalLecturers,
    required int totalCourses,
    required int openClasses,
    required int fullClasses,
    required int closedClasses,
    required List<_ir3li6gj.NamedCountDto> studentsByFaculty,
    required List<_ir3li6gj.NamedCountDto> studentsByMajor,
    required List<_ialr1zk7.ClassDemandDto> courseDemand,
    required List<_ir3li6gj.NamedCountDto> failedCourses,
    required List<_iko92chp.CourseGpaDto> courseGpas,
  }) = _AnalyticsReportDtoImpl;

  factory AnalyticsReportDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return AnalyticsReportDto(
      totalStudents: jsonSerialization['totalStudents'] as int,
      totalLecturers: jsonSerialization['totalLecturers'] as int,
      totalCourses: jsonSerialization['totalCourses'] as int,
      openClasses: jsonSerialization['openClasses'] as int,
      fullClasses: jsonSerialization['fullClasses'] as int,
      closedClasses: jsonSerialization['closedClasses'] as int,
      studentsByFaculty: _iyxbdoua.Protocol()
          .deserialize<List<_ir3li6gj.NamedCountDto>>(
            jsonSerialization['studentsByFaculty'],
          ),
      studentsByMajor: _iyxbdoua.Protocol()
          .deserialize<List<_ir3li6gj.NamedCountDto>>(
            jsonSerialization['studentsByMajor'],
          ),
      courseDemand: _iyxbdoua.Protocol()
          .deserialize<List<_ialr1zk7.ClassDemandDto>>(
            jsonSerialization['courseDemand'],
          ),
      failedCourses: _iyxbdoua.Protocol()
          .deserialize<List<_ir3li6gj.NamedCountDto>>(
            jsonSerialization['failedCourses'],
          ),
      courseGpas: _iyxbdoua.Protocol()
          .deserialize<List<_iko92chp.CourseGpaDto>>(
            jsonSerialization['courseGpas'],
          ),
    );
  }

  int totalStudents;

  int totalLecturers;

  int totalCourses;

  int openClasses;

  int fullClasses;

  int closedClasses;

  List<_ir3li6gj.NamedCountDto> studentsByFaculty;

  List<_ir3li6gj.NamedCountDto> studentsByMajor;

  List<_ialr1zk7.ClassDemandDto> courseDemand;

  List<_ir3li6gj.NamedCountDto> failedCourses;

  List<_iko92chp.CourseGpaDto> courseGpas;

  /// Returns a shallow copy of this [AnalyticsReportDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AnalyticsReportDto copyWith({
    int? totalStudents,
    int? totalLecturers,
    int? totalCourses,
    int? openClasses,
    int? fullClasses,
    int? closedClasses,
    List<_ir3li6gj.NamedCountDto>? studentsByFaculty,
    List<_ir3li6gj.NamedCountDto>? studentsByMajor,
    List<_ialr1zk7.ClassDemandDto>? courseDemand,
    List<_ir3li6gj.NamedCountDto>? failedCourses,
    List<_iko92chp.CourseGpaDto>? courseGpas,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AnalyticsReportDto',
      'totalStudents': totalStudents,
      'totalLecturers': totalLecturers,
      'totalCourses': totalCourses,
      'openClasses': openClasses,
      'fullClasses': fullClasses,
      'closedClasses': closedClasses,
      'studentsByFaculty': studentsByFaculty.toJson(
        valueToJson: (v) => v.toJson(),
      ),
      'studentsByMajor': studentsByMajor.toJson(valueToJson: (v) => v.toJson()),
      'courseDemand': courseDemand.toJson(valueToJson: (v) => v.toJson()),
      'failedCourses': failedCourses.toJson(valueToJson: (v) => v.toJson()),
      'courseGpas': courseGpas.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AnalyticsReportDto',
      'totalStudents': totalStudents,
      'totalLecturers': totalLecturers,
      'totalCourses': totalCourses,
      'openClasses': openClasses,
      'fullClasses': fullClasses,
      'closedClasses': closedClasses,
      'studentsByFaculty': studentsByFaculty.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'studentsByMajor': studentsByMajor.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'courseDemand': courseDemand.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'failedCourses': failedCourses.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'courseGpas': courseGpas.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _AnalyticsReportDtoImpl extends AnalyticsReportDto {
  _AnalyticsReportDtoImpl({
    required int totalStudents,
    required int totalLecturers,
    required int totalCourses,
    required int openClasses,
    required int fullClasses,
    required int closedClasses,
    required List<_ir3li6gj.NamedCountDto> studentsByFaculty,
    required List<_ir3li6gj.NamedCountDto> studentsByMajor,
    required List<_ialr1zk7.ClassDemandDto> courseDemand,
    required List<_ir3li6gj.NamedCountDto> failedCourses,
    required List<_iko92chp.CourseGpaDto> courseGpas,
  }) : super._(
         totalStudents: totalStudents,
         totalLecturers: totalLecturers,
         totalCourses: totalCourses,
         openClasses: openClasses,
         fullClasses: fullClasses,
         closedClasses: closedClasses,
         studentsByFaculty: studentsByFaculty,
         studentsByMajor: studentsByMajor,
         courseDemand: courseDemand,
         failedCourses: failedCourses,
         courseGpas: courseGpas,
       );

  /// Returns a shallow copy of this [AnalyticsReportDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AnalyticsReportDto copyWith({
    int? totalStudents,
    int? totalLecturers,
    int? totalCourses,
    int? openClasses,
    int? fullClasses,
    int? closedClasses,
    List<_ir3li6gj.NamedCountDto>? studentsByFaculty,
    List<_ir3li6gj.NamedCountDto>? studentsByMajor,
    List<_ialr1zk7.ClassDemandDto>? courseDemand,
    List<_ir3li6gj.NamedCountDto>? failedCourses,
    List<_iko92chp.CourseGpaDto>? courseGpas,
  }) {
    return AnalyticsReportDto(
      totalStudents: totalStudents ?? this.totalStudents,
      totalLecturers: totalLecturers ?? this.totalLecturers,
      totalCourses: totalCourses ?? this.totalCourses,
      openClasses: openClasses ?? this.openClasses,
      fullClasses: fullClasses ?? this.fullClasses,
      closedClasses: closedClasses ?? this.closedClasses,
      studentsByFaculty:
          studentsByFaculty ??
          this.studentsByFaculty.map((e0) => e0.copyWith()).toList(),
      studentsByMajor:
          studentsByMajor ??
          this.studentsByMajor.map((e0) => e0.copyWith()).toList(),
      courseDemand:
          courseDemand ?? this.courseDemand.map((e0) => e0.copyWith()).toList(),
      failedCourses:
          failedCourses ??
          this.failedCourses.map((e0) => e0.copyWith()).toList(),
      courseGpas:
          courseGpas ?? this.courseGpas.map((e0) => e0.copyWith()).toList(),
    );
  }
}
