import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

abstract final class ClassDemandService {
  static Future<List<ClassDemandDto>> analyze(Session session) async {
    final requests = await CourseOpeningRequest.db.find(
      session,
      where: (table) => table.status.equals(OpeningRequestStatus.pending),
    );
    final counts = <UuidValue, int>{};
    for (final request in requests) {
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
