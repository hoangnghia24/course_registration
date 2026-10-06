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

abstract class SystemAuditLog
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SystemAuditLog._({
    this.id,
    required this.userId,
    this.user,
    required this.action,
    required this.entity,
    required this.entityId,
    this.oldValue,
    this.newValue,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory SystemAuditLog({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String action,
    required String entity,
    required _isc.UuidValue entityId,
    String? oldValue,
    String? newValue,
    DateTime? createdAt,
  }) = _SystemAuditLogImpl;

  factory SystemAuditLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return SystemAuditLog(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ilo7u3hn.AppUser>(
              jsonSerialization['user'],
            ),
      action: jsonSerialization['action'] as String,
      entity: jsonSerialization['entity'] as String,
      entityId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['entityId'],
      ),
      oldValue: jsonSerialization['oldValue'] as String?,
      newValue: jsonSerialization['newValue'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue userId;

  _ilo7u3hn.AppUser? user;

  String action;

  String entity;

  _isc.UuidValue entityId;

  String? oldValue;

  String? newValue;

  DateTime createdAt;

  /// Returns a shallow copy of this [SystemAuditLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SystemAuditLog copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? userId,
    _ilo7u3hn.AppUser? user,
    String? action,
    String? entity,
    _isc.UuidValue? entityId,
    String? oldValue,
    String? newValue,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SystemAuditLog',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      if (oldValue != null) 'oldValue': oldValue,
      if (newValue != null) 'newValue': newValue,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SystemAuditLog',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      if (oldValue != null) 'oldValue': oldValue,
      if (newValue != null) 'newValue': newValue,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SystemAuditLogImpl extends SystemAuditLog {
  _SystemAuditLogImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String action,
    required String entity,
    required _isc.UuidValue entityId,
    String? oldValue,
    String? newValue,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         action: action,
         entity: entity,
         entityId: entityId,
         oldValue: oldValue,
         newValue: newValue,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SystemAuditLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SystemAuditLog copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? userId,
    Object? user = _Undefined,
    String? action,
    String? entity,
    _isc.UuidValue? entityId,
    Object? oldValue = _Undefined,
    Object? newValue = _Undefined,
    DateTime? createdAt,
  }) {
    return SystemAuditLog(
      id: id is _isc.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _ilo7u3hn.AppUser? ? user : this.user?.copyWith(),
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      oldValue: oldValue is String? ? oldValue : this.oldValue,
      newValue: newValue is String? ? newValue : this.newValue,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
