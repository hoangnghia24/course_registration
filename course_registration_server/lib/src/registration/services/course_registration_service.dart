import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../../generated/protocol.dart';
import '../../core/input_validator.dart';
import '../../core/pagination.dart';
import 'course_eligibility_service.dart';
import 'registration_period_service.dart';

abstract final class CourseRegistrationService {
  static Future<Semester> getCurrentSemester(Session session) async {
    final semesters = await Semester.db.find(
      session,
      where: (table) => table.status.equals(SemesterStatus.open),
    );
    if (semesters.isEmpty) {
      throw AppException(
        code: 'semester_not_open',
        message: 'Hiện không có học kỳ đang hoạt động.',
      );
    }
    semesters.sort((a, b) => b.startDate.compareTo(a.startDate));
    return semesters.first;
  }

  static Future<RegistrationPeriodDto> getRegistrationPeriod(
    Session session, {
    required UuidValue semesterId,
  }) async {
    await authorizedStudent(session);
    return RegistrationPeriodService.getDto(
      session,
      semesterId: semesterId,
    );
  }

  static Future<List<OpenCourseClassDto>> getOpenClasses(
    Session session, {
    required UuidValue semesterId,
    int page = 1,
    int pageSize = 50,
  }) async {
    final student = await authorizedStudent(session);
    final semester = await Semester.db.findById(session, semesterId);
    if (semester == null) {
      throw AppException(
        code: 'semester_not_found',
        message: 'Học kỳ không tồn tại.',
      );
    }
    final window = Pagination.window(page: page, pageSize: pageSize);
    final classes = await CourseClass.db.find(
      session,
      where: (table) => table.semesterId.equals(semesterId),
      orderBy: (table) => table.classCode,
      limit: window.limit,
      offset: window.offset,
    );
    final result = await _openClassDtos(
      session,
      student.trainingProgramId,
      classes.where((item) => item.status != CourseClassStatus.closed).toList(),
    );
    result.sort((a, b) => a.courseCode.compareTo(b.courseCode));
    return result;
  }

  static Future<EligibilityResultDto> checkEligibility(
    Session session, {
    UuidValue? studentId,
    required UuidValue courseClassId,
  }) async {
    final student = await authorizedStudent(session, studentId);
    return (await CourseEligibilityService.evaluate(
      session,
      student: student,
      courseClassId: courseClassId,
    )).result;
  }

  static Future<RegistrationResultDto> registerCourse(
    Session session, {
    UuidValue? studentId,
    required UuidValue courseClassId,
    String? deviceInfo,
  }) async {
    final student = await authorizedStudent(session, studentId);
    return session.db.transaction(
      (transaction) => registerCourseInTransaction(
        session,
        transaction: transaction,
        student: student,
        courseClassId: courseClassId,
        deviceInfo: deviceInfo,
      ),
    );
  }

  static Future<RegistrationResultDto> registerCourseInTransaction(
    Session session, {
    required Transaction transaction,
    required Student student,
    required UuidValue courseClassId,
    String? deviceInfo,
  }) async {
    final lockedStudent = await Student.db.findById(
      session,
      student.id!,
      transaction: transaction,
      lockMode: LockMode.forUpdate,
    );
    if (lockedStudent == null) {
      throw AppException(
        code: 'student_not_found',
        message: 'Không tìm thấy sinh viên.',
      );
    }
    final evaluation = await CourseEligibilityService.evaluate(
      session,
      student: lockedStudent,
      courseClassId: courseClassId,
      transaction: transaction,
      lockClass: true,
    );
    if (!evaluation.result.eligible) {
      return RegistrationResultDto(
        success: false,
        message: evaluation.result.messages.join(' '),
        errorCode: _eligibilityErrorCode(evaluation.result),
      );
    }

    final existing = await Registration.db.findFirstRow(
      session,
      transaction: transaction,
      where: (table) =>
          table.studentId.equals(student.id) &
          table.courseClassId.equals(courseClassId),
      lockMode: LockMode.forUpdate,
    );
    final now = DateTime.now().toUtc();
    final registration = existing == null
        ? await Registration.db.insertRow(
            session,
            Registration(
              studentId: lockedStudent.id!,
              courseClassId: courseClassId,
              registeredAt: now,
              status: RegistrationStatus.registered,
            ),
            transaction: transaction,
          )
        : await Registration.db.updateRow(
            session,
            existing.copyWith(
              registeredAt: now,
              status: RegistrationStatus.registered,
            ),
            transaction: transaction,
          );

    final count = evaluation.courseClass.registeredCount + 1;
    await CourseClass.db.updateRow(
      session,
      evaluation.courseClass.copyWith(
        registeredCount: count,
        status: count >= evaluation.courseClass.capacity
            ? CourseClassStatus.full
            : CourseClassStatus.open,
      ),
      transaction: transaction,
    );
    await RegistrationHistory.db.insertRow(
      session,
      RegistrationHistory(
        studentId: lockedStudent.id!,
        courseClassId: courseClassId,
        action: RegistrationAction.register,
        createdAt: now,
        deviceInfo: deviceInfo,
      ),
      transaction: transaction,
    );
    return RegistrationResultDto(
      success: true,
      message: 'Đăng ký học phần thành công.',
      registration: await _registeredCourseDto(
        session,
        registration,
        transaction: transaction,
      ),
    );
  }

  static Future<RegistrationResultDto> cancelCourse(
    Session session, {
    required UuidValue registrationId,
    String? deviceInfo,
  }) async {
    final student = await authorizedStudent(session);
    return session.db.transaction(
      (transaction) => cancelCourseInTransaction(
        session,
        transaction: transaction,
        student: student,
        registrationId: registrationId,
        deviceInfo: deviceInfo,
      ),
    );
  }

  static Future<RegistrationResultDto> cancelCourseInTransaction(
    Session session, {
    required Transaction transaction,
    required Student student,
    required UuidValue registrationId,
    String? deviceInfo,
  }) async {
    final registration = await Registration.db.findById(
      session,
      registrationId,
      transaction: transaction,
      lockMode: LockMode.forUpdate,
    );
    if (registration == null || registration.studentId != student.id) {
      throw AppException(
        code: 'forbidden',
        message: 'Bạn không thể hủy đăng ký này.',
      );
    }
    if (registration.status == RegistrationStatus.cancelled) {
      return RegistrationResultDto(
        success: false,
        message: 'Đăng ký đã được hủy trước đó.',
        errorCode: 'REGISTRATION_NOT_FOUND',
      );
    }
    final courseClass = await CourseClass.db.findById(
      session,
      registration.courseClassId,
      transaction: transaction,
      lockMode: LockMode.forUpdate,
    );
    if (courseClass == null) {
      throw AppException(
        code: 'class_not_found',
        message: 'Lớp học không tồn tại.',
      );
    }
    final window = await RegistrationPeriodService.getWindow(
      session,
      semesterId: courseClass.semesterId,
      transaction: transaction,
    );
    final now = DateTime.now().toUtc();
    if (!window.isOpenAt(now)) {
      final message =
          !window.configured ||
              window.status == RegistrationPeriodStatus.draft ||
              now.isBefore(window.startTime)
          ? 'Chưa đến thời gian đăng ký học phần.'
          : 'Thời gian đăng ký học phần đã kết thúc.';
      return RegistrationResultDto(
        success: false,
        message: message,
        errorCode: 'COURSE_NOT_OPEN',
      );
    }
    final cancelled = await Registration.db.updateRow(
      session,
      registration.copyWith(status: RegistrationStatus.cancelled),
      transaction: transaction,
    );
    final count = courseClass.registeredCount > 0
        ? courseClass.registeredCount - 1
        : 0;
    await CourseClass.db.updateRow(
      session,
      courseClass.copyWith(
        registeredCount: count,
        status: courseClass.status == CourseClassStatus.closed
            ? CourseClassStatus.closed
            : CourseClassStatus.open,
      ),
      transaction: transaction,
    );
    await RegistrationHistory.db.insertRow(
      session,
      RegistrationHistory(
        studentId: student.id!,
        courseClassId: courseClass.id!,
        action: RegistrationAction.cancel,
        deviceInfo: deviceInfo,
      ),
      transaction: transaction,
    );
    return RegistrationResultDto(
      success: true,
      message: 'Hủy đăng ký học phần thành công.',
      registration: await _registeredCourseDto(
        session,
        cancelled,
        transaction: transaction,
      ),
    );
  }

  static String _eligibilityErrorCode(EligibilityResultDto result) {
    if (result.messages.any((message) => message.contains('đã đăng ký'))) {
      return 'ALREADY_REGISTERED';
    }
    if (result.messages.any(
      (message) =>
          message.contains('đã đóng') ||
          message.contains('không mở đăng ký') ||
          message.contains('Chưa đến') ||
          message.contains('chưa bắt đầu') ||
          message.contains('đã kết thúc'),
    )) {
      return 'COURSE_NOT_OPEN';
    }
    if (!result.capacityAvailable) return 'CLASS_FULL';
    if (!result.prerequisitePassed) return 'PREREQUISITE_NOT_MET';
    if (!result.scheduleAvailable) return 'SCHEDULE_CONFLICT';
    if (!result.withinCreditLimit) return 'CREDIT_LIMIT_EXCEEDED';
    if (!result.inTrainingProgram) return 'VALIDATION_ERROR';
    if (!result.equivalentAvailable) return 'ALREADY_REGISTERED';
    return 'VALIDATION_ERROR';
  }

  static Future<List<RegisteredCourseDto>> getMyCourses(
    Session session, {
    UuidValue? semesterId,
    int page = 1,
    int pageSize = 50,
  }) async {
    final student = await authorizedStudent(session);
    final window = Pagination.window(page: page, pageSize: pageSize);
    final registrations = await Registration.db.find(
      session,
      where: (table) =>
          table.studentId.equals(student.id) &
          table.status.equals(RegistrationStatus.registered),
      orderBy: (table) => table.registeredAt.desc(),
      limit: window.limit,
      offset: window.offset,
    );
    final result = <RegisteredCourseDto>[];
    for (final registration in registrations) {
      final dto = await _registeredCourseDto(session, registration);
      if (semesterId == null || dto.semesterId == semesterId) result.add(dto);
    }
    result.sort((a, b) => a.courseCode.compareTo(b.courseCode));
    return result;
  }

  static Future<CourseOpeningRequest> createOpeningRequest(
    Session session, {
    required UuidValue courseId,
    required String reason,
  }) async {
    final student = await authorizedStudent(session);
    if (!InputValidator.requiredText(reason, maxLength: 1000)) {
      throw AppException(
        code: 'invalid_reason',
        message: 'Vui lòng nhập lý do mở lớp.',
      );
    }
    final programId = student.trainingProgramId;
    final programCourse = programId == null
        ? null
        : await TrainingProgramCourse.db.findFirstRow(
            session,
            where: (table) =>
                table.trainingProgramId.equals(programId) &
                table.courseId.equals(courseId),
          );
    if (programCourse == null) {
      throw AppException(
        code: 'course_outside_program',
        message: 'Môn học không thuộc chương trình đào tạo.',
      );
    }
    final pending = await CourseOpeningRequest.db.findFirstRow(
      session,
      where: (table) =>
          table.studentId.equals(student.id) &
          table.courseId.equals(courseId) &
          table.status.equals(OpeningRequestStatus.pending),
    );
    if (pending != null) return pending;
    return CourseOpeningRequest.db.insertRow(
      session,
      CourseOpeningRequest(
        studentId: student.id!,
        courseId: courseId,
        reason: reason.trim(),
        status: OpeningRequestStatus.pending,
      ),
    );
  }

  static Future<Student> authorizedStudent(
    Session session, [
    UuidValue? requestedStudentId,
  ]) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw AppException(
        code: 'unauthenticated',
        message: 'Vui lòng đăng nhập.',
      );
    }
    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (user?.id == null) {
      throw AppException(
        code: 'profile_not_found',
        message: 'Không tìm thấy hồ sơ.',
      );
    }
    if (!user!.isActive) {
      throw AppException(
        code: 'account_disabled',
        message: 'Tài khoản đã bị vô hiệu hóa.',
      );
    }
    final student = await Student.db.findFirstRow(
      session,
      where: (table) => table.userId.equals(user.id),
    );
    if (student?.id == null) {
      throw AppException(
        code: 'student_not_found',
        message: 'Không tìm thấy sinh viên.',
      );
    }
    if (requestedStudentId != null && requestedStudentId != student!.id) {
      throw AppException(
        code: 'forbidden',
        message: 'Bạn không có quyền truy cập.',
      );
    }
    return student!;
  }

  static Future<OpenCourseClassDto> _openClassDto(
    Session session,
    UuidValue? trainingProgramId,
    CourseClass courseClass, {
    Transaction? transaction,
  }) async {
    final course = await Course.db.findById(
      session,
      courseClass.courseId,
      transaction: transaction,
    );
    if (course == null) {
      throw AppException(
        code: 'course_not_found',
        message: 'Môn học không tồn tại.',
      );
    }
    final lecturer = await Lecturer.db.findById(
      session,
      courseClass.lecturerId,
      transaction: transaction,
    );
    final lecturerUser = lecturer == null
        ? null
        : await AppUser.db.findById(
            session,
            lecturer.userId,
            transaction: transaction,
          );
    final schedules = await ClassSchedule.db.find(
      session,
      transaction: transaction,
      where: (table) => table.courseClassId.equals(courseClass.id),
    );
    final programCourse = trainingProgramId == null
        ? null
        : await TrainingProgramCourse.db.findFirstRow(
            session,
            transaction: transaction,
            where: (table) =>
                table.trainingProgramId.equals(trainingProgramId) &
                table.courseId.equals(course.id),
          );
    return OpenCourseClassDto(
      courseClassId: courseClass.id!,
      courseId: course.id!,
      semesterId: courseClass.semesterId,
      classCode: courseClass.classCode,
      courseCode: course.courseCode,
      courseName: course.courseName,
      credits: course.credits,
      lecturerName: lecturerUser?.fullName ?? 'Chưa phân công',
      capacity: courseClass.capacity,
      registeredCount: courseClass.registeredCount,
      remainingSeats: (courseClass.capacity - courseClass.registeredCount)
          .clamp(
            0,
            courseClass.capacity,
          ),
      status: courseClass.status,
      inTrainingProgram: programCourse != null,
      schedules: schedules.map(_scheduleDto).toList(growable: false),
    );
  }

  static Future<List<OpenCourseClassDto>> _openClassDtos(
    Session session,
    UuidValue? trainingProgramId,
    List<CourseClass> classes,
  ) async {
    if (classes.isEmpty) return [];
    final courseIds = classes.map((item) => item.courseId).toSet();
    final lecturerIds = classes.map((item) => item.lecturerId).toSet();
    final classIds = classes.map((item) => item.id!).toSet();
    final courses = await Course.db.find(
      session,
      where: (table) => table.id.inSet(courseIds),
    );
    final lecturers = await Lecturer.db.find(
      session,
      where: (table) => table.id.inSet(lecturerIds),
    );
    final lecturerUserIds = lecturers.map((item) => item.userId).toSet();
    final users = lecturerUserIds.isEmpty
        ? <AppUser>[]
        : await AppUser.db.find(
            session,
            where: (table) => table.id.inSet(lecturerUserIds),
          );
    final schedules = await ClassSchedule.db.find(
      session,
      where: (table) => table.courseClassId.inSet(classIds),
    );
    final programCourses = trainingProgramId == null
        ? <TrainingProgramCourse>[]
        : await TrainingProgramCourse.db.find(
            session,
            where: (table) =>
                table.trainingProgramId.equals(trainingProgramId) &
                table.courseId.inSet(courseIds),
          );
    final coursesById = {for (final item in courses) item.id!: item};
    final lecturersById = {for (final item in lecturers) item.id!: item};
    final usersById = {for (final item in users) item.id!: item};
    final programCourseIds = programCourses
        .map((item) => item.courseId)
        .toSet();
    final schedulesByClass = <UuidValue, List<ClassSchedule>>{};
    for (final schedule in schedules) {
      schedulesByClass
          .putIfAbsent(schedule.courseClassId, () => [])
          .add(schedule);
    }
    final result = <OpenCourseClassDto>[];
    for (final courseClass in classes) {
      final course = coursesById[courseClass.courseId];
      if (course == null) continue;
      final lecturer = lecturersById[courseClass.lecturerId];
      final lecturerUser = lecturer == null ? null : usersById[lecturer.userId];
      result.add(
        OpenCourseClassDto(
          courseClassId: courseClass.id!,
          courseId: course.id!,
          semesterId: courseClass.semesterId,
          classCode: courseClass.classCode,
          courseCode: course.courseCode,
          courseName: course.courseName,
          credits: course.credits,
          lecturerName: lecturerUser?.fullName ?? 'Chưa phân công',
          capacity: courseClass.capacity,
          registeredCount: courseClass.registeredCount,
          remainingSeats: (courseClass.capacity - courseClass.registeredCount)
              .clamp(
                0,
                courseClass.capacity,
              ),
          status: courseClass.status,
          inTrainingProgram: programCourseIds.contains(course.id),
          schedules: (schedulesByClass[courseClass.id] ?? const [])
              .map(_scheduleDto)
              .toList(growable: false),
        ),
      );
    }
    return result;
  }

  static Future<RegisteredCourseDto> _registeredCourseDto(
    Session session,
    Registration registration, {
    Transaction? transaction,
  }) async {
    final courseClass = await CourseClass.db.findById(
      session,
      registration.courseClassId,
      transaction: transaction,
    );
    if (courseClass == null) {
      throw AppException(
        code: 'class_not_found',
        message: 'Lớp học không tồn tại.',
      );
    }
    final openClass = await _openClassDto(
      session,
      null,
      courseClass,
      transaction: transaction,
    );
    return RegisteredCourseDto(
      registrationId: registration.id!,
      courseClassId: courseClass.id!,
      semesterId: courseClass.semesterId,
      classCode: courseClass.classCode,
      courseCode: openClass.courseCode,
      courseName: openClass.courseName,
      credits: openClass.credits,
      lecturerName: openClass.lecturerName,
      registeredAt: registration.registeredAt,
      status: registration.status,
      schedules: openClass.schedules,
    );
  }

  static ClassScheduleDto _scheduleDto(ClassSchedule value) => ClassScheduleDto(
    dayOfWeek: value.dayOfWeek,
    startPeriod: value.startPeriod,
    endPeriod: value.endPeriod,
    room: value.room,
  );
}
