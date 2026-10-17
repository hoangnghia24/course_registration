import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/student/presentation/pages/training_program_page.dart';
import 'package:course_registration_flutter/features/student/presentation/providers/student_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('status chips show only courses with the selected progress', (
    tester,
  ) async {
    final courses = [
      _course('CNTT101', 'Đã hoàn thành', CourseProgressStatus.completed, 1),
      _course('CNTT102', 'Chưa bắt đầu', CourseProgressStatus.notStarted, 2),
      _course('CNTT103', 'Học dở', CourseProgressStatus.inProgress, 3),
    ];
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          trainingProgramProvider.overrideWith((ref) async => courses),
        ],
        child: const MaterialApp(home: TrainingProgramPage()),
      ),
    );
    await tester.pumpAndSettle();

    void expectVisible(String visible) {
      for (final name in ['Đã hoàn thành', 'Chưa bắt đầu', 'Học dở']) {
        expect(
          find.text(name),
          name == visible ? findsOneWidget : findsNothing,
        );
      }
    }

    for (final name in ['Đã hoàn thành', 'Chưa bắt đầu', 'Học dở']) {
      expect(find.text(name), findsOneWidget);
    }
    await tester.tap(find.widgetWithText(FilterChip, 'Đã học'));
    await tester.pumpAndSettle();
    expectVisible('Đã hoàn thành');

    await tester.tap(find.widgetWithText(FilterChip, 'Chưa học'));
    await tester.pumpAndSettle();
    expectVisible('Chưa bắt đầu');

    await tester.tap(find.widgetWithText(FilterChip, 'Đang học'));
    await tester.pumpAndSettle();
    expectVisible('Học dở');

    await tester.tap(find.widgetWithText(FilterChip, 'Tất cả'));
    await tester.pumpAndSettle();
    for (final name in ['Đã hoàn thành', 'Chưa bắt đầu', 'Học dở']) {
      expect(find.text(name), findsOneWidget);
    }
  });

  testWidgets('empty selected status shows the empty state', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          trainingProgramProvider.overrideWith(
            (ref) async => [
              _course(
                'CNTT101',
                'Đã hoàn thành',
                CourseProgressStatus.completed,
                1,
              ),
            ],
          ),
        ],
        child: const MaterialApp(home: TrainingProgramPage()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilterChip, 'Chưa học'));
    await tester.pumpAndSettle();

    expect(find.text('Không có môn học phù hợp.'), findsOneWidget);
    expect(find.text('Đã hoàn thành'), findsNothing);
  });
}

TrainingProgramCourseDto _course(
  String code,
  String name,
  CourseProgressStatus progress,
  int id,
) => TrainingProgramCourseDto(
  courseId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-${id.toString().padLeft(12, '0')}',
  ),
  courseCode: code,
  courseName: name,
  credits: 3,
  semesterNumber: 1,
  isRequired: true,
  courseType: CourseType.compulsory,
  progressStatus: progress,
);
