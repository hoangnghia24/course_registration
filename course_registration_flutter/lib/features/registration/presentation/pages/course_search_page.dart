import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../student/presentation/providers/student_providers.dart';
import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/course_registration_providers.dart';

enum _SearchBy { code, name, credits, major }

class CourseSearchPage extends ConsumerStatefulWidget {
  const CourseSearchPage({super.key});

  @override
  ConsumerState<CourseSearchPage> createState() => _CourseSearchPageState();
}

class _CourseSearchPageState extends ConsumerState<CourseSearchPage> {
  final _search = TextEditingController();
  _SearchBy _searchBy = _SearchBy.code;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final classes = ref.watch(availableOpenClassesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lớp học phần đang mở'),
        actions: [
          IconButton(
            tooltip: 'Yêu cầu mở lớp',
            onPressed: _showOpeningRequest,
            icon: const Icon(Icons.outgoing_mail),
          ),
        ],
      ),
      body: classes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(availableOpenClassesProvider),
        ),
        data: (items) {
          final filtered = items.where(_matches).toList();
          return Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxWidth < 420;
                  final searchField = TextField(
                    key: const Key('course-search'),
                    controller: _search,
                    onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Tìm học phần',
                    ),
                  );
                  final filter = DropdownButtonFormField<_SearchBy>(
                    initialValue: _searchBy,
                    isExpanded: true,
                    decoration: const InputDecoration(labelText: 'Tìm theo'),
                    onChanged: (value) => setState(() => _searchBy = value!),
                    items: const [
                      DropdownMenuItem(
                        value: _SearchBy.code,
                        child: Text('Mã môn'),
                      ),
                      DropdownMenuItem(
                        value: _SearchBy.name,
                        child: Text('Tên môn'),
                      ),
                      DropdownMenuItem(
                        value: _SearchBy.credits,
                        child: Text('Tín chỉ'),
                      ),
                      DropdownMenuItem(
                        value: _SearchBy.major,
                        child: Text('Theo ngành'),
                      ),
                    ],
                  );
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                    child: compact
                        ? Column(
                            children: [
                              searchField,
                              const SizedBox(height: 10),
                              filter,
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(child: searchField),
                              const SizedBox(width: 12),
                              SizedBox(width: 160, child: filter),
                            ],
                          ),
                  );
                },
              ),
              Expanded(
                child: filtered.isEmpty
                    ? const Center(child: Text('Không tìm thấy lớp phù hợp.'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) => _CourseClassCard(
                          courseClass: filtered[index],
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  bool _matches(OpenCourseClassDto item) {
    final query = _search.text.trim().toLowerCase();
    return switch (_searchBy) {
      _SearchBy.code => item.courseCode.toLowerCase().contains(query),
      _SearchBy.name => item.courseName.toLowerCase().contains(query),
      _SearchBy.credits => query.isEmpty || item.credits.toString() == query,
      _SearchBy.major => item.inTrainingProgram,
    };
  }

  Future<void> _showOpeningRequest() async {
    try {
      final courses = await ref.read(trainingProgramProvider.future);
      if (!mounted) return;
      final selected = await showDialog<TrainingProgramCourseDto>(
        context: context,
        builder: (context) => SimpleDialog(
          title: const Text('Chọn môn cần mở lớp'),
          children: courses
              .map(
                (course) => SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, course),
                  child: Text('${course.courseCode} - ${course.courseName}'),
                ),
              )
              .toList(),
        ),
      );
      if (selected == null || !mounted) return;
      final controller = TextEditingController();
      final reason = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          title: const Text('Lý do mở lớp'),
          content: TextField(
            controller: controller,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Lý do',
              hintText: 'Nhập lý do đề nghị mở lớp',
              alignLabelWithHint: true,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Gửi yêu cầu'),
            ),
          ],
        ),
      );
      controller.dispose();
      if (reason == null || reason.trim().isEmpty || !mounted) return;
      await ref
          .read(courseRegistrationRepositoryProvider)
          .createOpeningRequest(selected.courseId, reason);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã gửi yêu cầu mở lớp.')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Không thể gửi yêu cầu mở lớp.')),
        );
      }
    }
  }
}

class _CourseClassCard extends StatelessWidget {
  const _CourseClassCard({required this.courseClass});
  final OpenCourseClassDto courseClass;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${courseClass.courseCode} • ${courseClass.classCode}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            courseClass.courseName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text('${courseClass.credits} tín chỉ'),
          Text('GV ${courseClass.lecturerName}'),
          for (final schedule in courseClass.schedules)
            Text(
              'Thứ ${schedule.dayOfWeek} • Tiết ${schedule.startPeriod}-${schedule.endPeriod} • ${schedule.room}',
            ),
          const SizedBox(height: 6),
          Text('Còn ${courseClass.remainingSeats} chỗ'),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              key: Key('register-${courseClass.courseClassId}'),
              onPressed: courseClass.remainingSeats > 0
                  ? () => context.push(
                      '/student/registration/confirm',
                      extra: courseClass,
                    )
                  : null,
              child: const Text('ĐĂNG KÝ'),
            ),
          ),
        ],
      ),
    ),
  );
}
