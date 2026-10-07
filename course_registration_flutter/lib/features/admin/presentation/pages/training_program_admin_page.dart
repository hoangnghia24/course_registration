import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_handler.dart';
import '../providers/admin_providers.dart';

class TrainingProgramAdminPage extends ConsumerWidget {
  const TrainingProgramAdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final majors = ref.watch(majorsAdminProvider);
    final programs = ref.watch(trainingProgramsAdminProvider);
    final courses = ref.watch(courseManagementProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Chương trình đào tạo')),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('add-training-program'),
        onPressed: majors.value?.isNotEmpty == true
            ? () => _editProgram(context, ref, majors.requireValue)
            : null,
        icon: const Icon(Icons.add),
        label: const Text('Thêm chương trình'),
      ),
      body: majors.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(ErrorHandler.message(error))),
        data: (majorItems) => programs.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text(ErrorHandler.message(error))),
          data: (programItems) => courses.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) =>
                Center(child: Text(ErrorHandler.message(error))),
            data: (courseItems) => programItems.isEmpty
                ? const Center(child: Text('Chưa có chương trình đào tạo.'))
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 96),
                    itemCount: programItems.length,
                    itemBuilder: (context, index) {
                      final program = programItems[index];
                      final major = majorItems.firstWhere(
                        (item) => item.id == program.majorId,
                      );
                      return _ProgramCard(
                        program: program,
                        major: major,
                        courses: courseItems,
                        onEdit: () => _editProgram(
                          context,
                          ref,
                          majorItems,
                          program: program,
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _editProgram(
    BuildContext context,
    WidgetRef ref,
    List<Major> majors, {
    TrainingProgram? program,
  }) async {
    final value = await showDialog<_ProgramFormValue>(
      context: context,
      builder: (_) => _ProgramDialog(majors: majors, program: program),
    );
    if (value == null || !context.mounted) return;
    try {
      final repository = ref.read(adminRepositoryProvider);
      if (program == null) {
        await repository.createProgram(
          majorId: value.majorId,
          code: value.code,
          name: value.name,
          academicYear: value.academicYear,
          totalCredits: value.totalCredits,
          semesterCount: value.semesterCount,
          status: value.status,
        );
      } else {
        await repository.updateProgram(
          program.copyWith(
            code: value.code,
            name: value.name,
            academicYear: value.academicYear,
            totalCredits: value.totalCredits,
            semesterCount: value.semesterCount,
            status: value.status,
          ),
        );
      }
      ref.invalidate(trainingProgramsAdminProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã lưu chương trình đào tạo.')),
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

class _ProgramCard extends ConsumerWidget {
  const _ProgramCard({
    required this.program,
    required this.major,
    required this.courses,
    required this.onEdit,
  });
  final TrainingProgram program;
  final Major major;
  final List<Course> courses;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mappings = ref.watch(programCoursesAdminProvider(program.id!));
    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.account_tree),
        title: Text('${program.code} • ${program.name}'),
        subtitle: Text(
          '${major.name} • Khóa ${program.academicYear} • '
          '${program.semesterCount} học kỳ • ${program.totalCredits} tín chỉ • '
          '${_programStatusLabel(program.status)}',
        ),
        trailing: IconButton(
          tooltip: 'Sửa chương trình',
          onPressed: onEdit,
          icon: const Icon(Icons.edit_outlined),
        ),
        children: [
          mappings.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
            error: (error, _) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text(ErrorHandler.message(error)),
            ),
            data: (items) => Column(
              children: [
                for (
                  var semester = 1;
                  semester <= program.semesterCount;
                  semester++
                )
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 40, right: 16),
                    title: Text(
                      'Năm ${(semester + 1) ~/ 2} • Học kỳ $semester',
                    ),
                    subtitle: Text(_semesterCourses(items, semester)),
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: OutlinedButton.icon(
                      onPressed: courses.isEmpty
                          ? null
                          : () => _assignCourse(context, ref),
                      icon: const Icon(Icons.playlist_add),
                      label: const Text('Gán môn học'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _semesterCourses(List<TrainingProgramCourse> mappings, int semester) {
    final byId = {for (final course in courses) course.id!: course};
    final values = mappings.where((item) => item.semesterNumber == semester);
    if (values.isEmpty) return 'Chưa có môn học';
    return values
        .map((item) {
          final course = byId[item.courseId];
          return '${course?.courseCode ?? '?'} (${course?.credits ?? 0} TC, '
              '${item.isRequired ? 'bắt buộc' : 'tự chọn'})';
        })
        .join(' • ');
  }

  Future<void> _assignCourse(BuildContext context, WidgetRef ref) async {
    final value = await showDialog<(UuidValue, int, bool)>(
      context: context,
      builder: (_) => _CourseAssignmentDialog(
        courses: courses,
        semesterCount: program.semesterCount,
      ),
    );
    if (value == null || !context.mounted) return;
    try {
      await ref
          .read(adminRepositoryProvider)
          .setProgramCourse(
            programId: program.id!,
            courseId: value.$1,
            semesterNumber: value.$2,
            isRequired: value.$3,
          );
      ref.invalidate(programCoursesAdminProvider(program.id!));
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    }
  }
}

class _ProgramDialog extends StatefulWidget {
  const _ProgramDialog({required this.majors, this.program});
  final List<Major> majors;
  final TrainingProgram? program;

  @override
  State<_ProgramDialog> createState() => _ProgramDialogState();
}

class _ProgramDialogState extends State<_ProgramDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _code;
  late final TextEditingController _name;
  late final TextEditingController _year;
  late final TextEditingController _credits;
  late final TextEditingController _semesters;
  late UuidValue _majorId;
  late TrainingProgramStatus _status;

  @override
  void initState() {
    super.initState();
    final value = widget.program;
    _code = TextEditingController(text: value?.code ?? '');
    _name = TextEditingController(text: value?.name ?? '');
    _year = TextEditingController(
      text: (value?.academicYear ?? DateTime.now().year).toString(),
    );
    _credits = TextEditingController(
      text: (value?.totalCredits ?? 130).toString(),
    );
    _semesters = TextEditingController(
      text: (value?.semesterCount ?? 8).toString(),
    );
    _majorId = value?.majorId ?? widget.majors.first.id!;
    _status = value?.status ?? TrainingProgramStatus.draft;
  }

  @override
  void dispose() {
    _code.dispose();
    _name.dispose();
    _year.dispose();
    _credits.dispose();
    _semesters.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      widget.program == null ? 'Thêm chương trình' : 'Sửa chương trình',
    ),
    content: SizedBox(
      width: 520,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<UuidValue>(
                initialValue: _majorId,
                decoration: const InputDecoration(labelText: 'Ngành'),
                items: widget.majors
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.id,
                        child: Text(item.name),
                      ),
                    )
                    .toList(),
                onChanged: widget.program == null
                    ? (value) => _majorId = value!
                    : null,
              ),
              _text(_code, 'Mã chương trình', _required),
              _text(_name, 'Tên chương trình', _required),
              _text(
                _year,
                'Khóa tuyển sinh',
                (value) => _range(value, 2000, 2100),
                number: true,
              ),
              _text(
                _credits,
                'Tổng tín chỉ',
                (value) => _range(value, 1, 300),
                number: true,
              ),
              _text(
                _semesters,
                'Số học kỳ',
                (value) => _range(value, 1, 20),
                number: true,
              ),
              DropdownButtonFormField<TrainingProgramStatus>(
                initialValue: _status,
                decoration: const InputDecoration(labelText: 'Trạng thái'),
                items: TrainingProgramStatus.values
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(_programStatusLabel(item)),
                      ),
                    )
                    .toList(),
                onChanged: (value) => _status = value!,
              ),
            ],
          ),
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Hủy'),
      ),
      FilledButton(onPressed: _submit, child: const Text('Lưu')),
    ],
  );

  Widget _text(
    TextEditingController controller,
    String label,
    String? Function(String?) validator, {
    bool number = false,
  }) => TextFormField(
    controller: controller,
    keyboardType: number ? TextInputType.number : TextInputType.text,
    decoration: InputDecoration(labelText: label),
    validator: validator,
  );

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      _ProgramFormValue(
        majorId: _majorId,
        code: _code.text.trim().toUpperCase(),
        name: _name.text.trim(),
        academicYear: int.parse(_year.text),
        totalCredits: int.parse(_credits.text),
        semesterCount: int.parse(_semesters.text),
        status: _status,
      ),
    );
  }

  String? _required(String? value) =>
      value == null || value.trim().isEmpty ? 'Không được để trống' : null;
  String? _range(String? value, int min, int max) {
    final number = int.tryParse(value ?? '');
    return number == null || number < min || number > max
        ? 'Giá trị phải từ $min đến $max'
        : null;
  }
}

class _CourseAssignmentDialog extends StatefulWidget {
  const _CourseAssignmentDialog({
    required this.courses,
    required this.semesterCount,
  });
  final List<Course> courses;
  final int semesterCount;

  @override
  State<_CourseAssignmentDialog> createState() =>
      _CourseAssignmentDialogState();
}

class _CourseAssignmentDialogState extends State<_CourseAssignmentDialog> {
  late UuidValue _courseId = widget.courses.first.id!;
  int _semester = 1;
  bool _required = true;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Gán môn vào chương trình'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonFormField<UuidValue>(
          initialValue: _courseId,
          decoration: const InputDecoration(labelText: 'Môn học'),
          items: widget.courses
              .map(
                (item) => DropdownMenuItem(
                  value: item.id,
                  child: Text('${item.courseCode} • ${item.courseName}'),
                ),
              )
              .toList(),
          onChanged: (value) => _courseId = value!,
        ),
        DropdownButtonFormField<int>(
          initialValue: _semester,
          decoration: const InputDecoration(labelText: 'Học kỳ đề xuất'),
          items: List.generate(widget.semesterCount, (index) => index + 1)
              .map(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text('Học kỳ $value'),
                ),
              )
              .toList(),
          onChanged: (value) => _semester = value!,
        ),
        SwitchListTile(
          value: _required,
          title: const Text('Môn bắt buộc'),
          onChanged: (value) => setState(() => _required = value),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Hủy'),
      ),
      FilledButton(
        onPressed: () =>
            Navigator.pop(context, (_courseId, _semester, _required)),
        child: const Text('Lưu'),
      ),
    ],
  );
}

class _ProgramFormValue {
  const _ProgramFormValue({
    required this.majorId,
    required this.code,
    required this.name,
    required this.academicYear,
    required this.totalCredits,
    required this.semesterCount,
    required this.status,
  });
  final UuidValue majorId;
  final String code;
  final String name;
  final int academicYear;
  final int totalCredits;
  final int semesterCount;
  final TrainingProgramStatus status;
}

String _programStatusLabel(TrainingProgramStatus status) => switch (status) {
  TrainingProgramStatus.draft => 'Nháp',
  TrainingProgramStatus.active => 'Đang áp dụng',
  TrainingProgramStatus.archived => 'Lưu trữ',
};
