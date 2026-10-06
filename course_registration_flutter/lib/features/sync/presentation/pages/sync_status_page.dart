import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/providers.dart';

class SyncStatusPage extends ConsumerWidget {
  const SyncStatusPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(syncStatusProvider);
    final operations = ref.watch(pendingOperationsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Trạng thái đồng bộ')),
      body: status.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (value) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              value.lastSynchronized == null
                  ? 'Chưa đồng bộ'
                  : 'Đồng bộ gần nhất: ${value.lastSynchronized!.toLocal()}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _Count('Đang chờ', value.pending, Colors.orange),
                _Count('Đang đồng bộ', value.syncing, Colors.blue),
                _Count('Thất bại', value.failed, Colors.red),
                _Count('Xung đột', value.conflict, Colors.deepOrange),
                _Count('Đã đồng bộ', value.synced, Colors.green),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              key: const Key('sync-now'),
              onPressed: value.running
                  ? null
                  : () => ref.read(syncManagerProvider).synchronize(),
              icon: value.running
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.sync),
              label: const Text('Đồng bộ ngay'),
            ),
            const SizedBox(height: 20),
            Text(
              'Lịch sử thao tác',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            operations.when(
              loading: () => const LinearProgressIndicator(),
              error: (error, _) => Text('$error'),
              data: (items) => Column(
                children: items
                    .map(
                      (item) => ListTile(
                        leading: Icon(_icon(item.status)),
                        title: Text(item.action),
                        subtitle: Text(
                          '${item.createdAt.toLocal()}\n${item.lastError ?? item.errorCode ?? ''}',
                        ),
                        isThreeLine: item.lastError != null,
                        trailing:
                            item.status == 'FAILED' ||
                                item.status == 'AUTH_REQUIRED'
                            ? IconButton(
                                tooltip: 'Thử lại',
                                onPressed: () => ref
                                    .read(syncManagerProvider)
                                    .retryOperation(item.id),
                                icon: const Icon(Icons.refresh),
                              )
                            : Chip(label: Text(item.status)),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _icon(String status) => switch (status) {
    'SYNCED' => Icons.check_circle,
    'FAILED' => Icons.error,
    'CONFLICT' => Icons.warning,
    'SYNCING' => Icons.sync,
    _ => Icons.schedule,
  };
}

class _Count extends StatelessWidget {
  const _Count(this.label, this.value, this.color);
  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) => Chip(
    avatar: CircleAvatar(
      backgroundColor: color,
      child: Text('$value', style: const TextStyle(color: Colors.white)),
    ),
    label: Text(label),
  );
}
