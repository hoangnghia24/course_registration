/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:course_registration_server/src/generated/protocol.dart'
    as _i9p8z86v;
import 'package:serverpod/serverpod.dart' as _is;
import 'app_user.dart' as _i2j2xfrn;
import 'student/models/major.dart' as _iqe9gc9z;
import 'student/models/training_program.dart' as _ige2gcz9;

abstract class Student
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Student._({
    this.id,
    required this.userId,
    this.user,
    required this.studentCode,
    this.majorId,
    this.major,
    this.trainingProgramId,
    this.trainingProgram,
    required this.academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) : enrollmentYear = enrollmentYear ?? 0,
       currentSemester = currentSemester ?? 1,
       gpa = gpa ?? 0.0,
       totalCredits = totalCredits ?? 0;

  factory Student({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String studentCode,
    _is.UuidValue? majorId,
    _iqe9gc9z.Major? major,
    _is.UuidValue? trainingProgramId,
    _ige2gcz9.TrainingProgram? trainingProgram,
    required int academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) = _StudentImpl;

  factory Student.fromJson(Map<String, dynamic> jsonSerialization) {
    return Student(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _is.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i2j2xfrn.AppUser>(
              jsonSerialization['user'],
            ),
      studentCode: jsonSerialization['studentCode'] as String,
      majorId: jsonSerialization['majorId'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['majorId']),
      major: jsonSerialization['major'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_iqe9gc9z.Major>(
              jsonSerialization['major'],
            ),
      trainingProgramId: jsonSerialization['trainingProgramId'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['trainingProgramId'],
            ),
      trainingProgram: jsonSerialization['trainingProgram'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ige2gcz9.TrainingProgram>(
              jsonSerialization['trainingProgram'],
            ),
      academicYear: jsonSerialization['academicYear'] as int,
      enrollmentYear: jsonSerialization['enrollmentYear'] as int?,
      currentSemester: jsonSerialization['currentSemester'] as int?,
      gpa: (jsonSerialization['gpa'] as num?)?.toDouble(),
      totalCredits: jsonSerialization['totalCredits'] as int?,
    );
  }

  static final t = StudentTable();

  static const db = StudentRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue userId;

  _i2j2xfrn.AppUser? user;

  String studentCode;

  _is.UuidValue? majorId;

  _iqe9gc9z.Major? major;

  _is.UuidValue? trainingProgramId;

  _ige2gcz9.TrainingProgram? trainingProgram;

  int academicYear;

  int enrollmentYear;

  int currentSemester;

  double gpa;

  int totalCredits;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Student copyWith({
    _is.UuidValue? id,
    _is.UuidValue? userId,
    _i2j2xfrn.AppUser? user,
    String? studentCode,
    _is.UuidValue? majorId,
    _iqe9gc9z.Major? major,
    _is.UuidValue? trainingProgramId,
    _ige2gcz9.TrainingProgram? trainingProgram,
    int? academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Student',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'studentCode': studentCode,
      if (majorId != null) 'majorId': majorId?.toJson(),
      if (major != null) 'major': major?.toJson(),
      if (trainingProgramId != null)
        'trainingProgramId': trainingProgramId?.toJson(),
      if (trainingProgram != null) 'trainingProgram': trainingProgram?.toJson(),
      'academicYear': academicYear,
      'enrollmentYear': enrollmentYear,
      'currentSemester': currentSemester,
      'gpa': gpa,
      'totalCredits': totalCredits,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Student',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'studentCode': studentCode,
      if (majorId != null) 'majorId': majorId?.toJson(),
      if (major != null) 'major': major?.toJsonForProtocol(),
      if (trainingProgramId != null)
        'trainingProgramId': trainingProgramId?.toJson(),
      if (trainingProgram != null)
        'trainingProgram': trainingProgram?.toJsonForProtocol(),
      'academicYear': academicYear,
      'enrollmentYear': enrollmentYear,
      'currentSemester': currentSemester,
      'gpa': gpa,
      'totalCredits': totalCredits,
    };
  }

  static StudentInclude include({
    _i2j2xfrn.AppUserInclude? user,
    _iqe9gc9z.MajorInclude? major,
    _ige2gcz9.TrainingProgramInclude? trainingProgram,
  }) {
    return StudentInclude._(
      user: user,
      major: major,
      trainingProgram: trainingProgram,
    );
  }

  static StudentIncludeList includeList({
    _is.WhereExpressionBuilder<StudentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudentTable>? orderBy,
    _is.OrderByListBuilder<StudentTable>? orderByList,
    StudentInclude? include,
  }) {
    return StudentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudentImpl extends Student {
  _StudentImpl({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String studentCode,
    _is.UuidValue? majorId,
    _iqe9gc9z.Major? major,
    _is.UuidValue? trainingProgramId,
    _ige2gcz9.TrainingProgram? trainingProgram,
    required int academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         studentCode: studentCode,
         majorId: majorId,
         major: major,
         trainingProgramId: trainingProgramId,
         trainingProgram: trainingProgram,
         academicYear: academicYear,
         enrollmentYear: enrollmentYear,
         currentSemester: currentSemester,
         gpa: gpa,
         totalCredits: totalCredits,
       );

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Student copyWith({
    Object? id = _Undefined,
    _is.UuidValue? userId,
    Object? user = _Undefined,
    String? studentCode,
    Object? majorId = _Undefined,
    Object? major = _Undefined,
    Object? trainingProgramId = _Undefined,
    Object? trainingProgram = _Undefined,
    int? academicYear,
    int? enrollmentYear,
    int? currentSemester,
    double? gpa,
    int? totalCredits,
  }) {
    return Student(
      id: id is _is.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2j2xfrn.AppUser? ? user : this.user?.copyWith(),
      studentCode: studentCode ?? this.studentCode,
      majorId: majorId is _is.UuidValue? ? majorId : this.majorId,
      major: major is _iqe9gc9z.Major? ? major : this.major?.copyWith(),
      trainingProgramId: trainingProgramId is _is.UuidValue?
          ? trainingProgramId
          : this.trainingProgramId,
      trainingProgram: trainingProgram is _ige2gcz9.TrainingProgram?
          ? trainingProgram
          : this.trainingProgram?.copyWith(),
      academicYear: academicYear ?? this.academicYear,
      enrollmentYear: enrollmentYear ?? this.enrollmentYear,
      currentSemester: currentSemester ?? this.currentSemester,
      gpa: gpa ?? this.gpa,
      totalCredits: totalCredits ?? this.totalCredits,
    );
  }
}

class StudentUpdateTable extends _is.UpdateTable<StudentTable> {
  StudentUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> userId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> studentCode(String value) => _is.ColumnValue(
    table.studentCode,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> majorId(_is.UuidValue? value) =>
      _is.ColumnValue(
        table.majorId,
        value,
      );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> trainingProgramId(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.trainingProgramId,
    value,
  );

  _is.ColumnValue<int, int> academicYear(int value) => _is.ColumnValue(
    table.academicYear,
    value,
  );

  _is.ColumnValue<int, int> enrollmentYear(int value) => _is.ColumnValue(
    table.enrollmentYear,
    value,
  );

  _is.ColumnValue<int, int> currentSemester(int value) => _is.ColumnValue(
    table.currentSemester,
    value,
  );

  _is.ColumnValue<double, double> gpa(double value) => _is.ColumnValue(
    table.gpa,
    value,
  );

  _is.ColumnValue<int, int> totalCredits(int value) => _is.ColumnValue(
    table.totalCredits,
    value,
  );
}

class StudentTable extends _is.Table<_is.UuidValue?> {
  StudentTable({super.tableRelation}) : super(tableName: 'students') {
    updateTable = StudentUpdateTable(this);
    userId = _is.ColumnUuid(
      'userId',
      this,
    );
    studentCode = _is.ColumnString(
      'studentCode',
      this,
    );
    majorId = _is.ColumnUuid(
      'majorId',
      this,
    );
    trainingProgramId = _is.ColumnUuid(
      'trainingProgramId',
      this,
    );
    academicYear = _is.ColumnInt(
      'academicYear',
      this,
    );
    enrollmentYear = _is.ColumnInt(
      'enrollmentYear',
      this,
      hasDefault: true,
    );
    currentSemester = _is.ColumnInt(
      'currentSemester',
      this,
      hasDefault: true,
    );
    gpa = _is.ColumnDouble(
      'gpa',
      this,
    );
    totalCredits = _is.ColumnInt(
      'totalCredits',
      this,
    );
  }

  late final StudentUpdateTable updateTable;

  late final _is.ColumnUuid userId;

  _i2j2xfrn.AppUserTable? _user;

  late final _is.ColumnString studentCode;

  late final _is.ColumnUuid majorId;

  _iqe9gc9z.MajorTable? _major;

  late final _is.ColumnUuid trainingProgramId;

  _ige2gcz9.TrainingProgramTable? _trainingProgram;

  late final _is.ColumnInt academicYear;

  late final _is.ColumnInt enrollmentYear;

  late final _is.ColumnInt currentSemester;

  late final _is.ColumnDouble gpa;

  late final _is.ColumnInt totalCredits;

  _i2j2xfrn.AppUserTable get user {
    if (_user != null) return _user!;
    _user = _is.createRelationTable(
      relationFieldName: 'user',
      field: Student.t.userId,
      foreignField: _i2j2xfrn.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2j2xfrn.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _iqe9gc9z.MajorTable get major {
    if (_major != null) return _major!;
    _major = _is.createRelationTable(
      relationFieldName: 'major',
      field: Student.t.majorId,
      foreignField: _iqe9gc9z.Major.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _iqe9gc9z.MajorTable(tableRelation: foreignTableRelation),
    );
    return _major!;
  }

  _ige2gcz9.TrainingProgramTable get trainingProgram {
    if (_trainingProgram != null) return _trainingProgram!;
    _trainingProgram = _is.createRelationTable(
      relationFieldName: 'trainingProgram',
      field: Student.t.trainingProgramId,
      foreignField: _ige2gcz9.TrainingProgram.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ige2gcz9.TrainingProgramTable(tableRelation: foreignTableRelation),
    );
    return _trainingProgram!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    studentCode,
    majorId,
    trainingProgramId,
    academicYear,
    enrollmentYear,
    currentSemester,
    gpa,
    totalCredits,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'major') {
      return major;
    }
    if (relationField == 'trainingProgram') {
      return trainingProgram;
    }
    return null;
  }
}

class StudentInclude extends _is.IncludeObject {
  StudentInclude._({
    _i2j2xfrn.AppUserInclude? user,
    _iqe9gc9z.MajorInclude? major,
    _ige2gcz9.TrainingProgramInclude? trainingProgram,
  }) {
    _user = user;
    _major = major;
    _trainingProgram = trainingProgram;
  }

  _i2j2xfrn.AppUserInclude? _user;

  _iqe9gc9z.MajorInclude? _major;

  _ige2gcz9.TrainingProgramInclude? _trainingProgram;

  @override
  Map<String, _is.Include?> get includes => {
    'user': _user,
    'major': _major,
    'trainingProgram': _trainingProgram,
  };

  @override
  _is.Table<_is.UuidValue?> get table => Student.t;
}

class StudentIncludeList extends _is.IncludeList {
  StudentIncludeList._({
    _is.WhereExpressionBuilder<StudentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Student.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Student.t;
}

class StudentRepository {
  const StudentRepository._();

  final attachRow = const StudentAttachRowRepository._();

  final detachRow = const StudentDetachRowRepository._();

  /// Returns a list of [Student]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Student>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudentTable>? orderBy,
    _is.OrderByListBuilder<StudentTable>? orderByList,
    _is.Transaction? transaction,
    StudentInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Student>(
      where: where?.call(Student.t),
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Student] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Student?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudentTable>? where,
    int? offset,
    _is.OrderByBuilder<StudentTable>? orderBy,
    _is.OrderByListBuilder<StudentTable>? orderByList,
    _is.Transaction? transaction,
    StudentInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Student>(
      where: where?.call(Student.t),
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Student] by its [id] or null if no such row exists.
  Future<Student?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    StudentInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Student>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Student]s in the list and returns the inserted rows.
  ///
  /// The returned [Student]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Student>> insert(
    _is.DatabaseSession session,
    List<Student> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Student>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Student] and returns the inserted row.
  ///
  /// The returned [Student] will have its `id` field set.
  Future<Student> insertRow(
    _is.DatabaseSession session,
    Student row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Student>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Student]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [Student]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Student>> upsert(
    _is.DatabaseSession session,
    List<Student> rows, {
    required _is.ColumnSelections<StudentTable> conflictColumns,
    _is.ColumnSelections<StudentTable>? updateColumns,
    _is.WhereExpressionBuilder<StudentTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Student>(
      rows,
      conflictColumns: conflictColumns(Student.t),
      updateColumns: updateColumns?.call(Student.t),
      updateWhere: updateWhere?.call(Student.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Student] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [Student] will have its `id` field set.
  Future<Student?> upsertRow(
    _is.DatabaseSession session,
    Student row, {
    required _is.ColumnSelections<StudentTable> conflictColumns,
    _is.ColumnSelections<StudentTable>? updateColumns,
    _is.WhereExpressionBuilder<StudentTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Student>(
      row,
      conflictColumns: conflictColumns(Student.t),
      updateColumns: updateColumns?.call(Student.t),
      updateWhere: updateWhere?.call(Student.t),
      transaction: transaction,
    );
  }

  /// Updates all [Student]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Student>> update(
    _is.DatabaseSession session,
    List<Student> rows, {
    _is.ColumnSelections<StudentTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Student>(
      rows,
      columns: columns?.call(Student.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Student]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Student> updateRow(
    _is.DatabaseSession session,
    Student row, {
    _is.ColumnSelections<StudentTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Student>(
      row,
      columns: columns?.call(Student.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Student] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Student?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<StudentUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Student>(
      id,
      columnValues: columnValues(Student.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Student]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Student>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<StudentUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<StudentTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudentTable>? orderBy,
    _is.OrderByListBuilder<StudentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Student>(
      columnValues: columnValues(Student.t.updateTable),
      where: where(Student.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Student]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Student>> delete(
    _is.DatabaseSession session,
    List<Student> rows, {
    _is.OrderByBuilder<StudentTable>? orderBy,
    _is.OrderByListBuilder<StudentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Student>(
      rows,
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Student].
  Future<Student> deleteRow(
    _is.DatabaseSession session,
    Student row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Student>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Student>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudentTable> where,
    _is.OrderByBuilder<StudentTable>? orderBy,
    _is.OrderByListBuilder<StudentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Student>(
      where: where(Student.t),
      orderBy: orderBy?.call(Student.t),
      orderByList: orderByList?.call(Student.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudentTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Student>(
      where: where?.call(Student.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Student] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudentTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Student>(
      where: where(Student.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class StudentAttachRowRepository {
  const StudentAttachRowRepository._();

  /// Creates a relation between the given [Student] and [AppUser]
  /// by setting the [Student]'s foreign key `userId` to refer to the [AppUser].
  Future<void> user(
    _is.DatabaseSession session,
    Student student,
    _i2j2xfrn.AppUser user, {
    _is.Transaction? transaction,
  }) async {
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $student = student.copyWith(userId: user.id);
    await session.db.updateRow<Student>(
      $student,
      columns: [Student.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Student] and [Major]
  /// by setting the [Student]'s foreign key `majorId` to refer to the [Major].
  Future<void> major(
    _is.DatabaseSession session,
    Student student,
    _iqe9gc9z.Major major, {
    _is.Transaction? transaction,
  }) async {
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }
    if (major.id == null) {
      throw ArgumentError.notNull('major.id');
    }

    var $student = student.copyWith(majorId: major.id);
    await session.db.updateRow<Student>(
      $student,
      columns: [Student.t.majorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Student] and [TrainingProgram]
  /// by setting the [Student]'s foreign key `trainingProgramId` to refer to the [TrainingProgram].
  Future<void> trainingProgram(
    _is.DatabaseSession session,
    Student student,
    _ige2gcz9.TrainingProgram trainingProgram, {
    _is.Transaction? transaction,
  }) async {
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }
    if (trainingProgram.id == null) {
      throw ArgumentError.notNull('trainingProgram.id');
    }

    var $student = student.copyWith(trainingProgramId: trainingProgram.id);
    await session.db.updateRow<Student>(
      $student,
      columns: [Student.t.trainingProgramId],
      transaction: transaction,
    );
  }
}

class StudentDetachRowRepository {
  const StudentDetachRowRepository._();

  /// Detaches the relation between this [Student] and the [Major] set in `major`
  /// by setting the [Student]'s foreign key `majorId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> major(
    _is.DatabaseSession session,
    Student student, {
    _is.Transaction? transaction,
  }) async {
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }

    var $student = student.copyWith(majorId: null);
    await session.db.updateRow<Student>(
      $student,
      columns: [Student.t.majorId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Student] and the [TrainingProgram] set in `trainingProgram`
  /// by setting the [Student]'s foreign key `trainingProgramId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> trainingProgram(
    _is.DatabaseSession session,
    Student student, {
    _is.Transaction? transaction,
  }) async {
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }

    var $student = student.copyWith(trainingProgramId: null);
    await session.db.updateRow<Student>(
      $student,
      columns: [Student.t.trainingProgramId],
      transaction: transaction,
    );
  }
}
