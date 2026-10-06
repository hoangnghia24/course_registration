import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

import '../../generated/protocol.dart';
import '../../core/pagination.dart';
import 'gpa_calculator_service.dart';

abstract final class StudentService {
  static Future<StudentProfileDto> getProfile(
    Session session, {
    UuidValue? studentId,
  }) async {
    final student = await _authorizedStudent(session, studentId);
    final user = await _requiredUser(session, student);
    final major = await _requiredMajor(session, student);
    final faculty = await _requiredFaculty(session, major);
    final program = await _requiredProgram(session, student);
    final gpa = await getGpa(session, studentId: student.id);

    return StudentProfileDto(
      studentId: student.id!,
      fullName: user.fullName,
      email: user.email,
      phone: user.phone,
      avatar: user.avatar,
      studentCode: student.studentCode,
      majorName: major.name,
      facultyName: faculty.name,
      trainingProgramName: program.name,
      academicYear: student.academicYear,
      enrollmentYear: student.enrollmentYear,
      currentSemester: student.currentSemester,
      gpa: gpa.cumulativeGpa,
      totalCredits: gpa.earnedCredits,
      programTotalCredits: program.totalCredits,
    );
  }

  static Future<List<TrainingProgramCourseDto>> getTrainingProgram(
    Session session, {
    UuidValue? studentId,
    int page = 1,
    int pageSize = 50,
  }) async {
    final student = await _authorizedStudent(session, studentId);
    final programId = student.trainingProgramId;
    if (programId == null) {
      throw _incomplete('training_program');
    }

    final window = Pagination.window(page: page, pageSize: pageSize);
    final entries = await TrainingProgramCourse.db.find(
      session,
      where: (table) => table.trainingProgramId.equals(programId),
      orderBy: (table) => table.semesterNumber,
      limit: window.limit,
      offset: window.offset,
    );
    final transcripts = await StudentTranscript.db.find(
      session,
      where: (table) => table.studentId.equals(student.id),
    );
    final coursesById = await _coursesById(
      session,
      entries.map((entry) => entry.courseId),
    );
    final latestByCourse = <UuidValue, StudentTranscript>{};
    for (final item in transcripts) {
      final courseId = item.courseId;
      final current = latestByCourse[courseId];
      if (current == null || item.attemptNumber > current.attemptNumber) {
        latestByCourse[courseId] = item;
      }
    }

    final result = <TrainingProgramCourseDto>[];
    for (final entry in entries) {
      final courseId = entry.courseId;
      final course = coursesById[courseId];
      if (course == null) continue;
      final transcript = latestByCourse[courseId];
      final progress = transcript == null
          ? CourseProgressStatus.notStarted
          : transcript.status == TranscriptStatus.retake
          ? CourseProgressStatus.inProgress
          : CourseProgressStatus.completed;
      result.add(
        TrainingProgramCourseDto(
          courseId: courseId,
          courseCode: course.courseCode,
          courseName: course.courseName,
          credits: course.credits,
          semesterNumber: entry.semesterNumber,
          isRequired: entry.isRequired,
          courseType: course.courseType,
          progressStatus: progress,
        ),
      );
    }
    result.sort((a, b) {
      final semesterOrder = a.semesterNumber.compareTo(b.semesterNumber);
      return semesterOrder != 0
          ? semesterOrder
          : a.courseCode.compareTo(b.courseCode);
    });
    return result;
  }

  static Future<List<TranscriptDto>> getTranscript(
    Session session, {
    UuidValue? studentId,
    int page = 1,
    int pageSize = 50,
  }) async {
    final student = await _authorizedStudent(session, studentId);
    final window = Pagination.window(page: page, pageSize: pageSize);
    final records = await StudentTranscript.db.find(
      session,
      where: (table) => table.studentId.equals(student.id),
      orderBy: (table) => table.createdAt.desc(),
      limit: window.limit,
      offset: window.offset,
    );
    final coursesById = await _coursesById(
      session,
      records.map((record) => record.courseId),
    );
    final result = <TranscriptDto>[];
    for (final record in records) {
      final courseId = record.courseId;
      final course = coursesById[courseId];
      if (course == null) continue;
      result.add(
        TranscriptDto(
          transcriptId: record.id!,
          courseId: courseId,
          courseCode: course.courseCode,
          courseName: course.courseName,
          credits: course.credits,
          semester: record.semester,
          score: record.score,
          letterGrade: record.letterGrade,
          status: record.status,
          attemptNumber: record.attemptNumber,
        ),
      );
    }
    result.sort((a, b) {
      final semesterOrder = b.semester.compareTo(a.semester);
      return semesterOrder != 0
          ? semesterOrder
          : a.courseCode.compareTo(b.courseCode);
    });
    return result;
  }

  static Future<GpaDto> getGpa(
    Session session, {
    UuidValue? studentId,
    String? semester,
  }) async {
    final student = await _authorizedStudent(session, studentId);
    final records = await StudentTranscript.db.find(
      session,
      where: (table) => table.studentId.equals(student.id),
    );
    final coursesById = await _coursesById(
      session,
      records.map((record) => record.courseId),
    );
    final attempts = <GpaAttempt>[];
    for (final record in records) {
      final courseId = record.courseId;
      final course = coursesById[courseId];
      if (course == null) continue;
      attempts.add(
        GpaAttempt(
          courseId: courseId,
          credits: course.credits,
          score: record.score,
          status: record.status,
          attemptNumber: record.attemptNumber,
          semester: record.semester,
        ),
      );
    }
    return GpaCalculatorService.calculate(attempts, semester: semester);
  }

  static Future<Student> _authorizedStudent(
    Session session,
    UuidValue? requestedStudentId,
  ) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw AppException(code: 'unauthenticated', message: 'Login required.');
    }
    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (user?.id == null) {
      throw AppException(
        code: 'profile_not_found',
        message: 'Profile not found.',
      );
    }
    if (!user!.isActive) {
      throw AppException(
        code: 'account_disabled',
        message: 'Account disabled.',
      );
    }
    final ownStudent = await Student.db.findFirstRow(
      session,
      where: (table) => table.userId.equals(user.id),
    );
    if (ownStudent?.id == null) {
      throw AppException(
        code: 'student_not_found',
        message: 'Student academic profile has not been configured.',
      );
    }
    if (requestedStudentId != null && requestedStudentId != ownStudent!.id) {
      throw AppException(code: 'forbidden', message: 'Access denied.');
    }
    return ownStudent!;
  }

  static Future<AppUser> _requiredUser(Session session, Student student) async {
    final value = await AppUser.db.findById(session, student.userId);
    if (value == null) throw _incomplete('user');
    return value;
  }

  static Future<Major> _requiredMajor(Session session, Student student) async {
    final id = student.majorId;
    final value = id == null ? null : await Major.db.findById(session, id);
    if (value == null) throw _incomplete('major');
    return value;
  }

  static Future<Faculty> _requiredFaculty(Session session, Major major) async {
    final value = await Faculty.db.findById(session, major.facultyId);
    if (value == null) throw _incomplete('faculty');
    return value;
  }

  static Future<TrainingProgram> _requiredProgram(
    Session session,
    Student student,
  ) async {
    final id = student.trainingProgramId;
    final value = id == null
        ? null
        : await TrainingProgram.db.findById(session, id);
    if (value == null) throw _incomplete('training_program');
    return value;
  }

  static AppException _incomplete(String field) => AppException(
    code: 'academic_profile_incomplete',
    message: 'Missing academic profile field: $field.',
  );

  static Future<Map<UuidValue, Course>> _coursesById(
    Session session,
    Iterable<UuidValue> ids,
  ) async {
    final uniqueIds = ids.toSet();
    if (uniqueIds.isEmpty) return const {};
    final courses = await Course.db.find(
      session,
      where: (table) => table.id.inSet(uniqueIds),
    );
    return {for (final course in courses) course.id!: course};
  }
}
