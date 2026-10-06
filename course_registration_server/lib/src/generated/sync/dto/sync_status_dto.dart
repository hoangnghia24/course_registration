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

abstract class SyncStatusDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  SyncStatusDto._({
    required this.pending,
    required this.syncing,
    required this.synced,
    required this.failed,
    required this.conflict,
    this.lastProcessedAt,
  });

  factory SyncStatusDto({
    required int pending,
    required int syncing,
    required int synced,
    required int failed,
    required int conflict,
    DateTime? lastProcessedAt,
  }) = _SyncStatusDtoImpl;

  factory SyncStatusDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return SyncStatusDto(
      pending: jsonSerialization['pending'] as int,
      syncing: jsonSerialization['syncing'] as int,
      synced: jsonSerialization['synced'] as int,
      failed: jsonSerialization['failed'] as int,
      conflict: jsonSerialization['conflict'] as int,
      lastProcessedAt: jsonSerialization['lastProcessedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastProcessedAt'],
            ),
    );
  }

  int pending;

  int syncing;

  int synced;

  int failed;

  int conflict;

  DateTime? lastProcessedAt;

  /// Returns a shallow copy of this [SyncStatusDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SyncStatusDto copyWith({
    int? pending,
    int? syncing,
    int? synced,
    int? failed,
    int? conflict,
    DateTime? lastProcessedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncStatusDto',
      'pending': pending,
      'syncing': syncing,
      'synced': synced,
      'failed': failed,
      'conflict': conflict,
      if (lastProcessedAt != null) 'lastProcessedAt': lastProcessedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncStatusDto',
      'pending': pending,
      'syncing': syncing,
      'synced': synced,
      'failed': failed,
      'conflict': conflict,
      if (lastProcessedAt != null) 'lastProcessedAt': lastProcessedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncStatusDtoImpl extends SyncStatusDto {
  _SyncStatusDtoImpl({
    required int pending,
    required int syncing,
    required int synced,
    required int failed,
    required int conflict,
    DateTime? lastProcessedAt,
  }) : super._(
         pending: pending,
         syncing: syncing,
         synced: synced,
         failed: failed,
         conflict: conflict,
         lastProcessedAt: lastProcessedAt,
       );

  /// Returns a shallow copy of this [SyncStatusDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SyncStatusDto copyWith({
    int? pending,
    int? syncing,
    int? synced,
    int? failed,
    int? conflict,
    Object? lastProcessedAt = _Undefined,
  }) {
    return SyncStatusDto(
      pending: pending ?? this.pending,
      syncing: syncing ?? this.syncing,
      synced: synced ?? this.synced,
      failed: failed ?? this.failed,
      conflict: conflict ?? this.conflict,
      lastProcessedAt: lastProcessedAt is DateTime?
          ? lastProcessedAt
          : this.lastProcessedAt,
    );
  }
}
