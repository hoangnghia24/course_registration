import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

abstract final class ClassDemandService {
  static Future<List<ClassDemandDto>> analyze(Session session) async {
    final pendingProposals = await TeachingScheduleProposal.db.find(
      session,
      where: (table) => table.status.equals(TeachingScheduleStatus.pending),
    );
    final proposedClassIds = pendingProposals
        .map((item) => item.courseClassId)
        .toSet();
    final proposedClasses = proposedClassIds.isEmpty
        ? <CourseClass>[]
        : await CourseClass.db.find(
            session,
            where: (table) => table.id.inSet(proposedClassIds),
          );
    final coursesAlreadyProposed = proposedClasses
        .map((item) => item.courseId)
        .toSet();
    final requests = await CourseOpeningRequest.db.find(
      session,
      where: (table) => table.status.equals(OpeningRequestStatus.pending),
    );
    final counts = <UuidValue, int>{};
    for (final request in requests) {
      if (coursesAlreadyProposed.contains(request.courseId)) continue;
      counts.update(request.courseId, (value) => value + 1, ifAbsent: () => 1);
    }
    final courseIds = counts.keys.toSet();
    final courses = courseIds.isEmpty
        ? <Course>[]
        : await Course.db.find(
            session,
            where: (table) => table.id.inSet(courseIds),
          );
    final coursesById = {for (final item in courses) item.id!: item};
    final result = <ClassDemandDto>[];
    for (final entry in counts.entries) {
      final course = coursesById[entry.key];
      if (course == null) continue;
      result.add(
        ClassDemandDto(
          courseId: entry.key,
          courseCode: course.courseCode,
          courseName: course.courseName,
          requestCount: entry.value,
          recommendation: entry.value >= 30
              ? 'Đề xuất mở thêm lớp'
              : 'Tiếp tục theo dõi',
        ),
      );
    }
    result.sort((a, b) => b.requestCount.compareTo(a.requestCount));
    return result;
  }
}
