import 'dart:convert';

import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Sync endpoint', (sessionBuilder, endpoints) {
    test('push is idempotent and pull returns only changes', () async {
      final fixture = await _fixture(sessionBuilder, students: 1);
      final authenticated = _authenticated(
        sessionBuilder,
        fixture.authIds.single,
      );
      final operation = _registerOperation(
        '018f0000-0000-7000-8000-000000000721',
        fixture.courseClass.id!,
      );

      final first = await endpoints.sync.pushOperations(
        authenticated,
        operations: [operation],
      );
      final duplicate = await endpoints.sync.pushOperations(
        authenticated,
        operations: [operation],
      );
      final pull = await endpoints.sync.pullChanges(authenticated);

      expect(first.single.status, SyncOperationStatus.SYNCED);
      expect(duplicate.single.status, SyncOperationStatus.SYNCED);
      expect(duplicate.single.serverVersion, first.single.serverVersion);
      expect(pull.changes, hasLength(1));
      expect(pull.changes.single.entityType, 'COURSE_REGISTRATION');
      final registrations = await Registration.db.find(fixture.session);
      expect(registrations, hasLength(1));
      expect(
        (await CourseClass.db.findById(
          fixture.session,
          fixture.courseClass.id!,
        ))?.registeredCount,
        1,
      );
    });

    test('two students cannot take the same last seat', () async {
      final fixture = await _fixture(sessionBuilder, students: 2);
      final calls = <Future<List<SyncOperationResultDto>>>[];
      for (var index = 0; index < 2; index++) {
        calls.add(
          endpoints.sync.pushOperations(
            _authenticated(sessionBuilder, fixture.authIds[index]),
            operations: [
              _registerOperation(
                '018f0000-0000-7000-8000-00000000073${index + 1}',
                fixture.courseClass.id!,
              ),
            ],
          ),
        );
      }
      final results = (await Future.wait(
        calls,
      )).expand((items) => items).toList();

      expect(
        results.where((item) => item.status == SyncOperationStatus.SYNCED),
        hasLength(1),
      );
      expect(
        results
            .singleWhere((item) => item.status == SyncOperationStatus.FAILED)
            .errorCode,
        'CLASS_FULL',
      );
      final updated = await CourseClass.db.findById(
        fixture.session,
        fixture.courseClass.id!,
      );
      expect(updated?.registeredCount, 1);
      expect(updated!.registeredCount <= updated.capacity, isTrue);
    });

    test(
      'reports sync status, version conflicts, retry and incremental pull',
      () async {
        final fixture = await _fixture(sessionBuilder, students: 3);
        final authenticated = _authenticated(
          sessionBuilder,
          fixture.authIds.first,
        );
        final create = _registerOperation(
          '018f0000-0000-7000-8000-000000000741',
          fixture.courseClass.id!,
        );
        final created = (await endpoints.sync.pushOperations(
          authenticated,
          operations: [create],
        )).single;
        final registration = (await Registration.db.find(
          fixture.session,
          where: (table) =>
              table.courseClassId.equals(fixture.courseClass.id) &
              table.status.equals(RegistrationStatus.registered),
        )).single;
        final firstPull = await endpoints.sync.pullChanges(authenticated);
        final conflictId = UuidValue.withValidation(
          '018f0000-0000-7000-8000-000000000742',
        );
        final conflict = (await endpoints.sync.pushOperations(
          authenticated,
          operations: [
            SyncOperationInputDto(
              operationId: conflictId,
              entityType: 'COURSE_REGISTRATION',
              entityId: registration.id.toString(),
              operationType: 'DELETE',
              payload: jsonEncode({
                'registrationId': registration.id.toString(),
              }),
              clientId: 'integration-test',
              baseVersion: created.serverVersion! - 1,
            ),
          ],
        )).single;
        final status = await endpoints.sync.getSyncStatus(authenticated);
        final retry = await endpoints.sync.retryOperation(
          authenticated,
          operationId: conflictId,
        );
        final incremental = await endpoints.sync.pullChanges(
          authenticated,
          lastSyncAt: firstPull.serverTimestamp,
        );

        expect(conflict.status, SyncOperationStatus.CONFLICT);
        expect(conflict.errorCode, 'VERSION_CONFLICT');
        expect(status.synced, 1);
        expect(status.conflict, 1);
        expect(retry.status, SyncOperationStatus.CONFLICT);
        expect(retry.serverVersion, conflict.serverVersion);
        expect(incremental.changes, isEmpty);
        expect(
          (await Registration.db.findById(
            fixture.session,
            registration.id!,
          ))?.status,
          RegistrationStatus.registered,
        );
      },
    );
  }, rollbackDatabase: RollbackDatabase.disabled);
}

SyncOperationInputDto _registerOperation(String id, UuidValue courseClassId) =>
    SyncOperationInputDto(
      operationId: UuidValue.withValidation(id),
      entityType: 'COURSE_REGISTRATION',
      entityId: courseClassId.toString(),
      operationType: 'CREATE',
      payload: jsonEncode({'courseClassId': courseClassId.toString()}),
      clientId: 'integration-test',
    );

TestSessionBuilder _authenticated(
  TestSessionBuilder builder,
  UuidValue authUserId,
) => builder.copyWith(
  authentication: AuthenticationOverride.authenticationInfo(
    authUserId.toString(),
    {AppScopes.student},
  ),
);

class _Fixture {
  const _Fixture(this.session, this.authIds, this.courseClass);
  final Session session;
  final List<UuidValue> authIds;
  final CourseClass courseClass;
}

Future<_Fixture> _fixture(
  TestSessionBuilder builder, {
  required int students,
}) async {
  final session = builder.build();
  final faculty = await Faculty.db.insertRow(
    session,
    Faculty(name: 'Công nghệ thông tin', code: 'SYNC-CNTT-$students'),
  );
  final major = await Major.db.insertRow(
    session,
    Major(
      facultyId: faculty.id!,
      name: 'Đồng bộ',
      code: 'SYNC-MAJOR-$students',
    ),
  );
  final program = await TrainingProgram.db.insertRow(
    session,
    TrainingProgram(
      majorId: major.id!,
      name: 'Chương trình đồng bộ $students',
      academicYear: 2026,
      totalCredits: 130,
    ),
  );
  final course = await Course.db.insertRow(
    session,
    Course(
      courseCode: 'SYNC10$students',
      courseName: 'Offline First',
      credits: 3,
      courseType: CourseType.compulsory,
    ),
  );
  await TrainingProgramCourse.db.insertRow(
    session,
    TrainingProgramCourse(
      trainingProgramId: program.id!,
      courseId: course.id!,
      semesterNumber: 1,
      isRequired: true,
    ),
  );
  final lecturerUser = await AppUser.db.insertRow(
    session,
    AppUser(
      authUserId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-0000000007${students}0',
      ),
      email: 'sync-lecturer-$students@example.edu',
      fullName: 'Giảng viên Sync',
      role: UserRole.lecturer,
    ),
  );
  final lecturer = await Lecturer.db.insertRow(
    session,
    Lecturer(
      userId: lecturerUser.id!,
      lecturerCode: 'SYNC-GV-$students',
    ),
  );
  final semester = await Semester.db.insertRow(
    session,
    Semester(
      name: 'Học kỳ Sync $students',
      academicYear: 2026,
      startDate: DateTime.utc(2026, 9),
      endDate: DateTime.utc(2027, 1, 31),
      status: SemesterStatus.open,
    ),
  );
  final courseClass = await CourseClass.db.insertRow(
    session,
    CourseClass(
      courseId: course.id!,
      lecturerId: lecturer.id!,
      semesterId: semester.id!,
      classCode: 'SYNC10$students-01',
      capacity: 1,
      registeredCount: 0,
      status: CourseClassStatus.open,
    ),
  );
  final authIds = <UuidValue>[];
  for (var index = 0; index < students; index++) {
    final authId = UuidValue.withValidation(
      '018f0000-0000-7000-8000-0000000007$students${index + 1}',
    );
    authIds.add(authId);
    final user = await AppUser.db.insertRow(
      session,
      AppUser(
        authUserId: authId,
        email: 'sync-student-$students-$index@example.edu',
        fullName: 'Sinh viên Sync $index',
        role: UserRole.student,
      ),
    );
    await Student.db.insertRow(
      session,
      Student(
        userId: user.id!,
        studentCode: 'SYNC-SV-$students-$index',
        majorId: major.id,
        trainingProgramId: program.id,
        academicYear: 2026,
        enrollmentYear: 2026,
        currentSemester: 1,
      ),
    );
  }
  return _Fixture(session, authIds, courseClass);
}
