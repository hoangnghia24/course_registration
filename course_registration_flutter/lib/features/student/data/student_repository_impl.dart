import 'dart:convert';

import 'package:course_registration_client/course_registration_client.dart';

import '../../../core/database/app_database.dart';
import '../domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  StudentRepositoryImpl(this._client, this._database);

  final Client _client;
  final AppDatabase _database;

  @override
  Future<StudentProfileDto> getProfile() async {
    try {
      final profile = await _client.student.getProfile();
      await _database.cacheStudentProfile(
        profile.studentId.toString(),
        jsonEncode(profile.toJson()),
      );
      return profile;
    } catch (_) {
      final cached = await _database.latestStudentProfile();
      if (cached == null) rethrow;
      return StudentProfileDto.fromJson(
        jsonDecode(cached.payload) as Map<String, dynamic>,
      );
    }
  }

  @override
  Future<List<TrainingProgramCourseDto>> getTrainingProgram(
    UuidValue studentId,
  ) async {
    final key = studentId.toString();
    try {
      final courses = await _client.student.getTrainingProgram(
        studentId: studentId,
      );
      await _database.cacheTrainingProgram(
        key,
        jsonEncode(courses.map((course) => course.toJson()).toList()),
      );
      return courses;
    } catch (_) {
      final cached = await _database.readTrainingProgram(key);
      if (cached == null) rethrow;
      return (jsonDecode(cached.payload) as List<dynamic>)
          .map(
            (json) => TrainingProgramCourseDto.fromJson(
              json as Map<String, dynamic>,
            ),
          )
          .toList(growable: false);
    }
  }

  @override
  Future<List<TranscriptDto>> getTranscript(UuidValue studentId) async {
    final key = studentId.toString();
    try {
      final transcript = await _client.student.getTranscript(
        studentId: studentId,
      );
      await _database.cacheTranscript(
        key,
        jsonEncode(transcript.map((item) => item.toJson()).toList()),
      );
      return transcript;
    } catch (_) {
      final cached = await _database.readTranscript(key);
      if (cached == null) rethrow;
      return _decodeTranscript(cached.payload);
    }
  }

  @override
  Future<GpaDto> getGpa(UuidValue studentId, {String? semester}) async {
    try {
      return await _client.student.getGpa(
        studentId: studentId,
        semester: semester,
      );
    } catch (_) {
      final cached = await _database.readTranscript(studentId.toString());
      if (cached == null) rethrow;
      return _calculateCachedGpa(
        _decodeTranscript(cached.payload),
        semester: semester,
      );
    }
  }

  List<TranscriptDto> _decodeTranscript(String payload) =>
      (jsonDecode(payload) as List<dynamic>)
          .map(
            (json) => TranscriptDto.fromJson(json as Map<String, dynamic>),
          )
          .toList(growable: false);

  GpaDto _calculateCachedGpa(
    List<TranscriptDto> transcript, {
    String? semester,
  }) {
    final latest = <UuidValue, TranscriptDto>{};
    for (final item in transcript) {
      final current = latest[item.courseId];
      if (current == null || item.attemptNumber > current.attemptNumber) {
        latest[item.courseId] = item;
      }
    }
    final all = latest.values.toList(growable: false);
    final semesterItems = semester == null
        ? const <TranscriptDto>[]
        : all.where((item) => item.semester == semester).toList();
    return GpaDto(
      semester: semester,
      semesterGpa: semester == null ? null : _weighted(semesterItems),
      cumulativeGpa: _weighted(all),
      attemptedCredits: all.fold(0, (sum, item) => sum + item.credits),
      earnedCredits: all
          .where((item) => item.status == TranscriptStatus.passed)
          .fold(0, (sum, item) => sum + item.credits),
    );
  }

  double _weighted(List<TranscriptDto> items) {
    final credits = items.fold(0, (sum, item) => sum + item.credits);
    if (credits == 0) return 0;
    final points = items.fold<double>(
      0,
      (sum, item) => sum + item.score * item.credits,
    );
    return (points / credits * 100).roundToDouble() / 100;
  }
}
