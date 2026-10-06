enum NetworkStatus { online, offline }

abstract final class NetworkTransition {
  static bool triggersSync(NetworkStatus previous, NetworkStatus current) =>
      previous == NetworkStatus.offline && current == NetworkStatus.online;
}

class SyncStatusState {
  const SyncStatusState({
    this.lastSynchronized,
    this.pending = 0,
    this.syncing = 0,
    this.failed = 0,
    this.synced = 0,
    this.conflict = 0,
    this.running = false,
  });

  final DateTime? lastSynchronized;
  final int pending;
  final int syncing;
  final int failed;
  final int synced;
  final int conflict;
  final bool running;

  SyncStatusState copyWith({
    DateTime? lastSynchronized,
    int? pending,
    int? syncing,
    int? failed,
    int? synced,
    int? conflict,
    bool? running,
  }) => SyncStatusState(
    lastSynchronized: lastSynchronized ?? this.lastSynchronized,
    pending: pending ?? this.pending,
    syncing: syncing ?? this.syncing,
    failed: failed ?? this.failed,
    synced: synced ?? this.synced,
    conflict: conflict ?? this.conflict,
    running: running ?? this.running,
  );
}
