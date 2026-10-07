import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/registration/presentation/pages/course_schedule_page.dart';
import 'package:course_registration_flutter/features/registration/presentation/providers/course_registration_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('student schedule supports week and day selection in a grid', (
    tester,
  ) async {
    final id = UuidValue.withValidation(
      '018f0000-0000-7000-8000-000000000301',
    );
    final semester = Semester(
      id: id,
      name: 'Học kỳ 1',
      academicYear: 2026,
      startDate: DateTime.utc(2020),
      endDate: DateTime.utc(2030, 12, 31),
      status: SemesterStatus.open,
    );
    final course = RegisteredCourseDto(
      registrationId: id,
      courseClassId: id,
      semesterId: id,
      classCode: 'IT101-01',
      courseCode: 'IT101',
      courseName: 'Lập trình cơ bản',
      credits: 3,
      lecturerName: 'Nguyễn Văn A',
      registeredAt: DateTime.utc(2026),
      status: RegistrationStatus.registered,
      schedules: [
        ClassScheduleDto(
          dayOfWeek: 2,
          startPeriod: 1,
          endPeriod: 3,
          room: 'A101',
        ),
      ],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentSemesterProvider.overrideWith((ref) async => semester),
          myRegisteredCoursesProvider.overrideWith((ref) async => [course]),
        ],
        child: const MaterialApp(home: CourseSchedulePage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining(' – '), findsOneWidget);
    expect(find.byTooltip('Tuần trước'), findsOneWidget);
    expect(find.byTooltip('Tuần sau'), findsOneWidget);
    await tester.tap(find.byKey(const Key('schedule-day-1')));
    await tester.pumpAndSettle();

    expect(find.text('Tiết 1'), findsOneWidget);
    expect(find.textContaining('IT101 - Lập trình cơ bản'), findsWidgets);
    expect(find.textContaining('Phòng A101'), findsWidgets);
  });

  testWidgets('student schedule keeps week controls and grid when empty', (
    tester,
  ) async {
    final semester = Semester(
      id: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000302',
      ),
      name: 'Học kỳ 1',
      academicYear: 2026,
      startDate: DateTime.utc(2020),
      endDate: DateTime.utc(2030, 12, 31),
      status: SemesterStatus.open,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          currentSemesterProvider.overrideWith((ref) async => semester),
          myRegisteredCoursesProvider.overrideWith((ref) async => const []),
        ],
        child: const MaterialApp(home: CourseSchedulePage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byTooltip('Tuần trước'), findsOneWidget);
    expect(find.byKey(const Key('schedule-day-1')), findsOneWidget);
    expect(find.text('Tiết 1'), findsOneWidget);
  });
}
