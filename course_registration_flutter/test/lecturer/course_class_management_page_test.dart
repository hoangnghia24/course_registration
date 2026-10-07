import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/lecturer/domain/repositories/lecturer_repository.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/pages/course_class_management_page.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/providers/lecturer_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'lecturer_fixtures.dart';

void main() {
  testWidgets('class management displays class and actions', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
          lecturerRegistrationPeriodProvider(
            lecturerClass().semesterId,
          ).overrideWith((ref) async => _period()),
        ],
        child: const MaterialApp(home: CourseClassManagementPage()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('IT101 - Lập trình cơ bản'), findsOneWidget);
    expect(find.text('45/50 sinh viên'), findsOneWidget);
    expect(find.text('Chi tiết'), findsOneWidget);
    expect(find.text('Sửa'), findsOneWidget);
    expect(find.text('Xóa'), findsOneWidget);
    expect(find.text('Đã duyệt'), findsOneWidget);
  });

  testWidgets('deleting a class preserves registration history', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
          lecturerRegistrationPeriodProvider(
            lecturerClass().semesterId,
          ).overrideWith((ref) async => _period()),
        ],
        child: const MaterialApp(home: CourseClassManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Xóa'));
    await tester.pumpAndSettle();

    expect(find.text('Xóa lớp học phần?'), findsOneWidget);
    expect(find.textContaining('không thể xóa'), findsOneWidget);
    final deleteButton = find.widgetWithText(FilledButton, 'Xóa lớp');
    expect(tester.widget<FilledButton>(deleteButton).onPressed, isNull);
  });

  testWidgets('class changes are submitted as an approval request', (
    tester,
  ) async {
    final repository = _FakeLecturerRepository();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lecturerRepositoryProvider.overrideWithValue(repository),
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
          availableRoomsProvider.overrideWith((ref) async => ['A101']),
        ],
        child: const MaterialApp(home: CourseClassManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sửa'));
    await tester.pumpAndSettle();
    expect(find.text('Ngày học'), findsOneWidget);
    expect(find.text('Từ tiết'), findsOneWidget);
    expect(find.text('Đến tiết'), findsOneWidget);
    expect(find.text('Phòng học'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).first, '55');
    await tester.tap(find.text('Gửi duyệt'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(repository.updatedCapacity, 55);
    expect(repository.updatedSchedules.single.room, 'A101');
  });
}

class _FakeLecturerRepository implements LecturerRepository {
  int? updatedCapacity;
  List<ClassScheduleDto> updatedSchedules = const [];

  @override
  Future<ClassAdjustmentRequestDto> updateClass({
    required UuidValue courseClassId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) async {
    updatedCapacity = capacity;
    updatedSchedules = schedules;
    final item = lecturerClass();
    return ClassAdjustmentRequestDto(
      requestId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000299',
      ),
      courseClassId: courseClassId,
      classCode: item.classCode,
      courseCode: item.courseCode,
      courseName: item.courseName,
      lecturerName: 'Nguyễn Văn A',
      oldCapacity: item.capacity,
      newCapacity: capacity,
      oldSchedules: item.schedules,
      newSchedules: schedules,
      status: ClassAdjustmentStatus.pending,
      createdAt: DateTime.utc(2026, 10, 7),
    );
  }

  @override
  Future<LecturerProfileDto> getProfile() => throw UnimplementedError();
  @override
  Future<List<LecturerCourseClassDto>> getClasses() =>
      throw UnimplementedError();
  @override
  Future<List<TeachingScheduleProposal>> getSchedule() =>
      throw UnimplementedError();
  @override
  Future<List<ClassStudentDto>> getStudents(UuidValue courseClassId) =>
      throw UnimplementedError();
  @override
  Future<List<ClassDemandDto>> getDemand() => throw UnimplementedError();
  @override
  Future<List<Course>> getCourses() => throw UnimplementedError();
  @override
  Future<List<Semester>> getSemesters() => throw UnimplementedError();
  @override
  Future<List<String>> getAvailableRooms() => throw UnimplementedError();
  @override
  Future<RegistrationPeriodDto> getRegistrationPeriod(UuidValue semesterId) =>
      Future.value(_period());
  @override
  Future<List<ClassScheduleDto>> getAvailableScheduleSlots({
    required UuidValue semesterId,
    required String room,
  }) => throw UnimplementedError();
  @override
  Future<LecturerCourseClassDto> createClass({
    required UuidValue courseId,
    required UuidValue semesterId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) => throw UnimplementedError();
  @override
  Future<void> deleteClass(UuidValue courseClassId) =>
      throw UnimplementedError();
  @override
  Future<void> updateStudentGrades({
    required UuidValue courseClassId,
    required UuidValue studentId,
    required double midtermScore,
    required double finalScore,
  }) => throw UnimplementedError();
}

RegistrationPeriodDto _period() => RegistrationPeriodDto(
  semesterId: lecturerClass().semesterId,
  semesterName: 'Học kỳ 1',
  academicYear: 2026,
  startTime: DateTime.utc(2020),
  endTime: DateTime.utc(2030),
  lecturerStartTime: DateTime.utc(2020),
  lecturerEndTime: DateTime.utc(2030),
  status: RegistrationPeriodStatus.active,
  configured: true,
  isOpen: true,
  isLecturerOpen: true,
);
