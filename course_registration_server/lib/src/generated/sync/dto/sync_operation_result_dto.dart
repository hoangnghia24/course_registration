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
import '../../sync/models/sync_operation_status.dart' as _i9saic36;

abstract class SyncOperationResultDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  SyncOperationResultDto._({
    required this.operationId,
    required this.status,
    this.serverVersion,
    this.resultPayload,
    this.errorCode,
    this.errorMessage,
  });

  factory SyncOperationResultDto({
    required _is.UuidValue operationId,
    required _i9saic36.SyncOperationStatus status,
    int? serverVersion,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
  }) = _SyncOperationResultDtoImpl;

  factory SyncOperationResultDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return SyncOperationResultDto(
      operationId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['operationId'],
      ),
      status: _i9saic36.SyncOperationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      serverVersion: jsonSerialization['serverVersion'] as int?,
      resultPayload: jsonSerialization['resultPayload'] as String?,
      errorCode: jsonSerialization['errorCode'] as String?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
    );
  }

  _is.UuidValue operationId;

  _i9saic36.SyncOperationStatus status;

  int? serverVersion;

  String? resultPayload;

  String? errorCode;

  String? errorMessage;

  /// Returns a shallow copy of this [SyncOperationResultDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SyncOperationResultDto copyWith({
    _is.UuidValue? operationId,
    _i9saic36.SyncOperationStatus? status,
    int? serverVersion,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncOperationResultDto',
      'operationId': operationId.toJson(),
      'status': status.toJson(),
      if (serverVersion != null) 'serverVersion': serverVersion,
      if (resultPayload != null) 'resultPayload': resultPayload,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncOperationResultDto',
      'operationId': operationId.toJson(),
      'status': status.toJson(),
      if (serverVersion != null) 'serverVersion': serverVersion,
      if (resultPayload != null) 'resultPayload': resultPayload,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncOperationResultDtoImpl extends SyncOperationResultDto {
  _SyncOperationResultDtoImpl({
    required _is.UuidValue operationId,
    required _i9saic36.SyncOperationStatus status,
    int? serverVersion,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
  }) : super._(
         operationId: operationId,
         status: status,
         serverVersion: serverVersion,
         resultPayload: resultPayload,
         errorCode: errorCode,
         errorMessage: errorMessage,
       );

  /// Returns a shallow copy of this [SyncOperationResultDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SyncOperationResultDto copyWith({
    _is.UuidValue? operationId,
    _i9saic36.SyncOperationStatus? status,
    Object? serverVersion = _Undefined,
    Object? resultPayload = _Undefined,
    Object? errorCode = _Undefined,
    Object? errorMessage = _Undefined,
  }) {
    return SyncOperationResultDto(
      operationId: operationId ?? this.operationId,
      status: status ?? this.status,
      serverVersion: serverVersion is int? ? serverVersion : this.serverVersion,
      resultPayload: resultPayload is String?
          ? resultPayload
          : this.resultPayload,
      errorCode: errorCode is String? ? errorCode : this.errorCode,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
    );
  }
}
