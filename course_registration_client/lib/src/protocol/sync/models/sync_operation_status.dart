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

enum SyncOperationStatus implements _isc.SerializableModel {
  PENDING,
  SYNCING,
  SYNCED,
  FAILED,
  CONFLICT,
  CANCELLED,
  AUTH_REQUIRED;

  static SyncOperationStatus fromJson(String name) {
    switch (name) {
      case 'PENDING':
        return SyncOperationStatus.PENDING;
      case 'SYNCING':
        return SyncOperationStatus.SYNCING;
      case 'SYNCED':
        return SyncOperationStatus.SYNCED;
      case 'FAILED':
        return SyncOperationStatus.FAILED;
      case 'CONFLICT':
        return SyncOperationStatus.CONFLICT;
      case 'CANCELLED':
        return SyncOperationStatus.CANCELLED;
      case 'AUTH_REQUIRED':
        return SyncOperationStatus.AUTH_REQUIRED;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "SyncOperationStatus"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
