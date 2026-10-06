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

abstract class CoursePrerequisite
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  CoursePrerequisite._({
    this.id,
    required this.courseId,
    required this.prerequisiteId,
  });

  factory CoursePrerequisite({
    _is.UuidValue? id,
    required _is.UuidValue courseId,
    required _is.UuidValue prerequisiteId,
  }) = _CoursePrerequisiteImpl;

  factory CoursePrerequisite.fromJson(Map<String, dynamic> jsonSerialization) {
    return CoursePrerequisite(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      prerequisiteId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['prerequisiteId'],
      ),
    );
  }

  static final t = CoursePrerequisiteTable();

  static const db = CoursePrerequisiteRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue courseId;

  _is.UuidValue prerequisiteId;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [CoursePrerequisite]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CoursePrerequisite copyWith({
    _is.UuidValue? id,
    _is.UuidValue? courseId,
    _is.UuidValue? prerequisiteId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CoursePrerequisite',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'prerequisiteId': prerequisiteId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CoursePrerequisite',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      'prerequisiteId': prerequisiteId.toJson(),
    };
  }

  static CoursePrerequisiteInclude include() {
    return CoursePrerequisiteInclude._();
  }

  static CoursePrerequisiteIncludeList includeList({
    _is.WhereExpressionBuilder<CoursePrerequisiteTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CoursePrerequisiteTable>? orderBy,
    _is.OrderByListBuilder<CoursePrerequisiteTable>? orderByList,
    CoursePrerequisiteInclude? include,
  }) {
    return CoursePrerequisiteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CoursePrerequisite.t),
      orderByList: orderByList?.call(CoursePrerequisite.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CoursePrerequisiteImpl extends CoursePrerequisite {
  _CoursePrerequisiteImpl({
    _is.UuidValue? id,
    required _is.UuidValue courseId,
    required _is.UuidValue prerequisiteId,
  }) : super._(
         id: id,
         courseId: courseId,
         prerequisiteId: prerequisiteId,
       );

  /// Returns a shallow copy of this [CoursePrerequisite]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CoursePrerequisite copyWith({
    Object? id = _Undefined,
    _is.UuidValue? courseId,
    _is.UuidValue? prerequisiteId,
  }) {
    return CoursePrerequisite(
      id: id is _is.UuidValue? ? id : this.id,
      courseId: courseId ?? this.courseId,
      prerequisiteId: prerequisiteId ?? this.prerequisiteId,
    );
  }
}

class CoursePrerequisiteUpdateTable
    extends _is.UpdateTable<CoursePrerequisiteTable> {
  CoursePrerequisiteUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.courseId,
        value,
      );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> prerequisiteId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.prerequisiteId,
    value,
  );
}

class CoursePrerequisiteTable extends _is.Table<_is.UuidValue?> {
  CoursePrerequisiteTable({super.tableRelation})
    : super(tableName: 'course_prerequisites') {
    updateTable = CoursePrerequisiteUpdateTable(this);
    courseId = _is.ColumnUuid(
      'courseId',
      this,
    );
    prerequisiteId = _is.ColumnUuid(
      'prerequisiteId',
      this,
    );
  }

  late final CoursePrerequisiteUpdateTable updateTable;

  late final _is.ColumnUuid courseId;

  late final _is.ColumnUuid prerequisiteId;

  @override
  List<_is.Column> get columns => [
    id,
    courseId,
    prerequisiteId,
  ];
}

class CoursePrerequisiteInclude extends _is.IncludeObject {
  CoursePrerequisiteInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue?> get table => CoursePrerequisite.t;
}

class CoursePrerequisiteIncludeList extends _is.IncludeList {
  CoursePrerequisiteIncludeList._({
    _is.WhereExpressionBuilder<CoursePrerequisiteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CoursePrerequisite.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => CoursePrerequisite.t;
}

class CoursePrerequisiteRepository {
  const CoursePrerequisiteRepository._();

  /// Returns a list of [CoursePrerequisite]s matching the given query parameters.
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
  Future<List<CoursePrerequisite>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CoursePrerequisiteTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CoursePrerequisiteTable>? orderBy,
    _is.OrderByListBuilder<CoursePrerequisiteTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CoursePrerequisite>(
      where: where?.call(CoursePrerequisite.t),
      orderBy: orderBy?.call(CoursePrerequisite.t),
      orderByList: orderByList?.call(CoursePrerequisite.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CoursePrerequisite] matching the given query parameters.
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
  Future<CoursePrerequisite?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CoursePrerequisiteTable>? where,
    int? offset,
    _is.OrderByBuilder<CoursePrerequisiteTable>? orderBy,
    _is.OrderByListBuilder<CoursePrerequisiteTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CoursePrerequisite>(
      where: where?.call(CoursePrerequisite.t),
      orderBy: orderBy?.call(CoursePrerequisite.t),
      orderByList: orderByList?.call(CoursePrerequisite.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CoursePrerequisite] by its [id] or null if no such row exists.
  Future<CoursePrerequisite?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CoursePrerequisite>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CoursePrerequisite]s in the list and returns the inserted rows.
  ///
  /// The returned [CoursePrerequisite]s will have their `id` fields set.
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
  Future<List<CoursePrerequisite>> insert(
    _is.DatabaseSession session,
    List<CoursePrerequisite> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CoursePrerequisite>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CoursePrerequisite] and returns the inserted row.
  ///
  /// The returned [CoursePrerequisite] will have its `id` field set.
  Future<CoursePrerequisite> insertRow(
    _is.DatabaseSession session,
    CoursePrerequisite row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CoursePrerequisite>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CoursePrerequisite]s in the list and returns the resulting rows.
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
  /// The returned [CoursePrerequisite]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CoursePrerequisite>> upsert(
    _is.DatabaseSession session,
    List<CoursePrerequisite> rows, {
    required _is.ColumnSelections<CoursePrerequisiteTable> conflictColumns,
    _is.ColumnSelections<CoursePrerequisiteTable>? updateColumns,
    _is.WhereExpressionBuilder<CoursePrerequisiteTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CoursePrerequisite>(
      rows,
      conflictColumns: conflictColumns(CoursePrerequisite.t),
      updateColumns: updateColumns?.call(CoursePrerequisite.t),
      updateWhere: updateWhere?.call(CoursePrerequisite.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CoursePrerequisite] and returns the resulting row.
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
  /// The returned [CoursePrerequisite] will have its `id` field set.
  Future<CoursePrerequisite?> upsertRow(
    _is.DatabaseSession session,
    CoursePrerequisite row, {
    required _is.ColumnSelections<CoursePrerequisiteTable> conflictColumns,
    _is.ColumnSelections<CoursePrerequisiteTable>? updateColumns,
    _is.WhereExpressionBuilder<CoursePrerequisiteTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CoursePrerequisite>(
      row,
      conflictColumns: conflictColumns(CoursePrerequisite.t),
      updateColumns: updateColumns?.call(CoursePrerequisite.t),
      updateWhere: updateWhere?.call(CoursePrerequisite.t),
      transaction: transaction,
    );
  }

  /// Updates all [CoursePrerequisite]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CoursePrerequisite>> update(
    _is.DatabaseSession session,
    List<CoursePrerequisite> rows, {
    _is.ColumnSelections<CoursePrerequisiteTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CoursePrerequisite>(
      rows,
      columns: columns?.call(CoursePrerequisite.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CoursePrerequisite]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CoursePrerequisite> updateRow(
    _is.DatabaseSession session,
    CoursePrerequisite row, {
    _is.ColumnSelections<CoursePrerequisiteTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CoursePrerequisite>(
      row,
      columns: columns?.call(CoursePrerequisite.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CoursePrerequisite] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CoursePrerequisite?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<CoursePrerequisiteUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CoursePrerequisite>(
      id,
      columnValues: columnValues(CoursePrerequisite.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CoursePrerequisite]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CoursePrerequisite>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CoursePrerequisiteUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<CoursePrerequisiteTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CoursePrerequisiteTable>? orderBy,
    _is.OrderByListBuilder<CoursePrerequisiteTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CoursePrerequisite>(
      columnValues: columnValues(CoursePrerequisite.t.updateTable),
      where: where(CoursePrerequisite.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CoursePrerequisite.t),
      orderByList: orderByList?.call(CoursePrerequisite.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CoursePrerequisite]s in the list and returns the deleted rows.
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
  Future<List<CoursePrerequisite>> delete(
    _is.DatabaseSession session,
    List<CoursePrerequisite> rows, {
    _is.OrderByBuilder<CoursePrerequisiteTable>? orderBy,
    _is.OrderByListBuilder<CoursePrerequisiteTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CoursePrerequisite>(
      rows,
      orderBy: orderBy?.call(CoursePrerequisite.t),
      orderByList: orderByList?.call(CoursePrerequisite.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CoursePrerequisite].
  Future<CoursePrerequisite> deleteRow(
    _is.DatabaseSession session,
    CoursePrerequisite row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CoursePrerequisite>(
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
  Future<List<CoursePrerequisite>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CoursePrerequisiteTable> where,
    _is.OrderByBuilder<CoursePrerequisiteTable>? orderBy,
    _is.OrderByListBuilder<CoursePrerequisiteTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CoursePrerequisite>(
      where: where(CoursePrerequisite.t),
      orderBy: orderBy?.call(CoursePrerequisite.t),
      orderByList: orderByList?.call(CoursePrerequisite.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CoursePrerequisiteTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CoursePrerequisite>(
      where: where?.call(CoursePrerequisite.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CoursePrerequisite] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CoursePrerequisiteTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CoursePrerequisite>(
      where: where(CoursePrerequisite.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
