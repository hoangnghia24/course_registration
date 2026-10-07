import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/registration/presentation/pages/course_search_page.dart';
import 'package:course_registration_flutter/features/registration/domain/repositories/course_registration_repository.dart';
import 'package:course_registration_flutter/features/registration/presentation/providers/course_registration_providers.dart';
import 'package:course_registration_flutter/features/student/presentation/providers/student_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('course list displays open class information', (tester) async {
    final courseClass = _courseClass();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          availableOpenClassesProvider.overrideWith(
            (ref) async => [
              courseClass,
            ],
          ),
          registrationPeriodProvider.overrideWith(
            (ref) async => _registrationPeriod(courseClass.semesterId),
          ),
        ],
        child: const MaterialApp(home: CourseSearchPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('IT101'), findsOneWidget);
    expect(find.text('Lập trình cơ bản'), findsOneWidget);
    expect(find.text('GV Nguyễn Văn A'), findsOneWidget);
    expect(find.text('Còn 20 chỗ'), findsOneWidget);
    expect(find.text('ĐĂNG KÝ'), findsOneWidget);
  });

  test('registered classes are removed from available classes', () {
    final courseClass = _courseClass();
    final registered = RegisteredCourseDto(
      registrationId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000204',
      ),
      courseClassId: courseClass.courseClassId,
      semesterId: courseClass.semesterId,
      classCode: courseClass.classCode,
      courseCode: courseClass.courseCode,
      courseName: courseClass.courseName,
      credits: courseClass.credits,
      lecturerName: courseClass.lecturerName,
      registeredAt: DateTime.utc(2026, 10, 3),
      status: RegistrationStatus.registered,
      schedules: courseClass.schedules,
    );

    expect(filterAvailableClasses([courseClass], [registered]), isEmpty);
  });

  testWidgets('opening request closes without disposed controller errors', (
    tester,
  ) async {
    final repository = _FakeRegistrationRepository();
    final programCourse = TrainingProgramCourseDto(
      courseId: _courseClass().courseId,
      courseCode: 'IT101',
      courseName: 'Lập trình cơ bản',
      credits: 3,
      semesterNumber: 1,
      isRequired: true,
      courseType: CourseType.compulsory,
      progressStatus: CourseProgressStatus.notStarted,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          availableOpenClassesProvider.overrideWith((ref) async => const []),
          trainingProgramProvider.overrideWith((ref) async => [programCourse]),
          courseRegistrationRepositoryProvider.overrideWithValue(repository),
        ],
        child: const MaterialApp(home: CourseSearchPage()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Yêu cầu mở lớp'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('IT101 - Lập trình cơ bản'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'Cần học đúng tiến độ');
    await tester.tap(find.text('Gửi yêu cầu'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(repository.requestedCourseId, programCourse.courseId);
    expect(repository.reason, 'Cần học đúng tiến độ');
  });
}

class _FakeRegistrationRepository implements CourseRegistrationRepository {
  UuidValue? requestedCourseId;
  String? reason;

  @override
  Future<void> createOpeningRequest(UuidValue courseId, String reason) async {
    requestedCourseId = courseId;
    this.reason = reason;
  }

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
  @override
  Future<EligibilityResultDto> checkEligibility(UuidValue courseClassId) =>
      throw UnimplementedError();
  @override
  Future<RegistrationResultDto> registerCourse(UuidValue courseClassId) =>
      throw UnimplementedError();
  @override
  Future<RegistrationResultDto> cancelCourse(UuidValue registrationId) =>
      throw UnimplementedError();
}

RegistrationPeriodDto _registrationPeriod(UuidValue semesterId) =>
    RegistrationPeriodDto(
      semesterId: semesterId,
      semesterName: 'Học kỳ 1',
      academicYear: 2026,
      startTime: DateTime.utc(2020),
      endTime: DateTime.utc(2030),
      configured: true,
      isOpen: true,
    );

OpenCourseClassDto _courseClass() => OpenCourseClassDto(
  courseClassId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000201',
  ),
  courseId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000202',
  ),
  semesterId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000203',
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
  schedules: [
    ClassScheduleDto(dayOfWeek: 2, startPeriod: 1, endPeriod: 3, room: 'A101'),
  ],
);
