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
import '../../sync/models/sync_operation_status.dart' as _i9saic36;

abstract class SyncLog
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SyncLog._({
    this.id,
    required this.operationId,
    required this.action,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.errorCode,
    this.errorMessage,
  });

  factory SyncLog({
    _isc.UuidValue? id,
    required _isc.UuidValue operationId,
    required String action,
    required _i9saic36.SyncOperationStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? errorCode,
    String? errorMessage,
  }) = _SyncLogImpl;

  factory SyncLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return SyncLog(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      operationId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['operationId'],
      ),
      action: jsonSerialization['action'] as String,
      status: _i9saic36.SyncOperationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      startedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      errorCode: jsonSerialization['errorCode'] as String?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue operationId;

  String action;

  _i9saic36.SyncOperationStatus status;

  DateTime startedAt;

  DateTime? completedAt;

  String? errorCode;

  String? errorMessage;

  /// Returns a shallow copy of this [SyncLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SyncLog copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? operationId,
    String? action,
    _i9saic36.SyncOperationStatus? status,
    DateTime? startedAt,
    DateTime? completedAt,
    String? errorCode,
    String? errorMessage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncLog',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'action': action,
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncLog',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'action': action,
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncLogImpl extends SyncLog {
  _SyncLogImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue operationId,
    required String action,
    required _i9saic36.SyncOperationStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? errorCode,
    String? errorMessage,
  }) : super._(
         id: id,
         operationId: operationId,
         action: action,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         errorCode: errorCode,
         errorMessage: errorMessage,
       );

  /// Returns a shallow copy of this [SyncLog]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SyncLog copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? operationId,
    String? action,
    _i9saic36.SyncOperationStatus? status,
    DateTime? startedAt,
    Object? completedAt = _Undefined,
    Object? errorCode = _Undefined,
    Object? errorMessage = _Undefined,
  }) {
    return SyncLog(
      id: id is _isc.UuidValue? ? id : this.id,
      operationId: operationId ?? this.operationId,
      action: action ?? this.action,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      errorCode: errorCode is String? ? errorCode : this.errorCode,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
    );
  }
}
