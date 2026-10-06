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
import '../../lecturer.dart' as _ismqsd72;
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class LecturerCourseClass
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  LecturerCourseClass._({
    this.id,
    required this.lecturerId,
    this.lecturer,
    required this.courseClassId,
    this.courseClass,
    DateTime? assignedAt,
  }) : assignedAt = assignedAt ?? DateTime.now();

  factory LecturerCourseClass({
    _is.UuidValue? id,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? assignedAt,
  }) = _LecturerCourseClassImpl;

  factory LecturerCourseClass.fromJson(Map<String, dynamic> jsonSerialization) {
    return LecturerCourseClass(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      lecturerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      assignedAt: jsonSerialization['assignedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['assignedAt']),
    );
  }

  static final t = LecturerCourseClassTable();

  static const db = LecturerCourseClassRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  _is.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  DateTime assignedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [LecturerCourseClass]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  LecturerCourseClass copyWith({
    _is.UuidValue? id,
    _is.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    _is.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? assignedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LecturerCourseClass',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'assignedAt': assignedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LecturerCourseClass',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'assignedAt': assignedAt.toJson(),
    };
  }

  static LecturerCourseClassInclude include({
    _ismqsd72.LecturerInclude? lecturer,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    return LecturerCourseClassInclude._(
      lecturer: lecturer,
      courseClass: courseClass,
    );
  }

  static LecturerCourseClassIncludeList includeList({
    _is.WhereExpressionBuilder<LecturerCourseClassTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerCourseClassTable>? orderBy,
    _is.OrderByListBuilder<LecturerCourseClassTable>? orderByList,
    LecturerCourseClassInclude? include,
  }) {
    return LecturerCourseClassIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LecturerCourseClass.t),
      orderByList: orderByList?.call(LecturerCourseClass.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerCourseClassImpl extends LecturerCourseClass {
  _LecturerCourseClassImpl({
    _is.UuidValue? id,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? assignedAt,
  }) : super._(
         id: id,
         lecturerId: lecturerId,
         lecturer: lecturer,
         courseClassId: courseClassId,
         courseClass: courseClass,
         assignedAt: assignedAt,
       );

  /// Returns a shallow copy of this [LecturerCourseClass]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  LecturerCourseClass copyWith({
    Object? id = _Undefined,
    _is.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    _is.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    DateTime? assignedAt,
  }) {
    return LecturerCourseClass(
      id: id is _is.UuidValue? ? id : this.id,
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      assignedAt: assignedAt ?? this.assignedAt,
    );
  }
}

class LecturerCourseClassUpdateTable
    extends _is.UpdateTable<LecturerCourseClassTable> {
  LecturerCourseClassUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> lecturerId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.lecturerId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseClassId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.courseClassId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> assignedAt(DateTime value) =>
      _is.ColumnValue(
        table.assignedAt,
        value,
      );
}

class LecturerCourseClassTable extends _is.Table<_is.UuidValue?> {
  LecturerCourseClassTable({super.tableRelation})
    : super(tableName: 'lecturer_course_classes') {
    updateTable = LecturerCourseClassUpdateTable(this);
    lecturerId = _is.ColumnUuid(
      'lecturerId',
      this,
    );
    courseClassId = _is.ColumnUuid(
      'courseClassId',
      this,
    );
    assignedAt = _is.ColumnDateTime(
      'assignedAt',
      this,
      hasDefault: true,
    );
  }

  late final LecturerCourseClassUpdateTable updateTable;

  late final _is.ColumnUuid lecturerId;

  _ismqsd72.LecturerTable? _lecturer;

  late final _is.ColumnUuid courseClassId;

  _igjwbat6.CourseClassTable? _courseClass;

  late final _is.ColumnDateTime assignedAt;

  _ismqsd72.LecturerTable get lecturer {
    if (_lecturer != null) return _lecturer!;
    _lecturer = _is.createRelationTable(
      relationFieldName: 'lecturer',
      field: LecturerCourseClass.t.lecturerId,
      foreignField: _ismqsd72.Lecturer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ismqsd72.LecturerTable(tableRelation: foreignTableRelation),
    );
    return _lecturer!;
  }

  _igjwbat6.CourseClassTable get courseClass {
    if (_courseClass != null) return _courseClass!;
    _courseClass = _is.createRelationTable(
      relationFieldName: 'courseClass',
      field: LecturerCourseClass.t.courseClassId,
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
    lecturerId,
    courseClassId,
    assignedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'lecturer') {
      return lecturer;
    }
    if (relationField == 'courseClass') {
      return courseClass;
    }
    return null;
  }
}

class LecturerCourseClassInclude extends _is.IncludeObject {
  LecturerCourseClassInclude._({
    _ismqsd72.LecturerInclude? lecturer,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    _lecturer = lecturer;
    _courseClass = courseClass;
  }

  _ismqsd72.LecturerInclude? _lecturer;

  _igjwbat6.CourseClassInclude? _courseClass;

  @override
  Map<String, _is.Include?> get includes => {
    'lecturer': _lecturer,
    'courseClass': _courseClass,
  };

  @override
  _is.Table<_is.UuidValue?> get table => LecturerCourseClass.t;
}

class LecturerCourseClassIncludeList extends _is.IncludeList {
  LecturerCourseClassIncludeList._({
    _is.WhereExpressionBuilder<LecturerCourseClassTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LecturerCourseClass.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => LecturerCourseClass.t;
}

class LecturerCourseClassRepository {
  const LecturerCourseClassRepository._();

  final attachRow = const LecturerCourseClassAttachRowRepository._();

  /// Returns a list of [LecturerCourseClass]s matching the given query parameters.
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
  Future<List<LecturerCourseClass>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerCourseClassTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerCourseClassTable>? orderBy,
    _is.OrderByListBuilder<LecturerCourseClassTable>? orderByList,
    _is.Transaction? transaction,
    LecturerCourseClassInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<LecturerCourseClass>(
      where: where?.call(LecturerCourseClass.t),
      orderBy: orderBy?.call(LecturerCourseClass.t),
      orderByList: orderByList?.call(LecturerCourseClass.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [LecturerCourseClass] matching the given query parameters.
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
  Future<LecturerCourseClass?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerCourseClassTable>? where,
    int? offset,
    _is.OrderByBuilder<LecturerCourseClassTable>? orderBy,
    _is.OrderByListBuilder<LecturerCourseClassTable>? orderByList,
    _is.Transaction? transaction,
    LecturerCourseClassInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<LecturerCourseClass>(
      where: where?.call(LecturerCourseClass.t),
      orderBy: orderBy?.call(LecturerCourseClass.t),
      orderByList: orderByList?.call(LecturerCourseClass.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [LecturerCourseClass] by its [id] or null if no such row exists.
  Future<LecturerCourseClass?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    LecturerCourseClassInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<LecturerCourseClass>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [LecturerCourseClass]s in the list and returns the inserted rows.
  ///
  /// The returned [LecturerCourseClass]s will have their `id` fields set.
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
  Future<List<LecturerCourseClass>> insert(
    _is.DatabaseSession session,
    List<LecturerCourseClass> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<LecturerCourseClass>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [LecturerCourseClass] and returns the inserted row.
  ///
  /// The returned [LecturerCourseClass] will have its `id` field set.
  Future<LecturerCourseClass> insertRow(
    _is.DatabaseSession session,
    LecturerCourseClass row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<LecturerCourseClass>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [LecturerCourseClass]s in the list and returns the resulting rows.
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
  /// The returned [LecturerCourseClass]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LecturerCourseClass>> upsert(
    _is.DatabaseSession session,
    List<LecturerCourseClass> rows, {
    required _is.ColumnSelections<LecturerCourseClassTable> conflictColumns,
    _is.ColumnSelections<LecturerCourseClassTable>? updateColumns,
    _is.WhereExpressionBuilder<LecturerCourseClassTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<LecturerCourseClass>(
      rows,
      conflictColumns: conflictColumns(LecturerCourseClass.t),
      updateColumns: updateColumns?.call(LecturerCourseClass.t),
      updateWhere: updateWhere?.call(LecturerCourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [LecturerCourseClass] and returns the resulting row.
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
  /// The returned [LecturerCourseClass] will have its `id` field set.
  Future<LecturerCourseClass?> upsertRow(
    _is.DatabaseSession session,
    LecturerCourseClass row, {
    required _is.ColumnSelections<LecturerCourseClassTable> conflictColumns,
    _is.ColumnSelections<LecturerCourseClassTable>? updateColumns,
    _is.WhereExpressionBuilder<LecturerCourseClassTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<LecturerCourseClass>(
      row,
      conflictColumns: conflictColumns(LecturerCourseClass.t),
      updateColumns: updateColumns?.call(LecturerCourseClass.t),
      updateWhere: updateWhere?.call(LecturerCourseClass.t),
      transaction: transaction,
    );
  }

  /// Updates all [LecturerCourseClass]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LecturerCourseClass>> update(
    _is.DatabaseSession session,
    List<LecturerCourseClass> rows, {
    _is.ColumnSelections<LecturerCourseClassTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<LecturerCourseClass>(
      rows,
      columns: columns?.call(LecturerCourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [LecturerCourseClass]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LecturerCourseClass> updateRow(
    _is.DatabaseSession session,
    LecturerCourseClass row, {
    _is.ColumnSelections<LecturerCourseClassTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<LecturerCourseClass>(
      row,
      columns: columns?.call(LecturerCourseClass.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LecturerCourseClass] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LecturerCourseClass?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<LecturerCourseClassUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<LecturerCourseClass>(
      id,
      columnValues: columnValues(LecturerCourseClass.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LecturerCourseClass]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LecturerCourseClass>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<LecturerCourseClassUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<LecturerCourseClassTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerCourseClassTable>? orderBy,
    _is.OrderByListBuilder<LecturerCourseClassTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<LecturerCourseClass>(
      columnValues: columnValues(LecturerCourseClass.t.updateTable),
      where: where(LecturerCourseClass.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LecturerCourseClass.t),
      orderByList: orderByList?.call(LecturerCourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [LecturerCourseClass]s in the list and returns the deleted rows.
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
  Future<List<LecturerCourseClass>> delete(
    _is.DatabaseSession session,
    List<LecturerCourseClass> rows, {
    _is.OrderByBuilder<LecturerCourseClassTable>? orderBy,
    _is.OrderByListBuilder<LecturerCourseClassTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<LecturerCourseClass>(
      rows,
      orderBy: orderBy?.call(LecturerCourseClass.t),
      orderByList: orderByList?.call(LecturerCourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [LecturerCourseClass].
  Future<LecturerCourseClass> deleteRow(
    _is.DatabaseSession session,
    LecturerCourseClass row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LecturerCourseClass>(
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
  Future<List<LecturerCourseClass>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LecturerCourseClassTable> where,
    _is.OrderByBuilder<LecturerCourseClassTable>? orderBy,
    _is.OrderByListBuilder<LecturerCourseClassTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<LecturerCourseClass>(
      where: where(LecturerCourseClass.t),
      orderBy: orderBy?.call(LecturerCourseClass.t),
      orderByList: orderByList?.call(LecturerCourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerCourseClassTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<LecturerCourseClass>(
      where: where?.call(LecturerCourseClass.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [LecturerCourseClass] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LecturerCourseClassTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<LecturerCourseClass>(
      where: where(LecturerCourseClass.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class LecturerCourseClassAttachRowRepository {
  const LecturerCourseClassAttachRowRepository._();

  /// Creates a relation between the given [LecturerCourseClass] and [Lecturer]
  /// by setting the [LecturerCourseClass]'s foreign key `lecturerId` to refer to the [Lecturer].
  Future<void> lecturer(
    _is.DatabaseSession session,
    LecturerCourseClass lecturerCourseClass,
    _ismqsd72.Lecturer lecturer, {
    _is.Transaction? transaction,
  }) async {
    if (lecturerCourseClass.id == null) {
      throw ArgumentError.notNull('lecturerCourseClass.id');
    }
    if (lecturer.id == null) {
      throw ArgumentError.notNull('lecturer.id');
    }

    var $lecturerCourseClass = lecturerCourseClass.copyWith(
      lecturerId: lecturer.id,
    );
    await session.db.updateRow<LecturerCourseClass>(
      $lecturerCourseClass,
      columns: [LecturerCourseClass.t.lecturerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [LecturerCourseClass] and [CourseClass]
  /// by setting the [LecturerCourseClass]'s foreign key `courseClassId` to refer to the [CourseClass].
  Future<void> courseClass(
    _is.DatabaseSession session,
    LecturerCourseClass lecturerCourseClass,
    _igjwbat6.CourseClass courseClass, {
    _is.Transaction? transaction,
  }) async {
    if (lecturerCourseClass.id == null) {
      throw ArgumentError.notNull('lecturerCourseClass.id');
    }
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }

    var $lecturerCourseClass = lecturerCourseClass.copyWith(
      courseClassId: courseClass.id,
    );
    await session.db.updateRow<LecturerCourseClass>(
      $lecturerCourseClass,
      columns: [LecturerCourseClass.t.courseClassId],
      transaction: transaction,
    );
  }
}
