import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/student/presentation/pages/student_profile_page.dart';
import 'package:course_registration_flutter/features/student/presentation/providers/student_providers.dart';
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
}
