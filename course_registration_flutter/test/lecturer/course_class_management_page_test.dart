import 'package:course_registration_flutter/features/lecturer/presentation/pages/course_class_management_page.dart';
import 'package:course_registration_flutter/features/lecturer/presentation/providers/lecturer_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'lecturer_fixtures.dart';

void main() {
  testWidgets('class management displays class and actions', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
        ],
        child: const MaterialApp(home: CourseClassManagementPage()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('IT101 - Lập trình cơ bản'), findsOneWidget);
    expect(find.text('45/50 sinh viên'), findsOneWidget);
    expect(find.text('Chi tiết'), findsOneWidget);
    expect(find.text('Sửa'), findsOneWidget);
    expect(find.text('Xóa'), findsOneWidget);
  });

  testWidgets('deleting a class with students shows a clear warning', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseClassProvider.overrideWith((ref) async => [lecturerClass()]),
        ],
        child: const MaterialApp(home: CourseClassManagementPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Xóa'));
    await tester.pumpAndSettle();

    expect(find.text('Không thể xóa lớp'), findsOneWidget);
    expect(find.textContaining('đang có 45 sinh viên học'), findsOneWidget);
  });
}
