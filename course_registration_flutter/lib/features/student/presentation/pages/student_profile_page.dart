import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/providers.dart';
import '../providers/student_providers.dart';
import '../widgets/student_async_error.dart';

class StudentProfilePage extends ConsumerWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(studentProfileProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Hồ sơ cá nhân')),
      body: profile.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(studentProfileProvider),
        ),
        data: (student) => _ProfileContent(
          student: student,
          onEditName: () async {
            final name = await showDialog<String>(
              context: context,
              builder: (_) => _EditNameDialog(initialName: student.fullName),
            );
            if (name == null || !context.mounted) return;
            try {
              await ref
                  .read(authStateControllerProvider)
                  .refreshProfile(fullName: name);
              ref.invalidate(studentProfileProvider);
              await ref.read(studentProfileProvider.future);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã cập nhật họ tên.')),
                );
              }
            } catch (_) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Không thể cập nhật họ tên. Vui lòng thử lại.',
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.student, required this.onEditName});

  final StudentProfileDto student;
  final VoidCallback onEditName;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Center(
        child: CircleAvatar(
          radius: 48,
          backgroundImage: student.avatar?.isNotEmpty == true
              ? NetworkImage(student.avatar!)
              : null,
          child: student.avatar?.isNotEmpty == true
              ? null
              : const Icon(Icons.person_outline, size: 48),
        ),
      ),
      const SizedBox(height: 20),
      _ProfileTile(label: 'Họ tên', value: student.fullName),
      Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: onEditName,
          icon: const Icon(Icons.edit_outlined),
          label: const Text('Sửa họ tên'),
        ),
      ),
      _ProfileTile(label: 'MSSV', value: student.studentCode),
      _ProfileTile(label: 'Email', value: student.email),
      _ProfileTile(label: 'Ngành', value: student.majorName),
      _ProfileTile(label: 'Khoa', value: student.facultyName),
      _ProfileTile(label: 'Khóa học', value: student.academicYear.toString()),
      _ProfileTile(label: 'Chương trình', value: student.trainingProgramName),
      _ProfileTile(
        label: 'Học kỳ hiện tại',
        value: student.currentSemester.toString(),
      ),
    ],
  );
}

class _EditNameDialog extends StatefulWidget {
  const _EditNameDialog({required this.initialName});

  final String initialName;

  @override
  State<_EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<_EditNameDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Sửa họ tên'),
    content: Form(
      key: _formKey,
      child: TextFormField(
        key: const Key('student-name-input'),
        controller: _name,
        autofocus: true,
        maxLength: 120,
        decoration: const InputDecoration(labelText: 'Họ tên'),
        validator: (value) {
          final name = value?.trim() ?? '';
          if (name.isEmpty) return 'Vui lòng nhập họ tên';
          if (name.length < 2) return 'Họ tên phải có ít nhất 2 ký tự';
          return null;
        },
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Hủy'),
      ),
      FilledButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pop(context, _name.text.trim());
          }
        },
        child: const Text('Lưu'),
      ),
    ],
  );
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(label),
    subtitle: Text(value, style: Theme.of(context).textTheme.titleMedium),
  );
}
