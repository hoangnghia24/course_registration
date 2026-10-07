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
    expect(find.textContaining('SV001'), findsOneWidget);
    expect(find.textContaining('Trần Văn An'), findsOneWidget);
    expect(find.textContaining('Kỹ thuật phần mềm'), findsOneWidget);
    expect(find.textContaining('an@example.edu'), findsOneWidget);
    expect(find.byTooltip('Nhập điểm'), findsOneWidget);

    await tester.tap(find.byTooltip('Nhập điểm'));
    await tester.pumpAndSettle();

    expect(find.text('Nhập điểm SV001'), findsOneWidget);
    expect(find.text('Điểm giữa kỳ'), findsOneWidget);
    expect(find.text('Điểm cuối kỳ'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Điểm giữa kỳ'),
      '11',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Điểm cuối kỳ'),
      '9',
    );
    await tester.tap(find.text('Lưu điểm'));
    await tester.pump();

    expect(find.text('Điểm phải từ 0 đến 10'), findsOneWidget);
  });

  testWidgets('student list hides internal server errors and offers retry', (
    tester,
  ) async {
    final courseClass = lecturerClass();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          studentListProvider(courseClass.courseClassId).overrideWith(
            (ref) async => throw Exception(
              'ServerpodClientInternalServerError: statusCode: 500',
            ),
          ),
        ],
        child: MaterialApp(
          home: ClassStudentListPage(courseClass: courseClass),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Đã xảy ra lỗi. Vui lòng thử lại.'), findsOneWidget);
    expect(find.text('Thử lại'), findsOneWidget);
    expect(find.textContaining('ServerpodClient'), findsNothing);
  });
}
