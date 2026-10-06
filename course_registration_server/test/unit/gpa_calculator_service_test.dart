import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:course_registration_server/src/student/services/gpa_calculator_service.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

void main() {
  final courseA = UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000001',
  );
  final courseB = UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000002',
  );

  test('calculates weighted semester and cumulative GPA', () {
    final result = GpaCalculatorService.calculate(
      [
        GpaAttempt(
          courseId: courseA,
          credits: 3,
          score: 4,
          status: TranscriptStatus.passed,
          attemptNumber: 1,
          semester: '2025-1',
        ),
        GpaAttempt(
          courseId: courseB,
          credits: 2,
          score: 2.5,
          status: TranscriptStatus.passed,
          attemptNumber: 1,
          semester: '2025-2',
        ),
      ],
      semester: '2025-1',
    );

    expect(result.semesterGpa, 4);
    expect(result.cumulativeGpa, 3.4);
    expect(result.attemptedCredits, 5);
    expect(result.earnedCredits, 5);
  });

  test('latest retake replaces the previous failed attempt', () {
    final result = GpaCalculatorService.calculate([
      GpaAttempt(
        courseId: courseA,
        credits: 3,
        score: 0.8,
        status: TranscriptStatus.failed,
        attemptNumber: 1,
        semester: '2024-2',
      ),
      GpaAttempt(
        courseId: courseA,
        credits: 3,
        score: 3.2,
        status: TranscriptStatus.passed,
        attemptNumber: 2,
        semester: '2025-1',
      ),
      GpaAttempt(
        courseId: courseB,
        credits: 2,
        score: 1,
        status: TranscriptStatus.failed,
        attemptNumber: 1,
        semester: '2025-1',
      ),
    ]);

    expect(result.cumulativeGpa, 2.32);
    expect(result.attemptedCredits, 5);
    expect(result.earnedCredits, 3);
  });
}
