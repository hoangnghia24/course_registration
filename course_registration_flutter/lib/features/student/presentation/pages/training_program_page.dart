import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/student_providers.dart';
import '../widgets/student_async_error.dart';

class TrainingProgramPage extends ConsumerStatefulWidget {
  const TrainingProgramPage({super.key});

  @override
  ConsumerState<TrainingProgramPage> createState() =>
      _TrainingProgramPageState();
}

class _TrainingProgramPageState extends ConsumerState<TrainingProgramPage> {
  CourseProgressStatus? _filter;

  @override
  Widget build(BuildContext context) {
    final program = ref.watch(trainingProgramProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Chương trình đào tạo')),
      body: program.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(trainingProgramProvider),
        ),
        data: (courses) {
          final filtered = _filter == null
              ? courses
              : courses
                    .where((course) => course.progressStatus == _filter)
                    .toList();
          final semesters = <int, List<TrainingProgramCourseDto>>{};
          for (final course in filtered) {
            semesters.putIfAbsent(course.semesterNumber, () => []).add(course);
          }
          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    _chip(null, 'Tất cả'),
                    _chip(CourseProgressStatus.completed, 'Đã học'),
                    _chip(CourseProgressStatus.notStarted, 'Chưa học'),
                    _chip(CourseProgressStatus.inProgress, 'Đang học'),
                  ],
                ),
              ),
              Expanded(
                child: semesters.isEmpty
                    ? const Center(child: Text('Không có môn học phù hợp.'))
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          for (final entry in semesters.entries) ...[
                            Text(
                              'Học kỳ ${entry.key}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 6),
                            Card(
                              child: Column(
                                children: entry.value
                                    .map(
                                      (course) => ListTile(
                                        leading: Icon(
                                          _icon(course.progressStatus),
                                          color: _color(
                                            context,
                                            course.progressStatus,
                                          ),
                                        ),
                                        title: Text(course.courseName),
                                        subtitle: Text(
                                          '${course.courseCode} • ${course.credits} tín chỉ • ${course.isRequired ? 'Bắt buộc' : 'Tự chọn'}',
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _chip(CourseProgressStatus? value, String label) {
    final selected = _filter == value;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(color: selected ? colors.onPrimary : null),
        ),
        selected: selected,
        selectedColor: colors.primary,
        checkmarkColor: colors.onPrimary,
        onSelected: (_) => setState(() => _filter = value),
      ),
    );
  }

  IconData _icon(CourseProgressStatus status) => switch (status) {
    CourseProgressStatus.completed => Icons.check_circle,
    CourseProgressStatus.notStarted => Icons.radio_button_unchecked,
    CourseProgressStatus.inProgress => Icons.timelapse,
  };

  Color _color(BuildContext context, CourseProgressStatus status) =>
      switch (status) {
        CourseProgressStatus.completed => Colors.green,
        CourseProgressStatus.notStarted => Theme.of(
          context,
        ).colorScheme.outline,
        CourseProgressStatus.inProgress => Colors.orange,
      };
}
