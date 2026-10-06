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
import '../../registration/models/course_class.dart' as _igjwbat6;
import '../../registration/models/registration_action.dart' as _icvdo4c9;
import '../../student.dart' as _io7vu6m1;

abstract class RegistrationHistory
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  RegistrationHistory._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseClassId,
    this.courseClass,
    required this.action,
    DateTime? createdAt,
    this.deviceInfo,
  }) : createdAt = createdAt ?? DateTime.now();

  factory RegistrationHistory({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _icvdo4c9.RegistrationAction action,
    DateTime? createdAt,
    String? deviceInfo,
  }) = _RegistrationHistoryImpl;

  factory RegistrationHistory.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegistrationHistory(
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
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      action: _icvdo4c9.RegistrationAction.fromJson(
        (jsonSerialization['action'] as String),
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
    );
  }

  static final t = RegistrationHistoryTable();

  static const db = RegistrationHistoryRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue studentId;

  _io7vu6m1.Student? student;

  _is.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  _icvdo4c9.RegistrationAction action;

  DateTime createdAt;

  String? deviceInfo;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [RegistrationHistory]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RegistrationHistory copyWith({
    _is.UuidValue? id,
    _is.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _is.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    _icvdo4c9.RegistrationAction? action,
    DateTime? createdAt,
    String? deviceInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegistrationHistory',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'action': action.toJson(),
      'createdAt': createdAt.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegistrationHistory',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'action': action.toJson(),
      'createdAt': createdAt.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
    };
  }

  static RegistrationHistoryInclude include({
    _io7vu6m1.StudentInclude? student,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    return RegistrationHistoryInclude._(
      student: student,
      courseClass: courseClass,
    );
  }

  static RegistrationHistoryIncludeList includeList({
    _is.WhereExpressionBuilder<RegistrationHistoryTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationHistoryTable>? orderBy,
    _is.OrderByListBuilder<RegistrationHistoryTable>? orderByList,
    RegistrationHistoryInclude? include,
  }) {
    return RegistrationHistoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RegistrationHistory.t),
      orderByList: orderByList?.call(RegistrationHistory.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationHistoryImpl extends RegistrationHistory {
  _RegistrationHistoryImpl({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _icvdo4c9.RegistrationAction action,
    DateTime? createdAt,
    String? deviceInfo,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseClassId: courseClassId,
         courseClass: courseClass,
         action: action,
         createdAt: createdAt,
         deviceInfo: deviceInfo,
       );

  /// Returns a shallow copy of this [RegistrationHistory]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RegistrationHistory copyWith({
    Object? id = _Undefined,
    _is.UuidValue? studentId,
    Object? student = _Undefined,
    _is.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    _icvdo4c9.RegistrationAction? action,
    DateTime? createdAt,
    Object? deviceInfo = _Undefined,
  }) {
    return RegistrationHistory(
      id: id is _is.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      action: action ?? this.action,
      createdAt: createdAt ?? this.createdAt,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
    );
  }
}

class RegistrationHistoryUpdateTable
    extends _is.UpdateTable<RegistrationHistoryTable> {
  RegistrationHistoryUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> studentId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.studentId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseClassId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.courseClassId,
    value,
  );

  _is.ColumnValue<_icvdo4c9.RegistrationAction, _icvdo4c9.RegistrationAction>
  action(_icvdo4c9.RegistrationAction value) => _is.ColumnValue(
    table.action,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<String, String> deviceInfo(String? value) => _is.ColumnValue(
    table.deviceInfo,
    value,
  );
}

class RegistrationHistoryTable extends _is.Table<_is.UuidValue?> {
  RegistrationHistoryTable({super.tableRelation})
    : super(tableName: 'registration_history') {
    updateTable = RegistrationHistoryUpdateTable(this);
    studentId = _is.ColumnUuid(
      'studentId',
      this,
    );
    courseClassId = _is.ColumnUuid(
      'courseClassId',
      this,
    );
    action = _is.ColumnEnum(
      'action',
      this,
      _is.EnumSerialization.byName,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    deviceInfo = _is.ColumnString(
      'deviceInfo',
      this,
    );
  }

  late final RegistrationHistoryUpdateTable updateTable;

  late final _is.ColumnUuid studentId;

  _io7vu6m1.StudentTable? _student;

  late final _is.ColumnUuid courseClassId;

  _igjwbat6.CourseClassTable? _courseClass;

  late final _is.ColumnEnum<_icvdo4c9.RegistrationAction> action;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnString deviceInfo;

  _io7vu6m1.StudentTable get student {
    if (_student != null) return _student!;
    _student = _is.createRelationTable(
      relationFieldName: 'student',
      field: RegistrationHistory.t.studentId,
      foreignField: _io7vu6m1.Student.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _io7vu6m1.StudentTable(tableRelation: foreignTableRelation),
    );
    return _student!;
  }

  _igjwbat6.CourseClassTable get courseClass {
    if (_courseClass != null) return _courseClass!;
    _courseClass = _is.createRelationTable(
      relationFieldName: 'courseClass',
      field: RegistrationHistory.t.courseClassId,
      foreignField: _igjwbat6.CourseClass.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _igjwbat6.CourseClassTable(tableRelation: foreignTableRelation),
    );
    return _courseClass!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    studentId,
    courseClassId,
    action,
    createdAt,
    deviceInfo,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'student') {
      return student;
    }
    if (relationField == 'courseClass') {
      return courseClass;
    }
    return null;
  }
}

class RegistrationHistoryInclude extends _is.IncludeObject {
  RegistrationHistoryInclude._({
    _io7vu6m1.StudentInclude? student,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    _student = student;
    _courseClass = courseClass;
  }

  _io7vu6m1.StudentInclude? _student;

  _igjwbat6.CourseClassInclude? _courseClass;

  @override
  Map<String, _is.Include?> get includes => {
    'student': _student,
    'courseClass': _courseClass,
  };

  @override
  _is.Table<_is.UuidValue?> get table => RegistrationHistory.t;
}

class RegistrationHistoryIncludeList extends _is.IncludeList {
  RegistrationHistoryIncludeList._({
    _is.WhereExpressionBuilder<RegistrationHistoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RegistrationHistory.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => RegistrationHistory.t;
}

class RegistrationHistoryRepository {
  const RegistrationHistoryRepository._();

  final attachRow = const RegistrationHistoryAttachRowRepository._();

  /// Returns a list of [RegistrationHistory]s matching the given query parameters.
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
  Future<List<RegistrationHistory>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationHistoryTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationHistoryTable>? orderBy,
    _is.OrderByListBuilder<RegistrationHistoryTable>? orderByList,
    _is.Transaction? transaction,
    RegistrationHistoryInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RegistrationHistory>(
      where: where?.call(RegistrationHistory.t),
      orderBy: orderBy?.call(RegistrationHistory.t),
      orderByList: orderByList?.call(RegistrationHistory.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RegistrationHistory] matching the given query parameters.
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
  Future<RegistrationHistory?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationHistoryTable>? where,
    int? offset,
    _is.OrderByBuilder<RegistrationHistoryTable>? orderBy,
    _is.OrderByListBuilder<RegistrationHistoryTable>? orderByList,
    _is.Transaction? transaction,
    RegistrationHistoryInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RegistrationHistory>(
      where: where?.call(RegistrationHistory.t),
      orderBy: orderBy?.call(RegistrationHistory.t),
      orderByList: orderByList?.call(RegistrationHistory.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RegistrationHistory] by its [id] or null if no such row exists.
  Future<RegistrationHistory?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    RegistrationHistoryInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RegistrationHistory>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RegistrationHistory]s in the list and returns the inserted rows.
  ///
  /// The returned [RegistrationHistory]s will have their `id` fields set.
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
  Future<List<RegistrationHistory>> insert(
    _is.DatabaseSession session,
    List<RegistrationHistory> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RegistrationHistory>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RegistrationHistory] and returns the inserted row.
  ///
  /// The returned [RegistrationHistory] will have its `id` field set.
  Future<RegistrationHistory> insertRow(
    _is.DatabaseSession session,
    RegistrationHistory row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RegistrationHistory>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RegistrationHistory]s in the list and returns the resulting rows.
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
  /// The returned [RegistrationHistory]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RegistrationHistory>> upsert(
    _is.DatabaseSession session,
    List<RegistrationHistory> rows, {
    required _is.ColumnSelections<RegistrationHistoryTable> conflictColumns,
    _is.ColumnSelections<RegistrationHistoryTable>? updateColumns,
    _is.WhereExpressionBuilder<RegistrationHistoryTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RegistrationHistory>(
      rows,
      conflictColumns: conflictColumns(RegistrationHistory.t),
      updateColumns: updateColumns?.call(RegistrationHistory.t),
      updateWhere: updateWhere?.call(RegistrationHistory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RegistrationHistory] and returns the resulting row.
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
  /// The returned [RegistrationHistory] will have its `id` field set.
  Future<RegistrationHistory?> upsertRow(
    _is.DatabaseSession session,
    RegistrationHistory row, {
    required _is.ColumnSelections<RegistrationHistoryTable> conflictColumns,
    _is.ColumnSelections<RegistrationHistoryTable>? updateColumns,
    _is.WhereExpressionBuilder<RegistrationHistoryTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RegistrationHistory>(
      row,
      conflictColumns: conflictColumns(RegistrationHistory.t),
      updateColumns: updateColumns?.call(RegistrationHistory.t),
      updateWhere: updateWhere?.call(RegistrationHistory.t),
      transaction: transaction,
    );
  }

  /// Updates all [RegistrationHistory]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RegistrationHistory>> update(
    _is.DatabaseSession session,
    List<RegistrationHistory> rows, {
    _is.ColumnSelections<RegistrationHistoryTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RegistrationHistory>(
      rows,
      columns: columns?.call(RegistrationHistory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RegistrationHistory]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RegistrationHistory> updateRow(
    _is.DatabaseSession session,
    RegistrationHistory row, {
    _is.ColumnSelections<RegistrationHistoryTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RegistrationHistory>(
      row,
      columns: columns?.call(RegistrationHistory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RegistrationHistory] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RegistrationHistory?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<RegistrationHistoryUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RegistrationHistory>(
      id,
      columnValues: columnValues(RegistrationHistory.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RegistrationHistory]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RegistrationHistory>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RegistrationHistoryUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<RegistrationHistoryTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationHistoryTable>? orderBy,
    _is.OrderByListBuilder<RegistrationHistoryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RegistrationHistory>(
      columnValues: columnValues(RegistrationHistory.t.updateTable),
      where: where(RegistrationHistory.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RegistrationHistory.t),
      orderByList: orderByList?.call(RegistrationHistory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RegistrationHistory]s in the list and returns the deleted rows.
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
  Future<List<RegistrationHistory>> delete(
    _is.DatabaseSession session,
    List<RegistrationHistory> rows, {
    _is.OrderByBuilder<RegistrationHistoryTable>? orderBy,
    _is.OrderByListBuilder<RegistrationHistoryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RegistrationHistory>(
      rows,
      orderBy: orderBy?.call(RegistrationHistory.t),
      orderByList: orderByList?.call(RegistrationHistory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RegistrationHistory].
  Future<RegistrationHistory> deleteRow(
    _is.DatabaseSession session,
    RegistrationHistory row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RegistrationHistory>(
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
  Future<List<RegistrationHistory>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RegistrationHistoryTable> where,
    _is.OrderByBuilder<RegistrationHistoryTable>? orderBy,
    _is.OrderByListBuilder<RegistrationHistoryTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RegistrationHistory>(
      where: where(RegistrationHistory.t),
      orderBy: orderBy?.call(RegistrationHistory.t),
      orderByList: orderByList?.call(RegistrationHistory.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationHistoryTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RegistrationHistory>(
      where: where?.call(RegistrationHistory.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RegistrationHistory] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RegistrationHistoryTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RegistrationHistory>(
      where: where(RegistrationHistory.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class RegistrationHistoryAttachRowRepository {
  const RegistrationHistoryAttachRowRepository._();

  /// Creates a relation between the given [RegistrationHistory] and [Student]
  /// by setting the [RegistrationHistory]'s foreign key `studentId` to refer to the [Student].
  Future<void> student(
    _is.DatabaseSession session,
    RegistrationHistory registrationHistory,
    _io7vu6m1.Student student, {
    _is.Transaction? transaction,
  }) async {
    if (registrationHistory.id == null) {
      throw ArgumentError.notNull('registrationHistory.id');
    }
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }

    var $registrationHistory = registrationHistory.copyWith(
      studentId: student.id,
    );
    await session.db.updateRow<RegistrationHistory>(
      $registrationHistory,
      columns: [RegistrationHistory.t.studentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [RegistrationHistory] and [CourseClass]
  /// by setting the [RegistrationHistory]'s foreign key `courseClassId` to refer to the [CourseClass].
  Future<void> courseClass(
    _is.DatabaseSession session,
    RegistrationHistory registrationHistory,
    _igjwbat6.CourseClass courseClass, {
    _is.Transaction? transaction,
  }) async {
    if (registrationHistory.id == null) {
      throw ArgumentError.notNull('registrationHistory.id');
    }
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }

    var $registrationHistory = registrationHistory.copyWith(
      courseClassId: courseClass.id,
    );
    await session.db.updateRow<RegistrationHistory>(
      $registrationHistory,
      columns: [RegistrationHistory.t.courseClassId],
      transaction: transaction,
    );
  }
}
