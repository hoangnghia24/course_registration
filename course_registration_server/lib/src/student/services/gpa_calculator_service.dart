import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

class GpaAttempt {
  const GpaAttempt({
    required this.courseId,
    required this.credits,
    required this.score,
    required this.status,
    required this.attemptNumber,
    required this.semester,
  });

  final UuidValue courseId;
  final int credits;
  final double score;
  final TranscriptStatus status;
  final int attemptNumber;
  final String semester;
}

abstract final class GpaCalculatorService {
  static GpaDto calculate(List<GpaAttempt> attempts, {String? semester}) {
    for (final attempt in attempts) {
      if (attempt.credits <= 0) {
        throw ArgumentError.value(attempt.credits, 'credits');
      }
      if (attempt.score < 0 || attempt.score > 4) {
        throw ArgumentError.value(attempt.score, 'score', 'Expected 0..4');
      }
    }

    final cumulativeAttempts = _latestAttempts(attempts);
    final semesterAttempts = semester == null
        ? const <GpaAttempt>[]
        : _latestAttempts(
            attempts.where((attempt) => attempt.semester == semester),
          );

    final attemptedCredits = cumulativeAttempts.fold<int>(
      0,
      (total, attempt) => total + attempt.credits,
    );
    final earnedCredits = cumulativeAttempts
        .where((attempt) => attempt.status == TranscriptStatus.passed)
        .fold<int>(0, (total, attempt) => total + attempt.credits);

    return GpaDto(
      semester: semester,
      semesterGpa: semester == null ? null : _weightedGpa(semesterAttempts),
      cumulativeGpa: _weightedGpa(cumulativeAttempts),
      attemptedCredits: attemptedCredits,
      earnedCredits: earnedCredits,
    );
  }

  static List<GpaAttempt> _latestAttempts(Iterable<GpaAttempt> attempts) {
    final latest = <UuidValue, GpaAttempt>{};
    for (final attempt in attempts) {
      final current = latest[attempt.courseId];
      if (current == null || attempt.attemptNumber > current.attemptNumber) {
        latest[attempt.courseId] = attempt;
      }
    }
    return latest.values.toList(growable: false);
  }

  static double _weightedGpa(List<GpaAttempt> attempts) {
    final credits = attempts.fold<int>(
      0,
      (total, attempt) => total + attempt.credits,
    );
    if (credits == 0) return 0;
    final points = attempts.fold<double>(
      0,
      (total, attempt) => total + attempt.score * attempt.credits,
    );
    return (points / credits * 100).roundToDouble() / 100;
  }
}
