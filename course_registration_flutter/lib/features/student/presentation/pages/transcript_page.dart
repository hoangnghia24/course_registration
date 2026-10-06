import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/student_providers.dart';
import '../widgets/grade_scale_selector.dart';
import '../widgets/student_async_error.dart';

class TranscriptPage extends ConsumerWidget {
  const TranscriptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transcript = ref.watch(transcriptProvider);
    final gradeScale = ref.watch(gradeScaleProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Bảng điểm')),
      body: transcript.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(transcriptProvider),
        ),
        data: (items) => items.isEmpty
            ? const Center(child: Text('Chưa có dữ liệu bảng điểm.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GradeScaleSelector(
                        selected: gradeScale,
                        onSelected: ref
                            .read(gradeScaleProvider.notifier)
                            .select,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            const DataColumn(label: Text('Mã môn')),
                            const DataColumn(label: Text('Tên môn')),
                            const DataColumn(
                              label: Text('Tín chỉ'),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text('Điểm / ${gradeScale.maximum}'),
                              numeric: true,
                            ),
                            const DataColumn(label: Text('Điểm chữ')),
                            const DataColumn(label: Text('Trạng thái')),
                          ],
                          rows: items
                              .map(
                                (item) => DataRow(
                                  cells: [
                                    DataCell(Text(item.courseCode)),
                                    DataCell(Text(item.courseName)),
                                    DataCell(Text('${item.credits}')),
                                    DataCell(
                                      Text(
                                        gradeScale
                                            .fromFourPoint(item.score)
                                            .toStringAsFixed(2),
                                      ),
                                    ),
                                    DataCell(Text(item.letterGrade)),
                                    DataCell(_StatusChip(status: item.status)),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final TranscriptStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      TranscriptStatus.passed => ('Đạt', Colors.green),
      TranscriptStatus.failed => ('Rớt', Colors.red),
      TranscriptStatus.retake => ('Học lại', Colors.orange),
    };
    return Chip(
      label: Text(label),
      side: BorderSide(color: color),
      labelStyle: TextStyle(color: color),
      backgroundColor: color.withValues(alpha: 0.08),
    );
  }
}
