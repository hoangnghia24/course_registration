import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
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
    final value = await showDialog<(String, int)>(
      context: context,
      builder: (_) => _CourseClassEditDialog(item: item),
    );
    if (value == null || !context.mounted) return;
    await ref
        .read(lecturerRepositoryProvider)
        .updateClass(
          courseClassId: item.courseClassId,
          classCode: value.$1,
          capacity: value.$2,
          status: item.status,
        );
    ref.invalidate(courseClassProvider);
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

class _CourseClassEditDialog extends StatefulWidget {
  const _CourseClassEditDialog({required this.item});

  final LecturerCourseClassDto item;

  @override
  State<_CourseClassEditDialog> createState() =>
      _CourseClassEditDialogState();
}

class _CourseClassEditDialogState extends State<_CourseClassEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _code;
  late final TextEditingController _capacity;

  @override
  void initState() {
    super.initState();
    _code = TextEditingController(text: widget.item.classCode);
    _capacity = TextEditingController(text: '${widget.item.capacity}');
  }

  @override
  void dispose() {
    _code.dispose();
    _capacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Sửa lớp học phần'),
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    content: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _code,
              decoration: const InputDecoration(labelText: 'Mã lớp'),
              validator: (value) =>
                  (value?.trim().isEmpty ?? true) ? 'Bắt buộc' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _capacity,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Sĩ số',
                helperText:
                    'Từ ${widget.item.registeredCount} đến 500 sinh viên',
              ),
              validator: (value) {
                final capacity = int.tryParse(value ?? '');
                if (capacity == null) return 'Vui lòng nhập sĩ số';
                if (capacity < widget.item.registeredCount || capacity > 500) {
                  return 'Sĩ số phải từ ${widget.item.registeredCount} đến 500';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Hủy'),
      ),
      FilledButton(
        onPressed: () {
          if (!_formKey.currentState!.validate()) return;
          Navigator.pop(context, (
            _code.text.trim(),
            int.parse(_capacity.text),
          ));
        },
        child: const Text('Lưu'),
      ),
    ],
  );
}
