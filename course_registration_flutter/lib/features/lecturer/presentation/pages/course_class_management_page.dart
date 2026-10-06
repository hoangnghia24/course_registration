import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/lecturer_providers.dart';

class CourseClassManagementPage extends ConsumerWidget {
  const CourseClassManagementPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classes = ref.watch(courseClassProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý lớp học phần'),
        actions: [
          IconButton(
            onPressed: () => context.push('/lecturer/classes/create'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: classes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(courseClassProvider),
        ),
        data: (items) => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.courseCode} - ${item.courseName}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${item.semesterName} ${item.academicYear} • ${item.classCode}',
                    ),
                    Text('${item.registeredCount}/${item.capacity} sinh viên'),
                    Wrap(
                      children: [
                        TextButton(
                          onPressed: () => context.push(
                            '/lecturer/classes/students',
                            extra: item,
                          ),
                          child: const Text('Chi tiết'),
                        ),
                        TextButton(
                          onPressed: () => _edit(context, ref, item),
                          child: const Text('Sửa'),
                        ),
                        TextButton(
                          onPressed: () => _delete(context, ref, item),
                          child: const Text('Xóa'),
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
  }

  Future<void> _edit(
    BuildContext context,
    WidgetRef ref,
    LecturerCourseClassDto item,
  ) async {
    final code = TextEditingController(text: item.classCode);
    final capacity = TextEditingController(text: '${item.capacity}');
    final save = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sửa lớp học phần'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: code,
              decoration: const InputDecoration(labelText: 'Mã lớp'),
            ),
            TextField(
              controller: capacity,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Sĩ số'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
    if (save == true) {
      await ref
          .read(lecturerRepositoryProvider)
          .updateClass(
            courseClassId: item.courseClassId,
            classCode: code.text,
            capacity: int.tryParse(capacity.text) ?? item.capacity,
            status: item.status,
          );
      ref.invalidate(courseClassProvider);
    }
    code.dispose();
    capacity.dispose();
  }

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    LecturerCourseClassDto item,
  ) async {
    await ref.read(lecturerRepositoryProvider).deleteClass(item.courseClassId);
    ref.invalidate(courseClassProvider);
  }
}
