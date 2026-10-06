import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lecturer_providers.dart';

class LecturerSchedulePage extends ConsumerWidget {
  const LecturerSchedulePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Thời khóa biểu giảng dạy')),
    body: ref
        .watch(scheduleProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (items) => ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text('${item.dayOfWeek}')),
                  title: Text(
                    'Thứ ${item.dayOfWeek} • Tiết ${item.startPeriod}-${item.endPeriod}',
                  ),
                  subtitle: Text(
                    '${item.room} • ${item.status.name.toUpperCase()}',
                  ),
                ),
              );
            },
          ),
        ),
  );
}
