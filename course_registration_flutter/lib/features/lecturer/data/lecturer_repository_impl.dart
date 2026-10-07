import 'dart:convert';

import 'package:course_registration_client/course_registration_client.dart';

import '../../../core/database/app_database.dart';
import '../domain/repositories/lecturer_repository.dart';

class LecturerRepositoryImpl implements LecturerRepository {
  LecturerRepositoryImpl(this._client, this._database);
  final Client _client;
  final AppDatabase _database;

  @override
  Future<LecturerProfileDto> getProfile() async {
    try {
      final value = await _client.lecturer.getMyProfile();
      await _database.cacheLecturerProfile(
        value.lecturerId.toString(),
        jsonEncode(value.toJson()),
      );
      return value;
    } catch (_) {
      final cached = await _database.latestLecturerProfile();
      if (cached == null) rethrow;
      return LecturerProfileDto.fromJson(
        jsonDecode(cached.payload) as Map<String, dynamic>,
      );
    }
  }

  @override
  Future<List<LecturerCourseClassDto>> getClasses() async {
    final profile = await getProfile();
    final key = profile.lecturerId.toString();
    try {
      final values = await _client.lecturer.getMyCourseClasses();
      await _database.cacheMyClasses(key, _encode(values));
      return values;
    } catch (_) {
      final cached = await _database.readMyClasses(key);
      if (cached == null) rethrow;
      return _decode(cached.payload, LecturerCourseClassDto.fromJson);
    }
  }

  @override
  Future<List<TeachingScheduleProposal>> getSchedule() async {
    final profile = await getProfile();
    final key = profile.lecturerId.toString();
    try {
      final values = await _client.lecturer.getMySchedule();
      await _database.cacheLecturerSchedule(key, _encode(values));
      return values;
    } catch (_) {
      final cached = await _database.readLecturerSchedule(key);
      if (cached == null) rethrow;
      return _decode(cached.payload, TeachingScheduleProposal.fromJson);
    }
  }

  @override
  Future<List<ClassStudentDto>> getStudents(UuidValue courseClassId) async {
    final key = courseClassId.toString();
    try {
      final values = await _client.lecturer.getRegisteredStudents(
        courseClassId: courseClassId,
      );
      await _database.cacheStudentList(key, _encode(values));
      return values;
    } catch (_) {
      final cached = await _database.readStudentList(key);
      if (cached == null) rethrow;
      return _decode(cached.payload, ClassStudentDto.fromJson);
    }
  }

  @override
  Future<List<ClassDemandDto>> getDemand() => _client.lecturer.getClassDemand();
  @override
  Future<List<Course>> getCourses() => _client.lecturer.getCourses();
  @override
  Future<List<Semester>> getSemesters() => _client.lecturer.getSemesters();
  @override
  Future<List<String>> getAvailableRooms() =>
      _client.lecturer.getAvailableRooms();
  @override
  Future<List<ClassScheduleDto>> getAvailableScheduleSlots({
    required UuidValue semesterId,
    required String room,
  }) => _client.lecturer.getAvailableScheduleSlots(
    semesterId: semesterId,
    room: room,
  );

  @override
  Future<LecturerCourseClassDto> createClass({
    required UuidValue courseId,
    required UuidValue semesterId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) => _client.lecturer.createCourseClass(
    courseId: courseId,
    semesterId: semesterId,
    capacity: capacity,
    schedules: schedules,
  );

  @override
  Future<LecturerCourseClassDto> updateClass({
    required UuidValue courseClassId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) => _client.lecturer.updateCourseClass(
    courseClassId: courseClassId,
    capacity: capacity,
    schedules: schedules,
  );

  @override
  Future<void> deleteClass(UuidValue courseClassId) async {
    await _client.lecturer.deleteCourseClass(courseClassId: courseClassId);
  }

  @override
  Future<void> updateStudentGrades({
    required UuidValue courseClassId,
    required UuidValue studentId,
    required double midtermScore,
    required double finalScore,
  }) async {
    await _client.lecturer.updateStudentGrades(
      courseClassId: courseClassId,
      studentId: studentId,
      midtermScore: midtermScore,
      finalScore: finalScore,
    );
  }

  String _encode(List<dynamic> values) =>
      jsonEncode(values.map((value) => value.toJson()).toList());

  List<T> _decode<T>(
    String payload,
    T Function(Map<String, dynamic>) fromJson,
  ) => (jsonDecode(payload) as List<dynamic>)
      .map((value) => fromJson(value as Map<String, dynamic>))
      .toList(growable: false);
}
