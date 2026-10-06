import 'dart:convert';

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
          data: (items) => items.isEmpty
              ? const Center(child: Text('Chưa có lịch sử thao tác.'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowMinHeight: 56,
                      dataRowMaxHeight: 180,
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
                                DataCell(Text(_formatDateTime(item.createdAt))),
                                DataCell(Text(item.actorName)),
                                DataCell(Text(AppLabels.action(item.action))),
                                DataCell(
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      _formatAuditValue(item.oldValue),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      _formatAuditValue(item.newValue),
                                    ),
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

  static String _formatDateTime(DateTime value) {
    final local = value.toLocal();
    String two(int number) => number.toString().padLeft(2, '0');
    return '${two(local.day)}/${two(local.month)}/${local.year} '
        '${two(local.hour)}:${two(local.minute)}';
  }

  static String _formatAuditValue(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '-';
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return decoded.toString();
      final lines = <String>[];
      for (final entry in decoded.entries) {
        if (entry.key.startsWith('__') ||
            _technicalFields.contains(entry.key) ||
            entry.key.endsWith('Id')) {
          continue;
        }
        lines.add(
          '${_fieldLabels[entry.key] ?? _readableKey(entry.key)}: '
          '${_readableValue(entry.key, entry.value)}',
        );
      }
      return lines.isEmpty ? 'Không có thay đổi hiển thị' : lines.join('\n');
    } on FormatException {
      return raw;
    }
  }

  static const _technicalFields = {
    'id',
    'authUserId',
    'createdAt',
    'updatedAt',
  };

  static const _fieldLabels = {
    'email': 'Email',
    'fullName': 'Họ tên',
    'phone': 'Số điện thoại',
    'role': 'Vai trò',
    'isActive': 'Trạng thái tài khoản',
    'courseCode': 'Mã môn',
    'courseName': 'Tên môn',
    'credits': 'Số tín chỉ',
    'courseType': 'Loại môn',
    'description': 'Mô tả',
    'name': 'Tên',
    'academicYear': 'Năm học',
    'totalCredits': 'Tổng tín chỉ',
    'status': 'Trạng thái',
    'comment': 'Ghi chú',
  };

  static String _readableValue(String key, Object? value) {
    if (value == null) return 'Không có';
    if (key == 'isActive' && value is bool) {
      return value ? 'Đang hoạt động' : 'Đã vô hiệu hóa';
    }
    if (key == 'role') {
      return switch (value.toString()) {
        'student' => 'Sinh viên',
        'lecturer' => 'Giảng viên',
        'admin' => 'Quản trị viên',
        _ => value.toString(),
      };
    }
    if (key == 'courseType') {
      return value == 'compulsory' ? 'Bắt buộc' : 'Tự chọn';
    }
    if (key == 'status') {
      return switch (value.toString()) {
        'open' => 'Đang mở',
        'full' => 'Đã đầy',
        'closed' => 'Đã đóng',
        'pending' => 'Chờ duyệt',
        'approved' => 'Đã duyệt',
        'rejected' => 'Đã từ chối',
        _ => value.toString(),
      };
    }
    return value.toString();
  }

  static String _readableKey(String value) {
    final spaced = value.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
    return '${spaced[0].toUpperCase()}${spaced.substring(1)}';
  }
}
