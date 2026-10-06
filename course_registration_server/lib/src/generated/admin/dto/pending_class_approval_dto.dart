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
import 'package:course_registration_server/src/generated/protocol.dart'
    as _i9p8z86v;
import 'package:serverpod/serverpod.dart' as _is;
import '../../lecturer/models/teaching_schedule_proposal.dart' as _ir6p9ie4;

abstract class PendingClassApprovalDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  PendingClassApprovalDto._({
    required this.courseClassId,
    required this.classCode,
    required this.courseCode,
    required this.courseName,
    required this.lecturerName,
    required this.capacity,
    required this.proposals,
  });

  factory PendingClassApprovalDto({
    required _is.UuidValue courseClassId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required String lecturerName,
    required int capacity,
    required List<_ir6p9ie4.TeachingScheduleProposal> proposals,
  }) = _PendingClassApprovalDtoImpl;

  factory PendingClassApprovalDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PendingClassApprovalDto(
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      classCode: jsonSerialization['classCode'] as String,
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      lecturerName: jsonSerialization['lecturerName'] as String,
      capacity: jsonSerialization['capacity'] as int,
      proposals: _i9p8z86v.Protocol()
          .deserialize<List<_ir6p9ie4.TeachingScheduleProposal>>(
            jsonSerialization['proposals'],
          ),
    );
  }

  _is.UuidValue courseClassId;

  String classCode;

  String courseCode;

  String courseName;

  String lecturerName;

  int capacity;

  List<_ir6p9ie4.TeachingScheduleProposal> proposals;

  /// Returns a shallow copy of this [PendingClassApprovalDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  PendingClassApprovalDto copyWith({
    _is.UuidValue? courseClassId,
    String? classCode,
    String? courseCode,
    String? courseName,
    String? lecturerName,
    int? capacity,
    List<_ir6p9ie4.TeachingScheduleProposal>? proposals,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PendingClassApprovalDto',
      'courseClassId': courseClassId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'lecturerName': lecturerName,
      'capacity': capacity,
      'proposals': proposals.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PendingClassApprovalDto',
      'courseClassId': courseClassId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'lecturerName': lecturerName,
      'capacity': capacity,
      'proposals': proposals.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _PendingClassApprovalDtoImpl extends PendingClassApprovalDto {
  _PendingClassApprovalDtoImpl({
    required _is.UuidValue courseClassId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required String lecturerName,
    required int capacity,
    required List<_ir6p9ie4.TeachingScheduleProposal> proposals,
  }) : super._(
         courseClassId: courseClassId,
         classCode: classCode,
         courseCode: courseCode,
         courseName: courseName,
         lecturerName: lecturerName,
         capacity: capacity,
         proposals: proposals,
       );

  /// Returns a shallow copy of this [PendingClassApprovalDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  PendingClassApprovalDto copyWith({
    _is.UuidValue? courseClassId,
    String? classCode,
    String? courseCode,
    String? courseName,
    String? lecturerName,
    int? capacity,
    List<_ir6p9ie4.TeachingScheduleProposal>? proposals,
  }) {
    return PendingClassApprovalDto(
      courseClassId: courseClassId ?? this.courseClassId,
      classCode: classCode ?? this.classCode,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      lecturerName: lecturerName ?? this.lecturerName,
      capacity: capacity ?? this.capacity,
      proposals:
          proposals ?? this.proposals.map((e0) => e0.copyWith()).toList(),
    );
  }
}
