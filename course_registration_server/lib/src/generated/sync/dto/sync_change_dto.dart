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

abstract class SyncChangeDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  SyncChangeDto._({
    required this.entityType,
    required this.entityId,
    required this.changeType,
    this.payload,
    required this.serverVersion,
    required this.changedAt,
  });

  factory SyncChangeDto({
    required String entityType,
    required String entityId,
    required String changeType,
    String? payload,
    required int serverVersion,
    required DateTime changedAt,
  }) = _SyncChangeDtoImpl;

  factory SyncChangeDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return SyncChangeDto(
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as String,
      changeType: jsonSerialization['changeType'] as String,
      payload: jsonSerialization['payload'] as String?,
      serverVersion: jsonSerialization['serverVersion'] as int,
      changedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['changedAt'],
      ),
    );
  }

  String entityType;

  String entityId;

  String changeType;

  String? payload;

  int serverVersion;

  DateTime changedAt;

  /// Returns a shallow copy of this [SyncChangeDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SyncChangeDto copyWith({
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
      '__className__': 'SyncChangeDto',
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
      '__className__': 'SyncChangeDto',
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
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncChangeDtoImpl extends SyncChangeDto {
  _SyncChangeDtoImpl({
    required String entityType,
    required String entityId,
    required String changeType,
    String? payload,
    required int serverVersion,
    required DateTime changedAt,
  }) : super._(
         entityType: entityType,
         entityId: entityId,
         changeType: changeType,
         payload: payload,
         serverVersion: serverVersion,
         changedAt: changedAt,
       );

  /// Returns a shallow copy of this [SyncChangeDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SyncChangeDto copyWith({
    String? entityType,
    String? entityId,
    String? changeType,
    Object? payload = _Undefined,
    int? serverVersion,
    DateTime? changedAt,
  }) {
    return SyncChangeDto(
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      changeType: changeType ?? this.changeType,
      payload: payload is String? ? payload : this.payload,
      serverVersion: serverVersion ?? this.serverVersion,
      changedAt: changedAt ?? this.changedAt,
    );
  }
}
