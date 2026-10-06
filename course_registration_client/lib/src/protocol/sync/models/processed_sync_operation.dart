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
import '../../sync/models/sync_operation_status.dart' as _i9saic36;

abstract class ProcessedSyncOperation
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ProcessedSyncOperation._({
    this.id,
    required this.operationId,
    required this.userId,
    this.user,
    required this.entityType,
    this.entityId,
    required this.operationType,
    required this.payload,
    required this.status,
    this.resultPayload,
    this.errorCode,
    this.errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : serverVersion = serverVersion ?? 1,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ProcessedSyncOperation({
    _isc.UuidValue? id,
    required _isc.UuidValue operationId,
    required _isc.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String entityType,
    String? entityId,
    required String operationType,
    required String payload,
    required _i9saic36.SyncOperationStatus status,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProcessedSyncOperationImpl;

  factory ProcessedSyncOperation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProcessedSyncOperation(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      operationId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['operationId'],
      ),
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ilo7u3hn.AppUser>(
              jsonSerialization['user'],
            ),
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as String?,
      operationType: jsonSerialization['operationType'] as String,
      payload: jsonSerialization['payload'] as String,
      status: _i9saic36.SyncOperationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      resultPayload: jsonSerialization['resultPayload'] as String?,
      errorCode: jsonSerialization['errorCode'] as String?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      serverVersion: jsonSerialization['serverVersion'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue operationId;

  _isc.UuidValue userId;

  _ilo7u3hn.AppUser? user;

  String entityType;

  String? entityId;

  String operationType;

  String payload;

  _i9saic36.SyncOperationStatus status;

  String? resultPayload;

  String? errorCode;

  String? errorMessage;

  int serverVersion;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [ProcessedSyncOperation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ProcessedSyncOperation copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? operationId,
    _isc.UuidValue? userId,
    _ilo7u3hn.AppUser? user,
    String? entityType,
    String? entityId,
    String? operationType,
    String? payload,
    _i9saic36.SyncOperationStatus? status,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProcessedSyncOperation',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'entityType': entityType,
      if (entityId != null) 'entityId': entityId,
      'operationType': operationType,
      'payload': payload,
      'status': status.toJson(),
      if (resultPayload != null) 'resultPayload': resultPayload,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'serverVersion': serverVersion,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProcessedSyncOperation',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'entityType': entityType,
      if (entityId != null) 'entityId': entityId,
      'operationType': operationType,
      'payload': payload,
      'status': status.toJson(),
      if (resultPayload != null) 'resultPayload': resultPayload,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'serverVersion': serverVersion,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProcessedSyncOperationImpl extends ProcessedSyncOperation {
  _ProcessedSyncOperationImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue operationId,
    required _isc.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String entityType,
    String? entityId,
    required String operationType,
    required String payload,
    required _i9saic36.SyncOperationStatus status,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         operationId: operationId,
         userId: userId,
         user: user,
         entityType: entityType,
         entityId: entityId,
         operationType: operationType,
         payload: payload,
         status: status,
         resultPayload: resultPayload,
         errorCode: errorCode,
         errorMessage: errorMessage,
         serverVersion: serverVersion,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProcessedSyncOperation]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ProcessedSyncOperation copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? operationId,
    _isc.UuidValue? userId,
    Object? user = _Undefined,
    String? entityType,
    Object? entityId = _Undefined,
    String? operationType,
    String? payload,
    _i9saic36.SyncOperationStatus? status,
    Object? resultPayload = _Undefined,
    Object? errorCode = _Undefined,
    Object? errorMessage = _Undefined,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProcessedSyncOperation(
      id: id is _isc.UuidValue? ? id : this.id,
      operationId: operationId ?? this.operationId,
      userId: userId ?? this.userId,
      user: user is _ilo7u3hn.AppUser? ? user : this.user?.copyWith(),
      entityType: entityType ?? this.entityType,
      entityId: entityId is String? ? entityId : this.entityId,
      operationType: operationType ?? this.operationType,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      resultPayload: resultPayload is String?
          ? resultPayload
          : this.resultPayload,
      errorCode: errorCode is String? ? errorCode : this.errorCode,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      serverVersion: serverVersion ?? this.serverVersion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
