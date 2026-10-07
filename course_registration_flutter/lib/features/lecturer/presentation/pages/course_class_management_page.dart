import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/error_handler.dart';
import '../../../student/presentation/widgets/student_async_error.dart';
import '../providers/lecturer_providers.dart';

class CourseClassManagementPage extends ConsumerWidget {
  const CourseClassManagementPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classes = ref.watch(courseClassProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý lớp học phần'),
        actions: [
          IconButton(
            tooltip: 'Gửi yêu cầu mở lớp',
            onPressed: () => context.push('/lecturer/classes/create'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: classes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => StudentAsyncError(
          onRetry: () => ref.invalidate(courseClassProvider),
        ),
        data: (items) => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final period = ref
                .watch(lecturerRegistrationPeriodProvider(item.semesterId))
                .asData
                ?.value;
            final canChange = period?.isOpen ?? false;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.courseCode} - ${item.courseName}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${item.semesterName} ${item.academicYear} • ${item.classCode}',
                    ),
                    Text('${item.registeredCount}/${item.capacity} sinh viên'),
                    const SizedBox(height: 6),
                    _ApprovalStatusChip(item: item),
                    if (period != null && !period.isOpen)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          _periodMessage(period),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    Wrap(
                      children: [
                        TextButton(
                          onPressed: () => context.push(
                            '/lecturer/classes/students',
                            extra: item,
                          ),
                          child: const Text('Chi tiết'),
                        ),
                        TextButton(
                          onPressed: canChange
                              ? () => _edit(context, ref, item)
                              : null,
                          child: const Text('Sửa'),
                        ),
                        TextButton(
                          onPressed: canChange
                              ? () => _delete(context, ref, item)
                              : null,
                          child: const Text('Xóa'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _edit(
    BuildContext context,
    WidgetRef ref,
    LecturerCourseClassDto item,
  ) async {
    try {
      final rooms = await ref.read(availableRoomsProvider.future);
      if (!context.mounted) return;
      final value = await showDialog<_ClassEditValue>(
        context: context,
        builder: (_) => _CourseClassEditDialog(item: item, rooms: rooms),
      );
      if (value == null || !context.mounted) return;
      await ref
          .read(lecturerRepositoryProvider)
          .updateClass(
            courseClassId: item.courseClassId,
            capacity: value.capacity,
            schedules: [value.schedule],
          );
      ref.invalidate(courseClassProvider);
      ref.invalidate(scheduleProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã gửi yêu cầu điều chỉnh để phòng đào tạo duyệt.'),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    }
  }

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    LecturerCourseClassDto item,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa lớp học phần?'),
        content: Text(
          item.registeredCount == 0
              ? 'Bạn có chắc muốn xóa ${item.classCode} - ${item.courseName}?'
              : 'Lớp có ${item.registeredCount} sinh viên. Xóa lớp sẽ đồng thời gỡ toàn bộ đăng ký liên quan. Bạn có chắc chắn?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Xóa lớp'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    try {
      await ref
          .read(lecturerRepositoryProvider)
          .deleteClass(item.courseClassId);
      ref.invalidate(courseClassProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã xóa lớp học phần.')),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    }
  }

  static String _periodMessage(RegistrationPeriodDto period) {
    final now = DateTime.now().toUtc();
    if (now.isBefore(period.startTime.toUtc())) {
      return 'Chỉ được điều chỉnh từ ${_format(period.startTime.toLocal())}.';
    }
    if (now.isAfter(period.endTime.toUtc())) {
      return 'Thời gian điều chỉnh đã kết thúc lúc ${_format(period.endTime.toLocal())}.';
    }
    return 'Học kỳ hiện không mở điều chỉnh lớp học phần.';
  }

  static String _format(DateTime value) =>
      '${value.day.toString().padLeft(2, '0')}/'
      '${value.month.toString().padLeft(2, '0')}/${value.year} '
      '${value.hour.toString().padLeft(2, '0')}:'
      '${value.minute.toString().padLeft(2, '0')}';
}

class _ApprovalStatusChip extends StatelessWidget {
  const _ApprovalStatusChip({required this.item});

  final LecturerCourseClassDto item;

  @override
  Widget build(BuildContext context) {
    final adjustment = item.latestAdjustment;
    final pending = item.proposals.any(
      (value) => value.status == TeachingScheduleStatus.pending,
    );
    final rejected =
        item.proposals.isNotEmpty &&
        item.proposals.every(
          (value) => value.status == TeachingScheduleStatus.rejected,
        );
    final (
      label,
      color,
      icon,
    ) = adjustment?.status == ClassAdjustmentStatus.pending
        ? ('Chờ duyệt điều chỉnh', Colors.orange, Icons.hourglass_top)
        : adjustment?.status == ClassAdjustmentStatus.rejected
        ? ('Điều chỉnh bị từ chối', Colors.red, Icons.cancel_outlined)
        : adjustment?.status == ClassAdjustmentStatus.approved
        ? ('Điều chỉnh đã duyệt', Colors.green, Icons.check_circle_outline)
        : pending
        ? ('Chờ phòng đào tạo duyệt', Colors.orange, Icons.hourglass_top)
        : rejected && item.status == CourseClassStatus.closed
        ? ('Yêu cầu bị từ chối', Colors.red, Icons.cancel_outlined)
        : item.status == CourseClassStatus.open
        ? ('Đã duyệt', Colors.green, Icons.check_circle_outline)
        : ('Đã đóng', Colors.grey, Icons.lock_outline);
    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      side: BorderSide(color: color.withValues(alpha: 0.45)),
    );
  }
}

class _ClassEditValue {
  const _ClassEditValue({required this.capacity, required this.schedule});

  final int capacity;
  final ClassScheduleDto schedule;
}

class _CourseClassEditDialog extends StatefulWidget {
  const _CourseClassEditDialog({required this.item, required this.rooms});

  final LecturerCourseClassDto item;
  final List<String> rooms;

  @override
  State<_CourseClassEditDialog> createState() => _CourseClassEditDialogState();
}

class _CourseClassEditDialogState extends State<_CourseClassEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _capacity;
  late final TextEditingController _startPeriod;
  late final TextEditingController _endPeriod;
  late int _dayOfWeek;
  late String _room;

  @override
  void initState() {
    super.initState();
    _capacity = TextEditingController(text: '${widget.item.capacity}');
    final schedule = _initialSchedule(widget.item);
    _startPeriod = TextEditingController(text: '${schedule.startPeriod}');
    _endPeriod = TextEditingController(text: '${schedule.endPeriod}');
    _dayOfWeek = schedule.dayOfWeek;
    _room = widget.rooms.contains(schedule.room)
        ? schedule.room
        : widget.rooms.first;
  }

  @override
  void dispose() {
    _capacity.dispose();
    _startPeriod.dispose();
    _endPeriod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Sửa lớp học phần'),
    insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    content: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Mã lớp: ${widget.item.classCode} (tự động)'),
            const SizedBox(height: 12),
            TextFormField(
              controller: _capacity,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Sĩ số',
                helperText:
                    'Từ ${widget.item.registeredCount} đến 500 sinh viên',
              ),
              validator: (value) {
                final capacity = int.tryParse(value ?? '');
                if (capacity == null) return 'Vui lòng nhập sĩ số';
                if (capacity < widget.item.registeredCount || capacity > 500) {
                  return 'Sĩ số phải từ ${widget.item.registeredCount} đến 500';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              initialValue: _dayOfWeek,
              decoration: const InputDecoration(labelText: 'Ngày học'),
              items: [
                for (var day = 2; day <= 7; day++)
                  DropdownMenuItem(value: day, child: Text('Thứ $day')),
              ],
              onChanged: (value) => setState(() => _dayOfWeek = value!),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _startPeriod,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Từ tiết',
                    ),
                    validator: _periodValidator,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _endPeriod,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Đến tiết',
                    ),
                    validator: _periodValidator,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _room,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Phòng học'),
              items: widget.rooms
                  .map(
                    (room) => DropdownMenuItem(value: room, child: Text(room)),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _room = value!),
            ),
            const SizedBox(height: 12),
            const Text(
              'Mọi thay đổi sẽ được gửi đến phòng đào tạo để duyệt.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Hủy'),
      ),
      FilledButton(
        onPressed: () {
          if (!_formKey.currentState!.validate()) return;
          final start = int.parse(_startPeriod.text);
          final end = int.parse(_endPeriod.text);
          if (end < start) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Tiết kết thúc phải sau tiết bắt đầu.'),
              ),
            );
            return;
          }
          Navigator.pop(
            context,
            _ClassEditValue(
              capacity: int.parse(_capacity.text),
              schedule: ClassScheduleDto(
                dayOfWeek: _dayOfWeek,
                startPeriod: start,
                endPeriod: end,
                room: _room,
              ),
            ),
          );
        },
        child: const Text('Gửi duyệt'),
      ),
    ],
  );

  String? _periodValidator(String? value) {
    final period = int.tryParse(value ?? '');
    return period == null || period < 1 || period > 12 ? 'Nhập từ 1–12' : null;
  }

  static ClassScheduleDto _initialSchedule(LecturerCourseClassDto item) {
    final pending = item.proposals.where(
      (value) => value.status == TeachingScheduleStatus.pending,
    );
    if (pending.isNotEmpty) {
      final value = pending.first;
      return ClassScheduleDto(
        dayOfWeek: value.dayOfWeek,
        startPeriod: value.startPeriod,
        endPeriod: value.endPeriod,
        room: value.room,
      );
    }
    if (item.schedules.isNotEmpty) return item.schedules.first;
    return ClassScheduleDto(
      dayOfWeek: 2,
      startPeriod: 1,
      endPeriod: 3,
      room: '',
    );
  }
}
