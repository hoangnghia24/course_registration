import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../../lecturer/services/class_demand_service.dart';

abstract final class ReportCalculator {
  static double average(Iterable<double> values) {
    final list = values.toList(growable: false);
    if (list.isEmpty) return 0;
    final value = list.reduce((a, b) => a + b) / list.length;
    return (value * 100).roundToDouble() / 100;
  }
}

abstract final class AnalyticsService {
  static Future<AnalyticsReportDto> generate(Session session) async {
    final students = await Student.db.find(session);
    final lecturers = await Lecturer.db.find(session);
    final courses = await Course.db.find(session);
    final classes = await CourseClass.db.find(session);
    final majors = await Major.db.find(session);
    final faculties = await Faculty.db.find(session);
    final majorsById = {for (final item in majors) item.id!: item};
    final facultiesById = {for (final item in faculties) item.id!: item};
    final coursesById = {for (final item in courses) item.id!: item};
    final byMajor = <String, int>{};
    final byFaculty = <String, int>{};
    for (final student in students) {
      final major = student.majorId == null
          ? null
          : majorsById[student.majorId!];
      if (major == null) continue;
      byMajor.update(major.name, (value) => value + 1, ifAbsent: () => 1);
      final faculty = facultiesById[major.facultyId];
      if (faculty != null) {
        byFaculty.update(
          faculty.name,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
    }

    final transcripts = await StudentTranscript.db.find(session);
    final failed = <UuidValue, int>{};
    final scores = <UuidValue, List<double>>{};
    for (final item in transcripts) {
      if (item.status == TranscriptStatus.failed) {
        failed.update(item.courseId, (value) => value + 1, ifAbsent: () => 1);
      }
      scores.putIfAbsent(item.courseId, () => []).add(item.score);
    }
    final failedCourses = <NamedCountDto>[];
    for (final entry in failed.entries) {
      final course = coursesById[entry.key];
      if (course != null) {
        failedCourses.add(
          NamedCountDto(name: course.courseName, count: entry.value),
        );
      }
    }
    failedCourses.sort((a, b) => b.count.compareTo(a.count));
    final courseGpas = <CourseGpaDto>[];
    for (final entry in scores.entries) {
      final course = coursesById[entry.key];
      if (course != null) {
        courseGpas.add(
          CourseGpaDto(
            courseCode: course.courseCode,
            courseName: course.courseName,
            averageGpa: ReportCalculator.average(entry.value),
          ),
        );
      }
    }
    courseGpas.sort((a, b) => a.courseCode.compareTo(b.courseCode));

    return AnalyticsReportDto(
      totalStudents: students.length,
      totalLecturers: lecturers.length,
      totalCourses: courses.length,
      openClasses: classes
          .where((item) => item.status == CourseClassStatus.open)
          .length,
      fullClasses: classes
          .where((item) => item.status == CourseClassStatus.full)
          .length,
      closedClasses: classes
          .where((item) => item.status == CourseClassStatus.closed)
          .length,
      studentsByFaculty: _counts(byFaculty),
      studentsByMajor: _counts(byMajor),
      courseDemand: await ClassDemandService.analyze(session),
      failedCourses: failedCourses,
      courseGpas: courseGpas,
    );
  }

  static List<NamedCountDto> _counts(Map<String, int> values) {
    final result = values.entries
        .map((entry) => NamedCountDto(name: entry.key, count: entry.value))
        .toList();
    result.sort((a, b) => b.count.compareTo(a.count));
    return result;
  }
}
