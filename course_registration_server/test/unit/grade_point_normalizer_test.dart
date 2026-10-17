import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:course_registration_server/src/student/services/grade_point_normalizer.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

void main() {
  test('normalizes legacy ten-point rows for student and admin GPA', () {
    final id = UuidValue.withValidation('018f0000-0000-7000-8000-000000000010');
    final row = StudentTranscript(
      studentId: id,
      courseId: id,
      semester: '2026-1',
      score: 8.0,
      letterGrade: 'B+',
      status: TranscriptStatus.passed,
    );
    expect(GradePointNormalizer.fromTranscript(row), 3.5);
  });
}
