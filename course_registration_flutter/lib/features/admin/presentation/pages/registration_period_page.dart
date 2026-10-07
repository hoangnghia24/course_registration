import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_handler.dart';
import '../providers/admin_providers.dart';

class RegistrationPeriodPage extends ConsumerStatefulWidget {
  const RegistrationPeriodPage({super.key});

  @override
  ConsumerState<RegistrationPeriodPage> createState() =>
      _RegistrationPeriodPageState();
}

class _RegistrationPeriodPageState
    extends ConsumerState<RegistrationPeriodPage> {
  UuidValue? _semesterId;
  DateTime? _start;
  DateTime? _end;
  DateTime? _lecturerStart;
  DateTime? _lecturerEnd;
  RegistrationPeriodStatus? _status;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final periods = ref.watch(registrationPeriodsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text('Thời gian đăng ký học phần'),
        ),
      ),
      body: periods.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _RegistrationPeriodError(
          message: ErrorHandler.message(error),
          onRetry: () => ref.invalidate(registrationPeriodsProvider),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('Chưa có học kỳ để cấu hình.'));
          }
          final selected = _selected(items) ?? items.first;
          _semesterId ??= selected.semesterId;
          _start ??= selected.startTime.toLocal();
          _end ??= selected.endTime.toLocal();
          _lecturerStart ??= selected.lecturerStartTime.toLocal();
          _lecturerEnd ??= selected.lecturerEndTime.toLocal();
          _status ??= selected.status;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              DropdownButtonFormField<UuidValue>(
                key: const Key('registration-period-semester'),
                initialValue: selected.semesterId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Học kỳ'),
                items: items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.semesterId,
                        child: Text(
                          item.semesterName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  final next = items.firstWhere(
                    (item) => item.semesterId == value,
                  );
                  setState(() {
                    _semesterId = value;
                    _start = next.startTime.toLocal();
                    _end = next.endTime.toLocal();
                    _lecturerStart = next.lecturerStartTime.toLocal();
                    _lecturerEnd = next.lecturerEndTime.toLocal();
                    _status = next.status;
                  });
                },
              ),
              const SizedBox(height: 20),
              _DateTimeField(
                label: 'Sinh viên bắt đầu',
                value: _start!,
                onTap: () => _pick(_PeriodField.studentStart),
              ),
              const SizedBox(height: 12),
              _DateTimeField(
                label: 'Sinh viên kết thúc',
                value: _end!,
                onTap: () => _pick(_PeriodField.studentEnd),
              ),
              const SizedBox(height: 12),
              _DateTimeField(
                label: 'Giảng viên bắt đầu chỉnh sửa',
                value: _lecturerStart!,
                onTap: () => _pick(_PeriodField.lecturerStart),
              ),
              const SizedBox(height: 12),
              _DateTimeField(
                label: 'Giảng viên kết thúc chỉnh sửa',
                value: _lecturerEnd!,
                onTap: () => _pick(_PeriodField.lecturerEnd),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<RegistrationPeriodStatus>(
                key: const Key('registration-period-status'),
                initialValue: _status,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Trạng thái đợt'),
                items: RegistrationPeriodStatus.values
                    .map(
                      (status) => DropdownMenuItem(
                        value: status,
                        child: Text(_statusLabel(status)),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _status = value),
              ),
              const SizedBox(height: 12),
              Text(
                selected.configured
                    ? 'Đã cấu hình riêng cho học kỳ này.'
                    : 'Chưa cấu hình: backend sẽ từ chối mọi thao tác ghi.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                key: const Key('save-registration-period'),
                onPressed: _saving ? null : _save,
                icon: const Icon(Icons.save_outlined),
                label: Text(_saving ? 'Đang lưu...' : 'LƯU'),
              ),
            ],
          );
        },
      ),
    );
  }

  RegistrationPeriodDto? _selected(List<RegistrationPeriodDto> items) {
    for (final item in items) {
      if (item.semesterId == _semesterId) return item;
    }
    return null;
  }

  Future<void> _pick(_PeriodField field) async {
    final current =
        switch (field) {
          _PeriodField.studentStart => _start,
          _PeriodField.studentEnd => _end,
          _PeriodField.lecturerStart => _lecturerStart,
          _PeriodField.lecturerEnd => _lecturerEnd,
        } ??
        DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
    );
    if (time == null) return;
    final value = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      switch (field) {
        case _PeriodField.studentStart:
          _start = value;
        case _PeriodField.studentEnd:
          _end = value;
        case _PeriodField.lecturerStart:
          _lecturerStart = value;
        case _PeriodField.lecturerEnd:
          _lecturerEnd = value;
      }
    });
  }

  Future<void> _save() async {
    if (_semesterId == null ||
        _start == null ||
        _end == null ||
        _lecturerStart == null ||
        _lecturerEnd == null ||
        _status == null) {
      return;
    }
    if (!_start!.isBefore(_end!) || !_lecturerStart!.isBefore(_lecturerEnd!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thời gian bắt đầu phải trước thời gian kết thúc.'),
        ),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      await ref
          .read(adminRepositoryProvider)
          .updateRegistrationPeriod(
            semesterId: _semesterId!,
            startTime: _start!.toUtc(),
            endTime: _end!.toUtc(),
            lecturerStartTime: _lecturerStart!.toUtc(),
            lecturerEndTime: _lecturerEnd!.toUtc(),
            status: _status!,
          );
      ref.invalidate(registrationPeriodsProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã lưu thời gian đăng ký.')),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

enum _PeriodField { studentStart, studentEnd, lecturerStart, lecturerEnd }

String _statusLabel(RegistrationPeriodStatus status) => switch (status) {
  RegistrationPeriodStatus.draft => 'Nháp',
  RegistrationPeriodStatus.active => 'Đang áp dụng',
  RegistrationPeriodStatus.closed => 'Đã đóng',
};

class _DateTimeField extends StatelessWidget {
  const _DateTimeField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final DateTime value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
    ),
    leading: const Icon(Icons.event_outlined),
    title: Text(label),
    subtitle: Text(_format(value)),
    trailing: const Icon(Icons.edit_calendar_outlined),
    onTap: onTap,
  );

  static String _format(DateTime value) =>
      '${_two(value.day)}/${_two(value.month)}/${value.year} '
      '${_two(value.hour)}:${_two(value.minute)}';

  static String _two(int value) => value.toString().padLeft(2, '0');
}

class _RegistrationPeriodError extends StatelessWidget {
  const _RegistrationPeriodError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cloud_off_outlined,
            size: 48,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton.tonalIcon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Thử lại'),
          ),
        ],
      ),
    ),
  );
}
