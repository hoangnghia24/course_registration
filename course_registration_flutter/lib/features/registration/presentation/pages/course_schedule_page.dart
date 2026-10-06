import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/course_registration_providers.dart';

class CourseSchedulePage extends ConsumerWidget {
  const CourseSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(myRegisteredCoursesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Lịch học')),
      body: courses.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(myRegisteredCoursesProvider),
        ),
        data: (items) {
          final rows =
              [
                for (final course in items)
                  for (final schedule in course.schedules)
                    (course: course, schedule: schedule),
              ]..sort((a, b) {
                final day = a.schedule.dayOfWeek.compareTo(
                  b.schedule.dayOfWeek,
                );
                return day != 0
                    ? day
                    : a.schedule.startPeriod.compareTo(b.schedule.startPeriod);
              });
          return rows.isEmpty
              ? const Center(child: Text('Chưa có lịch học.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: rows.length,
                  itemBuilder: (context, index) {
                    final row = rows[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${row.schedule.dayOfWeek}'),
                        ),
                        title: Text(
                          '${row.course.courseCode} - ${row.course.courseName}',
                        ),
                        subtitle: Text(
                          'Thứ ${row.schedule.dayOfWeek} • Tiết ${row.schedule.startPeriod}-${row.schedule.endPeriod} • ${row.schedule.room}',
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
