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
import '../../lecturer/models/class_adjustment_status.dart' as _i45abhz5;
import '../../registration/dto/class_schedule_dto.dart' as _ib1jm4me;

abstract class ClassAdjustmentRequestDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  ClassAdjustmentRequestDto._({
    required this.requestId,
    required this.courseClassId,
    required this.classCode,
    required this.courseCode,
    required this.courseName,
    required this.lecturerName,
    required this.oldCapacity,
    required this.newCapacity,
    required this.oldSchedules,
    required this.newSchedules,
    required this.status,
    required this.createdAt,
    this.reviewedAt,
    this.reviewedByName,
    this.rejectReason,
  });

  factory ClassAdjustmentRequestDto({
    required _is.UuidValue requestId,
    required _is.UuidValue courseClassId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required String lecturerName,
    required int oldCapacity,
    required int newCapacity,
    required List<_ib1jm4me.ClassScheduleDto> oldSchedules,
    required List<_ib1jm4me.ClassScheduleDto> newSchedules,
    required _i45abhz5.ClassAdjustmentStatus status,
    required DateTime createdAt,
    DateTime? reviewedAt,
    String? reviewedByName,
    String? rejectReason,
  }) = _ClassAdjustmentRequestDtoImpl;

  factory ClassAdjustmentRequestDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ClassAdjustmentRequestDto(
      requestId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['requestId'],
      ),
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      classCode: jsonSerialization['classCode'] as String,
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      lecturerName: jsonSerialization['lecturerName'] as String,
      oldCapacity: jsonSerialization['oldCapacity'] as int,
      newCapacity: jsonSerialization['newCapacity'] as int,
      oldSchedules: _i9p8z86v.Protocol()
          .deserialize<List<_ib1jm4me.ClassScheduleDto>>(
            jsonSerialization['oldSchedules'],
          ),
      newSchedules: _i9p8z86v.Protocol()
          .deserialize<List<_ib1jm4me.ClassScheduleDto>>(
            jsonSerialization['newSchedules'],
          ),
      status: _i45abhz5.ClassAdjustmentStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      reviewedAt: jsonSerialization['reviewedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['reviewedAt']),
      reviewedByName: jsonSerialization['reviewedByName'] as String?,
      rejectReason: jsonSerialization['rejectReason'] as String?,
    );
  }

  _is.UuidValue requestId;

  _is.UuidValue courseClassId;

  String classCode;

  String courseCode;

  String courseName;

  String lecturerName;

  int oldCapacity;

  int newCapacity;

  List<_ib1jm4me.ClassScheduleDto> oldSchedules;

  List<_ib1jm4me.ClassScheduleDto> newSchedules;

  _i45abhz5.ClassAdjustmentStatus status;

  DateTime createdAt;

  DateTime? reviewedAt;

  String? reviewedByName;

  String? rejectReason;

  /// Returns a shallow copy of this [ClassAdjustmentRequestDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClassAdjustmentRequestDto copyWith({
    _is.UuidValue? requestId,
    _is.UuidValue? courseClassId,
    String? classCode,
    String? courseCode,
    String? courseName,
    String? lecturerName,
    int? oldCapacity,
    int? newCapacity,
    List<_ib1jm4me.ClassScheduleDto>? oldSchedules,
    List<_ib1jm4me.ClassScheduleDto>? newSchedules,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    DateTime? reviewedAt,
    String? reviewedByName,
    String? rejectReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassAdjustmentRequestDto',
      'requestId': requestId.toJson(),
      'courseClassId': courseClassId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'lecturerName': lecturerName,
      'oldCapacity': oldCapacity,
      'newCapacity': newCapacity,
      'oldSchedules': oldSchedules.toJson(valueToJson: (v) => v.toJson()),
      'newSchedules': newSchedules.toJson(valueToJson: (v) => v.toJson()),
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
      if (reviewedByName != null) 'reviewedByName': reviewedByName,
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassAdjustmentRequestDto',
      'requestId': requestId.toJson(),
      'courseClassId': courseClassId.toJson(),
      'classCode': classCode,
      'courseCode': courseCode,
      'courseName': courseName,
      'lecturerName': lecturerName,
      'oldCapacity': oldCapacity,
      'newCapacity': newCapacity,
      'oldSchedules': oldSchedules.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'newSchedules': newSchedules.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
      if (reviewedByName != null) 'reviewedByName': reviewedByName,
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClassAdjustmentRequestDtoImpl extends ClassAdjustmentRequestDto {
  _ClassAdjustmentRequestDtoImpl({
    required _is.UuidValue requestId,
    required _is.UuidValue courseClassId,
    required String classCode,
    required String courseCode,
    required String courseName,
    required String lecturerName,
    required int oldCapacity,
    required int newCapacity,
    required List<_ib1jm4me.ClassScheduleDto> oldSchedules,
    required List<_ib1jm4me.ClassScheduleDto> newSchedules,
    required _i45abhz5.ClassAdjustmentStatus status,
    required DateTime createdAt,
    DateTime? reviewedAt,
    String? reviewedByName,
    String? rejectReason,
  }) : super._(
         requestId: requestId,
         courseClassId: courseClassId,
         classCode: classCode,
         courseCode: courseCode,
         courseName: courseName,
         lecturerName: lecturerName,
         oldCapacity: oldCapacity,
         newCapacity: newCapacity,
         oldSchedules: oldSchedules,
         newSchedules: newSchedules,
         status: status,
         createdAt: createdAt,
         reviewedAt: reviewedAt,
         reviewedByName: reviewedByName,
         rejectReason: rejectReason,
       );

  /// Returns a shallow copy of this [ClassAdjustmentRequestDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClassAdjustmentRequestDto copyWith({
    _is.UuidValue? requestId,
    _is.UuidValue? courseClassId,
    String? classCode,
    String? courseCode,
    String? courseName,
    String? lecturerName,
    int? oldCapacity,
    int? newCapacity,
    List<_ib1jm4me.ClassScheduleDto>? oldSchedules,
    List<_ib1jm4me.ClassScheduleDto>? newSchedules,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    Object? reviewedAt = _Undefined,
    Object? reviewedByName = _Undefined,
    Object? rejectReason = _Undefined,
  }) {
    return ClassAdjustmentRequestDto(
      requestId: requestId ?? this.requestId,
      courseClassId: courseClassId ?? this.courseClassId,
      classCode: classCode ?? this.classCode,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      lecturerName: lecturerName ?? this.lecturerName,
      oldCapacity: oldCapacity ?? this.oldCapacity,
      newCapacity: newCapacity ?? this.newCapacity,
      oldSchedules:
          oldSchedules ?? this.oldSchedules.map((e0) => e0.copyWith()).toList(),
      newSchedules:
          newSchedules ?? this.newSchedules.map((e0) => e0.copyWith()).toList(),
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      reviewedAt: reviewedAt is DateTime? ? reviewedAt : this.reviewedAt,
      reviewedByName: reviewedByName is String?
          ? reviewedByName
          : this.reviewedByName,
      rejectReason: rejectReason is String? ? rejectReason : this.rejectReason,
    );
  }
}
