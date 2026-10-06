import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import '../auth/app_scopes.dart';
import '../generated/protocol.dart';

/// Development-only sample data for demonstrating the application.
abstract final class DemoDataSeed {
  static const password = 'HocVu@2026';

  static const accounts = <({String email, String name, UserRole role})>[
    (
      email: 'phongdaotao@namviet.edu.vn',
      name: 'Nguyễn Hoàng Minh',
      role: UserRole.admin,
    ),
    (
      email: 'minh.tran@namviet.edu.vn',
      name: 'TS. Trần Quang Minh',
      role: UserRole.lecturer,
    ),
    (
      email: '26cntt001@namviet.edu.vn',
      name: 'Nguyễn Văn An',
      role: UserRole.student,
    ),
    (
      email: '26cntt002@namviet.edu.vn',
      name: 'Trần Thị Bình',
      role: UserRole.student,
    ),
    (
      email: 'lan.pham@namviet.edu.vn',
      name: 'ThS. Phạm Ngọc Lan',
      role: UserRole.lecturer,
    ),
    (
      email: 'duc.le@namviet.edu.vn',
      name: 'TS. Lê Anh Đức',
      role: UserRole.lecturer,
    ),
    (
      email: '26cntt003@namviet.edu.vn',
      name: 'Lê Minh Châu',
      role: UserRole.student,
    ),
    (
      email: '26cntt004@namviet.edu.vn',
      name: 'Phạm Gia Huy',
      role: UserRole.student,
    ),
    (
      email: '26cntt005@namviet.edu.vn',
      name: 'Võ Hoàng Linh',
      role: UserRole.student,
    ),
    (
      email: '26cntt006@namviet.edu.vn',
      name: 'Đặng Thu Hà',
      role: UserRole.student,
    ),
    (
      email: '26cntt007@namviet.edu.vn',
      name: 'Bùi Quốc Khánh',
      role: UserRole.student,
    ),
    (
      email: '26cntt008@namviet.edu.vn',
      name: 'Ngô Thanh Mai',
      role: UserRole.student,
    ),
    (
      email: '26cntt009@namviet.edu.vn',
      name: 'Dương Minh Nhật',
      role: UserRole.student,
    ),
    (
      email: '26cntt010@namviet.edu.vn',
      name: 'Hoàng Yến Nhi',
      role: UserRole.student,
    ),
  ];

  static Future<bool> run(Session session, EmailIdp emailIdp) async {
    final existing = await Faculty.db.findFirstRow(
      session,
      where: (table) => table.code.equals('CNTT'),
    );
    if (existing != null) {
      await _resetDemoPasswords(session, emailIdp);
      await _repairDemoTranscriptScores(session);
      return false;
    }

    await session.db.transaction((transaction) async {
      final category = await CourseCategory.db.insertRow(
        session,
        CourseCategory(
          name: 'Khối kiến thức chuyên ngành',
          description:
              'Các học phần nền tảng và chuyên sâu ngành công nghệ thông tin.',
        ),
        transaction: transaction,
      );
      final faculty = await Faculty.db.insertRow(
        session,
        Faculty(
          name: 'Khoa Công nghệ Thông tin',
          code: 'CNTT',
          description:
              'Đào tạo kỹ sư và cử nhân trong lĩnh vực công nghệ thông tin.',
        ),
        transaction: transaction,
      );
      final major = await Major.db.insertRow(
        session,
        Major(
          facultyId: faculty.id!,
          name: 'Công nghệ Thông tin',
          code: '7480201',
          description:
              'Chương trình đào tạo theo định hướng ứng dụng và phát triển phần mềm.',
        ),
        transaction: transaction,
      );
      final program = await TrainingProgram.db.insertRow(
        session,
        TrainingProgram(
          majorId: major.id!,
          name: 'Chương trình Công nghệ Thông tin khóa 2026',
          academicYear: 2026,
          totalCredits: 130,
          description: 'Chương trình đào tạo hệ chính quy 130 tín chỉ.',
        ),
        transaction: transaction,
      );

      final courses = await Course.db.insert(
        session,
        [
          Course(
            courseCode: 'CNTT101',
            courseName: 'Nhập môn lập trình',
            credits: 3,
            description: 'Kiến thức nền tảng về thuật toán và lập trình.',
            courseType: CourseType.compulsory,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT102',
            courseName: 'Lập trình hướng đối tượng',
            credits: 3,
            description: 'Thiết kế phần mềm theo hướng đối tượng.',
            courseType: CourseType.compulsory,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT103',
            courseName: 'Cơ sở dữ liệu',
            credits: 3,
            description: 'Mô hình quan hệ, SQL và PostgreSQL.',
            courseType: CourseType.compulsory,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT104',
            courseName: 'Phát triển ứng dụng di động',
            credits: 3,
            description: 'Xây dựng ứng dụng đa nền tảng với Flutter.',
            courseType: CourseType.elective,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT105',
            courseName: 'Lập trình Java tương đương',
            credits: 3,
            description: 'Học phần tương đương cho lập trình hướng đối tượng.',
            courseType: CourseType.elective,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT106',
            courseName: 'Cấu trúc dữ liệu và giải thuật',
            credits: 3,
            description:
                'Danh sách, cây, đồ thị và các kỹ thuật thiết kế giải thuật.',
            courseType: CourseType.compulsory,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT107',
            courseName: 'Mạng máy tính',
            credits: 3,
            description:
                'Kiến trúc mạng, giao thức TCP/IP và quản trị mạng căn bản.',
            courseType: CourseType.compulsory,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT108',
            courseName: 'Hệ điều hành',
            credits: 3,
            description:
                'Tiến trình, bộ nhớ, hệ thống tệp và lập lịch tài nguyên.',
            courseType: CourseType.compulsory,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT109',
            courseName: 'Công nghệ phần mềm',
            credits: 3,
            description:
                'Quy trình phát triển, phân tích yêu cầu và kiểm thử phần mềm.',
            courseType: CourseType.compulsory,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT110',
            courseName: 'Phát triển ứng dụng web',
            credits: 3,
            description: 'Xây dựng ứng dụng web hiện đại và dịch vụ API.',
            courseType: CourseType.elective,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT111',
            courseName: 'An toàn thông tin',
            credits: 3,
            description: 'Nguyên lý bảo mật, mật mã và an toàn hệ thống.',
            courseType: CourseType.elective,
            categoryId: category.id,
          ),
          Course(
            courseCode: 'CNTT112',
            courseName: 'Trí tuệ nhân tạo',
            credits: 3,
            description: 'Tìm kiếm, biểu diễn tri thức và học máy nhập môn.',
            courseType: CourseType.elective,
            categoryId: category.id,
          ),
        ],
        transaction: transaction,
      );
      final byCode = {for (final course in courses) course.courseCode: course};

      await TrainingProgramCourse.db.insert(
        session,
        courses.indexed
            .map(
              (entry) => TrainingProgramCourse(
                trainingProgramId: program.id!,
                courseId: entry.$2.id!,
                semesterNumber: entry.$1 < 3 ? 1 : 2,
                isRequired: entry.$2.courseType == CourseType.compulsory,
              ),
            )
            .toList(),
        transaction: transaction,
      );
      await CoursePrerequisite.db.insertRow(
        session,
        CoursePrerequisite(
          courseId: byCode['CNTT102']!.id!,
          prerequisiteId: byCode['CNTT101']!.id!,
        ),
        transaction: transaction,
      );
      await CourseEquivalent.db.insertRow(
        session,
        CourseEquivalent(
          courseId: byCode['CNTT102']!.id!,
          equivalentId: byCode['CNTT105']!.id!,
        ),
        transaction: transaction,
      );
      await CoursePrerequisite.db.insert(
        session,
        [
          CoursePrerequisite(
            courseId: byCode['CNTT106']!.id!,
            prerequisiteId: byCode['CNTT101']!.id!,
          ),
          CoursePrerequisite(
            courseId: byCode['CNTT109']!.id!,
            prerequisiteId: byCode['CNTT102']!.id!,
          ),
          CoursePrerequisite(
            courseId: byCode['CNTT110']!.id!,
            prerequisiteId: byCode['CNTT103']!.id!,
          ),
          CoursePrerequisite(
            courseId: byCode['CNTT112']!.id!,
            prerequisiteId: byCode['CNTT106']!.id!,
          ),
        ],
        transaction: transaction,
      );

      final users = <String, AppUser>{};
      for (final account in accounts) {
        users[account.email] = await _createAccount(
          session,
          emailIdp,
          account,
          transaction,
        );
      }

      final admin = await Admin.db.insertRow(
        session,
        Admin(
          userId: users['phongdaotao@namviet.edu.vn']!.id!,
          permissionLevel: 9,
        ),
        transaction: transaction,
      );
      await AdminPermission.db.insert(
        session,
        [
              'MANAGE_USER',
              'MANAGE_COURSE',
              'MANAGE_PROGRAM',
              'APPROVE_CLASS',
              'VIEW_REPORT',
              'VIEW_AUDIT',
            ]
            .map(
              (permission) => AdminPermission(
                adminId: admin.id!,
                permissionName: permission,
              ),
            )
            .toList(),
        transaction: transaction,
      );

      final lecturer = await Lecturer.db.insertRow(
        session,
        Lecturer(
          userId: users['minh.tran@namviet.edu.vn']!.id!,
          lecturerCode: 'GV001',
          facultyId: faculty.id,
          academicDegree: 'Tiến sĩ',
          department: 'Kỹ thuật phần mềm',
          academicTitle: 'Giảng viên chính',
          specialization: 'Phát triển phần mềm và cơ sở dữ liệu',
        ),
        transaction: transaction,
      );
      await Lecturer.db.insert(
        session,
        [
          Lecturer(
            userId: users['lan.pham@namviet.edu.vn']!.id!,
            lecturerCode: 'GV002',
            facultyId: faculty.id,
            academicDegree: 'Thạc sĩ',
            department: 'Khoa học máy tính',
            academicTitle: 'Giảng viên',
            specialization: 'Trí tuệ nhân tạo và khoa học dữ liệu',
          ),
          Lecturer(
            userId: users['duc.le@namviet.edu.vn']!.id!,
            lecturerCode: 'GV003',
            facultyId: faculty.id,
            academicDegree: 'Tiến sĩ',
            department: 'Mạng máy tính',
            academicTitle: 'Trưởng bộ môn',
            specialization: 'Mạng máy tính và an toàn thông tin',
          ),
        ],
        transaction: transaction,
      );
      final student1 = await Student.db.insertRow(
        session,
        Student(
          userId: users['26cntt001@namviet.edu.vn']!.id!,
          studentCode: '26CNTT001',
          majorId: major.id,
          trainingProgramId: program.id,
          academicYear: 2026,
          enrollmentYear: 2026,
          currentSemester: 2,
          gpa: 3.45,
          totalCredits: 6,
        ),
        transaction: transaction,
      );
      final student2 = await Student.db.insertRow(
        session,
        Student(
          userId: users['26cntt002@namviet.edu.vn']!.id!,
          studentCode: '26CNTT002',
          majorId: major.id,
          trainingProgramId: program.id,
          academicYear: 2026,
          enrollmentYear: 2026,
          currentSemester: 2,
          gpa: 2.85,
          totalCredits: 3,
        ),
        transaction: transaction,
      );
      final students = <Student>[student1, student2];
      for (var index = 3; index <= 10; index++) {
        final email =
            '26cntt${index.toString().padLeft(3, '0')}@namviet.edu.vn';
        students.add(
          await Student.db.insertRow(
            session,
            Student(
              userId: users[email]!.id!,
              studentCode: '26CNTT${index.toString().padLeft(3, '0')}',
              majorId: major.id,
              trainingProgramId: program.id,
              academicYear: 2026,
              enrollmentYear: 2026,
              currentSemester: 2,
              gpa: 2.7 + (index % 5) * 0.2,
              totalCredits: index.isEven ? 6 : 3,
            ),
            transaction: transaction,
          ),
        );
      }

      final semester = await Semester.db.insertRow(
        session,
        Semester(
          name: 'Học kỳ 1 năm học 2026–2027',
          academicYear: 2026,
          startDate: DateTime.utc(2026, 9, 1),
          endDate: DateTime.utc(2026, 12, 31, 23, 59, 59),
          status: SemesterStatus.open,
        ),
        transaction: transaction,
      );
      final classes = <CourseClass>[];
      for (final data in [
        (code: 'CNTT102-01', course: 'CNTT102', count: 1),
        (code: 'CNTT103-01', course: 'CNTT103', count: 1),
        (code: 'CNTT104-01', course: 'CNTT104', count: 0),
        (code: 'CNTT106-01', course: 'CNTT106', count: 0),
        (code: 'CNTT107-01', course: 'CNTT107', count: 0),
        (code: 'CNTT109-01', course: 'CNTT109', count: 0),
        (code: 'CNTT110-01', course: 'CNTT110', count: 0),
        (code: 'CNTT112-01', course: 'CNTT112', count: 0),
      ]) {
        classes.add(
          await CourseClass.db.insertRow(
            session,
            CourseClass(
              courseId: byCode[data.course]!.id!,
              lecturerId: lecturer.id!,
              semesterId: semester.id!,
              classCode: data.code,
              capacity: 35,
              registeredCount: data.count,
              status: CourseClassStatus.open,
            ),
            transaction: transaction,
          ),
        );
      }
      await ClassSchedule.db.insert(
        session,
        [
          ClassSchedule(
            courseClassId: classes[0].id!,
            dayOfWeek: 2,
            startPeriod: 1,
            endPeriod: 3,
            room: 'A101',
          ),
          ClassSchedule(
            courseClassId: classes[1].id!,
            dayOfWeek: 4,
            startPeriod: 4,
            endPeriod: 6,
            room: 'A203',
          ),
          ClassSchedule(
            courseClassId: classes[2].id!,
            dayOfWeek: 6,
            startPeriod: 7,
            endPeriod: 9,
            room: 'LAB-02',
          ),
          ClassSchedule(
            courseClassId: classes[3].id!,
            dayOfWeek: 3,
            startPeriod: 1,
            endPeriod: 3,
            room: 'B204',
          ),
          ClassSchedule(
            courseClassId: classes[4].id!,
            dayOfWeek: 5,
            startPeriod: 1,
            endPeriod: 3,
            room: 'B305',
          ),
          ClassSchedule(
            courseClassId: classes[5].id!,
            dayOfWeek: 3,
            startPeriod: 7,
            endPeriod: 9,
            room: 'A302',
          ),
          ClassSchedule(
            courseClassId: classes[6].id!,
            dayOfWeek: 5,
            startPeriod: 7,
            endPeriod: 9,
            room: 'LAB-03',
          ),
          ClassSchedule(
            courseClassId: classes[7].id!,
            dayOfWeek: 7,
            startPeriod: 1,
            endPeriod: 3,
            room: 'C201',
          ),
        ],
        transaction: transaction,
      );
      await LecturerCourseClass.db.insert(
        session,
        classes
            .map(
              (courseClass) => LecturerCourseClass(
                lecturerId: lecturer.id!,
                courseClassId: courseClass.id!,
              ),
            )
            .toList(),
        transaction: transaction,
      );

      await StudentTranscript.db.insert(
        session,
        [
          StudentTranscript(
            studentId: student1.id!,
            courseId: byCode['CNTT101']!.id!,
            semester: '2026-1',
            score: 3.5,
            letterGrade: 'B+',
            status: TranscriptStatus.passed,
            attemptNumber: 1,
          ),
          StudentTranscript(
            studentId: student1.id!,
            courseId: byCode['CNTT105']!.id!,
            semester: '2026-1',
            score: 4.0,
            letterGrade: 'A',
            status: TranscriptStatus.passed,
            attemptNumber: 1,
          ),
          StudentTranscript(
            studentId: student2.id!,
            courseId: byCode['CNTT101']!.id!,
            semester: '2026-1',
            score: 3.0,
            letterGrade: 'B',
            status: TranscriptStatus.passed,
            attemptNumber: 1,
          ),
        ],
        transaction: transaction,
      );

      final registration1 = await Registration.db.insertRow(
        session,
        Registration(
          studentId: student1.id!,
          courseClassId: classes[0].id!,
          status: RegistrationStatus.registered,
        ),
        transaction: transaction,
      );
      final registration2 = await Registration.db.insertRow(
        session,
        Registration(
          studentId: student2.id!,
          courseClassId: classes[1].id!,
          status: RegistrationStatus.registered,
        ),
        transaction: transaction,
      );
      final additionalRegistrations = <(int, int)>[
        (2, 2),
        (2, 3),
        (3, 3),
        (3, 4),
        (4, 4),
        (4, 5),
        (5, 5),
        (5, 6),
        (6, 6),
        (6, 7),
        (7, 2),
        (7, 7),
        (8, 3),
        (8, 6),
        (9, 4),
        (9, 7),
      ];
      final addedPerClass = <int, int>{};
      for (final (studentIndex, classIndex) in additionalRegistrations) {
        await Registration.db.insertRow(
          session,
          Registration(
            studentId: students[studentIndex].id!,
            courseClassId: classes[classIndex].id!,
            status: RegistrationStatus.registered,
          ),
          transaction: transaction,
        );
        addedPerClass.update(
          classIndex,
          (count) => count + 1,
          ifAbsent: () => 1,
        );
      }
      for (final entry in addedPerClass.entries) {
        await CourseClass.db.updateRow(
          session,
          classes[entry.key].copyWith(
            registeredCount: classes[entry.key].registeredCount + entry.value,
          ),
          transaction: transaction,
        );
      }
      await RegistrationHistory.db.insert(
        session,
        [
          RegistrationHistory(
            studentId: student1.id!,
            courseClassId: classes[0].id!,
            action: RegistrationAction.register,
            deviceInfo: 'android:${registration1.id}',
          ),
          RegistrationHistory(
            studentId: student2.id!,
            courseClassId: classes[1].id!,
            action: RegistrationAction.register,
            deviceInfo: 'android:${registration2.id}',
          ),
        ],
        transaction: transaction,
      );
      await CourseOpeningRequest.db.insertRow(
        session,
        CourseOpeningRequest(
          studentId: student2.id!,
          courseId: byCode['CNTT104']!.id!,
          reason: 'Muốn học sớm để thực hiện đồ án ứng dụng di động.',
          status: OpeningRequestStatus.pending,
        ),
        transaction: transaction,
      );

      final proposal = await TeachingScheduleProposal.db.insertRow(
        session,
        TeachingScheduleProposal(
          lecturerId: lecturer.id!,
          courseClassId: classes[2].id!,
          dayOfWeek: 6,
          startPeriod: 7,
          endPeriod: 9,
          room: 'LAB-02',
          status: TeachingScheduleStatus.pending,
        ),
        transaction: transaction,
      );
      await ClassApproval.db.insertRow(
        session,
        ClassApproval(
          courseClassId: classes[2].id!,
          adminId: admin.id!,
          status: ClassApprovalStatus.pending,
          comment: 'Chờ phòng đào tạo kiểm tra sĩ số và phòng học.',
        ),
        transaction: transaction,
      );
      await LecturerActivityLog.db.insertRow(
        session,
        LecturerActivityLog(
          lecturerId: lecturer.id!,
          action: 'CREATE_SCHEDULE_PROPOSAL',
          entity: 'teaching_schedule_proposal',
          entityId: proposal.id!,
        ),
        transaction: transaction,
      );
      await SystemAuditLog.db.insertRow(
        session,
        SystemAuditLog(
          userId: users['phongdaotao@namviet.edu.vn']!.id!,
          action: 'INITIALIZE_ACADEMIC_DATA',
          entity: 'system',
          entityId: admin.id!,
          newValue: jsonEncode({'facultyCode': faculty.code, 'accounts': 4}),
        ),
        transaction: transaction,
      );

      final operationId = UuidValue.withValidation(
        '01990000-0000-7000-8000-000000000001',
      );
      final now = DateTime.now().toUtc();
      await ProcessedSyncOperation.db.insertRow(
        session,
        ProcessedSyncOperation(
          operationId: operationId,
          userId: users['26cntt001@namviet.edu.vn']!.id!,
          entityType: 'registration',
          entityId: registration1.id.toString(),
          operationType: 'CREATE',
          payload: jsonEncode({'courseClassId': classes[0].id.toString()}),
          status: SyncOperationStatus.SYNCED,
          resultPayload: jsonEncode({
            'registrationId': registration1.id.toString(),
          }),
          serverVersion: 1,
        ),
        transaction: transaction,
      );
      await SyncChange.db.insertRow(
        session,
        SyncChange(
          targetUserId: users['26cntt001@namviet.edu.vn']!.id!,
          entityType: 'registration',
          entityId: registration1.id.toString(),
          changeType: 'UPSERT',
          payload: jsonEncode({'status': 'registered'}),
          serverVersion: 1,
        ),
        transaction: transaction,
      );
      await SyncLog.db.insertRow(
        session,
        SyncLog(
          operationId: operationId,
          action: 'CREATE_REGISTRATION',
          status: SyncOperationStatus.SYNCED,
          startedAt: now,
          completedAt: now,
        ),
        transaction: transaction,
      );
    });
    return true;
  }

  static Future<AppUser> _createAccount(
    Session session,
    EmailIdp emailIdp,
    ({String email, String name, UserRole role}) account,
    Transaction transaction,
  ) async {
    final scope = switch (account.role) {
      UserRole.student => AppScopes.student,
      UserRole.lecturer => AppScopes.lecturer,
      UserRole.admin => AppScopes.admin,
    };
    final authUser = await AuthServices.instance.authUsers.create(
      session,
      scopes: {scope},
      transaction: transaction,
    );
    await emailIdp.admin.createEmailAuthentication(
      session,
      authUserId: authUser.id,
      email: account.email,
      password: password,
      transaction: transaction,
    );
    return AppUser.db.insertRow(
      session,
      AppUser(
        authUserId: authUser.id,
        email: account.email,
        fullName: account.name,
        phone: switch (account.role) {
          UserRole.admin => '0900000001',
          UserRole.lecturer => '0900000002',
          UserRole.student =>
            account.email.contains('01') ? '0900000003' : '0900000004',
        },
        role: account.role,
        isActive: true,
      ),
      transaction: transaction,
    );
  }

  static Future<void> _resetDemoPasswords(
    Session session,
    EmailIdp emailIdp,
  ) async {
    for (final account in accounts) {
      final existing = await emailIdp.admin.findAccount(
        session,
        email: account.email,
      );
      if (existing != null) {
        await emailIdp.admin.setPassword(
          session,
          email: account.email,
          password: password,
        );
      }
    }
  }

  static Future<void> _repairDemoTranscriptScores(Session session) async {
    final demoUsers = await AppUser.db.find(
      session,
      where: (table) => table.email.inSet(
        accounts.map((account) => account.email).toSet(),
      ),
    );
    if (demoUsers.isEmpty) return;

    final demoStudents = await Student.db.find(
      session,
      where: (table) => table.userId.inSet(
        demoUsers.map((user) => user.id!).toSet(),
      ),
    );
    if (demoStudents.isEmpty) return;

    final transcripts = await StudentTranscript.db.find(
      session,
      where: (table) => table.studentId.inSet(
        demoStudents.map((student) => student.id!).toSet(),
      ),
    );
    for (final transcript in transcripts.where((item) => item.score > 4)) {
      final score = switch (transcript.letterGrade.toUpperCase()) {
        'A' => 4.0,
        'B+' => 3.5,
        'B' => 3.0,
        'C+' => 2.5,
        'C' => 2.0,
        'D+' => 1.5,
        'D' => 1.0,
        _ => 0.0,
      };
      await StudentTranscript.db.updateRow(
        session,
        transcript.copyWith(score: score, updatedAt: DateTime.now()),
      );
    }
  }
}
