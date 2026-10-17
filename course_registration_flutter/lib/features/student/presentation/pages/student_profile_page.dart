import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        data: (student) => _ProfileContent(student: student),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.student});

  final StudentProfileDto student;

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
