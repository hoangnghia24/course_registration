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
import '../../admin.dart' as _ikmszj0x;
import '../../lecturer.dart' as _ismqsd72;
import '../../lecturer/models/class_adjustment_status.dart' as _i45abhz5;
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class ClassAdjustmentRequest
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ClassAdjustmentRequest._({
    this.id,
    required this.courseClassId,
    this.courseClass,
    required this.lecturerId,
    this.lecturer,
    required this.oldCapacity,
    required this.newCapacity,
    required this.oldSchedulesJson,
    required this.newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    this.reviewedAt,
    this.reviewedById,
    this.reviewedBy,
    this.rejectReason,
  }) : status = status ?? _i45abhz5.ClassAdjustmentStatus.pending,
       createdAt = createdAt ?? DateTime.now();

  factory ClassAdjustmentRequest({
    _isc.UuidValue? id,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required int oldCapacity,
    required int newCapacity,
    required String oldSchedulesJson,
    required String newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    DateTime? reviewedAt,
    _isc.UuidValue? reviewedById,
    _ikmszj0x.Admin? reviewedBy,
    String? rejectReason,
  }) = _ClassAdjustmentRequestImpl;

  factory ClassAdjustmentRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ClassAdjustmentRequest(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseClassId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      lecturerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      oldCapacity: jsonSerialization['oldCapacity'] as int,
      newCapacity: jsonSerialization['newCapacity'] as int,
      oldSchedulesJson: jsonSerialization['oldSchedulesJson'] as String,
      newSchedulesJson: jsonSerialization['newSchedulesJson'] as String,
      status: jsonSerialization['status'] == null
          ? null
          : _i45abhz5.ClassAdjustmentStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      reviewedAt: jsonSerialization['reviewedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['reviewedAt'],
            ),
      reviewedById: jsonSerialization['reviewedById'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['reviewedById'],
            ),
      reviewedBy: jsonSerialization['reviewedBy'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['reviewedBy'],
            ),
      rejectReason: jsonSerialization['rejectReason'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  _isc.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  int oldCapacity;

  int newCapacity;

  String oldSchedulesJson;

  String newSchedulesJson;

  _i45abhz5.ClassAdjustmentStatus status;

  DateTime createdAt;

  DateTime? reviewedAt;

  _isc.UuidValue? reviewedById;

  _ikmszj0x.Admin? reviewedBy;

  String? rejectReason;

  /// Returns a shallow copy of this [ClassAdjustmentRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ClassAdjustmentRequest copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    _isc.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    int? oldCapacity,
    int? newCapacity,
    String? oldSchedulesJson,
    String? newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    DateTime? reviewedAt,
    _isc.UuidValue? reviewedById,
    _ikmszj0x.Admin? reviewedBy,
    String? rejectReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassAdjustmentRequest',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'oldCapacity': oldCapacity,
      'newCapacity': newCapacity,
      'oldSchedulesJson': oldSchedulesJson,
      'newSchedulesJson': newSchedulesJson,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
      if (reviewedById != null) 'reviewedById': reviewedById?.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy?.toJson(),
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassAdjustmentRequest',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'oldCapacity': oldCapacity,
      'newCapacity': newCapacity,
      'oldSchedulesJson': oldSchedulesJson,
      'newSchedulesJson': newSchedulesJson,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
      if (reviewedById != null) 'reviewedById': reviewedById?.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy?.toJsonForProtocol(),
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClassAdjustmentRequestImpl extends ClassAdjustmentRequest {
  _ClassAdjustmentRequestImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required int oldCapacity,
    required int newCapacity,
    required String oldSchedulesJson,
    required String newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    DateTime? reviewedAt,
    _isc.UuidValue? reviewedById,
    _ikmszj0x.Admin? reviewedBy,
    String? rejectReason,
  }) : super._(
         id: id,
         courseClassId: courseClassId,
         courseClass: courseClass,
         lecturerId: lecturerId,
         lecturer: lecturer,
         oldCapacity: oldCapacity,
         newCapacity: newCapacity,
         oldSchedulesJson: oldSchedulesJson,
         newSchedulesJson: newSchedulesJson,
         status: status,
         createdAt: createdAt,
         reviewedAt: reviewedAt,
         reviewedById: reviewedById,
         reviewedBy: reviewedBy,
         rejectReason: rejectReason,
       );

  /// Returns a shallow copy of this [ClassAdjustmentRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ClassAdjustmentRequest copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    _isc.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    int? oldCapacity,
    int? newCapacity,
    String? oldSchedulesJson,
    String? newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    Object? reviewedAt = _Undefined,
    Object? reviewedById = _Undefined,
    Object? reviewedBy = _Undefined,
    Object? rejectReason = _Undefined,
  }) {
    return ClassAdjustmentRequest(
      id: id is _isc.UuidValue? ? id : this.id,
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      oldCapacity: oldCapacity ?? this.oldCapacity,
      newCapacity: newCapacity ?? this.newCapacity,
      oldSchedulesJson: oldSchedulesJson ?? this.oldSchedulesJson,
      newSchedulesJson: newSchedulesJson ?? this.newSchedulesJson,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      reviewedAt: reviewedAt is DateTime? ? reviewedAt : this.reviewedAt,
      reviewedById: reviewedById is _isc.UuidValue?
          ? reviewedById
          : this.reviewedById,
      reviewedBy: reviewedBy is _ikmszj0x.Admin?
          ? reviewedBy
          : this.reviewedBy?.copyWith(),
      rejectReason: rejectReason is String? ? rejectReason : this.rejectReason,
    );
  }
}
