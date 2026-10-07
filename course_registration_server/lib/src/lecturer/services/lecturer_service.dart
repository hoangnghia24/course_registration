import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../../generated/protocol.dart';
import '../../core/pagination.dart';
import '../../registration/services/eligibility_checkers.dart';
import '../../registration/services/registration_period_service.dart';
import 'class_adjustment_service.dart';
import 'class_demand_service.dart';
import 'lecturer_validators.dart';

abstract final class LecturerService {
  static const availableRooms = <String>[
    'A101',
    'A102',
    'A201',
    'A202',
    'B101',
    'B102',
    'B201',
    'B202',
    'C301',
    'C302',
  ];

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
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    if (capacity < 1 || capacity > 500) {
      throw AppException(
        code: 'invalid_class',
        message: 'Sĩ số lớp không hợp lệ.',
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
      await RegistrationPeriodService.requireLecturerOpen(
        session,
        semesterId: semesterId,
        transaction: transaction,
      );
      await ensureNoConflict(
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
          classCode: _automaticClassCode(),
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

  static Future<ClassAdjustmentRequestDto> updateCourseClass(
    Session session, {
    required UuidValue courseClassId,
    required int capacity,
    required List<ClassScheduleDto> schedules,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    _validateSchedules(schedules);
    return session.db.transaction((transaction) async {
      final courseClass = await _ownedClass(
        session,
        lecturer,
        courseClassId,
        transaction: transaction,
        lock: true,
      );
      await RegistrationPeriodService.requireLecturerOpen(
        session,
        semesterId: courseClass.semesterId,
        transaction: transaction,
      );
      if (!LecturerClassValidator.validForUpdate(
        capacity: capacity,
        registeredCount: courseClass.registeredCount,
      )) {
        throw AppException(
          code: 'invalid_capacity',
          message: 'Sĩ số tối đa không thể nhỏ hơn số sinh viên đã đăng ký.',
        );
      }
      await ensureNoConflict(
        session,
        lecturer: lecturer,
        semesterId: courseClass.semesterId,
        schedules: schedules,
        excludedClassId: courseClassId,
        transaction: transaction,
      );
      final pending = await ClassAdjustmentRequest.db.findFirstRow(
        session,
        transaction: transaction,
        where: (table) =>
            table.courseClassId.equals(courseClassId) &
            table.status.equals(ClassAdjustmentStatus.pending),
      );
      if (pending != null) {
        throw AppException(
          code: 'adjustment_already_pending',
          message: 'Lớp đã có một yêu cầu điều chỉnh đang chờ duyệt.',
        );
      }
      final currentSchedules = await ClassSchedule.db.find(
        session,
        transaction: transaction,
        where: (table) => table.courseClassId.equals(courseClassId),
      );
      final request = await ClassAdjustmentRequest.db.insertRow(
        session,
        ClassAdjustmentRequest(
          courseClassId: courseClassId,
          lecturerId: lecturer.id!,
          oldCapacity: courseClass.capacity,
          newCapacity: capacity,
          oldSchedulesJson: ClassAdjustmentService.encodeSchedules(
            currentSchedules.map(_scheduleDto).toList(growable: false),
          ),
          newSchedulesJson: ClassAdjustmentService.encodeSchedules(schedules),
          status: ClassAdjustmentStatus.pending,
        ),
        transaction: transaction,
      );
      await _log(
        session,
        lecturer: lecturer,
        action: 'REQUEST_CLASS_ADJUSTMENT',
        entity: 'class_adjustment_request',
        entityId: request.id!,
        transaction: transaction,
      );
      return ClassAdjustmentService.toDto(
        session,
        request,
        transaction: transaction,
      );
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
      await RegistrationPeriodService.requireLecturerOpen(
        session,
        semesterId: courseClass.semesterId,
        transaction: transaction,
      );
      final registration = await Registration.db.findFirstRow(
        session,
        transaction: transaction,
        where: (table) => table.courseClassId.equals(courseClassId),
      );
      final history = await RegistrationHistory.db.findFirstRow(
        session,
        transaction: transaction,
        where: (table) => table.courseClassId.equals(courseClassId),
      );
      if (registration != null || history != null) {
        throw AppException(
          code: 'class_has_registration_history',
          message:
              'Không thể xóa lớp đã có dữ liệu đăng ký. Hãy đóng lớp để bảo toàn lịch sử.',
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
      await RegistrationPeriodService.requireLecturerOpen(
        session,
        semesterId: courseClass.semesterId,
        transaction: transaction,
      );
      await ensureNoConflict(
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
    final classes = await CourseClass.db.find(
      session,
      where: (table) =>
          table.lecturerId.equals(lecturer.id) &
          table.status.equals(CourseClassStatus.open),
    );
    final classIds = classes.map((item) => item.id!).toSet();
    if (classIds.isEmpty) return [];
    // ClassSchedule is the canonical timetable written only after the training
    // department approves a proposal. Pending/rejected proposals must stay in
    // class management and must never leak into the teaching timetable.
    final approvedSchedules = await ClassSchedule.db.find(
      session,
      where: (table) => table.courseClassId.inSet(classIds),
    );
    final values = approvedSchedules
        .map(
          (schedule) => TeachingScheduleProposal(
            id: schedule.id,
            lecturerId: lecturer.id!,
            courseClassId: schedule.courseClassId,
            dayOfWeek: schedule.dayOfWeek,
            startPeriod: schedule.startPeriod,
            endPeriod: schedule.endPeriod,
            room: schedule.room,
            status: TeachingScheduleStatus.approved,
          ),
        )
        .toList();
    values.sort((a, b) {
      final day = a.dayOfWeek.compareTo(b.dayOfWeek);
      return day != 0 ? day : a.startPeriod.compareTo(b.startPeriod);
    });
    return values;
  }

  static Future<List<String>> getAvailableRooms(Session session) async {
    await _authorizedLecturer(session);
    return availableRooms;
  }

  static Future<RegistrationPeriodDto> getRegistrationPeriod(
    Session session, {
    required UuidValue semesterId,
  }) async {
    await _authorizedLecturer(session);
    return RegistrationPeriodService.getDto(
      session,
      semesterId: semesterId,
    );
  }

  static Future<List<ClassScheduleDto>> getAvailableScheduleSlots(
    Session session, {
    required UuidValue semesterId,
    required String room,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    if (!availableRooms.contains(room)) {
      throw AppException(
        code: 'invalid_room',
        message: 'Phòng học không hợp lệ.',
      );
    }
    final semesterClasses = await CourseClass.db.find(
      session,
      where: (table) => table.semesterId.equals(semesterId),
    );
    final classIds = semesterClasses.map((item) => item.id!).toSet();
    final lecturerClassIds = semesterClasses
        .where((item) => item.lecturerId == lecturer.id)
        .map((item) => item.id!)
        .toSet();
    final classSchedules = classIds.isEmpty
        ? <ClassSchedule>[]
        : await ClassSchedule.db.find(
            session,
            where: (table) => table.courseClassId.inSet(classIds),
          );
    final proposals = classIds.isEmpty
        ? <TeachingScheduleProposal>[]
        : await TeachingScheduleProposal.db.find(
            session,
            where: (table) =>
                table.courseClassId.inSet(classIds) &
                table.status.notEquals(TeachingScheduleStatus.rejected),
          );
    final lecturerOccupied = <ScheduleSlot>[
      ...classSchedules
          .where((item) => lecturerClassIds.contains(item.courseClassId))
          .map(_classScheduleSlot),
      ...proposals
          .where((item) => lecturerClassIds.contains(item.courseClassId))
          .map(_proposalSlot),
    ];
    final roomOccupied = <ScheduleSlot>[
      ...classSchedules
          .where((item) => item.room == room)
          .map(
            _classScheduleSlot,
          ),
      ...proposals.where((item) => item.room == room).map(_proposalSlot),
    ];
    final result = <ClassScheduleDto>[];
    const periods = [(1, 3), (4, 6), (7, 9), (10, 12)];
    for (var day = 2; day <= 7; day++) {
      for (final period in periods) {
        final candidate = ClassScheduleDto(
          dayOfWeek: day,
          startPeriod: period.$1,
          endPeriod: period.$2,
          room: room,
        );
        final slot = _slot(candidate);
        if (!TeachingConflictChecker.hasConflict([slot], lecturerOccupied) &&
            !TeachingConflictChecker.hasConflict([slot], roomOccupied)) {
          result.add(candidate);
        }
      }
    }
    return result;
  }

  static Future<List<ClassStudentDto>> getRegisteredStudents(
    Session session, {
    required UuidValue courseClassId,
    int page = 1,
    int pageSize = 50,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    final courseClass = await _ownedClass(session, lecturer, courseClassId);
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
    final semester = await Semester.db.findById(
      session,
      courseClass.semesterId,
    );
    final semesterLabel = semester == null
        ? null
        : '${semester.name} ${semester.academicYear}';
    final transcripts = semesterLabel == null
        ? <StudentTranscript>[]
        : await StudentTranscript.db.find(
            session,
            where: (table) =>
                table.courseId.equals(courseClass.courseId) &
                table.semester.equals(semesterLabel),
          );
    final transcriptsByStudent = {
      for (final item in transcripts) item.studentId: item,
    };
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
          midtermScore: transcriptsByStudent[student.id]?.midtermScore,
          finalScore: transcriptsByStudent[student.id]?.finalScore,
        ),
      );
    }
    result.sort((a, b) => a.studentCode.compareTo(b.studentCode));
    return result;
  }

  static Future<bool> updateStudentGrades(
    Session session, {
    required UuidValue courseClassId,
    required UuidValue studentId,
    required double midtermScore,
    required double finalScore,
  }) async {
    final lecturer = await _authorizedLecturer(session);
    if (!midtermScore.isFinite ||
        !finalScore.isFinite ||
        midtermScore < 0 ||
        midtermScore > 10 ||
        finalScore < 0 ||
        finalScore > 10) {
      throw AppException(
        code: 'invalid_grade',
        message: 'Điểm phải nằm trong khoảng từ 0 đến 10.',
      );
    }
    final courseClass = await _ownedClass(session, lecturer, courseClassId);
    await RegistrationPeriodService.requireLecturerOpen(
      session,
      semesterId: courseClass.semesterId,
    );
    final registration = await Registration.db.findFirstRow(
      session,
      where: (table) =>
          table.courseClassId.equals(courseClassId) &
          table.studentId.equals(studentId) &
          table.status.equals(RegistrationStatus.registered),
    );
    if (registration == null) {
      throw AppException(
        code: 'student_not_in_class',
        message: 'Sinh viên không thuộc lớp học phần này.',
      );
    }
    final semester = await Semester.db.findById(
      session,
      courseClass.semesterId,
    );
    if (semester == null) throw _incomplete('semester');
    final semesterLabel = '${semester.name} ${semester.academicYear}';
    final total = midtermScore * 0.4 + finalScore * 0.6;
    final gpa = (total / 10 * 4 * 100).roundToDouble() / 100;
    final letter = total >= 8.5
        ? 'A'
        : total >= 7
        ? 'B'
        : total >= 5.5
        ? 'C'
        : total >= 4
        ? 'D'
        : 'F';
    final existing = await StudentTranscript.db.findFirstRow(
      session,
      where: (table) =>
          table.studentId.equals(studentId) &
          table.courseId.equals(courseClass.courseId) &
          table.semester.equals(semesterLabel),
    );
    final value = StudentTranscript(
      id: existing?.id,
      studentId: studentId,
      courseId: courseClass.courseId,
      semester: semesterLabel,
      midtermScore: midtermScore,
      finalScore: finalScore,
      score: gpa,
      letterGrade: letter,
      status: total >= 4 ? TranscriptStatus.passed : TranscriptStatus.failed,
      attemptNumber: existing?.attemptNumber ?? 1,
      createdAt: existing?.createdAt ?? DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );
    final persisted = existing == null
        ? await StudentTranscript.db.insertRow(session, value)
        : await StudentTranscript.db.updateRow(session, value);
    await _log(
      session,
      lecturer: lecturer,
      action: 'UPDATE_GRADE',
      entity: 'student_transcript',
      entityId: persisted.id!,
    );
    return true;
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

  static Future<void> ensureNoConflict(
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

    final semesterClasses = await CourseClass.db.find(
      session,
      transaction: transaction,
      where: (table) => table.semesterId.equals(semesterId),
    );
    final classIds = semesterClasses
        .where((item) => item.id != excludedClassId)
        .map((item) => item.id!)
        .toSet();
    if (classIds.isEmpty) return;
    for (final schedule in schedules) {
      final occupied = <ScheduleSlot>[];
      final roomSchedules = await ClassSchedule.db.find(
        session,
        transaction: transaction,
        where: (table) =>
            table.courseClassId.inSet(classIds) &
            table.room.equals(schedule.room),
      );
      occupied.addAll(
        roomSchedules.map(
          (item) => ScheduleSlot(
            dayOfWeek: item.dayOfWeek,
            startPeriod: item.startPeriod,
            endPeriod: item.endPeriod,
          ),
        ),
      );
      final roomProposals = await TeachingScheduleProposal.db.find(
        session,
        transaction: transaction,
        where: (table) =>
            table.courseClassId.inSet(classIds) &
            table.room.equals(schedule.room) &
            table.status.notEquals(TeachingScheduleStatus.rejected),
      );
      occupied.addAll(
        roomProposals.map(
          (item) => ScheduleSlot(
            dayOfWeek: item.dayOfWeek,
            startPeriod: item.startPeriod,
            endPeriod: item.endPeriod,
          ),
        ),
      );
      if (TeachingConflictChecker.hasConflict([_slot(schedule)], occupied)) {
        throw AppException(
          code: 'room_schedule_conflict',
          message:
              'Phòng ${schedule.room} đã được sử dụng trong thời gian này.',
        );
      }
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
              !availableRooms.contains(item.room),
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

  static ScheduleSlot _classScheduleSlot(ClassSchedule value) => ScheduleSlot(
    dayOfWeek: value.dayOfWeek,
    startPeriod: value.startPeriod,
    endPeriod: value.endPeriod,
  );

  static ScheduleSlot _proposalSlot(TeachingScheduleProposal value) =>
      ScheduleSlot(
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
    final latestAdjustment = await ClassAdjustmentRequest.db.findFirstRow(
      session,
      transaction: transaction,
      where: (table) => table.courseClassId.equals(courseClass.id),
      orderBy: (table) => table.createdAt.desc(),
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
      latestAdjustment: latestAdjustment == null
          ? null
          : await ClassAdjustmentService.toDto(
              session,
              latestAdjustment,
              transaction: transaction,
            ),
    );
  }

  static ClassScheduleDto _scheduleDto(ClassSchedule value) => ClassScheduleDto(
    dayOfWeek: value.dayOfWeek,
    startPeriod: value.startPeriod,
    endPeriod: value.endPeriod,
    room: value.room,
  );

  static AppException _conflict() => AppException(
    code: 'teaching_schedule_conflict',
    message: 'Giảng viên đã có lịch dạy trong thời gian này.',
  );

  static String _automaticClassCode() =>
      'LHP${DateTime.now().toUtc().microsecondsSinceEpoch.toRadixString(36).toUpperCase()}';

  static AppException _incomplete(String field) => AppException(
    code: 'data_incomplete',
    message: 'Thiếu dữ liệu: $field.',
  );
}
