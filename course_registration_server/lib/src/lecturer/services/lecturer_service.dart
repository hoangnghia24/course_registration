import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../../generated/protocol.dart';
import '../../core/input_validator.dart';
import '../../core/pagination.dart';
import '../../registration/services/eligibility_checkers.dart';
import 'class_demand_service.dart';
import 'lecturer_validators.dart';

abstract final class LecturerService {
  static Future<LecturerProfileDto> getProfile(Session session) async {
    final lecturer = await _authorizedLecturer(session);
    final user = await AppUser.db.findById(session, lecturer.userId);
    if (user == null) throw _incomplete('user');
    final faculty = lecturer.facultyId == null
        ? null
        : await Faculty.db.findById(session, lecturer.facultyId!);
    return LecturerProfileDto(
      lecturerId: lecturer.id!,
      lecturerCode: lecturer.lecturerCode,
      fullName: user.fullName,
      email: user.email,
      phone: user.phone,
      avatar: user.avatar,
      department: lecturer.department,
      academicTitle: lecturer.academicTitle,
      academicDegree: lecturer.academicDegree,
      specialization: lecturer.specialization,
      facultyName: faculty?.name,
    );
  }

  static Future<List<Course>> getCourses(Session session) async {
    await _authorizedLecturer(session);
    final courses = await Course.db.find(session);
    courses.sort((a, b) => a.courseCode.compareTo(b.courseCode));
    return courses;
  }

  static Future<List<Semester>> getSemesters(Session session) async {
    await _authorizedLecturer(session);
    final semesters = await Semester.db.find(session);
    semesters.sort((a, b) => b.startDate.compareTo(a.startDate));
    return semesters;
  }

  static Future<List<LecturerCourseClassDto>> getMyClasses(
    Session session, {
    int page = 1,
    int pageSize = 50,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    final window = Pagination.window(page: page, pageSize: pageSize);
    final classes = await CourseClass.db.find(
      session,
      where: (table) => table.lecturerId.equals(lecturer.id),
      orderBy: (table) => table.classCode,
      limit: window.limit,
      offset: window.offset,
    );
    final result = <LecturerCourseClassDto>[];
    for (final courseClass in classes) {
      result.add(await _classDto(session, courseClass));
    }
    result.sort((a, b) => a.classCode.compareTo(b.classCode));
    return result;
  }

  static Future<LecturerCourseClassDto> createCourseClass(
    Session session, {
    required UuidValue courseId,
    required UuidValue semesterId,
    required String classCode,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    if (!LecturerClassValidator.validForCreate(
      classCode: classCode,
      capacity: capacity,
    )) {
      throw AppException(
        code: 'invalid_class',
        message: 'Mã lớp và sĩ số không hợp lệ.',
      );
    }
    _validateSchedules(schedules);
    return session.db.transaction((transaction) async {
      final course = await Course.db.findById(
        session,
        courseId,
        transaction: transaction,
      );
      final semester = await Semester.db.findById(
        session,
        semesterId,
        transaction: transaction,
      );
      if (course == null || semester == null) {
        throw _incomplete('course_or_semester');
      }
      await _ensureNoConflict(
        session,
        lecturer: lecturer,
        semesterId: semesterId,
        schedules: schedules,
        transaction: transaction,
      );
      final courseClass = await CourseClass.db.insertRow(
        session,
        CourseClass(
          courseId: courseId,
          lecturerId: lecturer.id!,
          semesterId: semesterId,
          classCode: classCode.trim(),
          capacity: capacity,
          registeredCount: 0,
          status: CourseClassStatus.closed,
        ),
        transaction: transaction,
      );
      await LecturerCourseClass.db.insertRow(
        session,
        LecturerCourseClass(
          lecturerId: lecturer.id!,
          courseClassId: courseClass.id!,
        ),
        transaction: transaction,
      );
      for (final schedule in schedules) {
        await _insertProposal(
          session,
          lecturer: lecturer,
          courseClassId: courseClass.id!,
          schedule: schedule,
          transaction: transaction,
        );
      }
      await _log(
        session,
        lecturer: lecturer,
        action: 'CREATE_CLASS',
        entity: 'course_class',
        entityId: courseClass.id!,
        transaction: transaction,
      );
      return _classDto(session, courseClass, transaction: transaction);
    });
  }

  static Future<LecturerCourseClassDto> updateCourseClass(
    Session session, {
    required UuidValue courseClassId,
    required String classCode,
    required int capacity,
    required CourseClassStatus status,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    return session.db.transaction((transaction) async {
      final courseClass = await _ownedClass(
        session,
        lecturer,
        courseClassId,
        transaction: transaction,
        lock: true,
      );
      if (!InputValidator.requiredText(classCode, maxLength: 32) ||
          !LecturerClassValidator.validForUpdate(
            capacity: capacity,
            registeredCount: courseClass.registeredCount,
          )) {
        throw AppException(
          code: 'invalid_capacity',
          message: 'Sĩ số tối đa không thể nhỏ hơn số sinh viên đã đăng ký.',
        );
      }
      final updated = await CourseClass.db.updateRow(
        session,
        courseClass.copyWith(
          classCode: classCode.trim(),
          capacity: capacity,
          status: status,
        ),
        transaction: transaction,
      );
      await _log(
        session,
        lecturer: lecturer,
        action: 'UPDATE_CLASS',
        entity: 'course_class',
        entityId: updated.id!,
        transaction: transaction,
      );
      return _classDto(session, updated, transaction: transaction);
    });
  }

  static Future<bool> deleteCourseClass(
    Session session, {
    required UuidValue courseClassId,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    return session.db.transaction((transaction) async {
      final courseClass = await _ownedClass(
        session,
        lecturer,
        courseClassId,
        transaction: transaction,
        lock: true,
      );
      if (courseClass.registeredCount > 0) {
        throw AppException(
          code: 'class_has_students',
          message: 'Không thể xóa lớp đã có sinh viên đăng ký.',
        );
      }
      await _log(
        session,
        lecturer: lecturer,
        action: 'DELETE_CLASS',
        entity: 'course_class',
        entityId: courseClass.id!,
        transaction: transaction,
      );
      await CourseClass.db.deleteRow(
        session,
        courseClass,
        transaction: transaction,
      );
      return true;
    });
  }

  static Future<TeachingScheduleProposal> createTeachingSchedule(
    Session session, {
    required UuidValue courseClassId,
    required ClassScheduleDto schedule,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    _validateSchedules([schedule]);
    return session.db.transaction((transaction) async {
      final courseClass = await _ownedClass(
        session,
        lecturer,
        courseClassId,
        transaction: transaction,
      );
      await _ensureNoConflict(
        session,
        lecturer: lecturer,
        semesterId: courseClass.semesterId,
        schedules: [schedule],
        transaction: transaction,
      );
      final proposal = await _insertProposal(
        session,
        lecturer: lecturer,
        courseClassId: courseClassId,
        schedule: schedule,
        transaction: transaction,
      );
      await _log(
        session,
        lecturer: lecturer,
        action: 'UPDATE_SCHEDULE',
        entity: 'teaching_schedule_proposal',
        entityId: proposal.id!,
        transaction: transaction,
      );
      return proposal;
    });
  }

  static Future<List<TeachingScheduleProposal>> getMySchedule(
    Session session,
  ) async {
    final lecturer = await _authorizedLecturer(session);
    final values = await TeachingScheduleProposal.db.find(
      session,
      where: (table) => table.lecturerId.equals(lecturer.id),
    );
    values.sort((a, b) {
      final day = a.dayOfWeek.compareTo(b.dayOfWeek);
      return day != 0 ? day : a.startPeriod.compareTo(b.startPeriod);
    });
    return values;
  }

  static Future<List<ClassStudentDto>> getRegisteredStudents(
    Session session, {
    required UuidValue courseClassId,
    int page = 1,
    int pageSize = 50,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    await _ownedClass(session, lecturer, courseClassId);
    final window = Pagination.window(page: page, pageSize: pageSize);
    final registrations = await Registration.db.find(
      session,
      where: (table) =>
          table.courseClassId.equals(courseClassId) &
          table.status.equals(RegistrationStatus.registered),
      orderBy: (table) => table.registeredAt,
      limit: window.limit,
      offset: window.offset,
    );
    final studentIds = registrations.map((item) => item.studentId).toSet();
    final students = studentIds.isEmpty
        ? <Student>[]
        : await Student.db.find(
            session,
            where: (table) => table.id.inSet(studentIds),
          );
    final users = students.isEmpty
        ? <AppUser>[]
        : await AppUser.db.find(
            session,
            where: (table) =>
                table.id.inSet(students.map((item) => item.userId).toSet()),
          );
    final majorIds = students
        .map((item) => item.majorId)
        .whereType<UuidValue>()
        .toSet();
    final majors = majorIds.isEmpty
        ? <Major>[]
        : await Major.db.find(
            session,
            where: (table) => table.id.inSet(majorIds),
          );
    final studentsById = {for (final item in students) item.id!: item};
    final usersById = {for (final item in users) item.id!: item};
    final majorsById = {for (final item in majors) item.id!: item};
    final result = <ClassStudentDto>[];
    for (final registration in registrations) {
      final student = studentsById[registration.studentId];
      if (student == null) continue;
      final user = usersById[student.userId];
      final major = student.majorId == null
          ? null
          : majorsById[student.majorId!];
      if (user == null) continue;
      result.add(
        ClassStudentDto(
          studentId: student.id!,
          studentCode: student.studentCode,
          fullName: user.fullName,
          majorName: major?.name ?? 'Chưa cập nhật',
          email: user.email,
          registrationStatus: registration.status,
        ),
      );
    }
    result.sort((a, b) => a.studentCode.compareTo(b.studentCode));
    return result;
  }

  static Future<List<ClassDemandDto>> getClassDemand(Session session) async {
    await _authorizedLecturer(session);
    return ClassDemandService.analyze(session);
  }

  static Future<Lecturer> _authorizedLecturer(Session session) async {
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
    if (user != null && !user.isActive) {
      throw AppException(
        code: 'account_disabled',
        message: 'Tài khoản đã bị vô hiệu hóa.',
      );
    }
    final lecturer = user?.id == null
        ? null
        : await Lecturer.db.findFirstRow(
            session,
            where: (table) => table.userId.equals(user!.id),
          );
    if (lecturer?.id == null) {
      throw AppException(
        code: 'lecturer_not_found',
        message: 'Không tìm thấy hồ sơ giảng viên.',
      );
    }
    return lecturer!;
  }

  static Future<CourseClass> _ownedClass(
    Session session,
    Lecturer lecturer,
    UuidValue courseClassId, {
    Transaction? transaction,
    bool lock = false,
  }) async {
    final courseClass = await CourseClass.db.findById(
      session,
      courseClassId,
      transaction: transaction,
      lockMode: lock ? LockMode.forUpdate : null,
    );
    if (courseClass == null) throw _incomplete('course_class');
    if (courseClass.lecturerId != lecturer.id) {
      throw AppException(
        code: 'forbidden',
        message: 'Bạn không phụ trách lớp này.',
      );
    }
    return courseClass;
  }

  static Future<void> _ensureNoConflict(
    Session session, {
    required Lecturer lecturer,
    required UuidValue semesterId,
    required List<ClassScheduleDto> schedules,
    UuidValue? excludedClassId,
    Transaction? transaction,
  }) async {
    final candidates = schedules.map(_slot).toList();
    for (var i = 0; i < candidates.length; i++) {
      for (var j = i + 1; j < candidates.length; j++) {
        if (TeachingConflictChecker.hasConflict(
          [candidates[i]],
          [candidates[j]],
        )) {
          throw _conflict();
        }
      }
    }
    final lecturerClasses = await CourseClass.db.find(
      session,
      transaction: transaction,
      where: (table) => table.lecturerId.equals(lecturer.id),
    );
    final existing = <ScheduleSlot>[];
    for (final courseClass in lecturerClasses) {
      if (courseClass.id == excludedClassId ||
          courseClass.semesterId != semesterId) {
        continue;
      }
      final schedules = await ClassSchedule.db.find(
        session,
        transaction: transaction,
        where: (table) => table.courseClassId.equals(courseClass.id),
      );
      existing.addAll(
        schedules.map(
          (item) => ScheduleSlot(
            dayOfWeek: item.dayOfWeek,
            startPeriod: item.startPeriod,
            endPeriod: item.endPeriod,
          ),
        ),
      );
      final proposals = await TeachingScheduleProposal.db.find(
        session,
        transaction: transaction,
        where: (table) => table.courseClassId.equals(courseClass.id),
      );
      existing.addAll(
        proposals
            .where((item) => item.status != TeachingScheduleStatus.rejected)
            .map(
              (item) => ScheduleSlot(
                dayOfWeek: item.dayOfWeek,
                startPeriod: item.startPeriod,
                endPeriod: item.endPeriod,
              ),
            ),
      );
    }
    if (TeachingConflictChecker.hasConflict(candidates, existing)) {
      throw _conflict();
    }
  }

  static void _validateSchedules(List<ClassScheduleDto> schedules) {
    if (schedules.isEmpty ||
        schedules.any(
          (item) =>
              item.dayOfWeek < 2 ||
              item.dayOfWeek > 8 ||
              item.startPeriod < 1 ||
              item.endPeriod < item.startPeriod ||
              item.endPeriod > 20 ||
              !InputValidator.requiredText(item.room, maxLength: 80),
        )) {
      throw AppException(
        code: 'invalid_schedule',
        message: 'Lịch dạy không hợp lệ.',
      );
    }
  }

  static ScheduleSlot _slot(ClassScheduleDto value) => ScheduleSlot(
    dayOfWeek: value.dayOfWeek,
    startPeriod: value.startPeriod,
    endPeriod: value.endPeriod,
  );

  static Future<TeachingScheduleProposal> _insertProposal(
    Session session, {
    required Lecturer lecturer,
    required UuidValue courseClassId,
    required ClassScheduleDto schedule,
    Transaction? transaction,
  }) => TeachingScheduleProposal.db.insertRow(
    session,
    TeachingScheduleProposal(
      lecturerId: lecturer.id!,
      courseClassId: courseClassId,
      dayOfWeek: schedule.dayOfWeek,
      startPeriod: schedule.startPeriod,
      endPeriod: schedule.endPeriod,
      room: schedule.room.trim(),
      status: TeachingScheduleStatus.pending,
    ),
    transaction: transaction,
  );

  static Future<void> _log(
    Session session, {
    required Lecturer lecturer,
    required String action,
    required String entity,
    required UuidValue entityId,
    Transaction? transaction,
  }) async {
    await LecturerActivityLog.db.insertRow(
      session,
      LecturerActivityLog(
        lecturerId: lecturer.id!,
        action: action,
        entity: entity,
        entityId: entityId,
      ),
      transaction: transaction,
    );
  }

  static Future<LecturerCourseClassDto> _classDto(
    Session session,
    CourseClass courseClass, {
    Transaction? transaction,
  }) async {
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
      throw _incomplete('course_or_semester');
    }
    final schedules = await ClassSchedule.db.find(
      session,
      transaction: transaction,
      where: (table) => table.courseClassId.equals(courseClass.id),
    );
    final proposals = await TeachingScheduleProposal.db.find(
      session,
      transaction: transaction,
      where: (table) => table.courseClassId.equals(courseClass.id),
    );
    return LecturerCourseClassDto(
      courseClassId: courseClass.id!,
      courseId: course.id!,
      semesterId: semester.id!,
      courseCode: course.courseCode,
      courseName: course.courseName,
      semesterName: semester.name,
      academicYear: semester.academicYear,
      classCode: courseClass.classCode,
      capacity: courseClass.capacity,
      registeredCount: courseClass.registeredCount,
      status: courseClass.status,
      schedules: schedules
          .map(
            (item) => ClassScheduleDto(
              dayOfWeek: item.dayOfWeek,
              startPeriod: item.startPeriod,
              endPeriod: item.endPeriod,
              room: item.room,
            ),
          )
          .toList(),
      proposals: proposals,
    );
  }

  static AppException _conflict() => AppException(
    code: 'teaching_schedule_conflict',
    message: 'Giảng viên đã có lịch dạy trong thời gian này.',
  );

  static AppException _incomplete(String field) => AppException(
    code: 'data_incomplete',
    message: 'Thiếu dữ liệu: $field.',
  );
}
