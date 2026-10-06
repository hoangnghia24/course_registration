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

abstract class CourseEquivalent
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  CourseEquivalent._({
    this.id,
    required this.courseId,
    required this.equivalentId,
  });

  factory CourseEquivalent({
    _is.UuidValue? id,
    required _is.UuidValue courseId,
    required _is.UuidValue equivalentId,
  }) = _CourseEquivalentImpl;

  factory CourseEquivalent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseEquivalent(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      equivalentId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['equivalentId'],
      ),
    );
  }

  static final t = CourseEquivalentTable();

  static const db = CourseEquivalentRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue courseId;

  _is.UuidValue equivalentId;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [CourseEquivalent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CourseEquivalent copyWith({
    _is.UuidValue? id,
    _is.UuidValue? courseId,
    _is.UuidValue? equivalentId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseEquivalent',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'equivalentId': equivalentId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseEquivalent',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'equivalentId': equivalentId.toJson(),
    };
  }

  static CourseEquivalentInclude include() {
    return CourseEquivalentInclude._();
  }

  static CourseEquivalentIncludeList includeList({
    _is.WhereExpressionBuilder<CourseEquivalentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseEquivalentTable>? orderBy,
    _is.OrderByListBuilder<CourseEquivalentTable>? orderByList,
    CourseEquivalentInclude? include,
  }) {
    return CourseEquivalentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseEquivalent.t),
      orderByList: orderByList?.call(CourseEquivalent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseEquivalentImpl extends CourseEquivalent {
  _CourseEquivalentImpl({
    _is.UuidValue? id,
    required _is.UuidValue courseId,
    required _is.UuidValue equivalentId,
  }) : super._(
         id: id,
         courseId: courseId,
         equivalentId: equivalentId,
       );

  /// Returns a shallow copy of this [CourseEquivalent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CourseEquivalent copyWith({
    Object? id = _Undefined,
    _is.UuidValue? courseId,
    _is.UuidValue? equivalentId,
  }) {
    return CourseEquivalent(
      id: id is _is.UuidValue? ? id : this.id,
      courseId: courseId ?? this.courseId,
      equivalentId: equivalentId ?? this.equivalentId,
    );
  }
}

class CourseEquivalentUpdateTable
    extends _is.UpdateTable<CourseEquivalentTable> {
  CourseEquivalentUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.courseId,
        value,
      );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> equivalentId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.equivalentId,
    value,
  );
}

class CourseEquivalentTable extends _is.Table<_is.UuidValue?> {
  CourseEquivalentTable({super.tableRelation})
    : super(tableName: 'course_equivalents') {
    updateTable = CourseEquivalentUpdateTable(this);
    courseId = _is.ColumnUuid(
      'courseId',
      this,
    );
    equivalentId = _is.ColumnUuid(
      'equivalentId',
      this,
    );
  }

  late final CourseEquivalentUpdateTable updateTable;

  late final _is.ColumnUuid courseId;

  late final _is.ColumnUuid equivalentId;

  @override
  List<_is.Column> get columns => [
    id,
    courseId,
    equivalentId,
  ];
}

class CourseEquivalentInclude extends _is.IncludeObject {
  CourseEquivalentInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue?> get table => CourseEquivalent.t;
}

class CourseEquivalentIncludeList extends _is.IncludeList {
  CourseEquivalentIncludeList._({
    _is.WhereExpressionBuilder<CourseEquivalentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CourseEquivalent.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => CourseEquivalent.t;
}

class CourseEquivalentRepository {
  const CourseEquivalentRepository._();

  /// Returns a list of [CourseEquivalent]s matching the given query parameters.
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
  Future<List<CourseEquivalent>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseEquivalentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseEquivalentTable>? orderBy,
    _is.OrderByListBuilder<CourseEquivalentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CourseEquivalent>(
      where: where?.call(CourseEquivalent.t),
      orderBy: orderBy?.call(CourseEquivalent.t),
      orderByList: orderByList?.call(CourseEquivalent.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CourseEquivalent] matching the given query parameters.
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
  Future<CourseEquivalent?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseEquivalentTable>? where,
    int? offset,
    _is.OrderByBuilder<CourseEquivalentTable>? orderBy,
    _is.OrderByListBuilder<CourseEquivalentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CourseEquivalent>(
      where: where?.call(CourseEquivalent.t),
      orderBy: orderBy?.call(CourseEquivalent.t),
      orderByList: orderByList?.call(CourseEquivalent.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CourseEquivalent] by its [id] or null if no such row exists.
  Future<CourseEquivalent?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CourseEquivalent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CourseEquivalent]s in the list and returns the inserted rows.
  ///
  /// The returned [CourseEquivalent]s will have their `id` fields set.
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
  Future<List<CourseEquivalent>> insert(
    _is.DatabaseSession session,
    List<CourseEquivalent> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CourseEquivalent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CourseEquivalent] and returns the inserted row.
  ///
  /// The returned [CourseEquivalent] will have its `id` field set.
  Future<CourseEquivalent> insertRow(
    _is.DatabaseSession session,
    CourseEquivalent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CourseEquivalent>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CourseEquivalent]s in the list and returns the resulting rows.
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
  /// The returned [CourseEquivalent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseEquivalent>> upsert(
    _is.DatabaseSession session,
    List<CourseEquivalent> rows, {
    required _is.ColumnSelections<CourseEquivalentTable> conflictColumns,
    _is.ColumnSelections<CourseEquivalentTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseEquivalentTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CourseEquivalent>(
      rows,
      conflictColumns: conflictColumns(CourseEquivalent.t),
      updateColumns: updateColumns?.call(CourseEquivalent.t),
      updateWhere: updateWhere?.call(CourseEquivalent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CourseEquivalent] and returns the resulting row.
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
  /// The returned [CourseEquivalent] will have its `id` field set.
  Future<CourseEquivalent?> upsertRow(
    _is.DatabaseSession session,
    CourseEquivalent row, {
    required _is.ColumnSelections<CourseEquivalentTable> conflictColumns,
    _is.ColumnSelections<CourseEquivalentTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseEquivalentTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CourseEquivalent>(
      row,
      conflictColumns: conflictColumns(CourseEquivalent.t),
      updateColumns: updateColumns?.call(CourseEquivalent.t),
      updateWhere: updateWhere?.call(CourseEquivalent.t),
      transaction: transaction,
    );
  }

  /// Updates all [CourseEquivalent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseEquivalent>> update(
    _is.DatabaseSession session,
    List<CourseEquivalent> rows, {
    _is.ColumnSelections<CourseEquivalentTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CourseEquivalent>(
      rows,
      columns: columns?.call(CourseEquivalent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CourseEquivalent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CourseEquivalent> updateRow(
    _is.DatabaseSession session,
    CourseEquivalent row, {
    _is.ColumnSelections<CourseEquivalentTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CourseEquivalent>(
      row,
      columns: columns?.call(CourseEquivalent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CourseEquivalent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CourseEquivalent?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<CourseEquivalentUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CourseEquivalent>(
      id,
      columnValues: columnValues(CourseEquivalent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CourseEquivalent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseEquivalent>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CourseEquivalentUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<CourseEquivalentTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseEquivalentTable>? orderBy,
    _is.OrderByListBuilder<CourseEquivalentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CourseEquivalent>(
      columnValues: columnValues(CourseEquivalent.t.updateTable),
      where: where(CourseEquivalent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseEquivalent.t),
      orderByList: orderByList?.call(CourseEquivalent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CourseEquivalent]s in the list and returns the deleted rows.
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
  Future<List<CourseEquivalent>> delete(
    _is.DatabaseSession session,
    List<CourseEquivalent> rows, {
    _is.OrderByBuilder<CourseEquivalentTable>? orderBy,
    _is.OrderByListBuilder<CourseEquivalentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CourseEquivalent>(
      rows,
      orderBy: orderBy?.call(CourseEquivalent.t),
      orderByList: orderByList?.call(CourseEquivalent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CourseEquivalent].
  Future<CourseEquivalent> deleteRow(
    _is.DatabaseSession session,
    CourseEquivalent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CourseEquivalent>(
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
  Future<List<CourseEquivalent>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseEquivalentTable> where,
    _is.OrderByBuilder<CourseEquivalentTable>? orderBy,
    _is.OrderByListBuilder<CourseEquivalentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CourseEquivalent>(
      where: where(CourseEquivalent.t),
      orderBy: orderBy?.call(CourseEquivalent.t),
      orderByList: orderByList?.call(CourseEquivalent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseEquivalentTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CourseEquivalent>(
      where: where?.call(CourseEquivalent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CourseEquivalent] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseEquivalentTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CourseEquivalent>(
      where: where(CourseEquivalent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
