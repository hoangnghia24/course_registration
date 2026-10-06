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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class SyncOperationInputDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SyncOperationInputDto._({
    required this.operationId,
    required this.entityType,
    this.entityId,
    required this.operationType,
    required this.payload,
    required this.clientId,
    this.baseVersion,
  });

  factory SyncOperationInputDto({
    required _isc.UuidValue operationId,
    required String entityType,
    String? entityId,
    required String operationType,
    required String payload,
    required String clientId,
    int? baseVersion,
  }) = _SyncOperationInputDtoImpl;

  factory SyncOperationInputDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return SyncOperationInputDto(
      operationId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['operationId'],
      ),
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as String?,
      operationType: jsonSerialization['operationType'] as String,
      payload: jsonSerialization['payload'] as String,
      clientId: jsonSerialization['clientId'] as String,
      baseVersion: jsonSerialization['baseVersion'] as int?,
    );
  }

  _isc.UuidValue operationId;

  String entityType;

  String? entityId;

  String operationType;

  String payload;

  String clientId;

  int? baseVersion;

  /// Returns a shallow copy of this [SyncOperationInputDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SyncOperationInputDto copyWith({
    _isc.UuidValue? operationId,
    String? entityType,
    String? entityId,
    String? operationType,
    String? payload,
    String? clientId,
    int? baseVersion,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncOperationInputDto',
      'operationId': operationId.toJson(),
      'entityType': entityType,
      if (entityId != null) 'entityId': entityId,
      'operationType': operationType,
      'payload': payload,
      'clientId': clientId,
      if (baseVersion != null) 'baseVersion': baseVersion,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncOperationInputDto',
      'operationId': operationId.toJson(),
      'entityType': entityType,
      if (entityId != null) 'entityId': entityId,
      'operationType': operationType,
      'payload': payload,
      'clientId': clientId,
      if (baseVersion != null) 'baseVersion': baseVersion,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncOperationInputDtoImpl extends SyncOperationInputDto {
  _SyncOperationInputDtoImpl({
    required _isc.UuidValue operationId,
    required String entityType,
    String? entityId,
    required String operationType,
    required String payload,
    required String clientId,
    int? baseVersion,
  }) : super._(
         operationId: operationId,
         entityType: entityType,
         entityId: entityId,
         operationType: operationType,
         payload: payload,
         clientId: clientId,
         baseVersion: baseVersion,
       );

  /// Returns a shallow copy of this [SyncOperationInputDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SyncOperationInputDto copyWith({
    _isc.UuidValue? operationId,
    String? entityType,
    Object? entityId = _Undefined,
    String? operationType,
    String? payload,
    String? clientId,
    Object? baseVersion = _Undefined,
  }) {
    return SyncOperationInputDto(
      operationId: operationId ?? this.operationId,
      entityType: entityType ?? this.entityType,
      entityId: entityId is String? ? entityId : this.entityId,
      operationType: operationType ?? this.operationType,
      payload: payload ?? this.payload,
      clientId: clientId ?? this.clientId,
      baseVersion: baseVersion is int? ? baseVersion : this.baseVersion,
    );
  }
}
