import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lecturer_providers.dart';

class ClassDemandPage extends ConsumerWidget {
  const ClassDemandPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Nhu cầu mở lớp')),
    body: ref
        .watch(classDemandProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (items) {
            final max = items.fold<int>(
              1,
              (value, item) =>
                  item.requestCount > value ? item.requestCount : value,
            );
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.courseCode} - ${item.courseName}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text('${item.requestCount} sinh viên yêu cầu'),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(value: item.requestCount / max),
                        const SizedBox(height: 8),
                        Text(item.recommendation),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
  );
}
