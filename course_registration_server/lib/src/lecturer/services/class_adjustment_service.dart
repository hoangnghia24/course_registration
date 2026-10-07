import 'dart:convert';

import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

abstract final class ClassAdjustmentService {
  static String encodeSchedules(List<ClassScheduleDto> schedules) => jsonEncode(
    _normalized(schedules).map((item) => item.toJson()).toList(growable: false),
  );

  static List<ClassScheduleDto> decodeSchedules(String value) =>
      (jsonDecode(value) as List<dynamic>)
          .map(
            (item) => ClassScheduleDto.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false);

  static bool schedulesMatch(
    List<ClassScheduleDto> current,
    String snapshot,
  ) => encodeSchedules(current) == encodeSchedules(decodeSchedules(snapshot));

  static Future<ClassAdjustmentRequestDto> toDto(
    Session session,
    ClassAdjustmentRequest request, {
    Transaction? transaction,
  }) async {
    final courseClass = await CourseClass.db.findById(
      session,
      request.courseClassId,
      transaction: transaction,
    );
    final course = courseClass == null
        ? null
        : await Course.db.findById(
            session,
            courseClass.courseId,
            transaction: transaction,
          );
    final lecturer = await Lecturer.db.findById(
      session,
      request.lecturerId,
      transaction: transaction,
    );
    final lecturerUser = lecturer == null
        ? null
        : await AppUser.db.findById(
            session,
            lecturer.userId,
            transaction: transaction,
          );
    final reviewer = request.reviewedById == null
        ? null
        : await Admin.db.findById(
            session,
            request.reviewedById!,
            transaction: transaction,
          );
    final reviewerUser = reviewer == null
        ? null
        : await AppUser.db.findById(
            session,
            reviewer.userId,
            transaction: transaction,
          );
    if (courseClass == null || course == null) {
      throw AppException(
        code: 'class_not_found',
        message: 'Lớp học phần của yêu cầu không còn tồn tại.',
      );
    }
    return ClassAdjustmentRequestDto(
      requestId: request.id!,
      courseClassId: courseClass.id!,
      classCode: courseClass.classCode,
      courseCode: course.courseCode,
      courseName: course.courseName,
      lecturerName: lecturerUser?.fullName ?? 'Chưa cập nhật',
      oldCapacity: request.oldCapacity,
      newCapacity: request.newCapacity,
      oldSchedules: decodeSchedules(request.oldSchedulesJson),
      newSchedules: decodeSchedules(request.newSchedulesJson),
      status: request.status,
      createdAt: request.createdAt,
      reviewedAt: request.reviewedAt,
      reviewedByName: reviewerUser?.fullName,
      rejectReason: request.rejectReason,
    );
  }

  static List<ClassScheduleDto> _normalized(
    List<ClassScheduleDto> schedules,
  ) {
    final result = [...schedules];
    result.sort((first, second) {
      final byDay = first.dayOfWeek.compareTo(second.dayOfWeek);
      if (byDay != 0) return byDay;
      final byStart = first.startPeriod.compareTo(second.startPeriod);
      if (byStart != 0) return byStart;
      final byEnd = first.endPeriod.compareTo(second.endPeriod);
      if (byEnd != 0) return byEnd;
      return first.room.compareTo(second.room);
    });
    return result;
  }
}
