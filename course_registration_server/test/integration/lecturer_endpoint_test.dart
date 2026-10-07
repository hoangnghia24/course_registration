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
        final rooms = await endpoints.lecturer.getAvailableRooms(authenticated);
        final slotsBefore = await endpoints.lecturer.getAvailableScheduleSlots(
          authenticated,
          semesterId: semester.id!,
          room: 'A101',
        );

        final created = await endpoints.lecturer.createCourseClass(
          authenticated,
          courseId: course.id!,
          semesterId: semester.id!,
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
        final slotsAfter = await endpoints.lecturer.getAvailableScheduleSlots(
          authenticated,
          semesterId: semester.id!,
          room: 'A101',
        );
        final profile = await endpoints.lecturer.getMyProfile(authenticated);
        final classes = await endpoints.lecturer.getMyCourseClasses(
          authenticated,
        );
        final updated = await endpoints.lecturer.updateCourseClass(
          authenticated,
          courseClassId: created.courseClassId,
          capacity: 60,
          schedules: [
            ClassScheduleDto(
              dayOfWeek: 3,
              startPeriod: 4,
              endPeriod: 6,
              room: 'A102',
            ),
          ],
        );
        final studentUser = await AppUser.db.insertRow(
          session,
          AppUser(
            authUserId: UuidValue.withValidation(
              '018f0000-0000-7000-8000-000000000302',
            ),
            email: 'phase5-student@example.edu',
            fullName: 'Trần Văn Học',
            role: UserRole.student,
          ),
        );
        final student = await Student.db.insertRow(
          session,
          Student(
            userId: studentUser.id!,
            studentCode: 'P5-SV001',
            academicYear: 2026,
          ),
        );
        await Registration.db.insertRow(
          session,
          Registration(
            studentId: student.id!,
            courseClassId: created.courseClassId,
            status: RegistrationStatus.registered,
          ),
        );
        final storedClass = await CourseClass.db.findById(
          session,
          created.courseClassId,
        );
        await CourseClass.db.updateRow(
          session,
          storedClass!.copyWith(registeredCount: 1),
        );
        await endpoints.lecturer.updateStudentGrades(
          authenticated,
          courseClassId: created.courseClassId,
          studentId: student.id!,
          midtermScore: 7,
          finalScore: 9,
        );
        final classStudents = await endpoints.lecturer.getRegisteredStudents(
          authenticated,
          courseClassId: created.courseClassId,
        );
        final transcript = await StudentTranscript.db.findFirstRow(
          session,
          where: (table) =>
              table.studentId.equals(student.id) &
              table.courseId.equals(course.id),
        );

        expect(profile.lecturerCode, 'P5-GV001');
        expect(rooms, contains('A101'));
        expect(
          slotsBefore,
          contains(
            isA<ClassScheduleDto>()
                .having((item) => item.dayOfWeek, 'dayOfWeek', 2)
                .having((item) => item.startPeriod, 'startPeriod', 1),
          ),
        );
        expect(
          slotsAfter,
          isNot(
            contains(
              isA<ClassScheduleDto>()
                  .having((item) => item.dayOfWeek, 'dayOfWeek', 2)
                  .having((item) => item.startPeriod, 'startPeriod', 1),
            ),
          ),
        );
        expect(created.classCode, startsWith('LHP'));
        expect(created.proposals.single.status, TeachingScheduleStatus.pending);
        expect(classes.single.courseName, 'Lập trình cơ bản');
        expect(updated.capacity, 60);
        expect(updated.status, CourseClassStatus.closed);
        expect(
          updated.proposals.any(
            (item) => item.status == TeachingScheduleStatus.pending,
          ),
          isTrue,
        );
        expect(classStudents.single.midtermScore, 7);
        expect(classStudents.single.finalScore, 9);
        expect(transcript?.score, 3.28);
        expect(transcript?.letterGrade, 'B');
        await expectLater(
          endpoints.lecturer.deleteCourseClass(
            authenticated,
            courseClassId: created.courseClassId,
          ),
          throwsA(
            isA<AppException>().having(
              (error) => error.code,
              'code',
              'class_has_students',
            ),
          ),
        );
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
