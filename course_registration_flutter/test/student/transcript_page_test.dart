import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/student/presentation/pages/transcript_page.dart';
import 'package:course_registration_flutter/features/student/presentation/providers/student_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('transcript screen displays course grade and status', (
    tester,
  ) async {
    final item = TranscriptDto(
      transcriptId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000010',
      ),
      courseId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000011',
      ),
      courseCode: 'CS101',
      courseName: 'Lập trình cơ bản',
      credits: 3,
      semester: '2025-1',
      score: 3.5,
      letterGrade: 'B+',
      status: TranscriptStatus.passed,
      attemptNumber: 1,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          transcriptProvider.overrideWith((ref) async => [item]),
        ],
        child: const MaterialApp(home: TranscriptPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('CS101'), findsOneWidget);
    expect(find.text('Lập trình cơ bản'), findsOneWidget);
    expect(find.text('B+'), findsOneWidget);
    expect(find.text('Đạt'), findsOneWidget);
    expect(find.text('3.50'), findsOneWidget);

    await tester.tap(find.text('Thang 10'));
    await tester.pumpAndSettle();
    expect(find.text('8.75'), findsOneWidget);
    expect(find.text('Điểm / 10'), findsOneWidget);
  });
}
