import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lecturer_providers.dart';

class ClassStudentListPage extends ConsumerWidget {
  const ClassStudentListPage({required this.courseClass, super.key});
  final LecturerCourseClassDto courseClass;
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: Text('Sinh viên ${courseClass.classCode}')),
    body: ref
        .watch(studentListProvider(courseClass.courseClassId))
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (items) => ListView(
            padding: const EdgeInsets.all(12),
            children: [
              Text(
                'Sĩ số: ${items.length}/${courseClass.capacity}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('STT')),
                    DataColumn(label: Text('MSSV')),
                    DataColumn(label: Text('Tên')),
                    DataColumn(label: Text('Ngành')),
                    DataColumn(label: Text('Email')),
                  ],
                  rows: [
                    for (var i = 0; i < items.length; i++)
                      DataRow(
                        cells: [
                          DataCell(Text('${i + 1}')),
                          DataCell(Text(items[i].studentCode)),
                          DataCell(Text(items[i].fullName)),
                          DataCell(Text(items[i].majorName)),
                          DataCell(Text(items[i].email)),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
  );
}
