import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/pages/class_student_list_page.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/providers/lecturer_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'lecturer_fixtures.dart';

void main() {
  testWidgets('student list displays registered student details', (
    tester,
  ) async {
    final student = ClassStudentDto(
      studentId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000405',
      ),
      studentCode: 'SV001',
      fullName: 'Trần Văn An',
      majorName: 'Kỹ thuật phần mềm',
      email: 'an@example.edu',
      registrationStatus: RegistrationStatus.registered,
    );
    final courseClass = lecturerClass();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          studentListProvider(
            courseClass.courseClassId,
          ).overrideWith((ref) async => [student]),
        ],
        child: MaterialApp(
          home: ClassStudentListPage(courseClass: courseClass),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('SV001'), findsOneWidget);
    expect(find.text('Trần Văn An'), findsOneWidget);
    expect(find.text('Kỹ thuật phần mềm'), findsOneWidget);
    expect(find.text('an@example.edu'), findsOneWidget);
  });
}
