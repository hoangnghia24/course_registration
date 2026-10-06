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
import '../../registration/models/opening_request_status.dart' as _ioohnrmm;
import '../../student.dart' as _io7vu6m1;
import '../../student/models/course.dart' as _ibp0tzhj;

abstract class CourseOpeningRequest
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  CourseOpeningRequest._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseId,
    this.course,
    required this.reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) : createdAt = createdAt ?? DateTime.now(),
       status = status ?? _ioohnrmm.OpeningRequestStatus.pending;

  factory CourseOpeningRequest({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) = _CourseOpeningRequestImpl;

  factory CourseOpeningRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseOpeningRequest(
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
      reason: jsonSerialization['reason'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      status: jsonSerialization['status'] == null
          ? null
          : _ioohnrmm.OpeningRequestStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
    );
  }

  static final t = CourseOpeningRequestTable();

  static const db = CourseOpeningRequestRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue studentId;

  _io7vu6m1.Student? student;

  _is.UuidValue courseId;

  _ibp0tzhj.Course? course;

  String reason;

  DateTime createdAt;

  _ioohnrmm.OpeningRequestStatus status;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [CourseOpeningRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CourseOpeningRequest copyWith({
    _is.UuidValue? id,
    _is.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _is.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    String? reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseOpeningRequest',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'reason': reason,
      'createdAt': createdAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseOpeningRequest',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'reason': reason,
      'createdAt': createdAt.toJson(),
      'status': status.toJson(),
    };
  }

  static CourseOpeningRequestInclude include({
    _io7vu6m1.StudentInclude? student,
    _ibp0tzhj.CourseInclude? course,
  }) {
    return CourseOpeningRequestInclude._(
      student: student,
      course: course,
    );
  }

  static CourseOpeningRequestIncludeList includeList({
    _is.WhereExpressionBuilder<CourseOpeningRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseOpeningRequestTable>? orderBy,
    _is.OrderByListBuilder<CourseOpeningRequestTable>? orderByList,
    CourseOpeningRequestInclude? include,
  }) {
    return CourseOpeningRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseOpeningRequest.t),
      orderByList: orderByList?.call(CourseOpeningRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseOpeningRequestImpl extends CourseOpeningRequest {
  _CourseOpeningRequestImpl({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required String reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseId: courseId,
         course: course,
         reason: reason,
         createdAt: createdAt,
         status: status,
       );

  /// Returns a shallow copy of this [CourseOpeningRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CourseOpeningRequest copyWith({
    Object? id = _Undefined,
    _is.UuidValue? studentId,
    Object? student = _Undefined,
    _is.UuidValue? courseId,
    Object? course = _Undefined,
    String? reason,
    DateTime? createdAt,
    _ioohnrmm.OpeningRequestStatus? status,
  }) {
    return CourseOpeningRequest(
      id: id is _is.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }
}

class CourseOpeningRequestUpdateTable
    extends _is.UpdateTable<CourseOpeningRequestTable> {
  CourseOpeningRequestUpdateTable(super.table);

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

  _is.ColumnValue<String, String> reason(String value) => _is.ColumnValue(
    table.reason,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<
    _ioohnrmm.OpeningRequestStatus,
    _ioohnrmm.OpeningRequestStatus
  >
  status(_ioohnrmm.OpeningRequestStatus value) => _is.ColumnValue(
    table.status,
    value,
  );
}

class CourseOpeningRequestTable extends _is.Table<_is.UuidValue?> {
  CourseOpeningRequestTable({super.tableRelation})
    : super(tableName: 'course_opening_requests') {
    updateTable = CourseOpeningRequestUpdateTable(this);
    studentId = _is.ColumnUuid(
      'studentId',
      this,
    );
    courseId = _is.ColumnUuid(
      'courseId',
      this,
    );
    reason = _is.ColumnString(
      'reason',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
  }

  late final CourseOpeningRequestUpdateTable updateTable;

  late final _is.ColumnUuid studentId;

  _io7vu6m1.StudentTable? _student;

  late final _is.ColumnUuid courseId;

  _ibp0tzhj.CourseTable? _course;

  late final _is.ColumnString reason;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnEnum<_ioohnrmm.OpeningRequestStatus> status;

  _io7vu6m1.StudentTable get student {
    if (_student != null) return _student!;
    _student = _is.createRelationTable(
      relationFieldName: 'student',
      field: CourseOpeningRequest.t.studentId,
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
      field: CourseOpeningRequest.t.courseId,
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
    reason,
    createdAt,
    status,
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

class CourseOpeningRequestInclude extends _is.IncludeObject {
  CourseOpeningRequestInclude._({
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
  _is.Table<_is.UuidValue?> get table => CourseOpeningRequest.t;
}

class CourseOpeningRequestIncludeList extends _is.IncludeList {
  CourseOpeningRequestIncludeList._({
    _is.WhereExpressionBuilder<CourseOpeningRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CourseOpeningRequest.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => CourseOpeningRequest.t;
}

class CourseOpeningRequestRepository {
  const CourseOpeningRequestRepository._();

  final attachRow = const CourseOpeningRequestAttachRowRepository._();

  /// Returns a list of [CourseOpeningRequest]s matching the given query parameters.
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
  Future<List<CourseOpeningRequest>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseOpeningRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseOpeningRequestTable>? orderBy,
    _is.OrderByListBuilder<CourseOpeningRequestTable>? orderByList,
    _is.Transaction? transaction,
    CourseOpeningRequestInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CourseOpeningRequest>(
      where: where?.call(CourseOpeningRequest.t),
      orderBy: orderBy?.call(CourseOpeningRequest.t),
      orderByList: orderByList?.call(CourseOpeningRequest.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CourseOpeningRequest] matching the given query parameters.
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
  Future<CourseOpeningRequest?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseOpeningRequestTable>? where,
    int? offset,
    _is.OrderByBuilder<CourseOpeningRequestTable>? orderBy,
    _is.OrderByListBuilder<CourseOpeningRequestTable>? orderByList,
    _is.Transaction? transaction,
    CourseOpeningRequestInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CourseOpeningRequest>(
      where: where?.call(CourseOpeningRequest.t),
      orderBy: orderBy?.call(CourseOpeningRequest.t),
      orderByList: orderByList?.call(CourseOpeningRequest.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CourseOpeningRequest] by its [id] or null if no such row exists.
  Future<CourseOpeningRequest?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    CourseOpeningRequestInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CourseOpeningRequest>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CourseOpeningRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [CourseOpeningRequest]s will have their `id` fields set.
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
  Future<List<CourseOpeningRequest>> insert(
    _is.DatabaseSession session,
    List<CourseOpeningRequest> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CourseOpeningRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CourseOpeningRequest] and returns the inserted row.
  ///
  /// The returned [CourseOpeningRequest] will have its `id` field set.
  Future<CourseOpeningRequest> insertRow(
    _is.DatabaseSession session,
    CourseOpeningRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CourseOpeningRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CourseOpeningRequest]s in the list and returns the resulting rows.
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
  /// The returned [CourseOpeningRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseOpeningRequest>> upsert(
    _is.DatabaseSession session,
    List<CourseOpeningRequest> rows, {
    required _is.ColumnSelections<CourseOpeningRequestTable> conflictColumns,
    _is.ColumnSelections<CourseOpeningRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseOpeningRequestTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CourseOpeningRequest>(
      rows,
      conflictColumns: conflictColumns(CourseOpeningRequest.t),
      updateColumns: updateColumns?.call(CourseOpeningRequest.t),
      updateWhere: updateWhere?.call(CourseOpeningRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CourseOpeningRequest] and returns the resulting row.
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
  /// The returned [CourseOpeningRequest] will have its `id` field set.
  Future<CourseOpeningRequest?> upsertRow(
    _is.DatabaseSession session,
    CourseOpeningRequest row, {
    required _is.ColumnSelections<CourseOpeningRequestTable> conflictColumns,
    _is.ColumnSelections<CourseOpeningRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseOpeningRequestTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CourseOpeningRequest>(
      row,
      conflictColumns: conflictColumns(CourseOpeningRequest.t),
      updateColumns: updateColumns?.call(CourseOpeningRequest.t),
      updateWhere: updateWhere?.call(CourseOpeningRequest.t),
      transaction: transaction,
    );
  }

  /// Updates all [CourseOpeningRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseOpeningRequest>> update(
    _is.DatabaseSession session,
    List<CourseOpeningRequest> rows, {
    _is.ColumnSelections<CourseOpeningRequestTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CourseOpeningRequest>(
      rows,
      columns: columns?.call(CourseOpeningRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CourseOpeningRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CourseOpeningRequest> updateRow(
    _is.DatabaseSession session,
    CourseOpeningRequest row, {
    _is.ColumnSelections<CourseOpeningRequestTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CourseOpeningRequest>(
      row,
      columns: columns?.call(CourseOpeningRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CourseOpeningRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CourseOpeningRequest?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<CourseOpeningRequestUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CourseOpeningRequest>(
      id,
      columnValues: columnValues(CourseOpeningRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CourseOpeningRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseOpeningRequest>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CourseOpeningRequestUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<CourseOpeningRequestTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseOpeningRequestTable>? orderBy,
    _is.OrderByListBuilder<CourseOpeningRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CourseOpeningRequest>(
      columnValues: columnValues(CourseOpeningRequest.t.updateTable),
      where: where(CourseOpeningRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseOpeningRequest.t),
      orderByList: orderByList?.call(CourseOpeningRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CourseOpeningRequest]s in the list and returns the deleted rows.
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
  Future<List<CourseOpeningRequest>> delete(
    _is.DatabaseSession session,
    List<CourseOpeningRequest> rows, {
    _is.OrderByBuilder<CourseOpeningRequestTable>? orderBy,
    _is.OrderByListBuilder<CourseOpeningRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CourseOpeningRequest>(
      rows,
      orderBy: orderBy?.call(CourseOpeningRequest.t),
      orderByList: orderByList?.call(CourseOpeningRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CourseOpeningRequest].
  Future<CourseOpeningRequest> deleteRow(
    _is.DatabaseSession session,
    CourseOpeningRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CourseOpeningRequest>(
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
  Future<List<CourseOpeningRequest>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseOpeningRequestTable> where,
    _is.OrderByBuilder<CourseOpeningRequestTable>? orderBy,
    _is.OrderByListBuilder<CourseOpeningRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CourseOpeningRequest>(
      where: where(CourseOpeningRequest.t),
      orderBy: orderBy?.call(CourseOpeningRequest.t),
      orderByList: orderByList?.call(CourseOpeningRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseOpeningRequestTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CourseOpeningRequest>(
      where: where?.call(CourseOpeningRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CourseOpeningRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseOpeningRequestTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CourseOpeningRequest>(
      where: where(CourseOpeningRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class CourseOpeningRequestAttachRowRepository {
  const CourseOpeningRequestAttachRowRepository._();

  /// Creates a relation between the given [CourseOpeningRequest] and [Student]
  /// by setting the [CourseOpeningRequest]'s foreign key `studentId` to refer to the [Student].
  Future<void> student(
    _is.DatabaseSession session,
    CourseOpeningRequest courseOpeningRequest,
    _io7vu6m1.Student student, {
    _is.Transaction? transaction,
  }) async {
    if (courseOpeningRequest.id == null) {
      throw ArgumentError.notNull('courseOpeningRequest.id');
    }
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }

    var $courseOpeningRequest = courseOpeningRequest.copyWith(
      studentId: student.id,
    );
    await session.db.updateRow<CourseOpeningRequest>(
      $courseOpeningRequest,
      columns: [CourseOpeningRequest.t.studentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CourseOpeningRequest] and [Course]
  /// by setting the [CourseOpeningRequest]'s foreign key `courseId` to refer to the [Course].
  Future<void> course(
    _is.DatabaseSession session,
    CourseOpeningRequest courseOpeningRequest,
    _ibp0tzhj.Course course, {
    _is.Transaction? transaction,
  }) async {
    if (courseOpeningRequest.id == null) {
      throw ArgumentError.notNull('courseOpeningRequest.id');
    }
    if (course.id == null) {
      throw ArgumentError.notNull('course.id');
    }

    var $courseOpeningRequest = courseOpeningRequest.copyWith(
      courseId: course.id,
    );
    await session.db.updateRow<CourseOpeningRequest>(
      $courseOpeningRequest,
      columns: [CourseOpeningRequest.t.courseId],
      transaction: transaction,
    );
  }
}
