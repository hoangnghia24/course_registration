import 'dart:async';

import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/core/theme/app_theme.dart';
import 'package:course_registration_flutter/features/admin/presentation/pages/admin_dashboard_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/pages/lecturer_dashboard_page.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/providers/lecturer_providers.dart';
import 'package:course_registration_flutter/features/registration/presentation/pages/course_search_page.dart';
import 'package:course_registration_flutter/features/registration/presentation/providers/course_registration_providers.dart';
import 'package:course_registration_flutter/features/student/presentation/pages/student_profile_page.dart';
import 'package:course_registration_flutter/features/student/presentation/providers/student_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../admin/admin_fixtures.dart';
import '../lecturer/lecturer_fixtures.dart';

void main() {
  const sizes = [Size(360, 640), Size(800, 1280), Size(1440, 900)];
  const modes = [ThemeMode.light, ThemeMode.dark];

  testWidgets(
    'student, lecturer, admin and registration pages are responsive',
    (
      tester,
    ) async {
      final startup = Stopwatch()..start();
      for (final size in sizes) {
        await tester.binding.setSurfaceSize(size);
        for (final mode in modes) {
          await _pump(
            tester,
            mode,
            const StudentProfilePage(),
            [studentProfileProvider.overrideWith((ref) async => _profile())],
          );
          await _pump(tester, mode, const LecturerDashboardPage(), [
            lecturerProvider.overrideWith((ref) async => lecturerProfile()),
            courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
            scheduleProvider.overrideWith((ref) async => []),
          ]);
          await _pump(tester, mode, const AdminDashboardPage(), [
            adminProvider.overrideWith((ref) async => adminReport()),
          ]);
          await _pump(tester, mode, const CourseSearchPage(), [
            availableOpenClassesProvider.overrideWith(
              (ref) async => [_openClass()],
            ),
          ]);
        }
      }
      startup.stop();
      // ignore: avoid_print
      print('PERF widget_matrix_24_pumps=${startup.elapsedMicroseconds}us');
    },
  );

  testWidgets('course list exposes loading, empty and error states', (
    tester,
  ) async {
    final pending = Completer<List<OpenCourseClassDto>>();
    await _pump(tester, ThemeMode.light, const CourseSearchPage(), [
      availableOpenClassesProvider.overrideWith((ref) => pending.future),
    ], settle: false);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await _pump(tester, ThemeMode.light, const CourseSearchPage(), [
      availableOpenClassesProvider.overrideWith((ref) async => []),
    ]);
    expect(find.textContaining('Không tìm thấy'), findsOneWidget);

    await _pump(tester, ThemeMode.dark, const CourseSearchPage(), [
      availableOpenClassesProvider.overrideWith(
        (ref) async => throw StateError('synthetic failure'),
      ),
    ]);
    expect(find.text('Thử lại'), findsOneWidget);
  });

  testWidgets('representative controls meet accessibility guidelines', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 1280));
    await _pump(tester, ThemeMode.dark, const CourseSearchPage(), [
      availableOpenClassesProvider.overrideWith((ref) async => [_openClass()]),
    ]);
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
  });
}

Future<void> _pump(
  WidgetTester tester,
  ThemeMode mode,
  Widget page,
  List<dynamic> overrides, {
  bool settle = true,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      key: UniqueKey(),
      overrides: overrides.cast(),
      child: MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: mode,
        home: page,
      ),
    ),
  );
  if (settle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
  }
  expect(tester.takeException(), isNull);
}

StudentProfileDto _profile() => StudentProfileDto(
  studentId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000901',
  ),
  fullName: 'Responsive Student',
  email: 'responsive@example.edu',
  studentCode: 'P8-RESPONSIVE',
  majorName: 'Software Engineering',
  facultyName: 'Information Technology',
  trainingProgramName: 'Phase 8 Program',
  academicYear: 2026,
  enrollmentYear: 2026,
  currentSemester: 1,
  gpa: 3.5,
  totalCredits: 30,
  programTotalCredits: 130,
);

OpenCourseClassDto _openClass() => OpenCourseClassDto(
  courseClassId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000902',
  ),
  courseId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000903',
  ),
  semesterId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000904',
  ),
  classCode: 'P8-RESPONSIVE-CLASS',
  courseCode: 'P8-UI',
  courseName: 'Responsive User Interface',
  credits: 3,
  lecturerName: 'Phase 8 Lecturer',
  capacity: 50,
  registeredCount: 30,
  remainingSeats: 20,
  status: CourseClassStatus.open,
  inTrainingProgram: true,
  schedules: [
    ClassScheduleDto(dayOfWeek: 2, startPeriod: 1, endPeriod: 3, room: 'A101'),
  ],
);
