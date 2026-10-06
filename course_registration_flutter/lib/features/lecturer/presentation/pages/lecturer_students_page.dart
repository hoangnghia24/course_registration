import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/lecturer_providers.dart';

class LecturerStudentsPage extends ConsumerWidget {
  const LecturerStudentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Sinh viên theo lớp')),
    body: ref
        .watch(courseClassProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (classes) => classes.isEmpty
              ? const Center(child: Text('Chưa có lớp học phần.'))
              : ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: classes.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = classes[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.groups)),
                        title: Text('${item.courseCode} - ${item.courseName}'),
                        subtitle: Text(
                          '${item.classCode} • ${item.registeredCount}/${item.capacity} sinh viên',
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => context.push(
                          '/lecturer/classes/students',
                          extra: item,
                        ),
                      ),
                    );
                  },
                ),
        ),
  );
}
