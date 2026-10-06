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

abstract class AuditLogDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  AuditLogDto._({
    required this.id,
    required this.actorName,
    required this.action,
    required this.entity,
    required this.entityId,
    this.oldValue,
    this.newValue,
    required this.createdAt,
  });

  factory AuditLogDto({
    required _is.UuidValue id,
    required String actorName,
    required String action,
    required String entity,
    required _is.UuidValue entityId,
    String? oldValue,
    String? newValue,
    required DateTime createdAt,
  }) = _AuditLogDtoImpl;

  factory AuditLogDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuditLogDto(
      id: _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      actorName: jsonSerialization['actorName'] as String,
      action: jsonSerialization['action'] as String,
      entity: jsonSerialization['entity'] as String,
      entityId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['entityId'],
      ),
      oldValue: jsonSerialization['oldValue'] as String?,
      newValue: jsonSerialization['newValue'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  _is.UuidValue id;

  String actorName;

  String action;

  String entity;

  _is.UuidValue entityId;

  String? oldValue;

  String? newValue;

  DateTime createdAt;

  /// Returns a shallow copy of this [AuditLogDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AuditLogDto copyWith({
    _is.UuidValue? id,
    String? actorName,
    String? action,
    String? entity,
    _is.UuidValue? entityId,
    String? oldValue,
    String? newValue,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuditLogDto',
      'id': id.toJson(),
      'actorName': actorName,
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
      '__className__': 'AuditLogDto',
      'id': id.toJson(),
      'actorName': actorName,
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
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuditLogDtoImpl extends AuditLogDto {
  _AuditLogDtoImpl({
    required _is.UuidValue id,
    required String actorName,
    required String action,
    required String entity,
    required _is.UuidValue entityId,
    String? oldValue,
    String? newValue,
    required DateTime createdAt,
  }) : super._(
         id: id,
         actorName: actorName,
         action: action,
         entity: entity,
         entityId: entityId,
         oldValue: oldValue,
         newValue: newValue,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AuditLogDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  AuditLogDto copyWith({
    _is.UuidValue? id,
    String? actorName,
    String? action,
    String? entity,
    _is.UuidValue? entityId,
    Object? oldValue = _Undefined,
    Object? newValue = _Undefined,
    DateTime? createdAt,
  }) {
    return AuditLogDto(
      id: id ?? this.id,
      actorName: actorName ?? this.actorName,
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      oldValue: oldValue is String? ? oldValue : this.oldValue,
      newValue: newValue is String? ? newValue : this.newValue,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
