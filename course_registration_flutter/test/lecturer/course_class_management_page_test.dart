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

  testWidgets('deleting a class with students shows a clear warning', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
        ],
        child: const MaterialApp(home: CourseClassManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Xóa'));
    await tester.pumpAndSettle();

    expect(find.text('Không thể xóa lớp'), findsOneWidget);
    expect(find.textContaining('đang có 45 sinh viên học'), findsOneWidget);
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
  Future<LecturerCourseClassDto> updateClass({
    required UuidValue courseClassId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) async {
    updatedCapacity = capacity;
    updatedSchedules = schedules;
    return lecturerClass().copyWith(
      capacity: capacity,
      status: CourseClassStatus.closed,
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
