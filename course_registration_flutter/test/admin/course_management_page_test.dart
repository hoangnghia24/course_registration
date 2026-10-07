import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/admin/domain/repositories/admin_repository.dart';
import 'package:course_registration_flutter/features/admin/presentation/pages/course_management_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('course credits must be between 1 and 10', (tester) async {
    final course = Course(
      id: UuidValue.withValidation('018f0000-0000-7000-8000-000000000201'),
      courseCode: 'TEST101',
      courseName: 'Môn kiểm thử',
      credits: 3,
      courseType: CourseType.compulsory,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseManagementProvider.overrideWith((ref) async => [course]),
        ],
        child: const MaterialApp(home: CourseManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Chỉnh sửa'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(1), '11');
    await tester.tap(find.text('Lưu'));
    await tester.pump();

    expect(find.text('Tín chỉ phải nằm trong khoảng 1–10'), findsOneWidget);
  });

  testWidgets('saving valid credits does not dispose controllers too early', (
    tester,
  ) async {
    final repository = _FakeAdminRepository(_course());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          adminRepositoryProvider.overrideWithValue(repository),
          courseManagementProvider.overrideWith(
            (ref) async => repository.getCourses(),
          ),
        ],
        child: const MaterialApp(home: CourseManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Chỉnh sửa'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(1), '4');
    await tester.tap(find.text('Lưu'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(repository.updateCalls, 1);
    expect(repository.course.credits, 4);
  });

  testWidgets('create course does not ask user for an ID or course code', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseManagementProvider.overrideWith((ref) async => [_course()]),
        ],
        child: const MaterialApp(home: CourseManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Tạo môn học'));
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byType(AlertDialog),
        matching: find.text('Mã môn'),
      ),
      findsNothing,
    );
    expect(
      find.descendant(
        of: find.byType(AlertDialog),
        matching: find.text('Tên môn'),
      ),
      findsOneWidget,
    );
  });
}

Course _course() => Course(
  id: UuidValue.withValidation('018f0000-0000-7000-8000-000000000201'),
  courseCode: 'TEST101',
  courseName: 'Môn kiểm thử',
  credits: 3,
  courseType: CourseType.compulsory,
);

class _FakeAdminRepository implements AdminRepository {
  _FakeAdminRepository(this.course);

  Course course;
  int updateCalls = 0;

  @override
  Future<List<Course>> getCourses() async => [course];

  @override
  Future<Course> updateCourse(Course course) async {
    updateCalls++;
    this.course = course;
    return course;
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
  ) => throw UnimplementedError();
  @override
  Future<bool> disableUser(UuidValue userId) => throw UnimplementedError();
  @override
  Future<bool> enableUser(UuidValue userId) => throw UnimplementedError();
  @override
  Future<Course> createCourse(
    String name,
    int credits,
    CourseType type,
  ) => throw UnimplementedError();
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
  }) => throw UnimplementedError();
  @override
  Future<AnalyticsReportDto> getReports() => throw UnimplementedError();
  @override
  Future<List<AuditLogDto>> getAuditLogs() => throw UnimplementedError();
}
