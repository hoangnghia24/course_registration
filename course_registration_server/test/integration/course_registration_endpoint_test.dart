import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Course registration endpoint', (sessionBuilder, endpoints) {
    test('registers atomically and updates capacity and history', () async {
      final studentAuthId = UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000100',
      );
      final lecturerAuthId = UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000101',
      );
      final session = sessionBuilder.build();
      final faculty = await Faculty.db.insertRow(
        session,
        Faculty(name: 'Công nghệ thông tin', code: 'CNTT-P4'),
      );
      final major = await Major.db.insertRow(
        session,
        Major(
          facultyId: faculty.id!,
          name: 'Kỹ thuật phần mềm',
          code: 'KTPM-P4',
        ),
      );
      final program = await TrainingProgram.db.insertRow(
        session,
        TrainingProgram(
          majorId: major.id!,
          name: 'KTPM Phase 4',
          academicYear: 2026,
          totalCredits: 130,
        ),
      );
      final course = await Course.db.insertRow(
        session,
        Course(
          courseCode: 'P4-CS101',
          courseName: 'Lập trình cơ bản',
          credits: 3,
          courseType: CourseType.compulsory,
        ),
      );
      await TrainingProgramCourse.db.insertRow(
        session,
        TrainingProgramCourse(
          trainingProgramId: program.id!,
          courseId: course.id!,
          semesterNumber: 1,
          isRequired: true,
        ),
      );
      final studentUser = await AppUser.db.insertRow(
        session,
        AppUser(
          authUserId: studentAuthId,
          email: 'phase4-student@example.edu',
          fullName: 'Nguyễn Văn An',
          role: UserRole.student,
        ),
      );
      final student = await Student.db.insertRow(
        session,
        Student(
          userId: studentUser.id!,
          studentCode: 'P4-SV001',
          majorId: major.id,
          trainingProgramId: program.id,
          academicYear: 2026,
          enrollmentYear: 2026,
          currentSemester: 1,
        ),
      );
      final lecturerUser = await AppUser.db.insertRow(
        session,
        AppUser(
          authUserId: lecturerAuthId,
          email: 'phase4-lecturer@example.edu',
          fullName: 'Trần Văn Bình',
          role: UserRole.lecturer,
        ),
      );
      final lecturer = await Lecturer.db.insertRow(
        session,
        Lecturer(
          userId: lecturerUser.id!,
          lecturerCode: 'P4-GV001',
          facultyId: faculty.id,
        ),
      );
      final semester = await Semester.db.insertRow(
        session,
        Semester(
          name: 'Học kỳ 1',
          academicYear: 2026,
          startDate: DateTime.utc(2026, 9, 1),
          endDate: DateTime.utc(2027, 1, 31),
          status: SemesterStatus.open,
        ),
      );
      final courseClass = await CourseClass.db.insertRow(
        session,
        CourseClass(
          courseId: course.id!,
          lecturerId: lecturer.id!,
          semesterId: semester.id!,
          classCode: 'P4-CS101-01',
          capacity: 1,
          registeredCount: 0,
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
          room: 'A101',
        ),
      );

      final authenticated = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          studentAuthId.toString(),
          {AppScopes.student},
        ),
      );
      final result = await endpoints.courseRegistration.registerCourse(
        authenticated,
        courseClassId: courseClass.id!,
        deviceInfo: 'integration-test',
      );

      expect(result.success, isTrue);
      expect(result.registration?.courseCode, 'P4-CS101');
      final updatedClass = await CourseClass.db.findById(
        session,
        courseClass.id!,
      );
      expect(updatedClass?.registeredCount, 1);
      expect(updatedClass?.status, CourseClassStatus.full);
      final registrations = await Registration.db.find(
        session,
        where: (table) => table.studentId.equals(student.id),
      );
      final history = await RegistrationHistory.db.find(
        session,
        where: (table) => table.studentId.equals(student.id),
      );
      expect(registrations.single.status, RegistrationStatus.registered);
      expect(history.single.action, RegistrationAction.register);
    });
  });
}
