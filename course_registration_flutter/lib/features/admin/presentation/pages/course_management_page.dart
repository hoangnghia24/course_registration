import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/admin_providers.dart';

class CourseManagementPage extends ConsumerWidget {
  const CourseManagementPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(
      title: const Text('Quản lý môn học'),
      actions: [
        IconButton(
          onPressed: () => _create(context, ref),
          icon: const Icon(Icons.add),
        ),
      ],
    ),
    body: ref
        .watch(courseManagementProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (items) => SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Mã môn')),
                  DataColumn(label: Text('Tên môn')),
                  DataColumn(label: Text('Tín chỉ')),
                  DataColumn(label: Text('Loại')),
                  DataColumn(label: Text('Thao tác')),
                ],
                rows: items
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(Text(item.courseCode)),
                          DataCell(Text(item.courseName)),
                          DataCell(Text('${item.credits}')),
                          DataCell(
                            Text(
                              item.courseType == CourseType.compulsory
                                  ? 'Bắt buộc'
                                  : 'Tự chọn',
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => _edit(context, ref, item),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await ref
                                        .read(adminRepositoryProvider)
                                        .deleteCourse(item.id!);
                                    ref.invalidate(courseManagementProvider);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
  );

  Future<void> _create(BuildContext context, WidgetRef ref) async {
    final value = await _dialog(context, null);
    if (value == null) return;
    await ref
        .read(adminRepositoryProvider)
        .createCourse(value.$1, value.$2, value.$3, value.$4);
    ref.invalidate(courseManagementProvider);
  }

  Future<void> _edit(BuildContext context, WidgetRef ref, Course item) async {
    final value = await _dialog(context, item);
    if (value == null) return;
    await ref
        .read(adminRepositoryProvider)
        .updateCourse(
          item.copyWith(
            courseCode: value.$1,
            courseName: value.$2,
            credits: value.$3,
            courseType: value.$4,
          ),
        );
    ref.invalidate(courseManagementProvider);
  }

  Future<(String, String, int, CourseType)?> _dialog(
    BuildContext context,
    Course? item,
  ) async {
    final code = TextEditingController(text: item?.courseCode);
    final name = TextEditingController(text: item?.courseName);
    final credits = TextEditingController(text: '${item?.credits ?? 3}');
    var type = item?.courseType ?? CourseType.compulsory;
    final result = await showDialog<(String, String, int, CourseType)>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(item == null ? 'Tạo môn học' : 'Sửa môn học'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: code,
                decoration: const InputDecoration(labelText: 'Mã môn'),
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Tên môn'),
              ),
              TextField(
                controller: credits,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Tín chỉ'),
              ),
              DropdownButton<CourseType>(
                value: type,
                isExpanded: true,
                items: CourseType.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => type = value!),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, (
                code.text,
                name.text,
                int.tryParse(credits.text) ?? 0,
                type,
              )),
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
    code.dispose();
    name.dispose();
    credits.dispose();
    return result;
  }
}
