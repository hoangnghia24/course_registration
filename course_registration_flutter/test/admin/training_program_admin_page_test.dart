import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/admin/presentation/pages/training_program_admin_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('program dialogs stay separated and do not overflow on phone', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final majorId = _id('401');
    final programId = _id('402');
    final major = Major(
      id: majorId,
      facultyId: _id('403'),
      name: 'Công nghệ Thông tin',
      code: 'CNTT',
    );
    final program = TrainingProgram(
      id: programId,
      majorId: majorId,
      code: 'CNTT_2027',
      name: 'Chương trình Công nghệ Thông tin khóa 2027',
      academicYear: 2027,
      totalCredits: 130,
      semesterCount: 8,
      status: TrainingProgramStatus.active,
    );
    final course = Course(
      id: _id('404'),
      courseCode: 'CNTT101',
      courseName: 'Nhập môn lập trình với tên môn học rất dài',
      credits: 3,
      courseType: CourseType.compulsory,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          majorsAdminProvider.overrideWith((ref) async => [major]),
          trainingProgramsAdminProvider.overrideWith(
            (ref) async => [program],
          ),
          courseManagementProvider.overrideWith((ref) async => [course]),
          programCoursesAdminProvider.overrideWith((ref, id) async => []),
        ],
        child: const MaterialApp(home: TrainingProgramAdminPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Sửa chương trình'));
    await tester.pumpAndSettle();

    final fields = tester
        .widgetList<TextFormField>(find.byType(TextFormField))
        .toList();
    expect(fields, hasLength(5));
    for (var index = 1; index < fields.length; index++) {
      final previous = tester.getRect(find.byWidget(fields[index - 1]));
      final current = tester.getRect(find.byWidget(fields[index]));
      expect(current.top - previous.bottom, greaterThanOrEqualTo(12));
    }
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Hủy'));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('CNTT_2027'));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView), const Offset(0, -650));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gán môn học'));
    await tester.pumpAndSettle();

    expect(find.text('Gán môn vào chương trình'), findsOneWidget);
    expect(find.textContaining('CNTT101'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

UuidValue _id(String suffix) => UuidValue.withValidation(
  '018f0000-0000-7000-8000-${suffix.padLeft(12, '0')}',
);
