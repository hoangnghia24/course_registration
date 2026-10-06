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
import '../../app_user.dart' as _ilo7u3hn;

abstract class SyncChange
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SyncChange._({
    this.id,
    required this.targetUserId,
    this.targetUser,
    required this.entityType,
    required this.entityId,
    required this.changeType,
    this.payload,
    required this.serverVersion,
    DateTime? changedAt,
  }) : changedAt = changedAt ?? DateTime.now();

  factory SyncChange({
    _isc.UuidValue? id,
    required _isc.UuidValue targetUserId,
    _ilo7u3hn.AppUser? targetUser,
    required String entityType,
    required String entityId,
    required String changeType,
    String? payload,
    required int serverVersion,
    DateTime? changedAt,
  }) = _SyncChangeImpl;

  factory SyncChange.fromJson(Map<String, dynamic> jsonSerialization) {
    return SyncChange(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      targetUserId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['targetUserId'],
      ),
      targetUser: jsonSerialization['targetUser'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ilo7u3hn.AppUser>(
              jsonSerialization['targetUser'],
            ),
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as String,
      changeType: jsonSerialization['changeType'] as String,
      payload: jsonSerialization['payload'] as String?,
      serverVersion: jsonSerialization['serverVersion'] as int,
      changedAt: jsonSerialization['changedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['changedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue targetUserId;

  _ilo7u3hn.AppUser? targetUser;

  String entityType;

  String entityId;

  String changeType;

  String? payload;

  int serverVersion;

  DateTime changedAt;

  /// Returns a shallow copy of this [SyncChange]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SyncChange copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? targetUserId,
    _ilo7u3hn.AppUser? targetUser,
    String? entityType,
    String? entityId,
    String? changeType,
    String? payload,
    int? serverVersion,
    DateTime? changedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncChange',
      if (id != null) 'id': id?.toJson(),
      'targetUserId': targetUserId.toJson(),
      if (targetUser != null) 'targetUser': targetUser?.toJson(),
      'entityType': entityType,
      'entityId': entityId,
      'changeType': changeType,
      if (payload != null) 'payload': payload,
      'serverVersion': serverVersion,
      'changedAt': changedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncChange',
      if (id != null) 'id': id?.toJson(),
      'targetUserId': targetUserId.toJson(),
      if (targetUser != null) 'targetUser': targetUser?.toJsonForProtocol(),
      'entityType': entityType,
      'entityId': entityId,
      'changeType': changeType,
      if (payload != null) 'payload': payload,
      'serverVersion': serverVersion,
      'changedAt': changedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncChangeImpl extends SyncChange {
  _SyncChangeImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue targetUserId,
    _ilo7u3hn.AppUser? targetUser,
    required String entityType,
    required String entityId,
    required String changeType,
    String? payload,
    required int serverVersion,
    DateTime? changedAt,
  }) : super._(
         id: id,
         targetUserId: targetUserId,
         targetUser: targetUser,
         entityType: entityType,
         entityId: entityId,
         changeType: changeType,
         payload: payload,
         serverVersion: serverVersion,
         changedAt: changedAt,
       );

  /// Returns a shallow copy of this [SyncChange]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SyncChange copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? targetUserId,
    Object? targetUser = _Undefined,
    String? entityType,
    String? entityId,
    String? changeType,
    Object? payload = _Undefined,
    int? serverVersion,
    DateTime? changedAt,
  }) {
    return SyncChange(
      id: id is _isc.UuidValue? ? id : this.id,
      targetUserId: targetUserId ?? this.targetUserId,
      targetUser: targetUser is _ilo7u3hn.AppUser?
          ? targetUser
          : this.targetUser?.copyWith(),
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      changeType: changeType ?? this.changeType,
      payload: payload is String? ? payload : this.payload,
      serverVersion: serverVersion ?? this.serverVersion,
      changedAt: changedAt ?? this.changedAt,
    );
  }
}
