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
import 'package:course_registration_server/src/generated/protocol.dart'
    as _i9p8z86v;
import 'package:serverpod/serverpod.dart' as _is;
import '../../sync/dto/sync_change_dto.dart' as _ij7l08vh;

abstract class PullSyncResultDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  PullSyncResultDto._({
    required this.changes,
    required this.deletedEntities,
    required this.serverTimestamp,
  });

  factory PullSyncResultDto({
    required List<_ij7l08vh.SyncChangeDto> changes,
    required List<String> deletedEntities,
    required DateTime serverTimestamp,
  }) = _PullSyncResultDtoImpl;

  factory PullSyncResultDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return PullSyncResultDto(
      changes: _i9p8z86v.Protocol().deserialize<List<_ij7l08vh.SyncChangeDto>>(
        jsonSerialization['changes'],
      ),
      deletedEntities: _i9p8z86v.Protocol().deserialize<List<String>>(
        jsonSerialization['deletedEntities'],
      ),
      serverTimestamp: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['serverTimestamp'],
      ),
    );
  }

  List<_ij7l08vh.SyncChangeDto> changes;

  List<String> deletedEntities;

  DateTime serverTimestamp;

  /// Returns a shallow copy of this [PullSyncResultDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  PullSyncResultDto copyWith({
    List<_ij7l08vh.SyncChangeDto>? changes,
    List<String>? deletedEntities,
    DateTime? serverTimestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PullSyncResultDto',
      'changes': changes.toJson(valueToJson: (v) => v.toJson()),
      'deletedEntities': deletedEntities.toJson(),
      'serverTimestamp': serverTimestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PullSyncResultDto',
      'changes': changes.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'deletedEntities': deletedEntities.toJson(),
      'serverTimestamp': serverTimestamp.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _PullSyncResultDtoImpl extends PullSyncResultDto {
  _PullSyncResultDtoImpl({
    required List<_ij7l08vh.SyncChangeDto> changes,
    required List<String> deletedEntities,
    required DateTime serverTimestamp,
  }) : super._(
         changes: changes,
         deletedEntities: deletedEntities,
         serverTimestamp: serverTimestamp,
       );

  /// Returns a shallow copy of this [PullSyncResultDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  PullSyncResultDto copyWith({
    List<_ij7l08vh.SyncChangeDto>? changes,
    List<String>? deletedEntities,
    DateTime? serverTimestamp,
  }) {
    return PullSyncResultDto(
      changes: changes ?? this.changes.map((e0) => e0.copyWith()).toList(),
      deletedEntities:
          deletedEntities ?? this.deletedEntities.map((e0) => e0).toList(),
      serverTimestamp: serverTimestamp ?? this.serverTimestamp,
    );
  }
}
