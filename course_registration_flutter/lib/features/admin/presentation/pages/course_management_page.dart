import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import '../../../../core/network/error_handler.dart';
import '../../../../core/presentation/app_labels.dart';
import '../providers/admin_providers.dart';

class CourseManagementPage extends ConsumerStatefulWidget {
  const CourseManagementPage({super.key});
  @override
  ConsumerState<CourseManagementPage> createState() =>
      _CourseManagementPageState();
}

class _CourseManagementPageState extends ConsumerState<CourseManagementPage> {
  bool _saving = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Quản lý môn học'),
      actions: [
        IconButton(
          tooltip: 'Tạo môn học',
          onPressed: _saving ? null : _create,
          icon: const Icon(Icons.add),
        ),
      ],
    ),
    body: ref
        .watch(courseManagementProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text('Không thể tải danh sách môn học: $error'),
            ),
          ),
          data: _courseList,
        ),
  );

  Widget _courseList(List<Course> items) => LayoutBuilder(
    builder: (context, constraints) {
      if (items.isEmpty) return const Center(child: Text('Chưa có môn học.'));
      if (constraints.maxWidth < 600) {
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (_, index) => _courseCard(items[index]),
        );
      }
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 28,
              columns: const [
                DataColumn(label: Text('Mã môn')),
                DataColumn(label: Text('Tên môn')),
                DataColumn(label: Text('Tín chỉ')),
                DataColumn(label: Text('Loại')),
                DataColumn(label: Text('Thao tác')),
              ],
              rows: items.map(_courseRow).toList(),
            ),
          ),
        ),
      );
    },
  );

  Widget _courseCard(Course item) => Card(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.courseCode, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          Text(item.courseName, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              Chip(label: Text('${item.credits} tín chỉ')),
              Chip(label: Text(_courseType(item.courseType))),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 4,
              children: [
                IconButton(
                  tooltip: 'Chỉnh sửa',
                  onPressed: _saving ? null : () => _edit(item),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  tooltip: 'Xóa môn học',
                  onPressed: _saving ? null : () => _delete(item),
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  DataRow _courseRow(Course item) => DataRow(
    cells: [
      DataCell(Text(item.courseCode)),
      DataCell(Text(item.courseName)),
      DataCell(Text('${item.credits}')),
      DataCell(Text(_courseType(item.courseType))),
      DataCell(
        Row(
          children: [
            IconButton(
              tooltip: 'Chỉnh sửa',
              onPressed: _saving ? null : () => _edit(item),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              tooltip: 'Xóa môn học',
              onPressed: _saving ? null : () => _delete(item),
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    ],
  );

  String _courseType(CourseType type) => AppLabels.courseType(type);

  Future<void> _create() async {
    final value = await _dialog(null);
    if (value == null) return;
    await _save(
      () => ref
          .read(adminRepositoryProvider)
          .createCourse(value.$1, value.$2, value.$3),
      success: 'Đã tạo môn học.',
    );
  }

  Future<void> _edit(Course item) async {
    final value = await _dialog(item);
    if (value == null) return;
    await _save(
      () => ref
          .read(adminRepositoryProvider)
          .updateCourse(
            item.copyWith(
              courseName: value.$1,
              credits: value.$2,
              courseType: value.$3,
            ),
          ),
      success: 'Đã cập nhật môn học.',
    );
  }

  Future<void> _delete(Course item) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa môn học?'),
        content: Text('${item.courseCode} - ${item.courseName}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    await _save(
      () => ref.read(adminRepositoryProvider).deleteCourse(item.id!),
      success: 'Đã xóa môn học.',
    );
  }

  Future<void> _save(
    Future<void> Function() operation, {
    required String success,
  }) async {
    setState(() => _saving = true);
    try {
      await operation();
      final _ = await ref.refresh(courseManagementProvider.future);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(success)));
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  Future<(String, int, CourseType)?> _dialog(Course? item) async {
    return showDialog<(String, int, CourseType)>(
      context: context,
      builder: (_) => _CourseDialog(item: item),
    );
  }
}

class _CourseDialog extends StatefulWidget {
  const _CourseDialog({this.item});

  final Course? item;

  @override
  State<_CourseDialog> createState() => _CourseDialogState();
}

class _CourseDialogState extends State<_CourseDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _credits;
  late CourseType _type;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.item?.courseName);
    _credits = TextEditingController(text: '${widget.item?.credits ?? 3}');
    _type = widget.item?.courseType ?? CourseType.compulsory;
  }

  @override
  void dispose() {
    _name.dispose();
    _credits.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    title: Text(widget.item == null ? 'Tạo môn học' : 'Sửa môn học'),
    content: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Tên môn'),
              validator: (value) => value!.trim().isEmpty ? 'Bắt buộc' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _credits,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Tín chỉ',
                helperText: 'Nhập từ 1 đến 10 tín chỉ',
              ),
              validator: (value) {
                final parsed = int.tryParse(value?.trim() ?? '');
                if (parsed == null) return 'Vui lòng nhập số tín chỉ';
                if (parsed < 1 || parsed > 10) {
                  return 'Tín chỉ phải nằm trong khoảng 1–10';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<CourseType>(
              initialValue: _type,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Loại môn'),
              items: CourseType.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(AppLabels.courseType(value)),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _type = value!),
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
            _name.text.trim(),
            int.parse(_credits.text),
            _type,
          ));
        },
        child: const Text('Lưu'),
      ),
    ],
  );
}
