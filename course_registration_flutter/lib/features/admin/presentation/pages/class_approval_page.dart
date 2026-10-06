import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/admin_providers.dart';

class ClassApprovalPage extends ConsumerWidget {
  const ClassApprovalPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Duyệt lớp học phần')),
    body: ref
        .watch(approvalProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (items) => items.isEmpty
              ? const Center(child: Text('Không có lớp chờ duyệt.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
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
                            Text(
                              '${item.classCode} • GV ${item.lecturerName} • ${item.capacity} sinh viên',
                            ),
                            for (final schedule in item.proposals)
                              Text(
                                'Thứ ${schedule.dayOfWeek}, tiết ${schedule.startPeriod}-${schedule.endPeriod}, ${schedule.room}',
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () =>
                                      _decide(ref, item.courseClassId, false),
                                  child: const Text('REJECT'),
                                ),
                                FilledButton(
                                  onPressed: () =>
                                      _decide(ref, item.courseClassId, true),
                                  child: const Text('APPROVE'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
  );
  Future<void> _decide(WidgetRef ref, dynamic id, bool approve) async {
    await ref.read(adminRepositoryProvider).decideClass(id, approve, null);
    ref.invalidate(approvalProvider);
    ref.invalidate(adminProvider);
  }
}
