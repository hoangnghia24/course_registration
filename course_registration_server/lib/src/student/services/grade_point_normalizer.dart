import '../../generated/protocol.dart';

abstract final class GradePointNormalizer {
  static double fromTranscript(StudentTranscript record) {
    if (record.score <= 4) return record.score;
    if (record.score > 10) {
      throw ArgumentError.value(record.score, 'score', 'Expected 0..10');
    }
    return switch (record.letterGrade.toUpperCase()) {
      'A' => 4.0,
      'B+' => 3.5,
      'B' => 3.0,
      'C+' => 2.5,
      'C' => 2.0,
      'D+' => 1.5,
      'D' => 1.0,
      _ => 0.0,
    };
  }
}
