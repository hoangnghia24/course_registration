import 'dart:convert';

import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_handler.dart';
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
          error: (error, _) => Center(child: Text(ErrorHandler.message(error))),
          data: (items) => items.isEmpty
              ? const Center(child: Text('Chưa có lịch sử thao tác.'))
              : RefreshIndicator(
                  onRefresh: () => ref.refresh(auditLogProvider.future),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: _AuditLogCard(item: items[index]),
                      ),
                    ),
                  ),
                ),
        ),
  );
}

class _AuditLogCard extends StatelessWidget {
  const _AuditLogCard({required this.item});

  final AuditLogDto item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 6,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  AppLabels.action(item.action),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _AuditFormatter.dateTime(item.createdAt),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 18,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Expanded(child: Text(item.actorName)),
              ],
            ),
            const SizedBox(height: 14),
            LayoutBuilder(
              builder: (context, constraints) {
                final oldPanel = _AuditValuePanel(
                  title: 'Dữ liệu cũ',
                  value: _AuditFormatter.value(item.oldValue),
                );
                final newPanel = _AuditValuePanel(
                  title: 'Dữ liệu mới',
                  value: _AuditFormatter.value(item.newValue),
                );
                if (constraints.maxWidth >= 700) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: oldPanel),
                      const SizedBox(width: 12),
                      Expanded(child: newPanel),
                    ],
                  );
                }
                return Column(
                  children: [
                    oldPanel,
                    const SizedBox(height: 10),
                    newPanel,
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AuditValuePanel extends StatelessWidget {
  const _AuditValuePanel({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              SelectableText(value),
            ],
          ),
        ),
      ),
    );
  }
}

abstract final class _AuditFormatter {
  static String dateTime(DateTime value) {
    final local = value.toLocal();
    return '${_two(local.day)}/${_two(local.month)}/${local.year} '
        '${_two(local.hour)}:${_two(local.minute)}';
  }

  static String value(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '-';
    try {
      return _node(jsonDecode(raw));
    } on FormatException {
      return _simple('', raw);
    }
  }

  static String _node(Object? node, {int depth = 0, String parentKey = ''}) {
    if (node is Map) {
      final lines = <String>[];
      for (final entry in node.entries) {
        final key = entry.key.toString();
        if (_isTechnical(key)) continue;
        final value = entry.value;
        final label = _fieldLabels[key] ?? _readableKey(key);
        final padding = '  ' * depth;
        if (value is Map || value is List || _isJsonContainer(value)) {
          lines.add(
            '$padding$label:\n${_node(
              _decodeContainer(value),
              depth: depth + 1,
              parentKey: key,
            )}',
          );
        } else {
          lines.add('$padding$label: ${_simple(key, value)}');
        }
      }
      return lines.isEmpty
          ? '${'  ' * depth}Không có thay đổi hiển thị'
          : lines.join('\n');
    }
    if (node is List) {
      if (node.isEmpty) return '${'  ' * depth}Không có';
      return node.indexed
          .map((entry) {
            final padding = '  ' * depth;
            final item = entry.$2;
            if (item is Map || item is List || _isJsonContainer(item)) {
              final itemLabel = parentKey == 'schedules'
                  ? 'Lịch ${entry.$1 + 1}'
                  : 'Mục ${entry.$1 + 1}';
              return '$padding$itemLabel:\n${_node(
                _decodeContainer(item),
                depth: depth + 1,
                parentKey: parentKey,
              )}';
            }
            return '$padding• ${_simple(parentKey, item)}';
          })
          .join('\n');
    }
    return '${'  ' * depth}${_simple(parentKey, node)}';
  }

  static bool _isJsonContainer(Object? value) {
    if (value is! String) return false;
    final trimmed = value.trim();
    return (trimmed.startsWith('{') && trimmed.endsWith('}')) ||
        (trimmed.startsWith('[') && trimmed.endsWith(']'));
  }

  static Object? _decodeContainer(Object? value) {
    if (value is! String) return value;
    try {
      return jsonDecode(value);
    } on FormatException {
      return value;
    }
  }

  static bool _isTechnical(String key) =>
      key.startsWith('__') ||
      _technicalFields.contains(key) ||
      key.endsWith('Id');

  static String _simple(String key, Object? value) {
    if (value == null || value.toString().trim().isEmpty) return 'Không có';
    if (key == 'isActive' && value is bool) {
      return value ? 'Đang hoạt động' : 'Đã vô hiệu hóa';
    }
    if (key == 'isRequired' && value is bool) {
      return value ? 'Bắt buộc' : 'Tự chọn';
    }
    if (value is bool) return value ? 'Có' : 'Không';
    if (key == 'dayOfWeek') {
      final day = value is int ? value : int.tryParse(value.toString());
      return switch (day) {
        1 => 'Thứ Hai',
        2 => 'Thứ Ba',
        3 => 'Thứ Tư',
        4 => 'Thứ Năm',
        5 => 'Thứ Sáu',
        6 => 'Thứ Bảy',
        7 => 'Chủ Nhật',
        _ => value.toString(),
      };
    }
    if (_isDateField(key)) {
      final parsed = DateTime.tryParse(value.toString());
      if (parsed != null) return dateTime(parsed);
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
      return _statusLabels[value.toString()] ?? value.toString();
    }
    return value.toString();
  }

  static bool _isDateField(String key) {
    final lower = key.toLowerCase();
    return lower.endsWith('time') ||
        lower.endsWith('date') ||
        lower.endsWith('at');
  }

  static String _readableKey(String value) {
    if (value.trim().isEmpty) return 'Giá trị';
    final spaced = value.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
    return '${spaced[0].toUpperCase()}${spaced.substring(1)}';
  }

  static String _two(int number) => number.toString().padLeft(2, '0');

  static const _technicalFields = {
    'id',
    'authUserId',
    'createdAt',
    'updatedAt',
    'reviewedById',
    'updatedById',
  };

  static const _fieldLabels = {
    'email': 'Email',
    'fullName': 'Họ tên',
    'phone': 'Số điện thoại',
    'role': 'Vai trò',
    'roleCode': 'Mã vai trò',
    'isActive': 'Trạng thái tài khoản',
    'courseCode': 'Mã môn',
    'courseName': 'Tên môn',
    'credits': 'Số tín chỉ',
    'courseType': 'Loại môn',
    'description': 'Mô tả',
    'code': 'Mã',
    'name': 'Tên',
    'academicYear': 'Khóa tuyển sinh',
    'totalCredits': 'Tổng tín chỉ',
    'semesterCount': 'Số học kỳ',
    'semesterNumber': 'Học kỳ',
    'isRequired': 'Loại môn trong chương trình',
    'status': 'Trạng thái',
    'comment': 'Ghi chú',
    'rejectReason': 'Lý do từ chối',
    'capacity': 'Sĩ số tối đa',
    'registeredCount': 'Số sinh viên đã đăng ký',
    'schedules': 'Lịch học',
    'dayOfWeek': 'Thứ',
    'startPeriod': 'Tiết bắt đầu',
    'endPeriod': 'Tiết kết thúc',
    'room': 'Phòng học',
    'startTime': 'Bắt đầu đăng ký',
    'endTime': 'Kết thúc đăng ký',
    'lecturerStartTime': 'Giảng viên bắt đầu đăng ký',
    'lecturerEndTime': 'Giảng viên kết thúc đăng ký',
  };

  static const _statusLabels = {
    'draft': 'Nháp',
    'upcoming': 'Sắp diễn ra',
    'active': 'Đang áp dụng',
    'archived': 'Lưu trữ',
    'open': 'Đang mở',
    'full': 'Đã đầy',
    'closed': 'Đã đóng',
    'pending': 'Chờ duyệt',
    'approved': 'Đã duyệt',
    'rejected': 'Đã từ chối',
    'cancelled': 'Đã hủy',
  };
}
