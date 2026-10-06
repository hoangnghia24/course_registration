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
import '../../sync/models/sync_operation_status.dart' as _i9saic36;

abstract class SyncLog
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  SyncLog._({
    this.id,
    required this.operationId,
    required this.action,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.errorCode,
    this.errorMessage,
  });

  factory SyncLog({
    _is.UuidValue? id,
    required _is.UuidValue operationId,
    required String action,
    required _i9saic36.SyncOperationStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? errorCode,
    String? errorMessage,
  }) = _SyncLogImpl;

  factory SyncLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return SyncLog(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      operationId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['operationId'],
      ),
      action: jsonSerialization['action'] as String,
      status: _i9saic36.SyncOperationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      startedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      errorCode: jsonSerialization['errorCode'] as String?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
    );
  }

  static final t = SyncLogTable();

  static const db = SyncLogRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue operationId;

  String action;

  _i9saic36.SyncOperationStatus status;

  DateTime startedAt;

  DateTime? completedAt;

  String? errorCode;

  String? errorMessage;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [SyncLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SyncLog copyWith({
    _is.UuidValue? id,
    _is.UuidValue? operationId,
    String? action,
    _i9saic36.SyncOperationStatus? status,
    DateTime? startedAt,
    DateTime? completedAt,
    String? errorCode,
    String? errorMessage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncLog',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'action': action,
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncLog',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'action': action,
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  static SyncLogInclude include() {
    return SyncLogInclude._();
  }

  static SyncLogIncludeList includeList({
    _is.WhereExpressionBuilder<SyncLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SyncLogTable>? orderBy,
    _is.OrderByListBuilder<SyncLogTable>? orderByList,
    SyncLogInclude? include,
  }) {
    return SyncLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SyncLog.t),
      orderByList: orderByList?.call(SyncLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncLogImpl extends SyncLog {
  _SyncLogImpl({
    _is.UuidValue? id,
    required _is.UuidValue operationId,
    required String action,
    required _i9saic36.SyncOperationStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? errorCode,
    String? errorMessage,
  }) : super._(
         id: id,
         operationId: operationId,
         action: action,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         errorCode: errorCode,
         errorMessage: errorMessage,
       );

  /// Returns a shallow copy of this [SyncLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SyncLog copyWith({
    Object? id = _Undefined,
    _is.UuidValue? operationId,
    String? action,
    _i9saic36.SyncOperationStatus? status,
    DateTime? startedAt,
    Object? completedAt = _Undefined,
    Object? errorCode = _Undefined,
    Object? errorMessage = _Undefined,
  }) {
    return SyncLog(
      id: id is _is.UuidValue? ? id : this.id,
      operationId: operationId ?? this.operationId,
      action: action ?? this.action,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      errorCode: errorCode is String? ? errorCode : this.errorCode,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
    );
  }
}

class SyncLogUpdateTable extends _is.UpdateTable<SyncLogTable> {
  SyncLogUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> operationId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.operationId,
    value,
  );

  _is.ColumnValue<String, String> action(String value) => _is.ColumnValue(
    table.action,
    value,
  );

  _is.ColumnValue<_i9saic36.SyncOperationStatus, _i9saic36.SyncOperationStatus>
  status(_i9saic36.SyncOperationStatus value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> startedAt(DateTime value) =>
      _is.ColumnValue(
        table.startedAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _is.ColumnValue(
        table.completedAt,
        value,
      );

  _is.ColumnValue<String, String> errorCode(String? value) => _is.ColumnValue(
    table.errorCode,
    value,
  );

  _is.ColumnValue<String, String> errorMessage(String? value) =>
      _is.ColumnValue(
        table.errorMessage,
        value,
      );
}

class SyncLogTable extends _is.Table<_is.UuidValue?> {
  SyncLogTable({super.tableRelation}) : super(tableName: 'sync_logs') {
    updateTable = SyncLogUpdateTable(this);
    operationId = _is.ColumnUuid(
      'operationId',
      this,
    );
    action = _is.ColumnString(
      'action',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    startedAt = _is.ColumnDateTime(
      'startedAt',
      this,
    );
    completedAt = _is.ColumnDateTime(
      'completedAt',
      this,
    );
    errorCode = _is.ColumnString(
      'errorCode',
      this,
    );
    errorMessage = _is.ColumnString(
      'errorMessage',
      this,
    );
  }

  late final SyncLogUpdateTable updateTable;

  late final _is.ColumnUuid operationId;

  late final _is.ColumnString action;

  late final _is.ColumnEnum<_i9saic36.SyncOperationStatus> status;

  late final _is.ColumnDateTime startedAt;

  late final _is.ColumnDateTime completedAt;

  late final _is.ColumnString errorCode;

  late final _is.ColumnString errorMessage;

  @override
  List<_is.Column> get columns => [
    id,
    operationId,
    action,
    status,
    startedAt,
    completedAt,
    errorCode,
    errorMessage,
  ];
}

class SyncLogInclude extends _is.IncludeObject {
  SyncLogInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue?> get table => SyncLog.t;
}

class SyncLogIncludeList extends _is.IncludeList {
  SyncLogIncludeList._({
    _is.WhereExpressionBuilder<SyncLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SyncLog.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => SyncLog.t;
}

class SyncLogRepository {
  const SyncLogRepository._();

  /// Returns a list of [SyncLog]s matching the given query parameters.
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
  Future<List<SyncLog>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SyncLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SyncLogTable>? orderBy,
    _is.OrderByListBuilder<SyncLogTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SyncLog>(
      where: where?.call(SyncLog.t),
      orderBy: orderBy?.call(SyncLog.t),
      orderByList: orderByList?.call(SyncLog.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SyncLog] matching the given query parameters.
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
  Future<SyncLog?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SyncLogTable>? where,
    int? offset,
    _is.OrderByBuilder<SyncLogTable>? orderBy,
    _is.OrderByListBuilder<SyncLogTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SyncLog>(
      where: where?.call(SyncLog.t),
      orderBy: orderBy?.call(SyncLog.t),
      orderByList: orderByList?.call(SyncLog.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SyncLog] by its [id] or null if no such row exists.
  Future<SyncLog?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SyncLog>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SyncLog]s in the list and returns the inserted rows.
  ///
  /// The returned [SyncLog]s will have their `id` fields set.
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
  Future<List<SyncLog>> insert(
    _is.DatabaseSession session,
    List<SyncLog> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SyncLog>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SyncLog] and returns the inserted row.
  ///
  /// The returned [SyncLog] will have its `id` field set.
  Future<SyncLog> insertRow(
    _is.DatabaseSession session,
    SyncLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SyncLog>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SyncLog]s in the list and returns the resulting rows.
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
  /// The returned [SyncLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SyncLog>> upsert(
    _is.DatabaseSession session,
    List<SyncLog> rows, {
    required _is.ColumnSelections<SyncLogTable> conflictColumns,
    _is.ColumnSelections<SyncLogTable>? updateColumns,
    _is.WhereExpressionBuilder<SyncLogTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SyncLog>(
      rows,
      conflictColumns: conflictColumns(SyncLog.t),
      updateColumns: updateColumns?.call(SyncLog.t),
      updateWhere: updateWhere?.call(SyncLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SyncLog] and returns the resulting row.
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
  /// The returned [SyncLog] will have its `id` field set.
  Future<SyncLog?> upsertRow(
    _is.DatabaseSession session,
    SyncLog row, {
    required _is.ColumnSelections<SyncLogTable> conflictColumns,
    _is.ColumnSelections<SyncLogTable>? updateColumns,
    _is.WhereExpressionBuilder<SyncLogTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SyncLog>(
      row,
      conflictColumns: conflictColumns(SyncLog.t),
      updateColumns: updateColumns?.call(SyncLog.t),
      updateWhere: updateWhere?.call(SyncLog.t),
      transaction: transaction,
    );
  }

  /// Updates all [SyncLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SyncLog>> update(
    _is.DatabaseSession session,
    List<SyncLog> rows, {
    _is.ColumnSelections<SyncLogTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SyncLog>(
      rows,
      columns: columns?.call(SyncLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SyncLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SyncLog> updateRow(
    _is.DatabaseSession session,
    SyncLog row, {
    _is.ColumnSelections<SyncLogTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SyncLog>(
      row,
      columns: columns?.call(SyncLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SyncLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SyncLog?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<SyncLogUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SyncLog>(
      id,
      columnValues: columnValues(SyncLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SyncLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SyncLog>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SyncLogUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SyncLogTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SyncLogTable>? orderBy,
    _is.OrderByListBuilder<SyncLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SyncLog>(
      columnValues: columnValues(SyncLog.t.updateTable),
      where: where(SyncLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SyncLog.t),
      orderByList: orderByList?.call(SyncLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SyncLog]s in the list and returns the deleted rows.
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
  Future<List<SyncLog>> delete(
    _is.DatabaseSession session,
    List<SyncLog> rows, {
    _is.OrderByBuilder<SyncLogTable>? orderBy,
    _is.OrderByListBuilder<SyncLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SyncLog>(
      rows,
      orderBy: orderBy?.call(SyncLog.t),
      orderByList: orderByList?.call(SyncLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SyncLog].
  Future<SyncLog> deleteRow(
    _is.DatabaseSession session,
    SyncLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SyncLog>(
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
  Future<List<SyncLog>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SyncLogTable> where,
    _is.OrderByBuilder<SyncLogTable>? orderBy,
    _is.OrderByListBuilder<SyncLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SyncLog>(
      where: where(SyncLog.t),
      orderBy: orderBy?.call(SyncLog.t),
      orderByList: orderByList?.call(SyncLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SyncLogTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SyncLog>(
      where: where?.call(SyncLog.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SyncLog] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SyncLogTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SyncLog>(
      where: where(SyncLog.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
