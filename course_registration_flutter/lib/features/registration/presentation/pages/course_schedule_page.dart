import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/weekly_timetable.dart';
import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/course_registration_providers.dart';

class CourseSchedulePage extends ConsumerWidget {
  const CourseSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final semester = ref.watch(currentSemesterProvider);
    final courses = ref.watch(myRegisteredCoursesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Thời khóa biểu học tập')),
      body: semester.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(currentSemesterProvider),
        ),
        data: (currentSemester) => courses.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => StudentAsyncError(
            onRetry: () => ref.invalidate(myRegisteredCoursesProvider),
          ),
          data: (items) {
            final entries = [
              for (final course in items)
                for (final schedule in course.schedules)
                  TimetableEntry(
                    dayOfWeek: schedule.dayOfWeek,
                    startPeriod: schedule.startPeriod,
                    endPeriod: schedule.endPeriod,
                    title: '${course.courseCode} - ${course.courseName}',
                    subtitle:
                        '${course.classCode} • Phòng ${schedule.room} • ${course.lecturerName}',
                  ),
            ];
            return WeeklyTimetable(
              entries: entries,
              semesterStart: currentSemester.startDate,
              semesterEnd: currentSemester.endDate,
            );
          },
        ),
      ),
    );
  }
}
