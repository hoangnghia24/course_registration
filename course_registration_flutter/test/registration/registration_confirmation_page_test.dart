import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/registration/domain/repositories/course_registration_repository.dart';
import 'package:course_registration_flutter/features/registration/presentation/pages/registration_confirmation_page.dart';
import 'package:course_registration_flutter/features/registration/presentation/providers/course_registration_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('registration screen confirms an eligible course', (
    tester,
  ) async {
    final repository = _FakeRegistrationRepository();
    final courseClass = _courseClass();
    final eligibility = EligibilityResultDto(
      eligible: true,
      prerequisitePassed: true,
      scheduleAvailable: true,
      withinCreditLimit: true,
      inTrainingProgram: true,
      equivalentAvailable: true,
      capacityAvailable: true,
      currentCredits: 12,
      projectedCredits: 15,
      minimumCredits: 10,
      maximumCredits: 25,
      messages: const [],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          courseRegistrationRepositoryProvider.overrideWithValue(repository),
          eligibilityProvider(
            courseClass.courseClassId,
          ).overrideWith((ref) async => eligibility),
          registrationPeriodProvider.overrideWith(
            (ref) async => RegistrationPeriodDto(
              semesterId: courseClass.semesterId,
              semesterName: 'Học kỳ 1',
              academicYear: 2026,
              startTime: DateTime.utc(2020),
              endTime: DateTime.utc(2030),
              lecturerStartTime: DateTime.utc(2020),
              lecturerEndTime: DateTime.utc(2030),
              status: RegistrationPeriodStatus.active,
              configured: true,
              isOpen: true,
              isLecturerOpen: true,
            ),
          ),
        ],
        child: MaterialApp(
          home: RegistrationConfirmationPage(courseClass: courseClass),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Đủ điều kiện tiên quyết'), findsOneWidget);
    expect(find.text('Không trùng lịch'), findsOneWidget);
    final scheduleRow = find.ancestor(
      of: find.text('Không trùng lịch'),
      matching: find.byType(ListTile),
    );
    expect(
      find.descendant(
        of: scheduleRow,
        matching: find.byIcon(Icons.check_circle),
      ),
      findsOneWidget,
    );
    expect(
      tester
          .widget<Icon>(
            find.descendant(of: scheduleRow, matching: find.byType(Icon)),
          )
          .color,
      Colors.green,
    );
    expect(find.text('Còn chỗ'), findsOneWidget);
    await tester.tap(find.byKey(const Key('confirm-registration')));
    await tester.pumpAndSettle();
    expect(repository.registerCalls, 1);
  });

  testWidgets('conflicting schedule shows a red X and disables confirmation', (
    tester,
  ) async {
    final courseClass = _courseClass();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          eligibilityProvider(courseClass.courseClassId).overrideWith(
            (ref) async => EligibilityResultDto(
              eligible: false,
              prerequisitePassed: true,
              scheduleAvailable: false,
              withinCreditLimit: true,
              inTrainingProgram: true,
              equivalentAvailable: true,
              capacityAvailable: true,
              currentCredits: 12,
              projectedCredits: 15,
              minimumCredits: 10,
              maximumCredits: 25,
              messages: const ['Trùng lịch'],
            ),
          ),
          registrationPeriodProvider.overrideWith(
            (ref) async => RegistrationPeriodDto(
              semesterId: courseClass.semesterId,
              semesterName: 'Học kỳ 1',
              academicYear: 2026,
              startTime: DateTime.utc(2020),
              endTime: DateTime.utc(2030),
              lecturerStartTime: DateTime.utc(2020),
              lecturerEndTime: DateTime.utc(2030),
              status: RegistrationPeriodStatus.active,
              configured: true,
              isOpen: true,
              isLecturerOpen: true,
            ),
          ),
        ],
        child: MaterialApp(
          home: RegistrationConfirmationPage(courseClass: courseClass),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final scheduleRow = find.ancestor(
      of: find.text('Không trùng lịch'),
      matching: find.byType(ListTile),
    );
    expect(
      find.descendant(of: scheduleRow, matching: find.byIcon(Icons.cancel)),
      findsOneWidget,
    );
    expect(
      tester
          .widget<Icon>(
            find.descendant(of: scheduleRow, matching: find.byType(Icon)),
          )
          .color,
      Theme.of(tester.element(scheduleRow)).colorScheme.error,
    );
    final button = tester.widget<FilledButton>(
      find.byKey(const Key('confirm-registration')),
    );
    expect(button.onPressed, isNull);
  });
}

OpenCourseClassDto _courseClass() => OpenCourseClassDto(
  courseClassId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000211',
  ),
  courseId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000212',
  ),
  semesterId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000213',
  ),
  classCode: 'IT101-01',
  courseCode: 'IT101',
  courseName: 'Lập trình cơ bản',
  credits: 3,
  lecturerName: 'Nguyễn Văn A',
  capacity: 50,
  registeredCount: 30,
  remainingSeats: 20,
  status: CourseClassStatus.open,
  inTrainingProgram: true,
  schedules: const [],
);

class _FakeRegistrationRepository implements CourseRegistrationRepository {
  int registerCalls = 0;

  @override
  Future<RegistrationResultDto> registerCourse(UuidValue courseClassId) async {
    registerCalls++;
    return RegistrationResultDto(success: true, message: 'Thành công');
  }

  @override
  Future<RegistrationResultDto> cancelCourse(UuidValue registrationId) =>
      throw UnimplementedError();
  @override
  Future<EligibilityResultDto> checkEligibility(UuidValue courseClassId) =>
      throw UnimplementedError();
  @override
  Future<void> createOpeningRequest(UuidValue courseId, String reason) =>
      throw UnimplementedError();
  @override
  Future<Semester> getCurrentSemester() => throw UnimplementedError();
  @override
  Future<RegistrationPeriodDto> getRegistrationPeriod(UuidValue semesterId) =>
      throw UnimplementedError();
  @override
  Future<List<OpenCourseClassDto>> getOpenClasses(UuidValue semesterId) =>
      throw UnimplementedError();
  @override
  Future<List<RegisteredCourseDto>> getMyCourses(UuidValue semesterId) =>
      throw UnimplementedError();
}
