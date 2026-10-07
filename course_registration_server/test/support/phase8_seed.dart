import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class Phase8Seed {
  const Phase8Seed({
    required this.studentAuthIds,
    required this.lecturerAuthId,
    required this.adminAuthId,
    required this.students,
    required this.lecturer,
    required this.admin,
    required this.major,
    required this.program,
    required this.semester,
    required this.course,
    required this.courseClass,
  });

  final List<UuidValue> studentAuthIds;
  final UuidValue lecturerAuthId;
  final UuidValue adminAuthId;
  final List<Student> students;
  final Lecturer lecturer;
  final Admin admin;
  final Major major;
  final TrainingProgram program;
  final Semester semester;
  final Course course;
  final CourseClass courseClass;
}

Future<Phase8Seed> seedPhase8(Session session) async {
  final faculty = await Faculty.db.insertRow(
    session,
    Faculty(name: 'Phase 8 Faculty', code: 'P8-FAC'),
  );
  final major = await Major.db.insertRow(
    session,
    Major(facultyId: faculty.id!, name: 'Phase 8 Major', code: 'P8-MAJOR'),
  );
  final program = await TrainingProgram.db.insertRow(
    session,
    TrainingProgram(
      majorId: major.id!,
      code: 'P8-PROGRAM',
      name: 'Phase 8 Program',
      academicYear: 2026,
      totalCredits: 130,
      semesterCount: 8,
      status: TrainingProgramStatus.active,
    ),
  );
  final prerequisite = await Course.db.insertRow(
    session,
    Course(
      courseCode: 'P8-PRE',
      courseName: 'Phase 8 Prerequisite',
      credits: 3,
      courseType: CourseType.compulsory,
    ),
  );
  final equivalent = await Course.db.insertRow(
    session,
    Course(
      courseCode: 'P8-EQV',
      courseName: 'Phase 8 Equivalent',
      credits: 3,
      courseType: CourseType.compulsory,
    ),
  );
  final course = await Course.db.insertRow(
    session,
    Course(
      courseCode: 'P8-COURSE',
      courseName: 'Phase 8 Course',
      credits: 3,
      courseType: CourseType.compulsory,
    ),
  );
  for (final value in [prerequisite, equivalent, course]) {
    await TrainingProgramCourse.db.insertRow(
      session,
      TrainingProgramCourse(
        trainingProgramId: program.id!,
        courseId: value.id!,
        semesterNumber: 1,
        isRequired: true,
      ),
    );
  }
  await CoursePrerequisite.db.insertRow(
    session,
    CoursePrerequisite(
      courseId: course.id!,
      prerequisiteId: prerequisite.id!,
    ),
  );
  await CourseEquivalent.db.insertRow(
    session,
    CourseEquivalent(
      courseId: prerequisite.id!,
      equivalentId: equivalent.id!,
    ),
  );

  final lecturerAuthId = UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000810',
  );
  final lecturerUser = await AppUser.db.insertRow(
    session,
    AppUser(
      authUserId: lecturerAuthId,
      email: 'phase8-lecturer@example.edu',
      fullName: 'Phase 8 Lecturer',
      role: UserRole.lecturer,
    ),
  );
  final lecturer = await Lecturer.db.insertRow(
    session,
    Lecturer(
      userId: lecturerUser.id!,
      lecturerCode: 'P8-LECTURER',
      facultyId: faculty.id,
    ),
  );

  final adminAuthId = UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000820',
  );
  final adminUser = await AppUser.db.insertRow(
    session,
    AppUser(
      authUserId: adminAuthId,
      email: 'phase8-admin@example.edu',
      fullName: 'Phase 8 Admin',
      role: UserRole.admin,
    ),
  );
  final admin = await Admin.db.insertRow(
    session,
    Admin(userId: adminUser.id!),
  );
  await AdminPermission.db.insert(
    session,
    const {
          'MANAGE_USER',
          'MANAGE_COURSE',
          'MANAGE_PROGRAM',
          'APPROVE_CLASS',
          'VIEW_REPORT',
          'VIEW_AUDIT',
        }
        .map(
          (permission) => AdminPermission(
            adminId: admin.id!,
            permissionName: permission,
          ),
        )
        .toList(),
  );

  final semester = await Semester.db.insertRow(
    session,
    Semester(
      name: 'Phase 8 Semester',
      academicYear: 2026,
      startDate: DateTime.utc(2026, 1),
      endDate: DateTime.utc(2027, 12, 31),
      status: SemesterStatus.open,
    ),
  );
  await RegistrationPeriod.db.insertRow(
    session,
    RegistrationPeriod(
      semesterId: semester.id!,
      startTime: DateTime.utc(2025),
      endTime: DateTime.utc(2028),
      lecturerStartTime: DateTime.utc(2025),
      lecturerEndTime: DateTime.utc(2028),
      status: RegistrationPeriodStatus.active,
    ),
  );
  final courseClass = await CourseClass.db.insertRow(
    session,
    CourseClass(
      courseId: course.id!,
      lecturerId: lecturer.id!,
      semesterId: semester.id!,
      classCode: 'P8-CLASS',
      capacity: 30,
      registeredCount: 1,
      status: CourseClassStatus.open,
    ),
  );
  await ClassSchedule.db.insertRow(
    session,
    ClassSchedule(
      courseClassId: courseClass.id!,
      dayOfWeek: 2,
      startPeriod: 1,
      endPeriod: 3,
      room: 'P8-ROOM',
    ),
  );

  final students = <Student>[];
  final authIds = <UuidValue>[];
  for (var index = 0; index < 2; index++) {
    final authId = UuidValue.withValidation(
      '018f0000-0000-7000-8000-00000000083${index + 1}',
    );
    authIds.add(authId);
    final user = await AppUser.db.insertRow(
      session,
      AppUser(
        authUserId: authId,
        email: 'phase8-student-$index@example.edu',
        fullName: 'Phase 8 Student $index',
        role: UserRole.student,
      ),
    );
    students.add(
      await Student.db.insertRow(
        session,
        Student(
          userId: user.id!,
          studentCode: 'P8-STUDENT-$index',
          majorId: major.id,
          trainingProgramId: program.id,
          academicYear: 2026,
          enrollmentYear: 2026,
          currentSemester: 1,
        ),
      ),
    );
  }
  await StudentTranscript.db.insertRow(
    session,
    StudentTranscript(
      studentId: students.first.id!,
      courseId: prerequisite.id!,
      semester: '2025-2',
      score: 3.5,
      letterGrade: 'B+',
      status: TranscriptStatus.passed,
      attemptNumber: 1,
    ),
  );
  final registration = await Registration.db.insertRow(
    session,
    Registration(
      studentId: students.first.id!,
      courseClassId: courseClass.id!,
      status: RegistrationStatus.registered,
    ),
  );
  await RegistrationHistory.db.insertRow(
    session,
    RegistrationHistory(
      studentId: students.first.id!,
      courseClassId: courseClass.id!,
      action: RegistrationAction.register,
      deviceInfo: 'phase8-seed:${registration.id}',
    ),
  );

  return Phase8Seed(
    studentAuthIds: authIds,
    lecturerAuthId: lecturerAuthId,
    adminAuthId: adminAuthId,
    students: students,
    lecturer: lecturer,
    admin: admin,
    major: major,
    program: program,
    semester: semester,
    course: course,
    courseClass: courseClass,
  );
}
