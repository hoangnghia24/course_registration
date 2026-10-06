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

abstract class SyncChange
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  SyncChange._({
    this.id,
    required this.targetUserId,
    this.targetUser,
    required this.entityType,
    required this.entityId,
    required this.changeType,
    this.payload,
    required this.serverVersion,
    DateTime? changedAt,
  }) : changedAt = changedAt ?? DateTime.now();

  factory SyncChange({
    _is.UuidValue? id,
    required _is.UuidValue targetUserId,
    _ilo7u3hn.AppUser? targetUser,
    required String entityType,
    required String entityId,
    required String changeType,
    String? payload,
    required int serverVersion,
    DateTime? changedAt,
  }) = _SyncChangeImpl;

  factory SyncChange.fromJson(Map<String, dynamic> jsonSerialization) {
    return SyncChange(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      targetUserId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['targetUserId'],
      ),
      targetUser: jsonSerialization['targetUser'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ilo7u3hn.AppUser>(
              jsonSerialization['targetUser'],
            ),
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as String,
      changeType: jsonSerialization['changeType'] as String,
      payload: jsonSerialization['payload'] as String?,
      serverVersion: jsonSerialization['serverVersion'] as int,
      changedAt: jsonSerialization['changedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['changedAt']),
    );
  }

  static final t = SyncChangeTable();

  static const db = SyncChangeRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue targetUserId;

  _ilo7u3hn.AppUser? targetUser;

  String entityType;

  String entityId;

  String changeType;

  String? payload;

  int serverVersion;

  DateTime changedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [SyncChange]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SyncChange copyWith({
    _is.UuidValue? id,
    _is.UuidValue? targetUserId,
    _ilo7u3hn.AppUser? targetUser,
    String? entityType,
    String? entityId,
    String? changeType,
    String? payload,
    int? serverVersion,
    DateTime? changedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncChange',
      if (id != null) 'id': id?.toJson(),
      'targetUserId': targetUserId.toJson(),
      if (targetUser != null) 'targetUser': targetUser?.toJson(),
      'entityType': entityType,
      'entityId': entityId,
      'changeType': changeType,
      if (payload != null) 'payload': payload,
      'serverVersion': serverVersion,
      'changedAt': changedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncChange',
      if (id != null) 'id': id?.toJson(),
      'targetUserId': targetUserId.toJson(),
      if (targetUser != null) 'targetUser': targetUser?.toJsonForProtocol(),
      'entityType': entityType,
      'entityId': entityId,
      'changeType': changeType,
      if (payload != null) 'payload': payload,
      'serverVersion': serverVersion,
      'changedAt': changedAt.toJson(),
    };
  }

  static SyncChangeInclude include({_ilo7u3hn.AppUserInclude? targetUser}) {
    return SyncChangeInclude._(targetUser: targetUser);
  }

  static SyncChangeIncludeList includeList({
    _is.WhereExpressionBuilder<SyncChangeTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SyncChangeTable>? orderBy,
    _is.OrderByListBuilder<SyncChangeTable>? orderByList,
    SyncChangeInclude? include,
  }) {
    return SyncChangeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SyncChange.t),
      orderByList: orderByList?.call(SyncChange.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncChangeImpl extends SyncChange {
  _SyncChangeImpl({
    _is.UuidValue? id,
    required _is.UuidValue targetUserId,
    _ilo7u3hn.AppUser? targetUser,
    required String entityType,
    required String entityId,
    required String changeType,
    String? payload,
    required int serverVersion,
    DateTime? changedAt,
  }) : super._(
         id: id,
         targetUserId: targetUserId,
         targetUser: targetUser,
         entityType: entityType,
         entityId: entityId,
         changeType: changeType,
         payload: payload,
         serverVersion: serverVersion,
         changedAt: changedAt,
       );

  /// Returns a shallow copy of this [SyncChange]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SyncChange copyWith({
    Object? id = _Undefined,
    _is.UuidValue? targetUserId,
    Object? targetUser = _Undefined,
    String? entityType,
    String? entityId,
    String? changeType,
    Object? payload = _Undefined,
    int? serverVersion,
    DateTime? changedAt,
  }) {
    return SyncChange(
      id: id is _is.UuidValue? ? id : this.id,
      targetUserId: targetUserId ?? this.targetUserId,
      targetUser: targetUser is _ilo7u3hn.AppUser?
          ? targetUser
          : this.targetUser?.copyWith(),
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      changeType: changeType ?? this.changeType,
      payload: payload is String? ? payload : this.payload,
      serverVersion: serverVersion ?? this.serverVersion,
      changedAt: changedAt ?? this.changedAt,
    );
  }
}

class SyncChangeUpdateTable extends _is.UpdateTable<SyncChangeTable> {
  SyncChangeUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> targetUserId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.targetUserId,
    value,
  );

  _is.ColumnValue<String, String> entityType(String value) => _is.ColumnValue(
    table.entityType,
    value,
  );

  _is.ColumnValue<String, String> entityId(String value) => _is.ColumnValue(
    table.entityId,
    value,
  );

  _is.ColumnValue<String, String> changeType(String value) => _is.ColumnValue(
    table.changeType,
    value,
  );

  _is.ColumnValue<String, String> payload(String? value) => _is.ColumnValue(
    table.payload,
    value,
  );

  _is.ColumnValue<int, int> serverVersion(int value) => _is.ColumnValue(
    table.serverVersion,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> changedAt(DateTime value) =>
      _is.ColumnValue(
        table.changedAt,
        value,
      );
}

class SyncChangeTable extends _is.Table<_is.UuidValue?> {
  SyncChangeTable({super.tableRelation}) : super(tableName: 'sync_changes') {
    updateTable = SyncChangeUpdateTable(this);
    targetUserId = _is.ColumnUuid(
      'targetUserId',
      this,
    );
    entityType = _is.ColumnString(
      'entityType',
      this,
    );
    entityId = _is.ColumnString(
      'entityId',
      this,
    );
    changeType = _is.ColumnString(
      'changeType',
      this,
    );
    payload = _is.ColumnString(
      'payload',
      this,
    );
    serverVersion = _is.ColumnInt(
      'serverVersion',
      this,
    );
    changedAt = _is.ColumnDateTime(
      'changedAt',
      this,
      hasDefault: true,
    );
  }

  late final SyncChangeUpdateTable updateTable;

  late final _is.ColumnUuid targetUserId;

  _ilo7u3hn.AppUserTable? _targetUser;

  late final _is.ColumnString entityType;

  late final _is.ColumnString entityId;

  late final _is.ColumnString changeType;

  late final _is.ColumnString payload;

  late final _is.ColumnInt serverVersion;

  late final _is.ColumnDateTime changedAt;

  _ilo7u3hn.AppUserTable get targetUser {
    if (_targetUser != null) return _targetUser!;
    _targetUser = _is.createRelationTable(
      relationFieldName: 'targetUser',
      field: SyncChange.t.targetUserId,
      foreignField: _ilo7u3hn.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ilo7u3hn.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _targetUser!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    targetUserId,
    entityType,
    entityId,
    changeType,
    payload,
    serverVersion,
    changedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'targetUser') {
      return targetUser;
    }
    return null;
  }
}

class SyncChangeInclude extends _is.IncludeObject {
  SyncChangeInclude._({_ilo7u3hn.AppUserInclude? targetUser}) {
    _targetUser = targetUser;
  }

  _ilo7u3hn.AppUserInclude? _targetUser;

  @override
  Map<String, _is.Include?> get includes => {'targetUser': _targetUser};

  @override
  _is.Table<_is.UuidValue?> get table => SyncChange.t;
}

class SyncChangeIncludeList extends _is.IncludeList {
  SyncChangeIncludeList._({
    _is.WhereExpressionBuilder<SyncChangeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SyncChange.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => SyncChange.t;
}

class SyncChangeRepository {
  const SyncChangeRepository._();

  final attachRow = const SyncChangeAttachRowRepository._();

  /// Returns a list of [SyncChange]s matching the given query parameters.
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
  Future<List<SyncChange>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SyncChangeTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SyncChangeTable>? orderBy,
    _is.OrderByListBuilder<SyncChangeTable>? orderByList,
    _is.Transaction? transaction,
    SyncChangeInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SyncChange>(
      where: where?.call(SyncChange.t),
      orderBy: orderBy?.call(SyncChange.t),
      orderByList: orderByList?.call(SyncChange.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SyncChange] matching the given query parameters.
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
  Future<SyncChange?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SyncChangeTable>? where,
    int? offset,
    _is.OrderByBuilder<SyncChangeTable>? orderBy,
    _is.OrderByListBuilder<SyncChangeTable>? orderByList,
    _is.Transaction? transaction,
    SyncChangeInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SyncChange>(
      where: where?.call(SyncChange.t),
      orderBy: orderBy?.call(SyncChange.t),
      orderByList: orderByList?.call(SyncChange.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SyncChange] by its [id] or null if no such row exists.
  Future<SyncChange?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    SyncChangeInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SyncChange>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SyncChange]s in the list and returns the inserted rows.
  ///
  /// The returned [SyncChange]s will have their `id` fields set.
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
  Future<List<SyncChange>> insert(
    _is.DatabaseSession session,
    List<SyncChange> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SyncChange>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SyncChange] and returns the inserted row.
  ///
  /// The returned [SyncChange] will have its `id` field set.
  Future<SyncChange> insertRow(
    _is.DatabaseSession session,
    SyncChange row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SyncChange>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SyncChange]s in the list and returns the resulting rows.
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
  /// The returned [SyncChange]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SyncChange>> upsert(
    _is.DatabaseSession session,
    List<SyncChange> rows, {
    required _is.ColumnSelections<SyncChangeTable> conflictColumns,
    _is.ColumnSelections<SyncChangeTable>? updateColumns,
    _is.WhereExpressionBuilder<SyncChangeTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SyncChange>(
      rows,
      conflictColumns: conflictColumns(SyncChange.t),
      updateColumns: updateColumns?.call(SyncChange.t),
      updateWhere: updateWhere?.call(SyncChange.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SyncChange] and returns the resulting row.
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
  /// The returned [SyncChange] will have its `id` field set.
  Future<SyncChange?> upsertRow(
    _is.DatabaseSession session,
    SyncChange row, {
    required _is.ColumnSelections<SyncChangeTable> conflictColumns,
    _is.ColumnSelections<SyncChangeTable>? updateColumns,
    _is.WhereExpressionBuilder<SyncChangeTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SyncChange>(
      row,
      conflictColumns: conflictColumns(SyncChange.t),
      updateColumns: updateColumns?.call(SyncChange.t),
      updateWhere: updateWhere?.call(SyncChange.t),
      transaction: transaction,
    );
  }

  /// Updates all [SyncChange]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SyncChange>> update(
    _is.DatabaseSession session,
    List<SyncChange> rows, {
    _is.ColumnSelections<SyncChangeTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SyncChange>(
      rows,
      columns: columns?.call(SyncChange.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SyncChange]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SyncChange> updateRow(
    _is.DatabaseSession session,
    SyncChange row, {
    _is.ColumnSelections<SyncChangeTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SyncChange>(
      row,
      columns: columns?.call(SyncChange.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SyncChange] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SyncChange?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<SyncChangeUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SyncChange>(
      id,
      columnValues: columnValues(SyncChange.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SyncChange]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SyncChange>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SyncChangeUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SyncChangeTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SyncChangeTable>? orderBy,
    _is.OrderByListBuilder<SyncChangeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SyncChange>(
      columnValues: columnValues(SyncChange.t.updateTable),
      where: where(SyncChange.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SyncChange.t),
      orderByList: orderByList?.call(SyncChange.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SyncChange]s in the list and returns the deleted rows.
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
  Future<List<SyncChange>> delete(
    _is.DatabaseSession session,
    List<SyncChange> rows, {
    _is.OrderByBuilder<SyncChangeTable>? orderBy,
    _is.OrderByListBuilder<SyncChangeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SyncChange>(
      rows,
      orderBy: orderBy?.call(SyncChange.t),
      orderByList: orderByList?.call(SyncChange.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SyncChange].
  Future<SyncChange> deleteRow(
    _is.DatabaseSession session,
    SyncChange row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SyncChange>(
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
  Future<List<SyncChange>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SyncChangeTable> where,
    _is.OrderByBuilder<SyncChangeTable>? orderBy,
    _is.OrderByListBuilder<SyncChangeTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SyncChange>(
      where: where(SyncChange.t),
      orderBy: orderBy?.call(SyncChange.t),
      orderByList: orderByList?.call(SyncChange.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SyncChangeTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SyncChange>(
      where: where?.call(SyncChange.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SyncChange] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SyncChangeTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SyncChange>(
      where: where(SyncChange.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class SyncChangeAttachRowRepository {
  const SyncChangeAttachRowRepository._();

  /// Creates a relation between the given [SyncChange] and [AppUser]
  /// by setting the [SyncChange]'s foreign key `targetUserId` to refer to the [AppUser].
  Future<void> targetUser(
    _is.DatabaseSession session,
    SyncChange syncChange,
    _ilo7u3hn.AppUser targetUser, {
    _is.Transaction? transaction,
  }) async {
    if (syncChange.id == null) {
      throw ArgumentError.notNull('syncChange.id');
    }
    if (targetUser.id == null) {
      throw ArgumentError.notNull('targetUser.id');
    }

    var $syncChange = syncChange.copyWith(targetUserId: targetUser.id);
    await session.db.updateRow<SyncChange>(
      $syncChange,
      columns: [SyncChange.t.targetUserId],
      transaction: transaction,
    );
  }
}
