import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/error_handler.dart';
import '../providers/lecturer_providers.dart';

class CreateCourseClassPage extends ConsumerStatefulWidget {
  const CreateCourseClassPage({super.key, this.initialCourseId});

  final UuidValue? initialCourseId;
  @override
  ConsumerState<CreateCourseClassPage> createState() =>
      _CreateCourseClassPageState();
}

class _CreateCourseClassPageState extends ConsumerState<CreateCourseClassPage> {
  late UuidValue? _courseId = widget.initialCourseId;
  UuidValue? _semesterId;
  String? _room;
  ClassScheduleDto? _selectedSlot;
  List<ClassScheduleDto> _availableSlots = const [];
  final _capacity = TextEditingController(text: '50');
  bool _loadingSlots = false;
  bool _saving = false;

  @override
  void dispose() {
    _capacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(lecturerCoursesProvider);
    final semesters = ref.watch(lecturerSemestersProvider);
    final rooms = ref.watch(availableRoomsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Gửi yêu cầu mở lớp')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _section(
            context,
            title: 'Thông tin lớp',
            children: [
              DropdownButtonFormField<UuidValue>(
                key: const Key('class-course'),
                initialValue: _courseId,
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Môn học'),
                items: courses.value
                    ?.map(
                      (item) => DropdownMenuItem(
                        value: item.id!,
                        child: Text(
                          '${item.courseCode} - ${item.courseName}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _courseId = value),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<UuidValue>(
                isExpanded: true,
                decoration: const InputDecoration(labelText: 'Học kỳ'),
                items: semesters.value
                    ?.map(
                      (item) => DropdownMenuItem(
                        value: item.id!,
                        child: Text('${item.name} ${item.academicYear}'),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _semesterId = value;
                    _selectedSlot = null;
                  });
                  _loadSlots();
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _capacity,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Sĩ số tối đa',
                  helperText: 'Từ 1 đến 500 sinh viên',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Mã lớp được hệ thống tạo tự động.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _section(
            context,
            title: 'Phòng học và thời gian',
            children: [
              const Text(
                'Chỉ hiển thị khung giờ chưa trùng lịch dạy và chưa có lớp sử dụng phòng.',
              ),
              const SizedBox(height: 14),
              rooms.when(
                loading: () => const LinearProgressIndicator(),
                error: (error, _) => Text('$error'),
                data: (values) => DropdownButtonFormField<String>(
                  key: const Key('class-room'),
                  initialValue: _room,
                  decoration: const InputDecoration(
                    labelText: 'Phòng học',
                    prefixIcon: Icon(Icons.meeting_room_outlined),
                  ),
                  items: values
                      .map(
                        (room) => DropdownMenuItem(
                          value: room,
                          child: Text(room),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _room = value;
                      _selectedSlot = null;
                    });
                    _loadSlots();
                  },
                ),
              ),
              const SizedBox(height: 18),
              if (_semesterId == null || _room == null)
                const Text('Hãy chọn học kỳ và phòng để xem lịch trống.')
              else if (_loadingSlots)
                const Center(child: CircularProgressIndicator())
              else if (_availableSlots.isEmpty)
                const Text('Không còn khung giờ trống cho phòng này.')
              else
                ..._buildSlotGroups(),
            ],
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            key: const Key('create-class-submit'),
            onPressed: _saving ? null : _save,
            icon: const Icon(Icons.add_business_outlined),
            label: Text(
              _saving ? 'Đang gửi...' : 'Gửi phòng đào tạo duyệt',
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    ),
  );

  List<Widget> _buildSlotGroups() {
    final widgets = <Widget>[];
    for (var day = 2; day <= 7; day++) {
      final values = _availableSlots
          .where((slot) => slot.dayOfWeek == day)
          .toList();
      if (values.isEmpty) continue;
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: Text(
            'Thứ $day',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      );
      widgets.add(
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: values
              .map(
                (slot) => ChoiceChip(
                  label: Text('Tiết ${slot.startPeriod}–${slot.endPeriod}'),
                  selected: _sameSlot(_selectedSlot, slot),
                  onSelected: (_) => setState(() => _selectedSlot = slot),
                ),
              )
              .toList(),
        ),
      );
    }
    return widgets;
  }

  bool _sameSlot(ClassScheduleDto? first, ClassScheduleDto second) =>
      first?.dayOfWeek == second.dayOfWeek &&
      first?.startPeriod == second.startPeriod &&
      first?.endPeriod == second.endPeriod;

  Future<void> _loadSlots() async {
    if (_semesterId == null || _room == null) return;
    setState(() => _loadingSlots = true);
    try {
      final values = await ref
          .read(lecturerRepositoryProvider)
          .getAvailableScheduleSlots(semesterId: _semesterId!, room: _room!);
      if (mounted) setState(() => _availableSlots = values);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ErrorHandler.message(error))),
        );
      }
    } finally {
      if (mounted) setState(() => _loadingSlots = false);
    }
  }

  Future<void> _save() async {
    final capacity = int.tryParse(_capacity.text);
    if (_courseId == null ||
        _semesterId == null ||
        _room == null ||
        _selectedSlot == null ||
        capacity == null ||
        capacity < 1 ||
        capacity > 500) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn đầy đủ thông tin hợp lệ.')),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      await ref
          .read(lecturerRepositoryProvider)
          .createClass(
            courseId: _courseId!,
            semesterId: _semesterId!,
            capacity: capacity,
            schedules: [_selectedSlot!.copyWith(room: _room!)],
          );
      ref.invalidate(courseClassProvider);
      ref.invalidate(scheduleProvider);
      ref.invalidate(classDemandProvider);
      if (mounted) Navigator.pop(context);
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
