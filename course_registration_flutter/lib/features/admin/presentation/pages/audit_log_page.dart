import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/app_labels.dart';
import '../providers/admin_providers.dart';

class AuditLogPage extends ConsumerWidget {
  const AuditLogPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Lịch sử hệ thống')),
    body: ref
        .watch(auditLogProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('$error')),
          data: (items) => SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Thời gian')),
                  DataColumn(label: Text('Người thực hiện')),
                  DataColumn(label: Text('Hành động')),
                  DataColumn(label: Text('Dữ liệu cũ')),
                  DataColumn(label: Text('Dữ liệu mới')),
                ],
                rows: items
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(Text(item.createdAt.toLocal().toString())),
                          DataCell(Text(item.actorName)),
                          DataCell(Text(AppLabels.action(item.action))),
                          DataCell(
                            SizedBox(
                              width: 240,
                              child: Text(item.oldValue ?? '-'),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 240,
                              child: Text(item.newValue ?? '-'),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
  );
}
