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
import '../../admin.dart' as _ikmszj0x;

abstract class AdminPermission
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  AdminPermission._({
    this.id,
    required this.adminId,
    this.admin,
    required this.permissionName,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory AdminPermission({
    _is.UuidValue? id,
    required _is.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    required String permissionName,
    DateTime? createdAt,
  }) = _AdminPermissionImpl;

  factory AdminPermission.fromJson(Map<String, dynamic> jsonSerialization) {
    return AdminPermission(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      adminId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['adminId'],
      ),
      admin: jsonSerialization['admin'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['admin'],
            ),
      permissionName: jsonSerialization['permissionName'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = AdminPermissionTable();

  static const db = AdminPermissionRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue adminId;

  _ikmszj0x.Admin? admin;

  String permissionName;

  DateTime createdAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [AdminPermission]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  AdminPermission copyWith({
    _is.UuidValue? id,
    _is.UuidValue? adminId,
    _ikmszj0x.Admin? admin,
    String? permissionName,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AdminPermission',
      if (id != null) 'id': id?.toJson(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJson(),
      'permissionName': permissionName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AdminPermission',
      if (id != null) 'id': id?.toJson(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJsonForProtocol(),
      'permissionName': permissionName,
      'createdAt': createdAt.toJson(),
    };
  }

  static AdminPermissionInclude include({_ikmszj0x.AdminInclude? admin}) {
    return AdminPermissionInclude._(admin: admin);
  }

  static AdminPermissionIncludeList includeList({
    _is.WhereExpressionBuilder<AdminPermissionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AdminPermissionTable>? orderBy,
    _is.OrderByListBuilder<AdminPermissionTable>? orderByList,
    AdminPermissionInclude? include,
  }) {
    return AdminPermissionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AdminPermission.t),
      orderByList: orderByList?.call(AdminPermission.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminPermissionImpl extends AdminPermission {
  _AdminPermissionImpl({
    _is.UuidValue? id,
    required _is.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    required String permissionName,
    DateTime? createdAt,
  }) : super._(
         id: id,
         adminId: adminId,
         admin: admin,
         permissionName: permissionName,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AdminPermission]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  AdminPermission copyWith({
    Object? id = _Undefined,
    _is.UuidValue? adminId,
    Object? admin = _Undefined,
    String? permissionName,
    DateTime? createdAt,
  }) {
    return AdminPermission(
      id: id is _is.UuidValue? ? id : this.id,
      adminId: adminId ?? this.adminId,
      admin: admin is _ikmszj0x.Admin? ? admin : this.admin?.copyWith(),
      permissionName: permissionName ?? this.permissionName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class AdminPermissionUpdateTable extends _is.UpdateTable<AdminPermissionTable> {
  AdminPermissionUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> adminId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.adminId,
        value,
      );

  _is.ColumnValue<String, String> permissionName(String value) =>
      _is.ColumnValue(
        table.permissionName,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class AdminPermissionTable extends _is.Table<_is.UuidValue?> {
  AdminPermissionTable({super.tableRelation})
    : super(tableName: 'admin_permissions') {
    updateTable = AdminPermissionUpdateTable(this);
    adminId = _is.ColumnUuid(
      'adminId',
      this,
    );
    permissionName = _is.ColumnString(
      'permissionName',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final AdminPermissionUpdateTable updateTable;

  late final _is.ColumnUuid adminId;

  _ikmszj0x.AdminTable? _admin;

  late final _is.ColumnString permissionName;

  late final _is.ColumnDateTime createdAt;

  _ikmszj0x.AdminTable get admin {
    if (_admin != null) return _admin!;
    _admin = _is.createRelationTable(
      relationFieldName: 'admin',
      field: AdminPermission.t.adminId,
      foreignField: _ikmszj0x.Admin.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ikmszj0x.AdminTable(tableRelation: foreignTableRelation),
    );
    return _admin!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    adminId,
    permissionName,
    createdAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'admin') {
      return admin;
    }
    return null;
  }
}

class AdminPermissionInclude extends _is.IncludeObject {
  AdminPermissionInclude._({_ikmszj0x.AdminInclude? admin}) {
    _admin = admin;
  }

  _ikmszj0x.AdminInclude? _admin;

  @override
  Map<String, _is.Include?> get includes => {'admin': _admin};

  @override
  _is.Table<_is.UuidValue?> get table => AdminPermission.t;
}

class AdminPermissionIncludeList extends _is.IncludeList {
  AdminPermissionIncludeList._({
    _is.WhereExpressionBuilder<AdminPermissionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AdminPermission.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => AdminPermission.t;
}

class AdminPermissionRepository {
  const AdminPermissionRepository._();

  final attachRow = const AdminPermissionAttachRowRepository._();

  /// Returns a list of [AdminPermission]s matching the given query parameters.
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
  Future<List<AdminPermission>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AdminPermissionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AdminPermissionTable>? orderBy,
    _is.OrderByListBuilder<AdminPermissionTable>? orderByList,
    _is.Transaction? transaction,
    AdminPermissionInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AdminPermission>(
      where: where?.call(AdminPermission.t),
      orderBy: orderBy?.call(AdminPermission.t),
      orderByList: orderByList?.call(AdminPermission.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AdminPermission] matching the given query parameters.
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
  Future<AdminPermission?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AdminPermissionTable>? where,
    int? offset,
    _is.OrderByBuilder<AdminPermissionTable>? orderBy,
    _is.OrderByListBuilder<AdminPermissionTable>? orderByList,
    _is.Transaction? transaction,
    AdminPermissionInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AdminPermission>(
      where: where?.call(AdminPermission.t),
      orderBy: orderBy?.call(AdminPermission.t),
      orderByList: orderByList?.call(AdminPermission.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AdminPermission] by its [id] or null if no such row exists.
  Future<AdminPermission?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    AdminPermissionInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AdminPermission>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AdminPermission]s in the list and returns the inserted rows.
  ///
  /// The returned [AdminPermission]s will have their `id` fields set.
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
  Future<List<AdminPermission>> insert(
    _is.DatabaseSession session,
    List<AdminPermission> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<AdminPermission>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [AdminPermission] and returns the inserted row.
  ///
  /// The returned [AdminPermission] will have its `id` field set.
  Future<AdminPermission> insertRow(
    _is.DatabaseSession session,
    AdminPermission row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<AdminPermission>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [AdminPermission]s in the list and returns the resulting rows.
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
  /// The returned [AdminPermission]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AdminPermission>> upsert(
    _is.DatabaseSession session,
    List<AdminPermission> rows, {
    required _is.ColumnSelections<AdminPermissionTable> conflictColumns,
    _is.ColumnSelections<AdminPermissionTable>? updateColumns,
    _is.WhereExpressionBuilder<AdminPermissionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<AdminPermission>(
      rows,
      conflictColumns: conflictColumns(AdminPermission.t),
      updateColumns: updateColumns?.call(AdminPermission.t),
      updateWhere: updateWhere?.call(AdminPermission.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [AdminPermission] and returns the resulting row.
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
  /// The returned [AdminPermission] will have its `id` field set.
  Future<AdminPermission?> upsertRow(
    _is.DatabaseSession session,
    AdminPermission row, {
    required _is.ColumnSelections<AdminPermissionTable> conflictColumns,
    _is.ColumnSelections<AdminPermissionTable>? updateColumns,
    _is.WhereExpressionBuilder<AdminPermissionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<AdminPermission>(
      row,
      conflictColumns: conflictColumns(AdminPermission.t),
      updateColumns: updateColumns?.call(AdminPermission.t),
      updateWhere: updateWhere?.call(AdminPermission.t),
      transaction: transaction,
    );
  }

  /// Updates all [AdminPermission]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AdminPermission>> update(
    _is.DatabaseSession session,
    List<AdminPermission> rows, {
    _is.ColumnSelections<AdminPermissionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<AdminPermission>(
      rows,
      columns: columns?.call(AdminPermission.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [AdminPermission]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AdminPermission> updateRow(
    _is.DatabaseSession session,
    AdminPermission row, {
    _is.ColumnSelections<AdminPermissionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<AdminPermission>(
      row,
      columns: columns?.call(AdminPermission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AdminPermission] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AdminPermission?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<AdminPermissionUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<AdminPermission>(
      id,
      columnValues: columnValues(AdminPermission.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AdminPermission]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<AdminPermission>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<AdminPermissionUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<AdminPermissionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AdminPermissionTable>? orderBy,
    _is.OrderByListBuilder<AdminPermissionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<AdminPermission>(
      columnValues: columnValues(AdminPermission.t.updateTable),
      where: where(AdminPermission.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AdminPermission.t),
      orderByList: orderByList?.call(AdminPermission.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [AdminPermission]s in the list and returns the deleted rows.
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
  Future<List<AdminPermission>> delete(
    _is.DatabaseSession session,
    List<AdminPermission> rows, {
    _is.OrderByBuilder<AdminPermissionTable>? orderBy,
    _is.OrderByListBuilder<AdminPermissionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<AdminPermission>(
      rows,
      orderBy: orderBy?.call(AdminPermission.t),
      orderByList: orderByList?.call(AdminPermission.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [AdminPermission].
  Future<AdminPermission> deleteRow(
    _is.DatabaseSession session,
    AdminPermission row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AdminPermission>(
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
  Future<List<AdminPermission>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AdminPermissionTable> where,
    _is.OrderByBuilder<AdminPermissionTable>? orderBy,
    _is.OrderByListBuilder<AdminPermissionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<AdminPermission>(
      where: where(AdminPermission.t),
      orderBy: orderBy?.call(AdminPermission.t),
      orderByList: orderByList?.call(AdminPermission.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AdminPermissionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<AdminPermission>(
      where: where?.call(AdminPermission.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AdminPermission] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AdminPermissionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AdminPermission>(
      where: where(AdminPermission.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class AdminPermissionAttachRowRepository {
  const AdminPermissionAttachRowRepository._();

  /// Creates a relation between the given [AdminPermission] and [Admin]
  /// by setting the [AdminPermission]'s foreign key `adminId` to refer to the [Admin].
  Future<void> admin(
    _is.DatabaseSession session,
    AdminPermission adminPermission,
    _ikmszj0x.Admin admin, {
    _is.Transaction? transaction,
  }) async {
    if (adminPermission.id == null) {
      throw ArgumentError.notNull('adminPermission.id');
    }
    if (admin.id == null) {
      throw ArgumentError.notNull('admin.id');
    }

    var $adminPermission = adminPermission.copyWith(adminId: admin.id);
    await session.db.updateRow<AdminPermission>(
      $adminPermission,
      columns: [AdminPermission.t.adminId],
      transaction: transaction,
    );
  }
}
