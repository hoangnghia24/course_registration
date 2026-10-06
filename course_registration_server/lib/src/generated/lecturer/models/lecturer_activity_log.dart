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

abstract class LecturerActivityLog
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  LecturerActivityLog._({
    this.id,
    required this.lecturerId,
    this.lecturer,
    required this.action,
    required this.entity,
    required this.entityId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory LecturerActivityLog({
    _is.UuidValue? id,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required String action,
    required String entity,
    required _is.UuidValue entityId,
    DateTime? createdAt,
  }) = _LecturerActivityLogImpl;

  factory LecturerActivityLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return LecturerActivityLog(
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
      action: jsonSerialization['action'] as String,
      entity: jsonSerialization['entity'] as String,
      entityId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['entityId'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = LecturerActivityLogTable();

  static const db = LecturerActivityLogRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  String action;

  String entity;

  _is.UuidValue entityId;

  DateTime createdAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [LecturerActivityLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  LecturerActivityLog copyWith({
    _is.UuidValue? id,
    _is.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    String? action,
    String? entity,
    _is.UuidValue? entityId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LecturerActivityLog',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LecturerActivityLog',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static LecturerActivityLogInclude include({
    _ismqsd72.LecturerInclude? lecturer,
  }) {
    return LecturerActivityLogInclude._(lecturer: lecturer);
  }

  static LecturerActivityLogIncludeList includeList({
    _is.WhereExpressionBuilder<LecturerActivityLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerActivityLogTable>? orderBy,
    _is.OrderByListBuilder<LecturerActivityLogTable>? orderByList,
    LecturerActivityLogInclude? include,
  }) {
    return LecturerActivityLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LecturerActivityLog.t),
      orderByList: orderByList?.call(LecturerActivityLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerActivityLogImpl extends LecturerActivityLog {
  _LecturerActivityLogImpl({
    _is.UuidValue? id,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required String action,
    required String entity,
    required _is.UuidValue entityId,
    DateTime? createdAt,
  }) : super._(
         id: id,
         lecturerId: lecturerId,
         lecturer: lecturer,
         action: action,
         entity: entity,
         entityId: entityId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [LecturerActivityLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  LecturerActivityLog copyWith({
    Object? id = _Undefined,
    _is.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    String? action,
    String? entity,
    _is.UuidValue? entityId,
    DateTime? createdAt,
  }) {
    return LecturerActivityLog(
      id: id is _is.UuidValue? ? id : this.id,
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class LecturerActivityLogUpdateTable
    extends _is.UpdateTable<LecturerActivityLogTable> {
  LecturerActivityLogUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> lecturerId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.lecturerId,
    value,
  );

  _is.ColumnValue<String, String> action(String value) => _is.ColumnValue(
    table.action,
    value,
  );

  _is.ColumnValue<String, String> entity(String value) => _is.ColumnValue(
    table.entity,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> entityId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.entityId,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class LecturerActivityLogTable extends _is.Table<_is.UuidValue?> {
  LecturerActivityLogTable({super.tableRelation})
    : super(tableName: 'lecturer_activity_logs') {
    updateTable = LecturerActivityLogUpdateTable(this);
    lecturerId = _is.ColumnUuid(
      'lecturerId',
      this,
    );
    action = _is.ColumnString(
      'action',
      this,
    );
    entity = _is.ColumnString(
      'entity',
      this,
    );
    entityId = _is.ColumnUuid(
      'entityId',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final LecturerActivityLogUpdateTable updateTable;

  late final _is.ColumnUuid lecturerId;

  _ismqsd72.LecturerTable? _lecturer;

  late final _is.ColumnString action;

  late final _is.ColumnString entity;

  late final _is.ColumnUuid entityId;

  late final _is.ColumnDateTime createdAt;

  _ismqsd72.LecturerTable get lecturer {
    if (_lecturer != null) return _lecturer!;
    _lecturer = _is.createRelationTable(
      relationFieldName: 'lecturer',
      field: LecturerActivityLog.t.lecturerId,
      foreignField: _ismqsd72.Lecturer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ismqsd72.LecturerTable(tableRelation: foreignTableRelation),
    );
    return _lecturer!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    lecturerId,
    action,
    entity,
    entityId,
    createdAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'lecturer') {
      return lecturer;
    }
    return null;
  }
}

class LecturerActivityLogInclude extends _is.IncludeObject {
  LecturerActivityLogInclude._({_ismqsd72.LecturerInclude? lecturer}) {
    _lecturer = lecturer;
  }

  _ismqsd72.LecturerInclude? _lecturer;

  @override
  Map<String, _is.Include?> get includes => {'lecturer': _lecturer};

  @override
  _is.Table<_is.UuidValue?> get table => LecturerActivityLog.t;
}

class LecturerActivityLogIncludeList extends _is.IncludeList {
  LecturerActivityLogIncludeList._({
    _is.WhereExpressionBuilder<LecturerActivityLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LecturerActivityLog.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => LecturerActivityLog.t;
}

class LecturerActivityLogRepository {
  const LecturerActivityLogRepository._();

  final attachRow = const LecturerActivityLogAttachRowRepository._();

  /// Returns a list of [LecturerActivityLog]s matching the given query parameters.
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
  Future<List<LecturerActivityLog>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerActivityLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerActivityLogTable>? orderBy,
    _is.OrderByListBuilder<LecturerActivityLogTable>? orderByList,
    _is.Transaction? transaction,
    LecturerActivityLogInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<LecturerActivityLog>(
      where: where?.call(LecturerActivityLog.t),
      orderBy: orderBy?.call(LecturerActivityLog.t),
      orderByList: orderByList?.call(LecturerActivityLog.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [LecturerActivityLog] matching the given query parameters.
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
  Future<LecturerActivityLog?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerActivityLogTable>? where,
    int? offset,
    _is.OrderByBuilder<LecturerActivityLogTable>? orderBy,
    _is.OrderByListBuilder<LecturerActivityLogTable>? orderByList,
    _is.Transaction? transaction,
    LecturerActivityLogInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<LecturerActivityLog>(
      where: where?.call(LecturerActivityLog.t),
      orderBy: orderBy?.call(LecturerActivityLog.t),
      orderByList: orderByList?.call(LecturerActivityLog.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [LecturerActivityLog] by its [id] or null if no such row exists.
  Future<LecturerActivityLog?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    LecturerActivityLogInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<LecturerActivityLog>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [LecturerActivityLog]s in the list and returns the inserted rows.
  ///
  /// The returned [LecturerActivityLog]s will have their `id` fields set.
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
  Future<List<LecturerActivityLog>> insert(
    _is.DatabaseSession session,
    List<LecturerActivityLog> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<LecturerActivityLog>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [LecturerActivityLog] and returns the inserted row.
  ///
  /// The returned [LecturerActivityLog] will have its `id` field set.
  Future<LecturerActivityLog> insertRow(
    _is.DatabaseSession session,
    LecturerActivityLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<LecturerActivityLog>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [LecturerActivityLog]s in the list and returns the resulting rows.
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
  /// The returned [LecturerActivityLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LecturerActivityLog>> upsert(
    _is.DatabaseSession session,
    List<LecturerActivityLog> rows, {
    required _is.ColumnSelections<LecturerActivityLogTable> conflictColumns,
    _is.ColumnSelections<LecturerActivityLogTable>? updateColumns,
    _is.WhereExpressionBuilder<LecturerActivityLogTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<LecturerActivityLog>(
      rows,
      conflictColumns: conflictColumns(LecturerActivityLog.t),
      updateColumns: updateColumns?.call(LecturerActivityLog.t),
      updateWhere: updateWhere?.call(LecturerActivityLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [LecturerActivityLog] and returns the resulting row.
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
  /// The returned [LecturerActivityLog] will have its `id` field set.
  Future<LecturerActivityLog?> upsertRow(
    _is.DatabaseSession session,
    LecturerActivityLog row, {
    required _is.ColumnSelections<LecturerActivityLogTable> conflictColumns,
    _is.ColumnSelections<LecturerActivityLogTable>? updateColumns,
    _is.WhereExpressionBuilder<LecturerActivityLogTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<LecturerActivityLog>(
      row,
      conflictColumns: conflictColumns(LecturerActivityLog.t),
      updateColumns: updateColumns?.call(LecturerActivityLog.t),
      updateWhere: updateWhere?.call(LecturerActivityLog.t),
      transaction: transaction,
    );
  }

  /// Updates all [LecturerActivityLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LecturerActivityLog>> update(
    _is.DatabaseSession session,
    List<LecturerActivityLog> rows, {
    _is.ColumnSelections<LecturerActivityLogTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<LecturerActivityLog>(
      rows,
      columns: columns?.call(LecturerActivityLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [LecturerActivityLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LecturerActivityLog> updateRow(
    _is.DatabaseSession session,
    LecturerActivityLog row, {
    _is.ColumnSelections<LecturerActivityLogTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<LecturerActivityLog>(
      row,
      columns: columns?.call(LecturerActivityLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LecturerActivityLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LecturerActivityLog?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<LecturerActivityLogUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<LecturerActivityLog>(
      id,
      columnValues: columnValues(LecturerActivityLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LecturerActivityLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LecturerActivityLog>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<LecturerActivityLogUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<LecturerActivityLogTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerActivityLogTable>? orderBy,
    _is.OrderByListBuilder<LecturerActivityLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<LecturerActivityLog>(
      columnValues: columnValues(LecturerActivityLog.t.updateTable),
      where: where(LecturerActivityLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LecturerActivityLog.t),
      orderByList: orderByList?.call(LecturerActivityLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [LecturerActivityLog]s in the list and returns the deleted rows.
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
  Future<List<LecturerActivityLog>> delete(
    _is.DatabaseSession session,
    List<LecturerActivityLog> rows, {
    _is.OrderByBuilder<LecturerActivityLogTable>? orderBy,
    _is.OrderByListBuilder<LecturerActivityLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<LecturerActivityLog>(
      rows,
      orderBy: orderBy?.call(LecturerActivityLog.t),
      orderByList: orderByList?.call(LecturerActivityLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [LecturerActivityLog].
  Future<LecturerActivityLog> deleteRow(
    _is.DatabaseSession session,
    LecturerActivityLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LecturerActivityLog>(
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
  Future<List<LecturerActivityLog>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LecturerActivityLogTable> where,
    _is.OrderByBuilder<LecturerActivityLogTable>? orderBy,
    _is.OrderByListBuilder<LecturerActivityLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<LecturerActivityLog>(
      where: where(LecturerActivityLog.t),
      orderBy: orderBy?.call(LecturerActivityLog.t),
      orderByList: orderByList?.call(LecturerActivityLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerActivityLogTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<LecturerActivityLog>(
      where: where?.call(LecturerActivityLog.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [LecturerActivityLog] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LecturerActivityLogTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<LecturerActivityLog>(
      where: where(LecturerActivityLog.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class LecturerActivityLogAttachRowRepository {
  const LecturerActivityLogAttachRowRepository._();

  /// Creates a relation between the given [LecturerActivityLog] and [Lecturer]
  /// by setting the [LecturerActivityLog]'s foreign key `lecturerId` to refer to the [Lecturer].
  Future<void> lecturer(
    _is.DatabaseSession session,
    LecturerActivityLog lecturerActivityLog,
    _ismqsd72.Lecturer lecturer, {
    _is.Transaction? transaction,
  }) async {
    if (lecturerActivityLog.id == null) {
      throw ArgumentError.notNull('lecturerActivityLog.id');
    }
    if (lecturer.id == null) {
      throw ArgumentError.notNull('lecturer.id');
    }

    var $lecturerActivityLog = lecturerActivityLog.copyWith(
      lecturerId: lecturer.id,
    );
    await session.db.updateRow<LecturerActivityLog>(
      $lecturerActivityLog,
      columns: [LecturerActivityLog.t.lecturerId],
      transaction: transaction,
    );
  }
}
