import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/weekly_timetable.dart';
import '../providers/lecturer_providers.dart';

class LecturerSchedulePage extends ConsumerWidget {
  const LecturerSchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(scheduleProvider);
    final classes = ref.watch(courseClassProvider).value ?? const [];
    return Scaffold(
      appBar: AppBar(title: const Text('Thời khóa biểu giảng dạy')),
      body: schedules.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (items) {
          final entries = items.map((item) {
            final matches = classes.where(
              (value) => value.courseClassId == item.courseClassId,
            );
            final courseClass = matches.isEmpty ? null : matches.first;
            return TimetableEntry(
              dayOfWeek: item.dayOfWeek,
              startPeriod: item.startPeriod,
              endPeriod: item.endPeriod,
              title: courseClass == null
                  ? 'Lớp học phần'
                  : '${courseClass.courseCode} - ${courseClass.courseName}',
              subtitle: '${courseClass?.classCode ?? ''} • Phòng ${item.room}',
              color: Colors.green,
            );
          }).toList();
          if (entries.isEmpty) {
            return const Center(
              child: Text('Chưa có lịch giảng dạy đã được duyệt.'),
            );
          }
          return WeeklyTimetable(entries: entries);
        },
      ),
    );
  }
}
