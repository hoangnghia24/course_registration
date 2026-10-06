import '../../generated/protocol.dart';
import 'sync_error_codes.dart';

abstract final class ConflictResolver {
  static SyncOperationStatus statusFor(String? errorCode) =>
      switch (errorCode) {
        SyncErrorCodes.versionConflict => SyncOperationStatus.CONFLICT,
        SyncErrorCodes.authRequired => SyncOperationStatus.AUTH_REQUIRED,
        null => SyncOperationStatus.SYNCED,
        _ => SyncOperationStatus.FAILED,
      };

  static bool isRetryable(String? errorCode) =>
      errorCode == SyncErrorCodes.networkError ||
      errorCode == SyncErrorCodes.serverError;
}
