import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/admin_providers.dart';

class ReportDashboardPage extends ConsumerWidget {
  const ReportDashboardPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Báo cáo thống kê')),
    body: ref
        .watch(analyticsProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (report) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Phân bố sinh viên theo ngành',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              for (final item in report.studentsByMajor)
                _Bar(item.name, item.count, report.totalStudents),
              const SizedBox(height: 20),
              Text(
                'Trạng thái lớp học',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Wrap(
                spacing: 12,
                children: [
                  Chip(label: Text('Mở: ${report.openClasses}')),
                  Chip(label: Text('Đầy: ${report.fullClasses}')),
                  Chip(label: Text('Đóng: ${report.closedClasses}')),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Nhu cầu môn học',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              for (final item in report.courseDemand)
                ListTile(
                  title: Text('${item.courseCode} - ${item.courseName}'),
                  trailing: Text('${item.requestCount}'),
                ),
              Text(
                'Môn có nhiều sinh viên rớt',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              for (final item in report.failedCourses)
                ListTile(
                  title: Text(item.name),
                  trailing: Text('${item.count}'),
                ),
              Text(
                'GPA trung bình từng môn',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              for (final item in report.courseGpas)
                ListTile(
                  title: Text('${item.courseCode} - ${item.courseName}'),
                  trailing: Text(item.averageGpa.toStringAsFixed(2)),
                ),
            ],
          ),
        ),
  );
}

class _Bar extends StatelessWidget {
  const _Bar(this.label, this.value, this.total);
  final String label;
  final int value;
  final int total;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $value'),
        LinearProgressIndicator(value: total == 0 ? 0 : value / total),
      ],
    ),
  );
}
