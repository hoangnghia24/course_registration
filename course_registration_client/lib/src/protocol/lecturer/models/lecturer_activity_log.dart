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
import '../../lecturer.dart' as _ismqsd72;

abstract class LecturerActivityLog
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  LecturerActivityLog._({
    this.id,
    required this.lecturerId,
    this.lecturer,
    required this.action,
    required this.entity,
    required this.entityId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory LecturerActivityLog({
    _isc.UuidValue? id,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required String action,
    required String entity,
    required _isc.UuidValue entityId,
    DateTime? createdAt,
  }) = _LecturerActivityLogImpl;

  factory LecturerActivityLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return LecturerActivityLog(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      lecturerId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      action: jsonSerialization['action'] as String,
      entity: jsonSerialization['entity'] as String,
      entityId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['entityId'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  String action;

  String entity;

  _isc.UuidValue entityId;

  DateTime createdAt;

  /// Returns a shallow copy of this [LecturerActivityLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  LecturerActivityLog copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    String? action,
    String? entity,
    _isc.UuidValue? entityId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LecturerActivityLog',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LecturerActivityLog',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerActivityLogImpl extends LecturerActivityLog {
  _LecturerActivityLogImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required String action,
    required String entity,
    required _isc.UuidValue entityId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         lecturerId: lecturerId,
         lecturer: lecturer,
         action: action,
         entity: entity,
         entityId: entityId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [LecturerActivityLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  LecturerActivityLog copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    String? action,
    String? entity,
    _isc.UuidValue? entityId,
    DateTime? createdAt,
  }) {
    return LecturerActivityLog(
      id: id is _isc.UuidValue? ? id : this.id,
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
