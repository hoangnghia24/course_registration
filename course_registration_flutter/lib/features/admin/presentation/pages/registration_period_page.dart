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
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final periods = ref.watch(registrationPeriodsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Thời gian đăng ký học phần')),
      body: periods.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(ErrorHandler.message(error))),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('Chưa có học kỳ để cấu hình.'));
          }
          final selected = _selected(items) ?? items.first;
          _semesterId ??= selected.semesterId;
          _start ??= selected.startTime.toLocal();
          _end ??= selected.endTime.toLocal();
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              DropdownButtonFormField<UuidValue>(
                key: const Key('registration-period-semester'),
                initialValue: selected.semesterId,
                decoration: const InputDecoration(labelText: 'Học kỳ'),
                items: items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.semesterId,
                        child: Text(
                          '${item.semesterName} ${item.academicYear}',
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
                  });
                },
              ),
              const SizedBox(height: 20),
              _DateTimeField(
                label: 'Bắt đầu',
                value: _start!,
                onTap: () => _pick(start: true),
              ),
              const SizedBox(height: 12),
              _DateTimeField(
                label: 'Kết thúc',
                value: _end!,
                onTap: () => _pick(start: false),
              ),
              const SizedBox(height: 12),
              Text(
                selected.configured
                    ? 'Đã cấu hình riêng cho học kỳ này.'
                    : 'Đang dùng ngày bắt đầu/kết thúc học kỳ làm mặc định.',
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

  Future<void> _pick({required bool start}) async {
    final current = (start ? _start : _end) ?? DateTime.now();
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
      if (start) {
        _start = value;
      } else {
        _end = value;
      }
    });
  }

  Future<void> _save() async {
    if (_semesterId == null || _start == null || _end == null) return;
    if (!_start!.isBefore(_end!)) {
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
