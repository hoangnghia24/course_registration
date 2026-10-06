/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _is;
import '../../registration/models/semester_status.dart' as _igaolepu;

abstract class Semester
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Semester._({
    this.id,
    required this.name,
    required this.academicYear,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory Semester({
    _is.UuidValue? id,
    required String name,
    required int academicYear,
    required DateTime startDate,
    required DateTime endDate,
    required _igaolepu.SemesterStatus status,
  }) = _SemesterImpl;

  factory Semester.fromJson(Map<String, dynamic> jsonSerialization) {
    return Semester(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      academicYear: jsonSerialization['academicYear'] as int,
      startDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['startDate'],
      ),
      endDate: _is.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      status: _igaolepu.SemesterStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
    );
  }

  static final t = SemesterTable();

  static const db = SemesterRepository._();

  @override
  _is.UuidValue? id;

  String name;

  int academicYear;

  DateTime startDate;

  DateTime endDate;

  _igaolepu.SemesterStatus status;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Semester]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Semester copyWith({
    _is.UuidValue? id,
    String? name,
    int? academicYear,
    DateTime? startDate,
    DateTime? endDate,
    _igaolepu.SemesterStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Semester',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'academicYear': academicYear,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Semester',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'academicYear': academicYear,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'status': status.toJson(),
    };
  }

  static SemesterInclude include() {
    return SemesterInclude._();
  }

  static SemesterIncludeList includeList({
    _is.WhereExpressionBuilder<SemesterTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SemesterTable>? orderBy,
    _is.OrderByListBuilder<SemesterTable>? orderByList,
    SemesterInclude? include,
  }) {
    return SemesterIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Semester.t),
      orderByList: orderByList?.call(Semester.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SemesterImpl extends Semester {
  _SemesterImpl({
    _is.UuidValue? id,
    required String name,
    required int academicYear,
    required DateTime startDate,
    required DateTime endDate,
    required _igaolepu.SemesterStatus status,
  }) : super._(
         id: id,
         name: name,
         academicYear: academicYear,
         startDate: startDate,
         endDate: endDate,
         status: status,
       );

  /// Returns a shallow copy of this [Semester]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Semester copyWith({
    Object? id = _Undefined,
    String? name,
    int? academicYear,
    DateTime? startDate,
    DateTime? endDate,
    _igaolepu.SemesterStatus? status,
  }) {
    return Semester(
      id: id is _is.UuidValue? ? id : this.id,
      name: name ?? this.name,
      academicYear: academicYear ?? this.academicYear,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
    );
  }
}

class SemesterUpdateTable extends _is.UpdateTable<SemesterTable> {
  SemesterUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<int, int> academicYear(int value) => _is.ColumnValue(
    table.academicYear,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> startDate(DateTime value) =>
      _is.ColumnValue(
        table.startDate,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> endDate(DateTime value) =>
      _is.ColumnValue(
        table.endDate,
        value,
      );

  _is.ColumnValue<_igaolepu.SemesterStatus, _igaolepu.SemesterStatus> status(
    _igaolepu.SemesterStatus value,
  ) => _is.ColumnValue(
    table.status,
    value,
  );
}

class SemesterTable extends _is.Table<_is.UuidValue?> {
  SemesterTable({super.tableRelation}) : super(tableName: 'semesters') {
    updateTable = SemesterUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    academicYear = _is.ColumnInt(
      'academicYear',
      this,
    );
    startDate = _is.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _is.ColumnDateTime(
      'endDate',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
  }

  late final SemesterUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnInt academicYear;

  late final _is.ColumnDateTime startDate;

  late final _is.ColumnDateTime endDate;

  late final _is.ColumnEnum<_igaolepu.SemesterStatus> status;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    academicYear,
    startDate,
    endDate,
    status,
  ];
}

class SemesterInclude extends _is.IncludeObject {
  SemesterInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue?> get table => Semester.t;
}

class SemesterIncludeList extends _is.IncludeList {
  SemesterIncludeList._({
    _is.WhereExpressionBuilder<SemesterTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Semester.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Semester.t;
}

class SemesterRepository {
  const SemesterRepository._();

  /// Returns a list of [Semester]s matching the given query parameters.
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
  Future<List<Semester>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SemesterTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SemesterTable>? orderBy,
    _is.OrderByListBuilder<SemesterTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Semester>(
      where: where?.call(Semester.t),
      orderBy: orderBy?.call(Semester.t),
      orderByList: orderByList?.call(Semester.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Semester] matching the given query parameters.
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
  Future<Semester?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SemesterTable>? where,
    int? offset,
    _is.OrderByBuilder<SemesterTable>? orderBy,
    _is.OrderByListBuilder<SemesterTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Semester>(
      where: where?.call(Semester.t),
      orderBy: orderBy?.call(Semester.t),
      orderByList: orderByList?.call(Semester.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Semester] by its [id] or null if no such row exists.
  Future<Semester?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Semester>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Semester]s in the list and returns the inserted rows.
  ///
  /// The returned [Semester]s will have their `id` fields set.
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
  Future<List<Semester>> insert(
    _is.DatabaseSession session,
    List<Semester> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Semester>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Semester] and returns the inserted row.
  ///
  /// The returned [Semester] will have its `id` field set.
  Future<Semester> insertRow(
    _is.DatabaseSession session,
    Semester row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Semester>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Semester]s in the list and returns the resulting rows.
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
  /// The returned [Semester]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Semester>> upsert(
    _is.DatabaseSession session,
    List<Semester> rows, {
    required _is.ColumnSelections<SemesterTable> conflictColumns,
    _is.ColumnSelections<SemesterTable>? updateColumns,
    _is.WhereExpressionBuilder<SemesterTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Semester>(
      rows,
      conflictColumns: conflictColumns(Semester.t),
      updateColumns: updateColumns?.call(Semester.t),
      updateWhere: updateWhere?.call(Semester.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Semester] and returns the resulting row.
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
  /// The returned [Semester] will have its `id` field set.
  Future<Semester?> upsertRow(
    _is.DatabaseSession session,
    Semester row, {
    required _is.ColumnSelections<SemesterTable> conflictColumns,
    _is.ColumnSelections<SemesterTable>? updateColumns,
    _is.WhereExpressionBuilder<SemesterTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Semester>(
      row,
      conflictColumns: conflictColumns(Semester.t),
      updateColumns: updateColumns?.call(Semester.t),
      updateWhere: updateWhere?.call(Semester.t),
      transaction: transaction,
    );
  }

  /// Updates all [Semester]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Semester>> update(
    _is.DatabaseSession session,
    List<Semester> rows, {
    _is.ColumnSelections<SemesterTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Semester>(
      rows,
      columns: columns?.call(Semester.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Semester]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Semester> updateRow(
    _is.DatabaseSession session,
    Semester row, {
    _is.ColumnSelections<SemesterTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Semester>(
      row,
      columns: columns?.call(Semester.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Semester] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Semester?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<SemesterUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Semester>(
      id,
      columnValues: columnValues(Semester.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Semester]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Semester>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SemesterUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SemesterTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SemesterTable>? orderBy,
    _is.OrderByListBuilder<SemesterTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Semester>(
      columnValues: columnValues(Semester.t.updateTable),
      where: where(Semester.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Semester.t),
      orderByList: orderByList?.call(Semester.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Semester]s in the list and returns the deleted rows.
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
  Future<List<Semester>> delete(
    _is.DatabaseSession session,
    List<Semester> rows, {
    _is.OrderByBuilder<SemesterTable>? orderBy,
    _is.OrderByListBuilder<SemesterTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Semester>(
      rows,
      orderBy: orderBy?.call(Semester.t),
      orderByList: orderByList?.call(Semester.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Semester].
  Future<Semester> deleteRow(
    _is.DatabaseSession session,
    Semester row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Semester>(
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
  Future<List<Semester>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SemesterTable> where,
    _is.OrderByBuilder<SemesterTable>? orderBy,
    _is.OrderByListBuilder<SemesterTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Semester>(
      where: where(Semester.t),
      orderBy: orderBy?.call(Semester.t),
      orderByList: orderByList?.call(Semester.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SemesterTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Semester>(
      where: where?.call(Semester.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Semester] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SemesterTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Semester>(
      where: where(Semester.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
