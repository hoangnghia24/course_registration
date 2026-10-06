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
  }) => throw UnimplementedError();
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
  Future<AnalyticsReportDto> getReports() => throw UnimplementedError();
  @override
  Future<List<AuditLogDto>> getAuditLogs() => throw UnimplementedError();
}
