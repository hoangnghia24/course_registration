import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../constants/app_constants.dart';

part 'app_database.g.dart';

class UsersLocal extends Table {
  TextColumn get id => text()();
  TextColumn get authUserId => text().unique()();
  TextColumn get email => text()();
  TextColumn get fullName => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get avatar => text().nullable()();
  TextColumn get role => text()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SessionsLocal extends Table {
  TextColumn get authUserId => text()();
  TextColumn get email => text()();
  TextColumn get role => text()();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {authUserId};
}

class SyncQueue extends Table {
  TextColumn get id => text()();
  TextColumn get action => text()();
  TextColumn get entity => text()();
  TextColumn get entityId => text().nullable()();
  TextColumn get operationType =>
      text().withDefault(const Constant('CREATE'))();
  TextColumn get data => text()();
  TextColumn get status => text().withDefault(const Constant('PENDING'))();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
  TextColumn get errorCode => text().nullable()();
  DateTimeColumn get nextRetryAt => dateTime().nullable()();
  TextColumn get clientId => text().withDefault(const Constant('legacy'))();
  TextColumn get userId => text().withDefault(const Constant(''))();
  IntColumn get baseVersion => integer().nullable()();
  IntColumn get serverVersion => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class PendingRegistrationLocal extends Table {
  TextColumn get id => text()();
  TextColumn get operationId => text().unique()();
  TextColumn get courseClassId => text()();
  TextColumn get registrationId => text().nullable()();
  TextColumn get action => text()();
  TextColumn get status => text()();
  TextColumn get payload => text()();
  TextColumn get errorCode => text().nullable()();
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SyncMetadata extends Table {
  TextColumn get userId => text()();
  DateTimeColumn get lastSyncAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {userId};
}

mixin CacheMetadata on Table {
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();
}

class StudentProfileCache extends Table with CacheMetadata {
  TextColumn get studentId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {studentId};
}

class TrainingProgramCache extends Table with CacheMetadata {
  TextColumn get studentId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {studentId};
}

class TranscriptCache extends Table with CacheMetadata {
  TextColumn get studentId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {studentId};
}

class OpenClassesCache extends Table with CacheMetadata {
  TextColumn get semesterId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {semesterId};
}

class RegisteredCoursesCache extends Table with CacheMetadata {
  TextColumn get semesterId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {semesterId};
}

class CurrentSemesterCache extends Table with CacheMetadata {
  TextColumn get cacheKey => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {cacheKey};
}

class CourseOpeningRequestsCache extends Table with CacheMetadata {
  TextColumn get cacheKey => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {cacheKey};
}

class LecturerProfileCache extends Table with CacheMetadata {
  TextColumn get lecturerId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {lecturerId};
}

class MyClassesCache extends Table with CacheMetadata {
  TextColumn get lecturerId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {lecturerId};
}

class ScheduleCache extends Table with CacheMetadata {
  TextColumn get lecturerId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {lecturerId};
}

class StudentListCache extends Table with CacheMetadata {
  TextColumn get courseClassId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {courseClassId};
}

class AdminDashboardCache extends Table with CacheMetadata {
  TextColumn get cacheKey => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {cacheKey};
}

class CourseCache extends Table with CacheMetadata {
  TextColumn get cacheKey => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {cacheKey};
}

class ReportCache extends Table with CacheMetadata {
  TextColumn get cacheKey => text()();
  TextColumn get payload => text()();
  DateTimeColumn get syncedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {cacheKey};
}

@DriftDatabase(
  tables: [
    UsersLocal,
    SessionsLocal,
    SyncQueue,
    PendingRegistrationLocal,
    SyncMetadata,
    StudentProfileCache,
    TrainingProgramCache,
    TranscriptCache,
    OpenClassesCache,
    RegisteredCoursesCache,
    CurrentSemesterCache,
    CourseOpeningRequestsCache,
    LecturerProfileCache,
    MyClassesCache,
    ScheduleCache,
    StudentListCache,
    AdminDashboardCache,
    CourseCache,
    ReportCache,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
    : super(
        driftDatabase(
          name: AppConstants.databaseName,
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.js'),
          ),
        ),
      );
  AppDatabase.forTesting(super.executor);
  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(studentProfileCache);
        await migrator.createTable(trainingProgramCache);
        await migrator.createTable(transcriptCache);
      }
      if (from < 3) {
        await migrator.createTable(openClassesCache);
        await migrator.createTable(registeredCoursesCache);
        await migrator.createTable(currentSemesterCache);
      }
      if (from < 4) {
        await migrator.createTable(lecturerProfileCache);
        await migrator.createTable(myClassesCache);
        await migrator.createTable(scheduleCache);
        await migrator.createTable(studentListCache);
      }
      if (from < 5) {
        await migrator.createTable(adminDashboardCache);
        await migrator.createTable(courseCache);
        await migrator.createTable(reportCache);
      }
      if (from < 6) {
        await migrator.addColumn(syncQueue, syncQueue.entityId);
        await migrator.addColumn(syncQueue, syncQueue.operationType);
        await migrator.addColumn(syncQueue, syncQueue.lastError);
        await migrator.addColumn(syncQueue, syncQueue.errorCode);
        await migrator.addColumn(syncQueue, syncQueue.nextRetryAt);
        await migrator.addColumn(syncQueue, syncQueue.clientId);
        await migrator.addColumn(syncQueue, syncQueue.userId);
        await migrator.addColumn(syncQueue, syncQueue.baseVersion);
        await migrator.addColumn(syncQueue, syncQueue.serverVersion);
        await migrator.addColumn(syncQueue, syncQueue.updatedAt);
        await migrator.createTable(pendingRegistrationLocal);
        await migrator.createTable(syncMetadata);
        await migrator.createTable(courseOpeningRequestsCache);
        await migrator.addColumn(
          studentProfileCache,
          studentProfileCache.serverUpdatedAt,
        );
        await migrator.addColumn(
          studentProfileCache,
          studentProfileCache.version,
        );
        await migrator.addColumn(
          trainingProgramCache,
          trainingProgramCache.serverUpdatedAt,
        );
        await migrator.addColumn(
          trainingProgramCache,
          trainingProgramCache.version,
        );
        await migrator.addColumn(
          transcriptCache,
          transcriptCache.serverUpdatedAt,
        );
        await migrator.addColumn(transcriptCache, transcriptCache.version);
        await migrator.addColumn(
          openClassesCache,
          openClassesCache.serverUpdatedAt,
        );
        await migrator.addColumn(openClassesCache, openClassesCache.version);
        await migrator.addColumn(
          registeredCoursesCache,
          registeredCoursesCache.serverUpdatedAt,
        );
        await migrator.addColumn(
          registeredCoursesCache,
          registeredCoursesCache.version,
        );
        await migrator.addColumn(
          currentSemesterCache,
          currentSemesterCache.serverUpdatedAt,
        );
        await migrator.addColumn(
          currentSemesterCache,
          currentSemesterCache.version,
        );
        await migrator.addColumn(
          lecturerProfileCache,
          lecturerProfileCache.serverUpdatedAt,
        );
        await migrator.addColumn(
          lecturerProfileCache,
          lecturerProfileCache.version,
        );
        await migrator.addColumn(
          myClassesCache,
          myClassesCache.serverUpdatedAt,
        );
        await migrator.addColumn(myClassesCache, myClassesCache.version);
        await migrator.addColumn(scheduleCache, scheduleCache.serverUpdatedAt);
        await migrator.addColumn(scheduleCache, scheduleCache.version);
        await migrator.addColumn(
          studentListCache,
          studentListCache.serverUpdatedAt,
        );
        await migrator.addColumn(studentListCache, studentListCache.version);
        await migrator.addColumn(
          adminDashboardCache,
          adminDashboardCache.serverUpdatedAt,
        );
        await migrator.addColumn(
          adminDashboardCache,
          adminDashboardCache.version,
        );
        await migrator.addColumn(courseCache, courseCache.serverUpdatedAt);
        await migrator.addColumn(courseCache, courseCache.version);
        await migrator.addColumn(reportCache, reportCache.serverUpdatedAt);
        await migrator.addColumn(reportCache, reportCache.version);
        await customStatement(
          "UPDATE sync_queue SET status = upper(status);",
        );
        await customStatement(
          "UPDATE sync_queue SET status = 'SYNCED' WHERE status = 'COMPLETED';",
        );
      }
    },
  );

  Future<void> cacheUser({
    required String id,
    required String authUserId,
    required String email,
    required String fullName,
    required String role,
    String? phone,
    String? avatar,
  }) => into(usersLocal).insertOnConflictUpdate(
    UsersLocalCompanion.insert(
      id: id,
      authUserId: authUserId,
      email: email,
      fullName: fullName,
      role: role,
      phone: Value(phone),
      avatar: Value(avatar),
      updatedAt: DateTime.now().toUtc(),
    ),
  );

  Future<List<SyncQueueData>> pendingOperations() =>
      (select(syncQueue)
            ..where(
              (row) =>
                  row.status.equals('PENDING') |
                  row.status.equals('AUTH_REQUIRED'),
            )
            ..orderBy([(row) => OrderingTerm.asc(row.createdAt)]))
          .get();

  Future<void> cacheSession({
    required String authUserId,
    required String email,
    required String role,
    DateTime? expiresAt,
  }) => into(sessionsLocal).insertOnConflictUpdate(
    SessionsLocalCompanion.insert(
      authUserId: authUserId,
      email: email,
      role: role,
      expiresAt: Value(expiresAt),
      updatedAt: DateTime.now().toUtc(),
    ),
  );

  Future<void> enqueueOperation({
    required String id,
    required String action,
    required String entity,
    required String data,
    String? entityId,
    String operationType = 'CREATE',
    String clientId = 'unknown',
    String userId = '',
    int? baseVersion,
  }) => into(syncQueue).insert(
    SyncQueueCompanion.insert(
      id: id,
      action: action,
      entity: entity,
      entityId: Value(entityId),
      operationType: Value(operationType),
      data: data,
      clientId: Value(clientId),
      userId: Value(userId),
      baseVersion: Value(baseVersion),
      createdAt: DateTime.now().toUtc(),
      updatedAt: Value(DateTime.now().toUtc()),
    ),
  );

  Stream<List<SyncQueueData>> watchOperations() => (select(
    syncQueue,
  )..orderBy([(row) => OrderingTerm.desc(row.createdAt)])).watch();

  Future<SyncQueueData?> operationById(String id) => (select(
    syncQueue,
  )..where((row) => row.id.equals(id))).getSingleOrNull();

  Future<void> recoverInterruptedOperations() =>
      (update(syncQueue)..where((row) => row.status.equals('SYNCING'))).write(
        SyncQueueCompanion(
          status: const Value('PENDING'),
          updatedAt: Value(DateTime.now().toUtc()),
        ),
      );

  Future<void> markOperationSyncing(String id) =>
      (update(syncQueue)..where((row) => row.id.equals(id))).write(
        SyncQueueCompanion(
          status: const Value('SYNCING'),
          updatedAt: Value(DateTime.now().toUtc()),
        ),
      );

  Future<void> updateOperationResult({
    required String id,
    required String status,
    String? errorCode,
    String? errorMessage,
    int? serverVersion,
    DateTime? nextRetryAt,
    bool incrementRetry = false,
  }) async {
    final operation = await (select(
      syncQueue,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
    if (operation == null) return;
    await (update(syncQueue)..where((row) => row.id.equals(id))).write(
      SyncQueueCompanion(
        status: Value(status),
        attemptCount: Value(
          operation.attemptCount + (incrementRetry ? 1 : 0),
        ),
        errorCode: Value(errorCode),
        lastError: Value(errorMessage),
        serverVersion: Value(serverVersion),
        nextRetryAt: Value(nextRetryAt),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
    await (update(
      pendingRegistrationLocal,
    )..where((row) => row.operationId.equals(id))).write(
      PendingRegistrationLocalCompanion(
        status: Value(status),
        errorCode: Value(errorCode),
        errorMessage: Value(errorMessage),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  Future<void> savePendingRegistration({
    required String operationId,
    required String courseClassId,
    required String action,
    required String payload,
    String? registrationId,
  }) => into(pendingRegistrationLocal).insertOnConflictUpdate(
    PendingRegistrationLocalCompanion.insert(
      id: operationId,
      operationId: operationId,
      courseClassId: courseClassId,
      registrationId: Value(registrationId),
      action: action,
      status: 'PENDING',
      payload: payload,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    ),
  );

  Stream<List<PendingRegistrationLocalData>> watchPendingRegistrations() =>
      (select(pendingRegistrationLocal)
            ..where((row) => row.status.isNotIn(['SYNCED', 'CANCELLED']))
            ..orderBy([(row) => OrderingTerm.desc(row.createdAt)]))
          .watch();

  Future<DateTime?> lastSyncAt(String userId) async => (await (select(
    syncMetadata,
  )..where((row) => row.userId.equals(userId))).getSingleOrNull())?.lastSyncAt;

  Future<void> setLastSyncAt(String userId, DateTime timestamp) =>
      into(syncMetadata).insertOnConflictUpdate(
        SyncMetadataCompanion.insert(
          userId: userId,
          lastSyncAt: Value(timestamp),
          updatedAt: DateTime.now().toUtc(),
        ),
      );

  Future<void> applyPullChanges(
    String userId,
    DateTime serverTimestamp,
    Future<void> Function() apply,
  ) => transaction(() async {
    await apply();
    await setLastSyncAt(userId, serverTimestamp);
  });

  Future<void> cacheStudentProfile(String studentId, String payload) =>
      into(studentProfileCache).insertOnConflictUpdate(
        StudentProfileCacheCompanion.insert(
          studentId: studentId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<StudentProfileCacheData?> latestStudentProfile() =>
      (select(studentProfileCache)
            ..orderBy([(row) => OrderingTerm.desc(row.syncedAt)])
            ..limit(1))
          .getSingleOrNull();

  Future<void> cacheTrainingProgram(String studentId, String payload) =>
      into(trainingProgramCache).insertOnConflictUpdate(
        TrainingProgramCacheCompanion.insert(
          studentId: studentId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<TrainingProgramCacheData?> readTrainingProgram(String studentId) =>
      (select(
        trainingProgramCache,
      )..where((row) => row.studentId.equals(studentId))).getSingleOrNull();

  Future<void> cacheTranscript(String studentId, String payload) =>
      into(transcriptCache).insertOnConflictUpdate(
        TranscriptCacheCompanion.insert(
          studentId: studentId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<TranscriptCacheData?> readTranscript(String studentId) => (select(
    transcriptCache,
  )..where((row) => row.studentId.equals(studentId))).getSingleOrNull();

  Future<void> cacheOpenClasses(String semesterId, String payload) =>
      into(openClassesCache).insertOnConflictUpdate(
        OpenClassesCacheCompanion.insert(
          semesterId: semesterId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<OpenClassesCacheData?> readOpenClasses(String semesterId) => (select(
    openClassesCache,
  )..where((row) => row.semesterId.equals(semesterId))).getSingleOrNull();

  Future<void> cacheRegisteredCourses(String semesterId, String payload) =>
      into(registeredCoursesCache).insertOnConflictUpdate(
        RegisteredCoursesCacheCompanion.insert(
          semesterId: semesterId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<RegisteredCoursesCacheData?> readRegisteredCourses(
    String semesterId,
  ) => (select(
    registeredCoursesCache,
  )..where((row) => row.semesterId.equals(semesterId))).getSingleOrNull();

  Future<void> cacheCurrentSemester(String payload) =>
      into(currentSemesterCache).insertOnConflictUpdate(
        CurrentSemesterCacheCompanion.insert(
          cacheKey: 'current',
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<CurrentSemesterCacheData?> readCurrentSemester() => (select(
    currentSemesterCache,
  )..where((row) => row.cacheKey.equals('current'))).getSingleOrNull();

  Future<void> cacheLecturerProfile(String lecturerId, String payload) =>
      into(lecturerProfileCache).insertOnConflictUpdate(
        LecturerProfileCacheCompanion.insert(
          lecturerId: lecturerId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<LecturerProfileCacheData?> latestLecturerProfile() =>
      (select(lecturerProfileCache)
            ..orderBy([(row) => OrderingTerm.desc(row.syncedAt)])
            ..limit(1))
          .getSingleOrNull();

  Future<void> cacheMyClasses(String lecturerId, String payload) =>
      into(myClassesCache).insertOnConflictUpdate(
        MyClassesCacheCompanion.insert(
          lecturerId: lecturerId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<MyClassesCacheData?> readMyClasses(String lecturerId) => (select(
    myClassesCache,
  )..where((row) => row.lecturerId.equals(lecturerId))).getSingleOrNull();

  Future<void> cacheLecturerSchedule(String lecturerId, String payload) =>
      into(scheduleCache).insertOnConflictUpdate(
        ScheduleCacheCompanion.insert(
          lecturerId: lecturerId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<ScheduleCacheData?> readLecturerSchedule(String lecturerId) => (select(
    scheduleCache,
  )..where((row) => row.lecturerId.equals(lecturerId))).getSingleOrNull();

  Future<void> cacheStudentList(String courseClassId, String payload) =>
      into(studentListCache).insertOnConflictUpdate(
        StudentListCacheCompanion.insert(
          courseClassId: courseClassId,
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<StudentListCacheData?> readStudentList(String courseClassId) =>
      (select(studentListCache)
            ..where((row) => row.courseClassId.equals(courseClassId)))
          .getSingleOrNull();

  Future<void> cacheAdminDashboard(String payload) =>
      into(adminDashboardCache).insertOnConflictUpdate(
        AdminDashboardCacheCompanion.insert(
          cacheKey: 'dashboard',
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<AdminDashboardCacheData?> readAdminDashboard() => (select(
    adminDashboardCache,
  )..where((row) => row.cacheKey.equals('dashboard'))).getSingleOrNull();

  Future<void> cacheAdminCourses(String payload) =>
      into(courseCache).insertOnConflictUpdate(
        CourseCacheCompanion.insert(
          cacheKey: 'courses',
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<CourseCacheData?> readAdminCourses() => (select(
    courseCache,
  )..where((row) => row.cacheKey.equals('courses'))).getSingleOrNull();

  Future<void> cacheAdminReport(String payload) =>
      into(reportCache).insertOnConflictUpdate(
        ReportCacheCompanion.insert(
          cacheKey: 'report',
          payload: payload,
          syncedAt: DateTime.now().toUtc(),
        ),
      );

  Future<ReportCacheData?> readAdminReport() => (select(
    reportCache,
  )..where((row) => row.cacheKey.equals('report'))).getSingleOrNull();

  Future<void> markOperationComplete(String id) =>
      updateOperationResult(id: id, status: 'SYNCED');

  Future<void> markOperationFailed(String id) async {
    final operation = await (select(
      syncQueue,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
    if (operation == null) return;
    await updateOperationResult(
      id: id,
      status: 'FAILED',
      incrementRetry: true,
    );
  }
}
