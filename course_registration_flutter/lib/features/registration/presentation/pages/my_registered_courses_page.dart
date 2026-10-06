import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/app_labels.dart';
import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/course_registration_providers.dart';

class MyRegisteredCoursesPage extends ConsumerWidget {
  const MyRegisteredCoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(myRegisteredCoursesProvider);
    final pending = ref.watch(pendingRegistrationsProvider).asData?.value ?? [];
    return Scaffold(
      appBar: AppBar(title: const Text('Học phần đã đăng ký')),
      body: courses.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(myRegisteredCoursesProvider),
        ),
        data: (items) => items.isEmpty && pending.isEmpty
            ? const Center(child: Text('Bạn chưa đăng ký học phần nào.'))
            : ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  for (final operation in pending)
                    Card(
                      color: operation.status == 'FAILED'
                          ? Theme.of(context).colorScheme.errorContainer
                          : Theme.of(context).colorScheme.tertiaryContainer,
                      child: ListTile(
                        leading: const Icon(Icons.sync),
                        title: Text(
                          operation.action == 'CANCEL_COURSE'
                              ? 'Yêu cầu hủy đang chờ đồng bộ'
                              : 'Yêu cầu đăng ký đang chờ đồng bộ',
                        ),
                        subtitle: Text(
                          operation.errorMessage ??
                              'Lớp: ${operation.courseClassId}',
                        ),
                        trailing: Chip(
                          label: Text(AppLabels.syncStatus(operation.status)),
                        ),
                      ),
                    ),
                  for (final item in items)
                    Card(
                      child: ListTile(
                        title: Text('${item.courseCode} - ${item.courseName}'),
                        subtitle: Text(
                          '${item.classCode} • ${item.credits} tín chỉ\n${_schedule(item.schedules)}',
                        ),
                        isThreeLine: true,
                        trailing: TextButton(
                          onPressed: () => _cancel(context, ref, item),
                          child: const Text('Hủy'),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }

  String _schedule(List<ClassScheduleDto> schedules) => schedules
      .map(
        (item) =>
            'Thứ ${item.dayOfWeek}, tiết ${item.startPeriod}-${item.endPeriod}',
      )
      .join(' • ');

  Future<void> _cancel(
    BuildContext context,
    WidgetRef ref,
    RegisteredCourseDto item,
  ) async {
    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hủy đăng ký?'),
        content: Text('${item.courseCode} - ${item.courseName}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Không'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Xác nhận hủy'),
          ),
        ],
      ),
    );
    if (accepted != true || !context.mounted) return;
    final result = await ref
        .read(courseRegistrationRepositoryProvider)
        .cancelCourse(item.registrationId);
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(result.message)));
    ref.invalidate(myRegisteredCoursesProvider);
    ref.invalidate(openClassesProvider);
  }
}
