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
import '../../sync/models/sync_operation_status.dart' as _i9saic36;

abstract class ProcessedSyncOperation
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  ProcessedSyncOperation._({
    this.id,
    required this.operationId,
    required this.userId,
    this.user,
    required this.entityType,
    this.entityId,
    required this.operationType,
    required this.payload,
    required this.status,
    this.resultPayload,
    this.errorCode,
    this.errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : serverVersion = serverVersion ?? 1,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ProcessedSyncOperation({
    _is.UuidValue? id,
    required _is.UuidValue operationId,
    required _is.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String entityType,
    String? entityId,
    required String operationType,
    required String payload,
    required _i9saic36.SyncOperationStatus status,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProcessedSyncOperationImpl;

  factory ProcessedSyncOperation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProcessedSyncOperation(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      operationId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['operationId'],
      ),
      userId: _is.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ilo7u3hn.AppUser>(
              jsonSerialization['user'],
            ),
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as String?,
      operationType: jsonSerialization['operationType'] as String,
      payload: jsonSerialization['payload'] as String,
      status: _i9saic36.SyncOperationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      resultPayload: jsonSerialization['resultPayload'] as String?,
      errorCode: jsonSerialization['errorCode'] as String?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      serverVersion: jsonSerialization['serverVersion'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ProcessedSyncOperationTable();

  static const db = ProcessedSyncOperationRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue operationId;

  _is.UuidValue userId;

  _ilo7u3hn.AppUser? user;

  String entityType;

  String? entityId;

  String operationType;

  String payload;

  _i9saic36.SyncOperationStatus status;

  String? resultPayload;

  String? errorCode;

  String? errorMessage;

  int serverVersion;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [ProcessedSyncOperation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ProcessedSyncOperation copyWith({
    _is.UuidValue? id,
    _is.UuidValue? operationId,
    _is.UuidValue? userId,
    _ilo7u3hn.AppUser? user,
    String? entityType,
    String? entityId,
    String? operationType,
    String? payload,
    _i9saic36.SyncOperationStatus? status,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProcessedSyncOperation',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'entityType': entityType,
      if (entityId != null) 'entityId': entityId,
      'operationType': operationType,
      'payload': payload,
      'status': status.toJson(),
      if (resultPayload != null) 'resultPayload': resultPayload,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'serverVersion': serverVersion,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProcessedSyncOperation',
      if (id != null) 'id': id?.toJson(),
      'operationId': operationId.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'entityType': entityType,
      if (entityId != null) 'entityId': entityId,
      'operationType': operationType,
      'payload': payload,
      'status': status.toJson(),
      if (resultPayload != null) 'resultPayload': resultPayload,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'serverVersion': serverVersion,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ProcessedSyncOperationInclude include({
    _ilo7u3hn.AppUserInclude? user,
  }) {
    return ProcessedSyncOperationInclude._(user: user);
  }

  static ProcessedSyncOperationIncludeList includeList({
    _is.WhereExpressionBuilder<ProcessedSyncOperationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProcessedSyncOperationTable>? orderBy,
    _is.OrderByListBuilder<ProcessedSyncOperationTable>? orderByList,
    ProcessedSyncOperationInclude? include,
  }) {
    return ProcessedSyncOperationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProcessedSyncOperation.t),
      orderByList: orderByList?.call(ProcessedSyncOperation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProcessedSyncOperationImpl extends ProcessedSyncOperation {
  _ProcessedSyncOperationImpl({
    _is.UuidValue? id,
    required _is.UuidValue operationId,
    required _is.UuidValue userId,
    _ilo7u3hn.AppUser? user,
    required String entityType,
    String? entityId,
    required String operationType,
    required String payload,
    required _i9saic36.SyncOperationStatus status,
    String? resultPayload,
    String? errorCode,
    String? errorMessage,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         operationId: operationId,
         userId: userId,
         user: user,
         entityType: entityType,
         entityId: entityId,
         operationType: operationType,
         payload: payload,
         status: status,
         resultPayload: resultPayload,
         errorCode: errorCode,
         errorMessage: errorMessage,
         serverVersion: serverVersion,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProcessedSyncOperation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ProcessedSyncOperation copyWith({
    Object? id = _Undefined,
    _is.UuidValue? operationId,
    _is.UuidValue? userId,
    Object? user = _Undefined,
    String? entityType,
    Object? entityId = _Undefined,
    String? operationType,
    String? payload,
    _i9saic36.SyncOperationStatus? status,
    Object? resultPayload = _Undefined,
    Object? errorCode = _Undefined,
    Object? errorMessage = _Undefined,
    int? serverVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProcessedSyncOperation(
      id: id is _is.UuidValue? ? id : this.id,
      operationId: operationId ?? this.operationId,
      userId: userId ?? this.userId,
      user: user is _ilo7u3hn.AppUser? ? user : this.user?.copyWith(),
      entityType: entityType ?? this.entityType,
      entityId: entityId is String? ? entityId : this.entityId,
      operationType: operationType ?? this.operationType,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      resultPayload: resultPayload is String?
          ? resultPayload
          : this.resultPayload,
      errorCode: errorCode is String? ? errorCode : this.errorCode,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      serverVersion: serverVersion ?? this.serverVersion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ProcessedSyncOperationUpdateTable
    extends _is.UpdateTable<ProcessedSyncOperationTable> {
  ProcessedSyncOperationUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> operationId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.operationId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> userId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> entityType(String value) => _is.ColumnValue(
    table.entityType,
    value,
  );

  _is.ColumnValue<String, String> entityId(String? value) => _is.ColumnValue(
    table.entityId,
    value,
  );

  _is.ColumnValue<String, String> operationType(String value) =>
      _is.ColumnValue(
        table.operationType,
        value,
      );

  _is.ColumnValue<String, String> payload(String value) => _is.ColumnValue(
    table.payload,
    value,
  );

  _is.ColumnValue<_i9saic36.SyncOperationStatus, _i9saic36.SyncOperationStatus>
  status(_i9saic36.SyncOperationStatus value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<String, String> resultPayload(String? value) =>
      _is.ColumnValue(
        table.resultPayload,
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

  _is.ColumnValue<int, int> serverVersion(int value) => _is.ColumnValue(
    table.serverVersion,
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

class ProcessedSyncOperationTable extends _is.Table<_is.UuidValue?> {
  ProcessedSyncOperationTable({super.tableRelation})
    : super(tableName: 'processed_sync_operations') {
    updateTable = ProcessedSyncOperationUpdateTable(this);
    operationId = _is.ColumnUuid(
      'operationId',
      this,
    );
    userId = _is.ColumnUuid(
      'userId',
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
    operationType = _is.ColumnString(
      'operationType',
      this,
    );
    payload = _is.ColumnString(
      'payload',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    resultPayload = _is.ColumnString(
      'resultPayload',
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
    serverVersion = _is.ColumnInt(
      'serverVersion',
      this,
      hasDefault: true,
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

  late final ProcessedSyncOperationUpdateTable updateTable;

  late final _is.ColumnUuid operationId;

  late final _is.ColumnUuid userId;

  _ilo7u3hn.AppUserTable? _user;

  late final _is.ColumnString entityType;

  late final _is.ColumnString entityId;

  late final _is.ColumnString operationType;

  late final _is.ColumnString payload;

  late final _is.ColumnEnum<_i9saic36.SyncOperationStatus> status;

  late final _is.ColumnString resultPayload;

  late final _is.ColumnString errorCode;

  late final _is.ColumnString errorMessage;

  late final _is.ColumnInt serverVersion;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  _ilo7u3hn.AppUserTable get user {
    if (_user != null) return _user!;
    _user = _is.createRelationTable(
      relationFieldName: 'user',
      field: ProcessedSyncOperation.t.userId,
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
    operationId,
    userId,
    entityType,
    entityId,
    operationType,
    payload,
    status,
    resultPayload,
    errorCode,
    errorMessage,
    serverVersion,
    createdAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class ProcessedSyncOperationInclude extends _is.IncludeObject {
  ProcessedSyncOperationInclude._({_ilo7u3hn.AppUserInclude? user}) {
    _user = user;
  }

  _ilo7u3hn.AppUserInclude? _user;

  @override
  Map<String, _is.Include?> get includes => {'user': _user};

  @override
  _is.Table<_is.UuidValue?> get table => ProcessedSyncOperation.t;
}

class ProcessedSyncOperationIncludeList extends _is.IncludeList {
  ProcessedSyncOperationIncludeList._({
    _is.WhereExpressionBuilder<ProcessedSyncOperationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProcessedSyncOperation.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => ProcessedSyncOperation.t;
}

class ProcessedSyncOperationRepository {
  const ProcessedSyncOperationRepository._();

  final attachRow = const ProcessedSyncOperationAttachRowRepository._();

  /// Returns a list of [ProcessedSyncOperation]s matching the given query parameters.
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
  Future<List<ProcessedSyncOperation>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProcessedSyncOperationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProcessedSyncOperationTable>? orderBy,
    _is.OrderByListBuilder<ProcessedSyncOperationTable>? orderByList,
    _is.Transaction? transaction,
    ProcessedSyncOperationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ProcessedSyncOperation>(
      where: where?.call(ProcessedSyncOperation.t),
      orderBy: orderBy?.call(ProcessedSyncOperation.t),
      orderByList: orderByList?.call(ProcessedSyncOperation.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ProcessedSyncOperation] matching the given query parameters.
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
  Future<ProcessedSyncOperation?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProcessedSyncOperationTable>? where,
    int? offset,
    _is.OrderByBuilder<ProcessedSyncOperationTable>? orderBy,
    _is.OrderByListBuilder<ProcessedSyncOperationTable>? orderByList,
    _is.Transaction? transaction,
    ProcessedSyncOperationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ProcessedSyncOperation>(
      where: where?.call(ProcessedSyncOperation.t),
      orderBy: orderBy?.call(ProcessedSyncOperation.t),
      orderByList: orderByList?.call(ProcessedSyncOperation.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ProcessedSyncOperation] by its [id] or null if no such row exists.
  Future<ProcessedSyncOperation?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    ProcessedSyncOperationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ProcessedSyncOperation>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ProcessedSyncOperation]s in the list and returns the inserted rows.
  ///
  /// The returned [ProcessedSyncOperation]s will have their `id` fields set.
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
  Future<List<ProcessedSyncOperation>> insert(
    _is.DatabaseSession session,
    List<ProcessedSyncOperation> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ProcessedSyncOperation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ProcessedSyncOperation] and returns the inserted row.
  ///
  /// The returned [ProcessedSyncOperation] will have its `id` field set.
  Future<ProcessedSyncOperation> insertRow(
    _is.DatabaseSession session,
    ProcessedSyncOperation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProcessedSyncOperation>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ProcessedSyncOperation]s in the list and returns the resulting rows.
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
  /// The returned [ProcessedSyncOperation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProcessedSyncOperation>> upsert(
    _is.DatabaseSession session,
    List<ProcessedSyncOperation> rows, {
    required _is.ColumnSelections<ProcessedSyncOperationTable> conflictColumns,
    _is.ColumnSelections<ProcessedSyncOperationTable>? updateColumns,
    _is.WhereExpressionBuilder<ProcessedSyncOperationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ProcessedSyncOperation>(
      rows,
      conflictColumns: conflictColumns(ProcessedSyncOperation.t),
      updateColumns: updateColumns?.call(ProcessedSyncOperation.t),
      updateWhere: updateWhere?.call(ProcessedSyncOperation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ProcessedSyncOperation] and returns the resulting row.
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
  /// The returned [ProcessedSyncOperation] will have its `id` field set.
  Future<ProcessedSyncOperation?> upsertRow(
    _is.DatabaseSession session,
    ProcessedSyncOperation row, {
    required _is.ColumnSelections<ProcessedSyncOperationTable> conflictColumns,
    _is.ColumnSelections<ProcessedSyncOperationTable>? updateColumns,
    _is.WhereExpressionBuilder<ProcessedSyncOperationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ProcessedSyncOperation>(
      row,
      conflictColumns: conflictColumns(ProcessedSyncOperation.t),
      updateColumns: updateColumns?.call(ProcessedSyncOperation.t),
      updateWhere: updateWhere?.call(ProcessedSyncOperation.t),
      transaction: transaction,
    );
  }

  /// Updates all [ProcessedSyncOperation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProcessedSyncOperation>> update(
    _is.DatabaseSession session,
    List<ProcessedSyncOperation> rows, {
    _is.ColumnSelections<ProcessedSyncOperationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ProcessedSyncOperation>(
      rows,
      columns: columns?.call(ProcessedSyncOperation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ProcessedSyncOperation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProcessedSyncOperation> updateRow(
    _is.DatabaseSession session,
    ProcessedSyncOperation row, {
    _is.ColumnSelections<ProcessedSyncOperationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProcessedSyncOperation>(
      row,
      columns: columns?.call(ProcessedSyncOperation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProcessedSyncOperation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProcessedSyncOperation?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<ProcessedSyncOperationUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ProcessedSyncOperation>(
      id,
      columnValues: columnValues(ProcessedSyncOperation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProcessedSyncOperation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProcessedSyncOperation>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ProcessedSyncOperationUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<ProcessedSyncOperationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProcessedSyncOperationTable>? orderBy,
    _is.OrderByListBuilder<ProcessedSyncOperationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ProcessedSyncOperation>(
      columnValues: columnValues(ProcessedSyncOperation.t.updateTable),
      where: where(ProcessedSyncOperation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProcessedSyncOperation.t),
      orderByList: orderByList?.call(ProcessedSyncOperation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ProcessedSyncOperation]s in the list and returns the deleted rows.
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
  Future<List<ProcessedSyncOperation>> delete(
    _is.DatabaseSession session,
    List<ProcessedSyncOperation> rows, {
    _is.OrderByBuilder<ProcessedSyncOperationTable>? orderBy,
    _is.OrderByListBuilder<ProcessedSyncOperationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ProcessedSyncOperation>(
      rows,
      orderBy: orderBy?.call(ProcessedSyncOperation.t),
      orderByList: orderByList?.call(ProcessedSyncOperation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ProcessedSyncOperation].
  Future<ProcessedSyncOperation> deleteRow(
    _is.DatabaseSession session,
    ProcessedSyncOperation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProcessedSyncOperation>(
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
  Future<List<ProcessedSyncOperation>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProcessedSyncOperationTable> where,
    _is.OrderByBuilder<ProcessedSyncOperationTable>? orderBy,
    _is.OrderByListBuilder<ProcessedSyncOperationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ProcessedSyncOperation>(
      where: where(ProcessedSyncOperation.t),
      orderBy: orderBy?.call(ProcessedSyncOperation.t),
      orderByList: orderByList?.call(ProcessedSyncOperation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProcessedSyncOperationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ProcessedSyncOperation>(
      where: where?.call(ProcessedSyncOperation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ProcessedSyncOperation] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProcessedSyncOperationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ProcessedSyncOperation>(
      where: where(ProcessedSyncOperation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class ProcessedSyncOperationAttachRowRepository {
  const ProcessedSyncOperationAttachRowRepository._();

  /// Creates a relation between the given [ProcessedSyncOperation] and [AppUser]
  /// by setting the [ProcessedSyncOperation]'s foreign key `userId` to refer to the [AppUser].
  Future<void> user(
    _is.DatabaseSession session,
    ProcessedSyncOperation processedSyncOperation,
    _ilo7u3hn.AppUser user, {
    _is.Transaction? transaction,
  }) async {
    if (processedSyncOperation.id == null) {
      throw ArgumentError.notNull('processedSyncOperation.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $processedSyncOperation = processedSyncOperation.copyWith(
      userId: user.id,
    );
    await session.db.updateRow<ProcessedSyncOperation>(
      $processedSyncOperation,
      columns: [ProcessedSyncOperation.t.userId],
      transaction: transaction,
    );
  }
}
