import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/registration/presentation/pages/course_registration_dashboard_page.dart';
import 'package:course_registration_flutter/features/registration/presentation/pages/my_registered_courses_page.dart';
import 'package:course_registration_flutter/features/registration/presentation/providers/course_registration_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final creditsByClass in <List<int>>[
    [],
    [3],
    [3, 4],
  ]) {
    final total = creditsByClass.fold<int>(0, (sum, value) => sum + value);
    testWidgets('summary and progress use $total registered credits', (
      tester,
    ) async {
      final semesterId = UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000301',
      );
      final semester = Semester(
        id: semesterId,
        name: 'Học kỳ 1',
        academicYear: 2026,
        startDate: DateTime.utc(2020),
        endDate: DateTime.utc(2030, 12, 31),
        status: SemesterStatus.open,
      );
      final courses = [
        for (var index = 0; index < creditsByClass.length; index++)
          RegisteredCourseDto(
            registrationId: semesterId,
            courseClassId: semesterId,
            semesterId: semesterId,
            classCode: 'IT10$index-01',
            courseCode: 'IT10$index',
            courseName: 'Môn $index',
            credits: creditsByClass[index],
            lecturerName: 'Giảng viên',
            registeredAt: DateTime.utc(2026),
            status: RegistrationStatus.registered,
            schedules: const [],
          ),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentSemesterProvider.overrideWith((ref) async => semester),
            myRegisteredCoursesProvider.overrideWith((ref) async => courses),
            registrationPeriodProvider.overrideWith(
              (ref) async => RegistrationPeriodDto(
                semesterId: semesterId,
                semesterName: semester.name,
                academicYear: semester.academicYear,
                startTime: DateTime.utc(2020),
                endTime: DateTime.utc(2030),
                lecturerStartTime: DateTime.utc(2020),
                lecturerEndTime: DateTime.utc(2030),
                status: RegistrationPeriodStatus.active,
                configured: true,
                isOpen: true,
                isLecturerOpen: true,
              ),
            ),
          ],
          child: const MaterialApp(home: CourseRegistrationDashboardPage()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Tín chỉ đã đăng ký: $total/25'), findsOneWidget);
      expect(
        tester
            .widget<LinearProgressIndicator>(
              find.byType(LinearProgressIndicator),
            )
            .value,
        total / 25,
      );
    });
  }

  testWidgets('registered list shows the same 3 credits as its DTO', (
    tester,
  ) async {
    final id = UuidValue.withValidation('018f0000-0000-7000-8000-000000000302');
    final course = RegisteredCourseDto(
      registrationId: id,
      courseClassId: id,
      semesterId: id,
      classCode: 'CNTT102-01',
      courseCode: 'CNTT102',
      courseName: 'Môn học',
      credits: 3,
      lecturerName: 'Giảng viên',
      registeredAt: DateTime.utc(2026),
      status: RegistrationStatus.registered,
      schedules: const [],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          myRegisteredCoursesProvider.overrideWith((ref) async => [course]),
          pendingRegistrationsProvider.overrideWith(
            (ref) => Stream.value([]),
          ),
          registrationPeriodProvider.overrideWith(
            (ref) async => RegistrationPeriodDto(
              semesterId: id,
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
            ),
          ),
        ],
        child: const MaterialApp(home: MyRegisteredCoursesPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('CNTT102-01 • 3 tín chỉ'), findsOneWidget);
  });
}
