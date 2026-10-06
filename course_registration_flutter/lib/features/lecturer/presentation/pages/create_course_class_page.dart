import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lecturer_providers.dart';

class CreateCourseClassPage extends ConsumerStatefulWidget {
  const CreateCourseClassPage({super.key});
  @override
  ConsumerState<CreateCourseClassPage> createState() =>
      _CreateCourseClassPageState();
}

class _CreateCourseClassPageState extends ConsumerState<CreateCourseClassPage> {
  UuidValue? _courseId;
  UuidValue? _semesterId;
  final _code = TextEditingController();
  final _capacity = TextEditingController(text: '50');
  final _day = TextEditingController(text: '2');
  final _start = TextEditingController(text: '1');
  final _end = TextEditingController(text: '3');
  final _room = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    for (final controller in [_code, _capacity, _day, _start, _end, _room]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(lecturerCoursesProvider);
    final semesters = ref.watch(lecturerSemestersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo lớp học phần')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<UuidValue>(
            decoration: const InputDecoration(labelText: 'Chọn môn'),
            items: courses.value
                ?.map(
                  (item) => DropdownMenuItem(
                    value: item.id!,
                    child: Text('${item.courseCode} - ${item.courseName}'),
                  ),
                )
                .toList(),
            onChanged: (value) => _courseId = value,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<UuidValue>(
            decoration: const InputDecoration(labelText: 'Chọn học kỳ'),
            items: semesters.value
                ?.map(
                  (item) => DropdownMenuItem(
                    value: item.id!,
                    child: Text('${item.name} ${item.academicYear}'),
                  ),
                )
                .toList(),
            onChanged: (value) => _semesterId = value,
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('class-code'),
            controller: _code,
            decoration: const InputDecoration(labelText: 'Mã lớp'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _capacity,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Sĩ số tối đa'),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _day,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Thứ'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _start,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Tiết đầu'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _end,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Tiết cuối'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _room,
            decoration: const InputDecoration(labelText: 'Phòng học'),
          ),
          const SizedBox(height: 20),
          FilledButton(
            key: const Key('create-class-submit'),
            onPressed: _saving ? null : _save,
            child: const Text('Tạo lớp'),
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    final capacity = int.tryParse(_capacity.text);
    final day = int.tryParse(_day.text);
    final start = int.tryParse(_start.text);
    final end = int.tryParse(_end.text);
    if (_courseId == null ||
        _semesterId == null ||
        _code.text.trim().isEmpty ||
        capacity == null ||
        day == null ||
        start == null ||
        end == null ||
        _room.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin.')),
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
            classCode: _code.text,
            capacity: capacity,
            schedules: [
              ClassScheduleDto(
                dayOfWeek: day,
                startPeriod: start,
                endPeriod: end,
                room: _room.text,
              ),
            ],
          );
      ref.invalidate(courseClassProvider);
      ref.invalidate(scheduleProvider);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$error')));
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }
}
