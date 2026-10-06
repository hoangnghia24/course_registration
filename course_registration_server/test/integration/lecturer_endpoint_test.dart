import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Lecturer endpoint', (sessionBuilder, endpoints) {
    test(
      'creates an owned class, schedule proposal and activity log',
      () async {
        final authUserId = UuidValue.withValidation(
          '018f0000-0000-7000-8000-000000000301',
        );
        final session = sessionBuilder.build();
        final faculty = await Faculty.db.insertRow(
          session,
          Faculty(name: 'Công nghệ thông tin', code: 'CNTT-P5'),
        );
        final user = await AppUser.db.insertRow(
          session,
          AppUser(
            authUserId: authUserId,
            email: 'phase5-lecturer@example.edu',
            fullName: 'Nguyễn Văn Giảng',
            role: UserRole.lecturer,
          ),
        );
        final lecturer = await Lecturer.db.insertRow(
          session,
          Lecturer(
            userId: user.id!,
            lecturerCode: 'P5-GV001',
            facultyId: faculty.id,
            department: 'Khoa học máy tính',
            academicTitle: 'Giảng viên chính',
            specialization: 'Cơ sở dữ liệu',
          ),
        );
        final course = await Course.db.insertRow(
          session,
          Course(
            courseCode: 'P5-IT101',
            courseName: 'Lập trình cơ bản',
            credits: 3,
            courseType: CourseType.compulsory,
          ),
        );
        final semester = await Semester.db.insertRow(
          session,
          Semester(
            name: 'P5 Học kỳ 1',
            academicYear: 2026,
            startDate: DateTime.utc(2026, 9, 1),
            endDate: DateTime.utc(2027, 1, 31),
            status: SemesterStatus.open,
          ),
        );
        final authenticated = sessionBuilder.copyWith(
          authentication: AuthenticationOverride.authenticationInfo(
            authUserId.toString(),
            {AppScopes.lecturer},
          ),
        );

        final created = await endpoints.lecturer.createCourseClass(
          authenticated,
          courseId: course.id!,
          semesterId: semester.id!,
          classCode: 'P5-IT101-01',
          capacity: 50,
          schedules: [
            ClassScheduleDto(
              dayOfWeek: 2,
              startPeriod: 1,
              endPeriod: 3,
              room: 'A101',
            ),
          ],
        );
        final profile = await endpoints.lecturer.getMyProfile(authenticated);
        final classes = await endpoints.lecturer.getMyCourseClasses(
          authenticated,
        );
        final updated = await endpoints.lecturer.updateCourseClass(
          authenticated,
          courseClassId: created.courseClassId,
          classCode: 'P5-IT101-01A',
          capacity: 60,
          status: CourseClassStatus.open,
        );

        expect(profile.lecturerCode, 'P5-GV001');
        expect(created.classCode, 'P5-IT101-01');
        expect(created.proposals.single.status, TeachingScheduleStatus.pending);
        expect(classes.single.courseName, 'Lập trình cơ bản');
        expect(updated.capacity, 60);
        final assignments = await LecturerCourseClass.db.find(
          session,
          where: (table) => table.lecturerId.equals(lecturer.id),
        );
        final logs = await LecturerActivityLog.db.find(
          session,
          where: (table) => table.lecturerId.equals(lecturer.id),
        );
        expect(assignments, hasLength(1));
        expect(
          logs.map((item) => item.action),
          containsAll(['CREATE_CLASS', 'UPDATE_CLASS']),
        );
      },
    );
  });
}
