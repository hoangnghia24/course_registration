import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/student/presentation/pages/student_profile_page.dart';
import 'package:course_registration_flutter/features/student/presentation/providers/student_providers.dart';
import 'package:course_registration_flutter/features/authentication/domain/repositories/auth_repository.dart';
import 'package:course_registration_flutter/features/authentication/presentation/controllers/auth_state_controller.dart';
import 'package:course_registration_flutter/shared/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('profile screen displays student academic information', (
    tester,
  ) async {
    final profile = StudentProfileDto(
      studentId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000001',
      ),
      fullName: 'Nguyễn Văn An',
      email: 'an@example.edu',
      studentCode: 'SV001',
      majorName: 'Kỹ thuật phần mềm',
      facultyName: 'Công nghệ thông tin',
      trainingProgramName: 'KTPM 2025',
      academicYear: 2025,
      enrollmentYear: 2025,
      currentSemester: 2,
      gpa: 3.45,
      totalCredits: 42,
      programTotalCredits: 130,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          studentProfileProvider.overrideWith((ref) async => profile),
        ],
        child: const MaterialApp(home: StudentProfilePage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Nguyễn Văn An'), findsOneWidget);
    expect(find.text('SV001'), findsOneWidget);
    expect(find.text('Kỹ thuật phần mềm'), findsOneWidget);
    expect(find.text('Công nghệ thông tin'), findsOneWidget);
  });

  testWidgets('edits and trims name, then reloads profile', (tester) async {
    final auth = _FakeAuthController();
    var currentName = 'Nguyễn Văn An';
    auth.onSave = (name) => currentName = name;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authStateControllerProvider.overrideWithValue(auth),
          studentProfileProvider.overrideWith(
            (ref) async => _profile()..fullName = currentName,
          ),
        ],
        child: const MaterialApp(home: StudentProfilePage()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sửa họ tên'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('student-name-input')),
      '  Trần Thị Ánh  ',
    );
    await tester.tap(find.text('Lưu'));
    await tester.pumpAndSettle();
    expect(auth.savedName, 'Trần Thị Ánh');
    expect(find.text('Trần Thị Ánh'), findsOneWidget);
    expect(find.text('Đã cập nhật họ tên.'), findsOneWidget);
  });

  testWidgets('rejects blank name before request', (tester) async {
    final auth = _FakeAuthController();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authStateControllerProvider.overrideWithValue(auth),
          studentProfileProvider.overrideWith((ref) async => _profile()),
        ],
        child: const MaterialApp(home: StudentProfilePage()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sửa họ tên'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('student-name-input')), '   ');
    await tester.tap(find.text('Lưu'));
    await tester.pumpAndSettle();
    expect(find.text('Vui lòng nhập họ tên'), findsOneWidget);
    expect(auth.savedName, isNull);
  });

  testWidgets('reports network failure without changing displayed name', (
    tester,
  ) async {
    final auth = _FakeAuthController()..fail = true;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authStateControllerProvider.overrideWithValue(auth),
          studentProfileProvider.overrideWith((ref) async => _profile()),
        ],
        child: const MaterialApp(home: StudentProfilePage()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sửa họ tên'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('student-name-input')),
      'Tên mới',
    );
    await tester.tap(find.text('Lưu'));
    await tester.pumpAndSettle();
    expect(find.text('Nguyễn Văn An'), findsOneWidget);
    expect(
      find.text('Không thể cập nhật họ tên. Vui lòng thử lại.'),
      findsOneWidget,
    );
  });
}

StudentProfileDto _profile() => StudentProfileDto(
  studentId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000001',
  ),
  fullName: 'Nguyễn Văn An',
  email: 'an@example.edu',
  studentCode: 'SV001',
  majorName: 'Kỹ thuật phần mềm',
  facultyName: 'Công nghệ thông tin',
  trainingProgramName: 'KTPM 2025',
  academicYear: 2025,
  enrollmentYear: 2025,
  currentSemester: 2,
  gpa: 3.45,
  totalCredits: 42,
  programTotalCredits: 130,
);

class _FakeAuthController extends AuthStateController {
  _FakeAuthController() : super(_UnusedAuthRepository());

  String? savedName;
  bool fail = false;
  void Function(String)? onSave;

  @override
  Future<void> refreshProfile({String? fullName}) async {
    if (fail) throw Exception('Network unavailable');
    savedName = fullName;
    if (fullName != null) onSave?.call(fullName);
  }
}

class _UnusedAuthRepository implements AuthRepository {
  @override
  bool get isAuthenticated => false;
  @override
  Future<AppUser?> restore() => throw UnimplementedError();
  @override
  Future<AppUser> login(String email, String password) =>
      throw UnimplementedError();
  @override
  Future<AppUser> completeProfile({String? fullName}) =>
      throw UnimplementedError();
  @override
  Future<void> logout() => throw UnimplementedError();
}
