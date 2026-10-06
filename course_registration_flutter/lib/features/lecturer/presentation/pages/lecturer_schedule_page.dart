import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/app_labels.dart';
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
          if (items.isEmpty) {
            return const Center(child: Text('Chưa có lịch giảng dạy.'));
          }
          final byDay = <int, List<TeachingScheduleProposal>>{};
          for (final item in items) {
            byDay.putIfAbsent(item.dayOfWeek, () => []).add(item);
          }
          return ListView(
            padding: const EdgeInsets.all(12),
            children: [
              const _ScheduleLegend(),
              const SizedBox(height: 12),
              for (var day = 2; day <= 7; day++)
                if (byDay[day]?.isNotEmpty ?? false)
                  _DaySchedule(
                    day: day,
                    items: byDay[day]!,
                    classes: classes,
                  ),
            ],
          );
        },
      ),
    );
  }
}

class _ScheduleLegend extends StatelessWidget {
  const _ScheduleLegend();

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children: const [
          _LegendDot(color: Colors.orange, label: 'Chờ duyệt'),
          _LegendDot(color: Colors.green, label: 'Đã duyệt'),
          _LegendDot(color: Colors.red, label: 'Đã từ chối'),
        ],
      ),
    ),
  );
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const SizedBox(width: 5),
      Text(label),
    ],
  );
}

class _DaySchedule extends StatelessWidget {
  const _DaySchedule({
    required this.day,
    required this.items,
    required this.classes,
  });
  final int day;
  final List<TeachingScheduleProposal> items;
  final List<LecturerCourseClassDto> classes;

  @override
  Widget build(BuildContext context) {
    items.sort((a, b) => a.startPeriod.compareTo(b.startPeriod));
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              'Thứ $day',
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          for (final item in items) _ScheduleTile(item: item, classes: classes),
        ],
      ),
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  const _ScheduleTile({required this.item, required this.classes});
  final TeachingScheduleProposal item;
  final List<LecturerCourseClassDto> classes;

  @override
  Widget build(BuildContext context) {
    LecturerCourseClassDto? courseClass;
    for (final value in classes) {
      if (value.courseClassId == item.courseClassId) {
        courseClass = value;
        break;
      }
    }
    final color = switch (item.status) {
      TeachingScheduleStatus.pending => Colors.orange,
      TeachingScheduleStatus.approved => Colors.green,
      TeachingScheduleStatus.rejected => Colors.red,
    };
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 5)),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.schedule, size: 20),
              Text('${item.startPeriod}–${item.endPeriod}'),
            ],
          ),
        ),
        title: Text(
          courseClass == null
              ? 'Lớp học phần'
              : '${courseClass.courseCode} - ${courseClass.courseName}',
        ),
        subtitle: Text(
          '${courseClass?.classCode ?? ''} • Phòng ${item.room}\n'
          '${AppLabels.teachingScheduleStatus(item.status)}',
        ),
        isThreeLine: true,
      ),
    );
  }
}
