import 'package:course_registration_flutter/features/admin/presentation/pages/user_management_page.dart';
import 'package:course_registration_flutter/features/admin/domain/repositories/admin_repository.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'admin_fixtures.dart';

void main() {
  testWidgets('user management lists and filters users', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userManagementProvider.overrideWith(
            (ref) async => [adminStudent()],
          ),
        ],
        child: const MaterialApp(home: UserManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Admin Test Student'), findsOneWidget);
    expect(find.text('Vô hiệu hóa'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('admin-user-search')),
      'missing',
    );
    await tester.pump();
    expect(find.text('Admin Test Student'), findsNothing);
  });

  testWidgets('inactive user can be enabled again', (tester) async {
    final repository = _FakeAdminRepository();
    final user = disabledAdminStudent();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          adminRepositoryProvider.overrideWithValue(repository),
          userManagementProvider.overrideWith((ref) async => [user]),
        ],
        child: const MaterialApp(home: UserManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Kích hoạt lại'), findsOneWidget);
    await tester.tap(find.text('Kích hoạt lại'));
    await tester.pumpAndSettle();

    expect(repository.enabledUserId, user.userId);
    expect(find.text('Đã kích hoạt lại ${user.fullName}.'), findsOneWidget);
  });

  testWidgets('create form uses automatic role code and digits-only phone', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userManagementProvider.overrideWith((ref) async => const []),
          majorsAdminProvider.overrideWith((ref) async => [_major()]),
          trainingProgramsAdminProvider.overrideWith(
            (ref) async => [_program()],
          ),
        ],
        child: const MaterialApp(home: UserManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tạo tài khoản'));
    await tester.pumpAndSettle();

    expect(find.text('Mã vai trò'), findsNothing);
    expect(find.text('Vai trò'), findsOneWidget);
    expect(find.text('Số điện thoại'), findsOneWidget);

    final phoneField = find.byKey(const Key('admin-user-phone'));
    await tester.enterText(phoneField, '09abc123456');
    await tester.pump();
    final widget = tester.widget<TextFormField>(phoneField);
    expect(widget.controller!.text, '09123456');
  });

  testWidgets('creating a student submits a complete academic profile', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final repository = _FakeAdminRepository();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          adminRepositoryProvider.overrideWithValue(repository),
          userManagementProvider.overrideWith((ref) async => const []),
          majorsAdminProvider.overrideWith((ref) async => [_major()]),
          trainingProgramsAdminProvider.overrideWith(
            (ref) async => [_program()],
          ),
        ],
        child: const MaterialApp(home: UserManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Tạo tài khoản'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(0), 'new@student.edu');
    await tester.enterText(find.byType(TextFormField).at(1), 'Password123!');
    await tester.enterText(find.byType(TextFormField).at(2), 'Sinh viên mới');

    await tester.ensureVisible(find.byKey(const Key('admin-student-major')));
    await tester.tap(find.byKey(const Key('admin-student-major')));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('P8-MAJOR').last);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('admin-student-program')));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('P8-PROGRAM').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Lưu'));
    await tester.pumpAndSettle();

    expect(repository.createdRole, UserRole.student);
    expect(repository.createdMajorId, _major().id);
    expect(repository.createdProgramId, _program().id);
    expect(repository.createdAcademicYear, _program().academicYear);
    expect(tester.takeException(), isNull);
  });

  testWidgets('editing an account closes without disposed controller errors', (
    tester,
  ) async {
    final repository = _FakeAdminRepository();
    final user = adminStudent();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          adminRepositoryProvider.overrideWithValue(repository),
          userManagementProvider.overrideWith((ref) async => [user]),
        ],
        child: const MaterialApp(home: UserManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Chỉnh sửa'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(1), 'Tên đã sửa');
    await tester.tap(find.text('Lưu'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(repository.updatedUserId, user.userId);
  });
}

class _FakeAdminRepository implements AdminRepository {
  UuidValue? enabledUserId;
  UuidValue? updatedUserId;
  UserRole? createdRole;
  UuidValue? createdMajorId;
  UuidValue? createdProgramId;
  int? createdAcademicYear;

  @override
  Future<bool> enableUser(UuidValue userId) async {
    enabledUserId = userId;
    return true;
  }

  @override
  Future<List<AdminUserDto>> getUsers() => throw UnimplementedError();
  @override
  Future<AdminUserDto> createUser({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phone,
    int? academicYear,
    UuidValue? majorId,
    UuidValue? trainingProgramId,
  }) async {
    createdRole = role;
    createdMajorId = majorId;
    createdProgramId = trainingProgramId;
    createdAcademicYear = academicYear;
    return AdminUserDto(
      userId: _id('505'),
      authUserId: _id('506'),
      email: email,
      fullName: fullName,
      phone: phone,
      role: role,
      isActive: true,
      roleCode: role == UserRole.student ? 'SVTEST' : null,
    );
  }

  @override
  Future<AdminUserDto> updateUser(
    UuidValue userId,
    String fullName,
    String? phone,
  ) async {
    updatedUserId = userId;
    return adminStudent().copyWith(fullName: fullName, phone: phone);
  }

  @override
  Future<bool> disableUser(UuidValue userId) => throw UnimplementedError();
  @override
  Future<List<Course>> getCourses() => throw UnimplementedError();
  @override
  Future<Course> createCourse(
    String name,
    int credits,
    CourseType type,
  ) => throw UnimplementedError();
  @override
  Future<Course> updateCourse(Course course) => throw UnimplementedError();
  @override
  Future<bool> deleteCourse(UuidValue courseId) => throw UnimplementedError();
  @override
  Future<List<TrainingProgram>> getPrograms() => throw UnimplementedError();
  @override
  Future<List<Major>> getMajors() => throw UnimplementedError();
  @override
  Future<List<TrainingProgramCourse>> getProgramCourses(UuidValue programId) =>
      throw UnimplementedError();
  @override
  Future<TrainingProgram> createProgram({
    required UuidValue majorId,
    required String code,
    required String name,
    required int academicYear,
    required int totalCredits,
    required int semesterCount,
    required TrainingProgramStatus status,
    String? description,
  }) => throw UnimplementedError();
  @override
  Future<TrainingProgram> updateProgram(TrainingProgram program) =>
      throw UnimplementedError();
  @override
  Future<TrainingProgramCourse> setProgramCourse({
    required UuidValue programId,
    required UuidValue courseId,
    required int semesterNumber,
    required bool isRequired,
  }) => throw UnimplementedError();
  @override
  Future<List<CoursePrerequisite>> getPrerequisites() =>
      throw UnimplementedError();
  @override
  Future<List<CourseEquivalent>> getEquivalents() => throw UnimplementedError();
  @override
  Future<List<PendingClassApprovalDto>> getPendingClasses() =>
      throw UnimplementedError();
  @override
  Future<void> decideClass(UuidValue classId, bool approve, String? comment) =>
      throw UnimplementedError();
  @override
  Future<List<ClassAdjustmentRequestDto>> getAdjustmentRequests({
    ClassAdjustmentStatus? status,
  }) => throw UnimplementedError();
  @override
  Future<ClassAdjustmentRequestDto> decideAdjustmentRequest({
    required UuidValue requestId,
    required bool approve,
    String? rejectReason,
  }) => throw UnimplementedError();
  @override
  Future<List<RegistrationPeriodDto>> getRegistrationPeriods() =>
      throw UnimplementedError();
  @override
  Future<RegistrationPeriodDto> updateRegistrationPeriod({
    required UuidValue semesterId,
    required DateTime startTime,
    required DateTime endTime,
    required DateTime lecturerStartTime,
    required DateTime lecturerEndTime,
    required RegistrationPeriodStatus status,
  }) => throw UnimplementedError();
  @override
  Future<AnalyticsReportDto> getReports() => throw UnimplementedError();
  @override
  Future<List<AuditLogDto>> getAuditLogs() => throw UnimplementedError();
}

Major _major() => Major(
  id: _id('501'),
  facultyId: _id('502'),
  name: 'Công nghệ Thông tin',
  code: 'P8-MAJOR',
);

TrainingProgram _program() => TrainingProgram(
  id: _id('503'),
  majorId: _major().id!,
  code: 'P8-PROGRAM',
  name: 'Chương trình CNTT',
  academicYear: 2026,
  totalCredits: 130,
  semesterCount: 8,
  status: TrainingProgramStatus.active,
);

UuidValue _id(String suffix) => UuidValue.withValidation(
  '018f0000-0000-7000-8000-${suffix.padLeft(12, '0')}',
);
