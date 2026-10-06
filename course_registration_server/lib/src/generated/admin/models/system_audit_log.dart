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
import '../../app_user.dart' as _ilo7u3hn;

abstract class SystemAuditLog
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  SystemAuditLog._({
    this.id,
    required this.userId,
    this.user,
    required this.action,
    required this.entity,
    required this.entityId,
    this.oldValue,
    this.newValue,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory SystemAuditLog({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String action,
    required String entity,
    required _is.UuidValue entityId,
    String? oldValue,
    String? newValue,
    DateTime? createdAt,
  }) = _SystemAuditLogImpl;

  factory SystemAuditLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return SystemAuditLog(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _is.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ilo7u3hn.AppUser>(
              jsonSerialization['user'],
            ),
      action: jsonSerialization['action'] as String,
      entity: jsonSerialization['entity'] as String,
      entityId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['entityId'],
      ),
      oldValue: jsonSerialization['oldValue'] as String?,
      newValue: jsonSerialization['newValue'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = SystemAuditLogTable();

  static const db = SystemAuditLogRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue userId;

  _ilo7u3hn.AppUser? user;

  String action;

  String entity;

  _is.UuidValue entityId;

  String? oldValue;

  String? newValue;

  DateTime createdAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [SystemAuditLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SystemAuditLog copyWith({
    _is.UuidValue? id,
    _is.UuidValue? userId,
    _ilo7u3hn.AppUser? user,
    String? action,
    String? entity,
    _is.UuidValue? entityId,
    String? oldValue,
    String? newValue,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SystemAuditLog',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      if (oldValue != null) 'oldValue': oldValue,
      if (newValue != null) 'newValue': newValue,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SystemAuditLog',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'action': action,
      'entity': entity,
      'entityId': entityId.toJson(),
      if (oldValue != null) 'oldValue': oldValue,
      if (newValue != null) 'newValue': newValue,
      'createdAt': createdAt.toJson(),
    };
  }

  static SystemAuditLogInclude include({_ilo7u3hn.AppUserInclude? user}) {
    return SystemAuditLogInclude._(user: user);
  }

  static SystemAuditLogIncludeList includeList({
    _is.WhereExpressionBuilder<SystemAuditLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SystemAuditLogTable>? orderBy,
    _is.OrderByListBuilder<SystemAuditLogTable>? orderByList,
    SystemAuditLogInclude? include,
  }) {
    return SystemAuditLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SystemAuditLog.t),
      orderByList: orderByList?.call(SystemAuditLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SystemAuditLogImpl extends SystemAuditLog {
  _SystemAuditLogImpl({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String action,
    required String entity,
    required _is.UuidValue entityId,
    String? oldValue,
    String? newValue,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         action: action,
         entity: entity,
         entityId: entityId,
         oldValue: oldValue,
         newValue: newValue,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SystemAuditLog]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SystemAuditLog copyWith({
    Object? id = _Undefined,
    _is.UuidValue? userId,
    Object? user = _Undefined,
    String? action,
    String? entity,
    _is.UuidValue? entityId,
    Object? oldValue = _Undefined,
    Object? newValue = _Undefined,
    DateTime? createdAt,
  }) {
    return SystemAuditLog(
      id: id is _is.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _ilo7u3hn.AppUser? ? user : this.user?.copyWith(),
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      oldValue: oldValue is String? ? oldValue : this.oldValue,
      newValue: newValue is String? ? newValue : this.newValue,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class SystemAuditLogUpdateTable extends _is.UpdateTable<SystemAuditLogTable> {
  SystemAuditLogUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> userId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.userId,
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

  _is.ColumnValue<String, String> oldValue(String? value) => _is.ColumnValue(
    table.oldValue,
    value,
  );

  _is.ColumnValue<String, String> newValue(String? value) => _is.ColumnValue(
    table.newValue,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class SystemAuditLogTable extends _is.Table<_is.UuidValue?> {
  SystemAuditLogTable({super.tableRelation})
    : super(tableName: 'system_audit_logs') {
    updateTable = SystemAuditLogUpdateTable(this);
    userId = _is.ColumnUuid(
      'userId',
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
    oldValue = _is.ColumnString(
      'oldValue',
      this,
    );
    newValue = _is.ColumnString(
      'newValue',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final SystemAuditLogUpdateTable updateTable;

  late final _is.ColumnUuid userId;

  _ilo7u3hn.AppUserTable? _user;

  late final _is.ColumnString action;

  late final _is.ColumnString entity;

  late final _is.ColumnUuid entityId;

  late final _is.ColumnString oldValue;

  late final _is.ColumnString newValue;

  late final _is.ColumnDateTime createdAt;

  _ilo7u3hn.AppUserTable get user {
    if (_user != null) return _user!;
    _user = _is.createRelationTable(
      relationFieldName: 'user',
      field: SystemAuditLog.t.userId,
      foreignField: _ilo7u3hn.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ilo7u3hn.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    action,
    entity,
    entityId,
    oldValue,
    newValue,
    createdAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class SystemAuditLogInclude extends _is.IncludeObject {
  SystemAuditLogInclude._({_ilo7u3hn.AppUserInclude? user}) {
    _user = user;
  }

  _ilo7u3hn.AppUserInclude? _user;

  @override
  Map<String, _is.Include?> get includes => {'user': _user};

  @override
  _is.Table<_is.UuidValue?> get table => SystemAuditLog.t;
}

class SystemAuditLogIncludeList extends _is.IncludeList {
  SystemAuditLogIncludeList._({
    _is.WhereExpressionBuilder<SystemAuditLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SystemAuditLog.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => SystemAuditLog.t;
}

class SystemAuditLogRepository {
  const SystemAuditLogRepository._();

  final attachRow = const SystemAuditLogAttachRowRepository._();

  /// Returns a list of [SystemAuditLog]s matching the given query parameters.
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
  Future<List<SystemAuditLog>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SystemAuditLogTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SystemAuditLogTable>? orderBy,
    _is.OrderByListBuilder<SystemAuditLogTable>? orderByList,
    _is.Transaction? transaction,
    SystemAuditLogInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SystemAuditLog>(
      where: where?.call(SystemAuditLog.t),
      orderBy: orderBy?.call(SystemAuditLog.t),
      orderByList: orderByList?.call(SystemAuditLog.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SystemAuditLog] matching the given query parameters.
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
  Future<SystemAuditLog?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SystemAuditLogTable>? where,
    int? offset,
    _is.OrderByBuilder<SystemAuditLogTable>? orderBy,
    _is.OrderByListBuilder<SystemAuditLogTable>? orderByList,
    _is.Transaction? transaction,
    SystemAuditLogInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SystemAuditLog>(
      where: where?.call(SystemAuditLog.t),
      orderBy: orderBy?.call(SystemAuditLog.t),
      orderByList: orderByList?.call(SystemAuditLog.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SystemAuditLog] by its [id] or null if no such row exists.
  Future<SystemAuditLog?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    SystemAuditLogInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SystemAuditLog>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SystemAuditLog]s in the list and returns the inserted rows.
  ///
  /// The returned [SystemAuditLog]s will have their `id` fields set.
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
  Future<List<SystemAuditLog>> insert(
    _is.DatabaseSession session,
    List<SystemAuditLog> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SystemAuditLog>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SystemAuditLog] and returns the inserted row.
  ///
  /// The returned [SystemAuditLog] will have its `id` field set.
  Future<SystemAuditLog> insertRow(
    _is.DatabaseSession session,
    SystemAuditLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SystemAuditLog>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SystemAuditLog]s in the list and returns the resulting rows.
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
  /// The returned [SystemAuditLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SystemAuditLog>> upsert(
    _is.DatabaseSession session,
    List<SystemAuditLog> rows, {
    required _is.ColumnSelections<SystemAuditLogTable> conflictColumns,
    _is.ColumnSelections<SystemAuditLogTable>? updateColumns,
    _is.WhereExpressionBuilder<SystemAuditLogTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SystemAuditLog>(
      rows,
      conflictColumns: conflictColumns(SystemAuditLog.t),
      updateColumns: updateColumns?.call(SystemAuditLog.t),
      updateWhere: updateWhere?.call(SystemAuditLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SystemAuditLog] and returns the resulting row.
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
  /// The returned [SystemAuditLog] will have its `id` field set.
  Future<SystemAuditLog?> upsertRow(
    _is.DatabaseSession session,
    SystemAuditLog row, {
    required _is.ColumnSelections<SystemAuditLogTable> conflictColumns,
    _is.ColumnSelections<SystemAuditLogTable>? updateColumns,
    _is.WhereExpressionBuilder<SystemAuditLogTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SystemAuditLog>(
      row,
      conflictColumns: conflictColumns(SystemAuditLog.t),
      updateColumns: updateColumns?.call(SystemAuditLog.t),
      updateWhere: updateWhere?.call(SystemAuditLog.t),
      transaction: transaction,
    );
  }

  /// Updates all [SystemAuditLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SystemAuditLog>> update(
    _is.DatabaseSession session,
    List<SystemAuditLog> rows, {
    _is.ColumnSelections<SystemAuditLogTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SystemAuditLog>(
      rows,
      columns: columns?.call(SystemAuditLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SystemAuditLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SystemAuditLog> updateRow(
    _is.DatabaseSession session,
    SystemAuditLog row, {
    _is.ColumnSelections<SystemAuditLogTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SystemAuditLog>(
      row,
      columns: columns?.call(SystemAuditLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SystemAuditLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SystemAuditLog?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<SystemAuditLogUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SystemAuditLog>(
      id,
      columnValues: columnValues(SystemAuditLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SystemAuditLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SystemAuditLog>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SystemAuditLogUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SystemAuditLogTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SystemAuditLogTable>? orderBy,
    _is.OrderByListBuilder<SystemAuditLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SystemAuditLog>(
      columnValues: columnValues(SystemAuditLog.t.updateTable),
      where: where(SystemAuditLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SystemAuditLog.t),
      orderByList: orderByList?.call(SystemAuditLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SystemAuditLog]s in the list and returns the deleted rows.
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
  Future<List<SystemAuditLog>> delete(
    _is.DatabaseSession session,
    List<SystemAuditLog> rows, {
    _is.OrderByBuilder<SystemAuditLogTable>? orderBy,
    _is.OrderByListBuilder<SystemAuditLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SystemAuditLog>(
      rows,
      orderBy: orderBy?.call(SystemAuditLog.t),
      orderByList: orderByList?.call(SystemAuditLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SystemAuditLog].
  Future<SystemAuditLog> deleteRow(
    _is.DatabaseSession session,
    SystemAuditLog row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SystemAuditLog>(
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
  Future<List<SystemAuditLog>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SystemAuditLogTable> where,
    _is.OrderByBuilder<SystemAuditLogTable>? orderBy,
    _is.OrderByListBuilder<SystemAuditLogTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SystemAuditLog>(
      where: where(SystemAuditLog.t),
      orderBy: orderBy?.call(SystemAuditLog.t),
      orderByList: orderByList?.call(SystemAuditLog.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SystemAuditLogTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SystemAuditLog>(
      where: where?.call(SystemAuditLog.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SystemAuditLog] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SystemAuditLogTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SystemAuditLog>(
      where: where(SystemAuditLog.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class SystemAuditLogAttachRowRepository {
  const SystemAuditLogAttachRowRepository._();

  /// Creates a relation between the given [SystemAuditLog] and [AppUser]
  /// by setting the [SystemAuditLog]'s foreign key `userId` to refer to the [AppUser].
  Future<void> user(
    _is.DatabaseSession session,
    SystemAuditLog systemAuditLog,
    _ilo7u3hn.AppUser user, {
    _is.Transaction? transaction,
  }) async {
    if (systemAuditLog.id == null) {
      throw ArgumentError.notNull('systemAuditLog.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $systemAuditLog = systemAuditLog.copyWith(userId: user.id);
    await session.db.updateRow<SystemAuditLog>(
      $systemAuditLog,
      columns: [SystemAuditLog.t.userId],
      transaction: transaction,
    );
  }
}
