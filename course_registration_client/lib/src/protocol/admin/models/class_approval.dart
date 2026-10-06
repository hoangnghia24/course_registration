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
import '../../admin/models/class_approval_status.dart' as _ie7gue25;
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class ClassApproval
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ClassApproval._({
    this.id,
    required this.courseClassId,
    this.courseClass,
    required this.adminId,
    this.admin,
    _ie7gue25.ClassApprovalStatus? status,
    this.comment,
    DateTime? createdAt,
  }) : status = status ?? _ie7gue25.ClassApprovalStatus.pending,
       createdAt = createdAt ?? DateTime.now();

  factory ClassApproval({
    _isc.UuidValue? id,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _isc.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    _ie7gue25.ClassApprovalStatus? status,
    String? comment,
    DateTime? createdAt,
  }) = _ClassApprovalImpl;

  factory ClassApproval.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClassApproval(
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
      adminId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['adminId'],
      ),
      admin: jsonSerialization['admin'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['admin'],
            ),
      status: jsonSerialization['status'] == null
          ? null
          : _ie7gue25.ClassApprovalStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      comment: jsonSerialization['comment'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  _isc.UuidValue adminId;

  _ikmszj0x.Admin? admin;

  _ie7gue25.ClassApprovalStatus status;

  String? comment;

  DateTime createdAt;

  /// Returns a shallow copy of this [ClassApproval]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ClassApproval copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    _isc.UuidValue? adminId,
    _ikmszj0x.Admin? admin,
    _ie7gue25.ClassApprovalStatus? status,
    String? comment,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassApproval',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJson(),
      'status': status.toJson(),
      if (comment != null) 'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassApproval',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJsonForProtocol(),
      'status': status.toJson(),
      if (comment != null) 'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClassApprovalImpl extends ClassApproval {
  _ClassApprovalImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _isc.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    _ie7gue25.ClassApprovalStatus? status,
    String? comment,
    DateTime? createdAt,
  }) : super._(
         id: id,
         courseClassId: courseClassId,
         courseClass: courseClass,
         adminId: adminId,
         admin: admin,
         status: status,
         comment: comment,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ClassApproval]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ClassApproval copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    _isc.UuidValue? adminId,
    Object? admin = _Undefined,
    _ie7gue25.ClassApprovalStatus? status,
    Object? comment = _Undefined,
    DateTime? createdAt,
  }) {
    return ClassApproval(
      id: id is _isc.UuidValue? ? id : this.id,
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      adminId: adminId ?? this.adminId,
      admin: admin is _ikmszj0x.Admin? ? admin : this.admin?.copyWith(),
      status: status ?? this.status,
      comment: comment is String? ? comment : this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
