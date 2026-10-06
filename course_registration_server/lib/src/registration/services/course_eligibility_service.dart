import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import 'eligibility_checkers.dart';

class EligibilityEvaluation {
  const EligibilityEvaluation({
    required this.result,
    required this.courseClass,
    required this.course,
  });

  final EligibilityResultDto result;
  final CourseClass courseClass;
  final Course course;
}

abstract final class CourseEligibilityService {
  static Future<EligibilityEvaluation> evaluate(
    Session session, {
    required Student student,
    required UuidValue courseClassId,
    Transaction? transaction,
    bool lockClass = false,
  }) async {
    final courseClass = await CourseClass.db.findById(
      session,
      courseClassId,
      transaction: transaction,
      lockMode: lockClass ? LockMode.forUpdate : null,
    );
    if (courseClass == null) {
      throw AppException(
        code: 'class_not_found',
        message: 'Lớp học không tồn tại.',
      );
    }
    final course = await Course.db.findById(
      session,
      courseClass.courseId,
      transaction: transaction,
    );
    final semester = await Semester.db.findById(
      session,
      courseClass.semesterId,
      transaction: transaction,
    );
    if (course == null || semester == null) {
      throw AppException(
        code: 'class_data_incomplete',
        message: 'Thông tin lớp học chưa đầy đủ.',
      );
    }

    final messages = <String>[];
    final semesterOpen = RegistrationWindowPolicy.isOpen(
      statusOpen: semester.status == SemesterStatus.open,
      startDate: semester.startDate,
      endDate: semester.endDate,
      now: DateTime.now().toUtc(),
    );
    if (!semesterOpen || courseClass.status == CourseClassStatus.closed) {
      messages.add('Học kỳ hoặc lớp học đã đóng đăng ký.');
    }

    final capacityAvailable = CapacityChecker.hasSeat(
      capacity: courseClass.capacity,
      registeredCount: courseClass.registeredCount,
    );
    if (!capacityAvailable || courseClass.status == CourseClassStatus.full) {
      messages.add('Lớp học đã đủ sĩ số.');
    }

    final activeRegistrations = await Registration.db.find(
      session,
      transaction: transaction,
      where: (table) =>
          table.studentId.equals(student.id) &
          table.status.equals(RegistrationStatus.registered),
    );
    final registeredClasses = <CourseClass>[];
    for (final registration in activeRegistrations) {
      final value = await CourseClass.db.findById(
        session,
        registration.courseClassId,
        transaction: transaction,
      );
      if (value != null && value.semesterId == courseClass.semesterId) {
        registeredClasses.add(value);
      }
    }
    final duplicateCourse = DuplicateRegistrationChecker.isDuplicate(
      course.id.toString(),
      registeredClasses.map((value) => value.courseId.toString()),
    );
    if (duplicateCourse) messages.add('Bạn đã đăng ký môn học này.');

    var currentCredits = 0;
    for (final value in registeredClasses) {
      final registeredCourse = await Course.db.findById(
        session,
        value.courseId,
        transaction: transaction,
      );
      currentCredits += registeredCourse?.credits ?? 0;
    }
    final withinCreditLimit = CreditLimitChecker.canAdd(
      currentCredits: currentCredits,
      courseCredits: course.credits,
    );
    if (!withinCreditLimit) messages.add('Đã vượt quá số tín chỉ tối đa.');

    final programId = student.trainingProgramId;
    final program = programId == null
        ? null
        : await TrainingProgram.db.findById(
            session,
            programId,
            transaction: transaction,
          );
    final programCourse = programId == null
        ? null
        : await TrainingProgramCourse.db.findFirstRow(
            session,
            transaction: transaction,
            where: (table) =>
                table.trainingProgramId.equals(programId) &
                table.courseId.equals(course.id),
          );
    final inTrainingProgram = ProgramChecker.matches(
      programMajorId: program?.majorId.toString(),
      studentMajorId: student.majorId?.toString(),
      containsCourse: programCourse != null,
    );
    if (!inTrainingProgram) {
      messages.add('Môn học không thuộc ngành hoặc chương trình đào tạo.');
    }

    final transcripts = await StudentTranscript.db.find(
      session,
      transaction: transaction,
      where: (table) => table.studentId.equals(student.id),
    );
    final passed = transcripts
        .where((item) => item.status == TranscriptStatus.passed)
        .map((item) => item.courseId.toString())
        .toSet();
    final prerequisites = await CoursePrerequisite.db.find(
      session,
      transaction: transaction,
      where: (table) => table.courseId.equals(course.id),
    );
    final equivalents = await CourseEquivalent.db.find(
      session,
      transaction: transaction,
      where: (table) =>
          table.courseId.equals(course.id) |
          table.equivalentId.equals(course.id),
    );
    final equivalentMap = <String, Set<String>>{};
    for (final prerequisite in prerequisites) {
      final related = await CourseEquivalent.db.find(
        session,
        transaction: transaction,
        where: (table) =>
            table.courseId.equals(prerequisite.prerequisiteId) |
            table.equivalentId.equals(prerequisite.prerequisiteId),
      );
      equivalentMap[prerequisite.prerequisiteId.toString()] = related
          .map(
            (item) => item.courseId == prerequisite.prerequisiteId
                ? item.equivalentId.toString()
                : item.courseId.toString(),
          )
          .toSet();
    }
    final prerequisitePassed = PrerequisiteChecker.isSatisfied(
      prerequisites: prerequisites
          .map((item) => item.prerequisiteId.toString())
          .toSet(),
      passedCourses: passed,
      equivalents: equivalentMap,
    );
    if (!prerequisitePassed) {
      messages.add('Bạn chưa học môn tiên quyết.');
    }
    final targetEquivalentIds = equivalents
        .map(
          (item) => item.courseId == course.id
              ? item.equivalentId.toString()
              : item.courseId.toString(),
        )
        .toSet();
    final equivalentAvailable = EquivalentCourseChecker.canRegister(
      courseId: course.id.toString(),
      passedCourses: passed,
      equivalentCourseIds: targetEquivalentIds,
    );
    if (!equivalentAvailable) {
      messages.add('Môn học hoặc môn tương đương đã được hoàn thành.');
    }

    final candidateSchedules = await ClassSchedule.db.find(
      session,
      transaction: transaction,
      where: (table) => table.courseClassId.equals(courseClass.id),
    );
    final registeredSchedules = <ClassSchedule>[];
    for (final value in registeredClasses) {
      registeredSchedules.addAll(
        await ClassSchedule.db.find(
          session,
          transaction: transaction,
          where: (table) => table.courseClassId.equals(value.id),
        ),
      );
    }
    final hasConflict = ScheduleConflictChecker.hasConflict(
      candidateSchedules.map(_slot),
      registeredSchedules.map(_slot),
    );
    if (hasConflict) messages.add('Môn học bị trùng lịch.');

    final eligible =
        messages.isEmpty &&
        semesterOpen &&
        !duplicateCourse &&
        capacityAvailable &&
        withinCreditLimit &&
        inTrainingProgram &&
        prerequisitePassed &&
        equivalentAvailable &&
        !hasConflict;
    return EligibilityEvaluation(
      courseClass: courseClass,
      course: course,
      result: EligibilityResultDto(
        eligible: eligible,
        prerequisitePassed: prerequisitePassed,
        scheduleAvailable: !hasConflict,
        withinCreditLimit: withinCreditLimit,
        inTrainingProgram: inTrainingProgram,
        equivalentAvailable: equivalentAvailable,
        capacityAvailable: capacityAvailable,
        currentCredits: currentCredits,
        projectedCredits: currentCredits + course.credits,
        minimumCredits: CreditLimitChecker.minimumCredits,
        maximumCredits: CreditLimitChecker.maximumCredits,
        messages: messages,
      ),
    );
  }

  static ScheduleSlot _slot(ClassSchedule value) => ScheduleSlot(
    dayOfWeek: value.dayOfWeek,
    startPeriod: value.startPeriod,
    endPeriod: value.endPeriod,
  );
}
