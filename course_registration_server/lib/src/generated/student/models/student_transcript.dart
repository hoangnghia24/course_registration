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
import '../../student.dart' as _io7vu6m1;
import '../../student/models/course.dart' as _ibp0tzhj;
import '../../student/models/transcript_status.dart' as _ipjkcfjo;

abstract class StudentTranscript
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  StudentTranscript._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseId,
    this.course,
    required this.semester,
    this.midtermScore,
    this.finalScore,
    required this.score,
    required this.letterGrade,
    required this.status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : attemptNumber = attemptNumber ?? 1,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory StudentTranscript({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String semester,
    double? midtermScore,
    double? finalScore,
    required double score,
    required String letterGrade,
    required _ipjkcfjo.TranscriptStatus status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _StudentTranscriptImpl;

  factory StudentTranscript.fromJson(Map<String, dynamic> jsonSerialization) {
    return StudentTranscript(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      studentId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['studentId'],
      ),
      student: jsonSerialization['student'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_io7vu6m1.Student>(
              jsonSerialization['student'],
            ),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      course: jsonSerialization['course'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ibp0tzhj.Course>(
              jsonSerialization['course'],
            ),
      semester: jsonSerialization['semester'] as String,
      midtermScore: (jsonSerialization['midtermScore'] as num?)?.toDouble(),
      finalScore: (jsonSerialization['finalScore'] as num?)?.toDouble(),
      score: (jsonSerialization['score'] as num).toDouble(),
      letterGrade: jsonSerialization['letterGrade'] as String,
      status: _ipjkcfjo.TranscriptStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      attemptNumber: jsonSerialization['attemptNumber'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = StudentTranscriptTable();

  static const db = StudentTranscriptRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue studentId;

  _io7vu6m1.Student? student;

  _is.UuidValue courseId;

  _ibp0tzhj.Course? course;

  String semester;

  double? midtermScore;

  double? finalScore;

  double score;

  String letterGrade;

  _ipjkcfjo.TranscriptStatus status;

  int attemptNumber;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [StudentTranscript]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  StudentTranscript copyWith({
    _is.UuidValue? id,
    _is.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _is.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    String? semester,
    double? midtermScore,
    double? finalScore,
    double? score,
    String? letterGrade,
    _ipjkcfjo.TranscriptStatus? status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StudentTranscript',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'semester': semester,
      if (midtermScore != null) 'midtermScore': midtermScore,
      if (finalScore != null) 'finalScore': finalScore,
      'score': score,
      'letterGrade': letterGrade,
      'status': status.toJson(),
      'attemptNumber': attemptNumber,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StudentTranscript',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'semester': semester,
      if (midtermScore != null) 'midtermScore': midtermScore,
      if (finalScore != null) 'finalScore': finalScore,
      'score': score,
      'letterGrade': letterGrade,
      'status': status.toJson(),
      'attemptNumber': attemptNumber,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static StudentTranscriptInclude include({
    _io7vu6m1.StudentInclude? student,
    _ibp0tzhj.CourseInclude? course,
  }) {
    return StudentTranscriptInclude._(
      student: student,
      course: course,
    );
  }

  static StudentTranscriptIncludeList includeList({
    _is.WhereExpressionBuilder<StudentTranscriptTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudentTranscriptTable>? orderBy,
    _is.OrderByListBuilder<StudentTranscriptTable>? orderByList,
    StudentTranscriptInclude? include,
  }) {
    return StudentTranscriptIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudentTranscript.t),
      orderByList: orderByList?.call(StudentTranscript.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudentTranscriptImpl extends StudentTranscript {
  _StudentTranscriptImpl({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String semester,
    double? midtermScore,
    double? finalScore,
    required double score,
    required String letterGrade,
    required _ipjkcfjo.TranscriptStatus status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseId: courseId,
         course: course,
         semester: semester,
         midtermScore: midtermScore,
         finalScore: finalScore,
         score: score,
         letterGrade: letterGrade,
         status: status,
         attemptNumber: attemptNumber,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StudentTranscript]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  StudentTranscript copyWith({
    Object? id = _Undefined,
    _is.UuidValue? studentId,
    Object? student = _Undefined,
    _is.UuidValue? courseId,
    Object? course = _Undefined,
    String? semester,
    Object? midtermScore = _Undefined,
    Object? finalScore = _Undefined,
    double? score,
    String? letterGrade,
    _ipjkcfjo.TranscriptStatus? status,
    int? attemptNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StudentTranscript(
      id: id is _is.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      semester: semester ?? this.semester,
      midtermScore: midtermScore is double? ? midtermScore : this.midtermScore,
      finalScore: finalScore is double? ? finalScore : this.finalScore,
      score: score ?? this.score,
      letterGrade: letterGrade ?? this.letterGrade,
      status: status ?? this.status,
      attemptNumber: attemptNumber ?? this.attemptNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class StudentTranscriptUpdateTable
    extends _is.UpdateTable<StudentTranscriptTable> {
  StudentTranscriptUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> studentId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.studentId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.courseId,
        value,
      );

  _is.ColumnValue<String, String> semester(String value) => _is.ColumnValue(
    table.semester,
    value,
  );

  _is.ColumnValue<double, double> midtermScore(double? value) =>
      _is.ColumnValue(
        table.midtermScore,
        value,
      );

  _is.ColumnValue<double, double> finalScore(double? value) => _is.ColumnValue(
    table.finalScore,
    value,
  );

  _is.ColumnValue<double, double> score(double value) => _is.ColumnValue(
    table.score,
    value,
  );

  _is.ColumnValue<String, String> letterGrade(String value) => _is.ColumnValue(
    table.letterGrade,
    value,
  );

  _is.ColumnValue<_ipjkcfjo.TranscriptStatus, _ipjkcfjo.TranscriptStatus>
  status(_ipjkcfjo.TranscriptStatus value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<int, int> attemptNumber(int value) => _is.ColumnValue(
    table.attemptNumber,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class StudentTranscriptTable extends _is.Table<_is.UuidValue?> {
  StudentTranscriptTable({super.tableRelation})
    : super(tableName: 'student_transcripts') {
    updateTable = StudentTranscriptUpdateTable(this);
    studentId = _is.ColumnUuid(
      'studentId',
      this,
    );
    courseId = _is.ColumnUuid(
      'courseId',
      this,
    );
    semester = _is.ColumnString(
      'semester',
      this,
    );
    midtermScore = _is.ColumnDouble(
      'midtermScore',
      this,
    );
    finalScore = _is.ColumnDouble(
      'finalScore',
      this,
    );
    score = _is.ColumnDouble(
      'score',
      this,
    );
    letterGrade = _is.ColumnString(
      'letterGrade',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    attemptNumber = _is.ColumnInt(
      'attemptNumber',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final StudentTranscriptUpdateTable updateTable;

  late final _is.ColumnUuid studentId;

  _io7vu6m1.StudentTable? _student;

  late final _is.ColumnUuid courseId;

  _ibp0tzhj.CourseTable? _course;

  late final _is.ColumnString semester;

  late final _is.ColumnDouble midtermScore;

  late final _is.ColumnDouble finalScore;

  late final _is.ColumnDouble score;

  late final _is.ColumnString letterGrade;

  late final _is.ColumnEnum<_ipjkcfjo.TranscriptStatus> status;

  late final _is.ColumnInt attemptNumber;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  _io7vu6m1.StudentTable get student {
    if (_student != null) return _student!;
    _student = _is.createRelationTable(
      relationFieldName: 'student',
      field: StudentTranscript.t.studentId,
      foreignField: _io7vu6m1.Student.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _io7vu6m1.StudentTable(tableRelation: foreignTableRelation),
    );
    return _student!;
  }

  _ibp0tzhj.CourseTable get course {
    if (_course != null) return _course!;
    _course = _is.createRelationTable(
      relationFieldName: 'course',
      field: StudentTranscript.t.courseId,
      foreignField: _ibp0tzhj.Course.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ibp0tzhj.CourseTable(tableRelation: foreignTableRelation),
    );
    return _course!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    studentId,
    courseId,
    semester,
    midtermScore,
    finalScore,
    score,
    letterGrade,
    status,
    attemptNumber,
    createdAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'student') {
      return student;
    }
    if (relationField == 'course') {
      return course;
    }
    return null;
  }
}

class StudentTranscriptInclude extends _is.IncludeObject {
  StudentTranscriptInclude._({
    _io7vu6m1.StudentInclude? student,
    _ibp0tzhj.CourseInclude? course,
  }) {
    _student = student;
    _course = course;
  }

  _io7vu6m1.StudentInclude? _student;

  _ibp0tzhj.CourseInclude? _course;

  @override
  Map<String, _is.Include?> get includes => {
    'student': _student,
    'course': _course,
  };

  @override
  _is.Table<_is.UuidValue?> get table => StudentTranscript.t;
}

class StudentTranscriptIncludeList extends _is.IncludeList {
  StudentTranscriptIncludeList._({
    _is.WhereExpressionBuilder<StudentTranscriptTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StudentTranscript.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => StudentTranscript.t;
}

class StudentTranscriptRepository {
  const StudentTranscriptRepository._();

  final attachRow = const StudentTranscriptAttachRowRepository._();

  /// Returns a list of [StudentTranscript]s matching the given query parameters.
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
  Future<List<StudentTranscript>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudentTranscriptTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudentTranscriptTable>? orderBy,
    _is.OrderByListBuilder<StudentTranscriptTable>? orderByList,
    _is.Transaction? transaction,
    StudentTranscriptInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StudentTranscript>(
      where: where?.call(StudentTranscript.t),
      orderBy: orderBy?.call(StudentTranscript.t),
      orderByList: orderByList?.call(StudentTranscript.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StudentTranscript] matching the given query parameters.
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
  Future<StudentTranscript?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudentTranscriptTable>? where,
    int? offset,
    _is.OrderByBuilder<StudentTranscriptTable>? orderBy,
    _is.OrderByListBuilder<StudentTranscriptTable>? orderByList,
    _is.Transaction? transaction,
    StudentTranscriptInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StudentTranscript>(
      where: where?.call(StudentTranscript.t),
      orderBy: orderBy?.call(StudentTranscript.t),
      orderByList: orderByList?.call(StudentTranscript.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StudentTranscript] by its [id] or null if no such row exists.
  Future<StudentTranscript?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    StudentTranscriptInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StudentTranscript>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StudentTranscript]s in the list and returns the inserted rows.
  ///
  /// The returned [StudentTranscript]s will have their `id` fields set.
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
  Future<List<StudentTranscript>> insert(
    _is.DatabaseSession session,
    List<StudentTranscript> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<StudentTranscript>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [StudentTranscript] and returns the inserted row.
  ///
  /// The returned [StudentTranscript] will have its `id` field set.
  Future<StudentTranscript> insertRow(
    _is.DatabaseSession session,
    StudentTranscript row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<StudentTranscript>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [StudentTranscript]s in the list and returns the resulting rows.
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
  /// The returned [StudentTranscript]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudentTranscript>> upsert(
    _is.DatabaseSession session,
    List<StudentTranscript> rows, {
    required _is.ColumnSelections<StudentTranscriptTable> conflictColumns,
    _is.ColumnSelections<StudentTranscriptTable>? updateColumns,
    _is.WhereExpressionBuilder<StudentTranscriptTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<StudentTranscript>(
      rows,
      conflictColumns: conflictColumns(StudentTranscript.t),
      updateColumns: updateColumns?.call(StudentTranscript.t),
      updateWhere: updateWhere?.call(StudentTranscript.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [StudentTranscript] and returns the resulting row.
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
  /// The returned [StudentTranscript] will have its `id` field set.
  Future<StudentTranscript?> upsertRow(
    _is.DatabaseSession session,
    StudentTranscript row, {
    required _is.ColumnSelections<StudentTranscriptTable> conflictColumns,
    _is.ColumnSelections<StudentTranscriptTable>? updateColumns,
    _is.WhereExpressionBuilder<StudentTranscriptTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<StudentTranscript>(
      row,
      conflictColumns: conflictColumns(StudentTranscript.t),
      updateColumns: updateColumns?.call(StudentTranscript.t),
      updateWhere: updateWhere?.call(StudentTranscript.t),
      transaction: transaction,
    );
  }

  /// Updates all [StudentTranscript]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudentTranscript>> update(
    _is.DatabaseSession session,
    List<StudentTranscript> rows, {
    _is.ColumnSelections<StudentTranscriptTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<StudentTranscript>(
      rows,
      columns: columns?.call(StudentTranscript.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [StudentTranscript]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StudentTranscript> updateRow(
    _is.DatabaseSession session,
    StudentTranscript row, {
    _is.ColumnSelections<StudentTranscriptTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<StudentTranscript>(
      row,
      columns: columns?.call(StudentTranscript.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StudentTranscript] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StudentTranscript?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<StudentTranscriptUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<StudentTranscript>(
      id,
      columnValues: columnValues(StudentTranscript.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StudentTranscript]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudentTranscript>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<StudentTranscriptUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<StudentTranscriptTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudentTranscriptTable>? orderBy,
    _is.OrderByListBuilder<StudentTranscriptTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<StudentTranscript>(
      columnValues: columnValues(StudentTranscript.t.updateTable),
      where: where(StudentTranscript.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudentTranscript.t),
      orderByList: orderByList?.call(StudentTranscript.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [StudentTranscript]s in the list and returns the deleted rows.
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
  Future<List<StudentTranscript>> delete(
    _is.DatabaseSession session,
    List<StudentTranscript> rows, {
    _is.OrderByBuilder<StudentTranscriptTable>? orderBy,
    _is.OrderByListBuilder<StudentTranscriptTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<StudentTranscript>(
      rows,
      orderBy: orderBy?.call(StudentTranscript.t),
      orderByList: orderByList?.call(StudentTranscript.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [StudentTranscript].
  Future<StudentTranscript> deleteRow(
    _is.DatabaseSession session,
    StudentTranscript row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StudentTranscript>(
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
  Future<List<StudentTranscript>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudentTranscriptTable> where,
    _is.OrderByBuilder<StudentTranscriptTable>? orderBy,
    _is.OrderByListBuilder<StudentTranscriptTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<StudentTranscript>(
      where: where(StudentTranscript.t),
      orderBy: orderBy?.call(StudentTranscript.t),
      orderByList: orderByList?.call(StudentTranscript.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudentTranscriptTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<StudentTranscript>(
      where: where?.call(StudentTranscript.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StudentTranscript] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudentTranscriptTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StudentTranscript>(
      where: where(StudentTranscript.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class StudentTranscriptAttachRowRepository {
  const StudentTranscriptAttachRowRepository._();

  /// Creates a relation between the given [StudentTranscript] and [Student]
  /// by setting the [StudentTranscript]'s foreign key `studentId` to refer to the [Student].
  Future<void> student(
    _is.DatabaseSession session,
    StudentTranscript studentTranscript,
    _io7vu6m1.Student student, {
    _is.Transaction? transaction,
  }) async {
    if (studentTranscript.id == null) {
      throw ArgumentError.notNull('studentTranscript.id');
    }
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }

    var $studentTranscript = studentTranscript.copyWith(studentId: student.id);
    await session.db.updateRow<StudentTranscript>(
      $studentTranscript,
      columns: [StudentTranscript.t.studentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [StudentTranscript] and [Course]
  /// by setting the [StudentTranscript]'s foreign key `courseId` to refer to the [Course].
  Future<void> course(
    _is.DatabaseSession session,
    StudentTranscript studentTranscript,
    _ibp0tzhj.Course course, {
    _is.Transaction? transaction,
  }) async {
    if (studentTranscript.id == null) {
      throw ArgumentError.notNull('studentTranscript.id');
    }
    if (course.id == null) {
      throw ArgumentError.notNull('course.id');
    }

    var $studentTranscript = studentTranscript.copyWith(courseId: course.id);
    await session.db.updateRow<StudentTranscript>(
      $studentTranscript,
      columns: [StudentTranscript.t.courseId],
      transaction: transaction,
    );
  }
}
