import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Student endpoint', (sessionBuilder, endpoints) {
    test('returns the authenticated student academic profile', () async {
      final authUserId = UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000010',
      );
      final session = sessionBuilder.build();
      final faculty = await Faculty.db.insertRow(
        session,
        Faculty(name: 'Công nghệ thông tin', code: 'CNTT'),
      );
      final major = await Major.db.insertRow(
        session,
        Major(
          facultyId: faculty.id!,
          name: 'Kỹ thuật phần mềm',
          code: 'KTPM',
        ),
      );
      final program = await TrainingProgram.db.insertRow(
        session,
        TrainingProgram(
          majorId: major.id!,
          code: 'KTPM-2025',
          name: 'KTPM 2025',
          academicYear: 2025,
          totalCredits: 130,
          semesterCount: 8,
        ),
      );
      final course = await Course.db.insertRow(
        session,
        Course(
          courseCode: 'CS101',
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
      final user = await AppUser.db.insertRow(
        session,
        AppUser(
          authUserId: authUserId,
          email: 'student@example.edu',
          fullName: 'Nguyễn Văn An',
          role: UserRole.student,
        ),
      );
      final student = await Student.db.insertRow(
        session,
        Student(
          userId: user.id!,
          studentCode: 'SV001',
          majorId: major.id,
          trainingProgramId: program.id,
          academicYear: 2025,
          enrollmentYear: 2025,
          currentSemester: 1,
        ),
      );
      await StudentTranscript.db.insertRow(
        session,
        StudentTranscript(
          studentId: student.id!,
          courseId: course.id!,
          semester: '2025-1',
          score: 3.5,
          letterGrade: 'B+',
          status: TranscriptStatus.passed,
        ),
      );

      final authenticated = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId.toString(),
          {AppScopes.student},
        ),
      );
      final profile = await endpoints.student.getProfile(authenticated);
      final programCourses = await endpoints.student.getTrainingProgram(
        authenticated,
      );
      final transcript = await endpoints.student.getTranscript(authenticated);
      final gpa = await endpoints.student.getGpa(
        authenticated,
        semester: '2025-1',
      );

      expect(profile.studentCode, 'SV001');
      expect(profile.facultyName, 'Công nghệ thông tin');
      expect(profile.majorName, 'Kỹ thuật phần mềm');
      expect(profile.gpa, 3.5);
      expect(profile.totalCredits, 3);
      expect(
        programCourses.single.progressStatus,
        CourseProgressStatus.completed,
      );
      expect(transcript.single.letterGrade, 'B+');
      expect(gpa.semesterGpa, 3.5);
      expect(gpa.cumulativeGpa, 3.5);
    });
  });
}
