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

abstract class Faculty
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Faculty._({
    this.id,
    required this.name,
    required this.code,
    this.description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Faculty({
    _is.UuidValue? id,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FacultyImpl;

  factory Faculty.fromJson(Map<String, dynamic> jsonSerialization) {
    return Faculty(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      description: jsonSerialization['description'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = FacultyTable();

  static const db = FacultyRepository._();

  @override
  _is.UuidValue? id;

  String name;

  String code;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Faculty]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Faculty copyWith({
    _is.UuidValue? id,
    String? name,
    String? code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Faculty',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'code': code,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Faculty',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'code': code,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static FacultyInclude include() {
    return FacultyInclude._();
  }

  static FacultyIncludeList includeList({
    _is.WhereExpressionBuilder<FacultyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FacultyTable>? orderBy,
    _is.OrderByListBuilder<FacultyTable>? orderByList,
    FacultyInclude? include,
  }) {
    return FacultyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Faculty.t),
      orderByList: orderByList?.call(Faculty.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FacultyImpl extends Faculty {
  _FacultyImpl({
    _is.UuidValue? id,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         code: code,
         description: description,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Faculty]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Faculty copyWith({
    Object? id = _Undefined,
    String? name,
    String? code,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Faculty(
      id: id is _is.UuidValue? ? id : this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class FacultyUpdateTable extends _is.UpdateTable<FacultyTable> {
  FacultyUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> code(String value) => _is.ColumnValue(
    table.code,
    value,
  );

  _is.ColumnValue<String, String> description(String? value) => _is.ColumnValue(
    table.description,
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

class FacultyTable extends _is.Table<_is.UuidValue?> {
  FacultyTable({super.tableRelation}) : super(tableName: 'faculties') {
    updateTable = FacultyUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    code = _is.ColumnString(
      'code',
      this,
    );
    description = _is.ColumnString(
      'description',
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

  late final FacultyUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString code;

  late final _is.ColumnString description;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    code,
    description,
    createdAt,
    updatedAt,
  ];
}

class FacultyInclude extends _is.IncludeObject {
  FacultyInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue?> get table => Faculty.t;
}

class FacultyIncludeList extends _is.IncludeList {
  FacultyIncludeList._({
    _is.WhereExpressionBuilder<FacultyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Faculty.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Faculty.t;
}

class FacultyRepository {
  const FacultyRepository._();

  /// Returns a list of [Faculty]s matching the given query parameters.
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
  Future<List<Faculty>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FacultyTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FacultyTable>? orderBy,
    _is.OrderByListBuilder<FacultyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Faculty>(
      where: where?.call(Faculty.t),
      orderBy: orderBy?.call(Faculty.t),
      orderByList: orderByList?.call(Faculty.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Faculty] matching the given query parameters.
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
  Future<Faculty?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FacultyTable>? where,
    int? offset,
    _is.OrderByBuilder<FacultyTable>? orderBy,
    _is.OrderByListBuilder<FacultyTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Faculty>(
      where: where?.call(Faculty.t),
      orderBy: orderBy?.call(Faculty.t),
      orderByList: orderByList?.call(Faculty.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Faculty] by its [id] or null if no such row exists.
  Future<Faculty?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Faculty>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Faculty]s in the list and returns the inserted rows.
  ///
  /// The returned [Faculty]s will have their `id` fields set.
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
  Future<List<Faculty>> insert(
    _is.DatabaseSession session,
    List<Faculty> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Faculty>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Faculty] and returns the inserted row.
  ///
  /// The returned [Faculty] will have its `id` field set.
  Future<Faculty> insertRow(
    _is.DatabaseSession session,
    Faculty row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Faculty>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Faculty]s in the list and returns the resulting rows.
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
  /// The returned [Faculty]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Faculty>> upsert(
    _is.DatabaseSession session,
    List<Faculty> rows, {
    required _is.ColumnSelections<FacultyTable> conflictColumns,
    _is.ColumnSelections<FacultyTable>? updateColumns,
    _is.WhereExpressionBuilder<FacultyTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Faculty>(
      rows,
      conflictColumns: conflictColumns(Faculty.t),
      updateColumns: updateColumns?.call(Faculty.t),
      updateWhere: updateWhere?.call(Faculty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Faculty] and returns the resulting row.
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
  /// The returned [Faculty] will have its `id` field set.
  Future<Faculty?> upsertRow(
    _is.DatabaseSession session,
    Faculty row, {
    required _is.ColumnSelections<FacultyTable> conflictColumns,
    _is.ColumnSelections<FacultyTable>? updateColumns,
    _is.WhereExpressionBuilder<FacultyTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Faculty>(
      row,
      conflictColumns: conflictColumns(Faculty.t),
      updateColumns: updateColumns?.call(Faculty.t),
      updateWhere: updateWhere?.call(Faculty.t),
      transaction: transaction,
    );
  }

  /// Updates all [Faculty]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Faculty>> update(
    _is.DatabaseSession session,
    List<Faculty> rows, {
    _is.ColumnSelections<FacultyTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Faculty>(
      rows,
      columns: columns?.call(Faculty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Faculty]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Faculty> updateRow(
    _is.DatabaseSession session,
    Faculty row, {
    _is.ColumnSelections<FacultyTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Faculty>(
      row,
      columns: columns?.call(Faculty.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Faculty] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Faculty?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<FacultyUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Faculty>(
      id,
      columnValues: columnValues(Faculty.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Faculty]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Faculty>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<FacultyUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<FacultyTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FacultyTable>? orderBy,
    _is.OrderByListBuilder<FacultyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Faculty>(
      columnValues: columnValues(Faculty.t.updateTable),
      where: where(Faculty.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Faculty.t),
      orderByList: orderByList?.call(Faculty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Faculty]s in the list and returns the deleted rows.
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
  Future<List<Faculty>> delete(
    _is.DatabaseSession session,
    List<Faculty> rows, {
    _is.OrderByBuilder<FacultyTable>? orderBy,
    _is.OrderByListBuilder<FacultyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Faculty>(
      rows,
      orderBy: orderBy?.call(Faculty.t),
      orderByList: orderByList?.call(Faculty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Faculty].
  Future<Faculty> deleteRow(
    _is.DatabaseSession session,
    Faculty row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Faculty>(
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
  Future<List<Faculty>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FacultyTable> where,
    _is.OrderByBuilder<FacultyTable>? orderBy,
    _is.OrderByListBuilder<FacultyTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Faculty>(
      where: where(Faculty.t),
      orderBy: orderBy?.call(Faculty.t),
      orderByList: orderByList?.call(Faculty.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FacultyTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Faculty>(
      where: where?.call(Faculty.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Faculty] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FacultyTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Faculty>(
      where: where(Faculty.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
