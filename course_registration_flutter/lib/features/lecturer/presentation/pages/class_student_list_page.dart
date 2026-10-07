import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_handler.dart';
import '../providers/lecturer_providers.dart';

class ClassStudentListPage extends ConsumerWidget {
  const ClassStudentListPage({required this.courseClass, super.key});
  final LecturerCourseClassDto courseClass;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: Text('Sinh viên ${courseClass.classCode}')),
    body: ref
        .watch(studentListProvider(courseClass.courseClassId))
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ErrorHandler.message(error),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () => ref.invalidate(
                      studentListProvider(courseClass.courseClassId),
                    ),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Thử lại'),
                  ),
                ],
              ),
            ),
          ),
          data: (items) => items.isEmpty
              ? const Center(child: Text('Lớp chưa có sinh viên đăng ký.'))
              : ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.groups),
                        title: Text(
                          '${courseClass.courseCode} - ${courseClass.courseName}',
                        ),
                        subtitle: Text(
                          'Sĩ số: ${items.length}/${courseClass.capacity} • Chọn sinh viên để nhập điểm',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    for (final student in items)
                      Card(
                        child: ListTile(
                          isThreeLine: true,
                          leading: CircleAvatar(
                            child: Text(
                              student.fullName.trim().isEmpty
                                  ? '?'
                                  : student.fullName.trim()[0],
                            ),
                          ),
                          title: Text(
                            '${student.studentCode} - ${student.fullName}',
                          ),
                          subtitle: Text(
                            '${student.majorName} • ${student.email}\n'
                            'Giữa kỳ: ${_score(student.midtermScore)} • Cuối kỳ: ${_score(student.finalScore)}',
                          ),
                          trailing: IconButton(
                            tooltip: 'Nhập điểm',
                            icon: const Icon(Icons.edit_note),
                            onPressed: () => _editGrades(context, ref, student),
                          ),
                          onTap: () => _editGrades(context, ref, student),
                        ),
                      ),
                  ],
                ),
        ),
  );

  static String _score(double? value) =>
      value == null ? 'Chưa nhập' : value.toStringAsFixed(1);

  Future<void> _editGrades(
    BuildContext context,
    WidgetRef ref,
    ClassStudentDto student,
  ) async {
    final result = await showDialog<(double, double)>(
      context: context,
      builder: (_) => _GradeDialog(student: student),
    );
    if (result == null || !context.mounted) return;
    try {
      await ref
          .read(lecturerRepositoryProvider)
          .updateStudentGrades(
            courseClassId: courseClass.courseClassId,
            studentId: student.studentId,
            midtermScore: result.$1,
            finalScore: result.$2,
          );
      ref.invalidate(studentListProvider(courseClass.courseClassId));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đã lưu điểm cho ${student.fullName}.')),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    }
  }
}

class _GradeDialog extends StatefulWidget {
  const _GradeDialog({required this.student});
  final ClassStudentDto student;

  @override
  State<_GradeDialog> createState() => _GradeDialogState();
}

class _GradeDialogState extends State<_GradeDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _midterm;
  late final TextEditingController _finalScore;

  @override
  void initState() {
    super.initState();
    _midterm = TextEditingController(
      text: widget.student.midtermScore?.toString(),
    );
    _finalScore = TextEditingController(
      text: widget.student.finalScore?.toString(),
    );
  }

  @override
  void dispose() {
    _midterm.dispose();
    _finalScore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Nhập điểm ${widget.student.studentCode}'),
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _scoreField(_midterm, 'Điểm giữa kỳ'),
          const SizedBox(height: 12),
          _scoreField(_finalScore, 'Điểm cuối kỳ'),
          const SizedBox(height: 8),
          const Text('Thang điểm 10 • Giữa kỳ 40% • Cuối kỳ 60%'),
        ],
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
            double.parse(_midterm.text.replaceAll(',', '.')),
            double.parse(_finalScore.text.replaceAll(',', '.')),
          ));
        },
        child: const Text('Lưu điểm'),
      ),
    ],
  );

  Widget _scoreField(TextEditingController controller, String label) =>
      TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}([.,]\d?)?')),
        ],
        decoration: InputDecoration(labelText: label),
        validator: (value) {
          final score = double.tryParse((value ?? '').replaceAll(',', '.'));
          if (score == null || score < 0 || score > 10) {
            return 'Điểm phải từ 0 đến 10';
          }
          return null;
        },
      );
}
