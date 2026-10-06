import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/sync/sync_models.dart';
import '../../../../shared/services/providers.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final network = ref.watch(networkStatusProvider).asData?.value;
    final sync = ref.watch(syncStatusProvider).asData?.value;
    final offline = network == NetworkStatus.offline;
    final pending = sync?.pending ?? 0;
    return Column(
      children: [
        if (offline || pending > 0)
          Material(
            color: offline
                ? Theme.of(context).colorScheme.errorContainer
                : Theme.of(context).colorScheme.tertiaryContainer,
            child: SafeArea(
              bottom: false,
              child: InkWell(
                onTap: () => context.push('/sync'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Icon(offline ? Icons.cloud_off : Icons.sync),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          offline
                              ? 'Offline — Dữ liệu đang được lưu trên thiết bị.${pending > 0 ? ' $pending thao tác đang chờ đồng bộ.' : ''}'
                              : '$pending thao tác đang chờ đồng bộ',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        Expanded(child: child),
      ],
    );
  }
}
