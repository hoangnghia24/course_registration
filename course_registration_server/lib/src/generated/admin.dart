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
import 'app_user.dart' as _i2j2xfrn;

abstract class Admin
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Admin._({
    this.id,
    required this.userId,
    this.user,
    int? permissionLevel,
  }) : permissionLevel = permissionLevel ?? 1;

  factory Admin({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    int? permissionLevel,
  }) = _AdminImpl;

  factory Admin.fromJson(Map<String, dynamic> jsonSerialization) {
    return Admin(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _is.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i2j2xfrn.AppUser>(
              jsonSerialization['user'],
            ),
      permissionLevel: jsonSerialization['permissionLevel'] as int?,
    );
  }

  static final t = AdminTable();

  static const db = AdminRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue userId;

  _i2j2xfrn.AppUser? user;

  int permissionLevel;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Admin copyWith({
    _is.UuidValue? id,
    _is.UuidValue? userId,
    _i2j2xfrn.AppUser? user,
    int? permissionLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Admin',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'permissionLevel': permissionLevel,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Admin',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'permissionLevel': permissionLevel,
    };
  }

  static AdminInclude include({_i2j2xfrn.AppUserInclude? user}) {
    return AdminInclude._(user: user);
  }

  static AdminIncludeList includeList({
    _is.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AdminTable>? orderBy,
    _is.OrderByListBuilder<AdminTable>? orderByList,
    AdminInclude? include,
  }) {
    return AdminIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminImpl extends Admin {
  _AdminImpl({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    int? permissionLevel,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         permissionLevel: permissionLevel,
       );

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Admin copyWith({
    Object? id = _Undefined,
    _is.UuidValue? userId,
    Object? user = _Undefined,
    int? permissionLevel,
  }) {
    return Admin(
      id: id is _is.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2j2xfrn.AppUser? ? user : this.user?.copyWith(),
      permissionLevel: permissionLevel ?? this.permissionLevel,
    );
  }
}

class AdminUpdateTable extends _is.UpdateTable<AdminTable> {
  AdminUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> userId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<int, int> permissionLevel(int value) => _is.ColumnValue(
    table.permissionLevel,
    value,
  );
}

class AdminTable extends _is.Table<_is.UuidValue?> {
  AdminTable({super.tableRelation}) : super(tableName: 'admins') {
    updateTable = AdminUpdateTable(this);
    userId = _is.ColumnUuid(
      'userId',
      this,
    );
    permissionLevel = _is.ColumnInt(
      'permissionLevel',
      this,
    );
  }

  late final AdminUpdateTable updateTable;

  late final _is.ColumnUuid userId;

  _i2j2xfrn.AppUserTable? _user;

  late final _is.ColumnInt permissionLevel;

  _i2j2xfrn.AppUserTable get user {
    if (_user != null) return _user!;
    _user = _is.createRelationTable(
      relationFieldName: 'user',
      field: Admin.t.userId,
      foreignField: _i2j2xfrn.AppUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2j2xfrn.AppUserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    permissionLevel,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class AdminInclude extends _is.IncludeObject {
  AdminInclude._({_i2j2xfrn.AppUserInclude? user}) {
    _user = user;
  }

  _i2j2xfrn.AppUserInclude? _user;

  @override
  Map<String, _is.Include?> get includes => {'user': _user};

  @override
  _is.Table<_is.UuidValue?> get table => Admin.t;
}

class AdminIncludeList extends _is.IncludeList {
  AdminIncludeList._({
    _is.WhereExpressionBuilder<AdminTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Admin.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Admin.t;
}

class AdminRepository {
  const AdminRepository._();

  final attachRow = const AdminAttachRowRepository._();

  /// Returns a list of [Admin]s matching the given query parameters.
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
  Future<List<Admin>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AdminTable>? orderBy,
    _is.OrderByListBuilder<AdminTable>? orderByList,
    _is.Transaction? transaction,
    AdminInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Admin>(
      where: where?.call(Admin.t),
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Admin] matching the given query parameters.
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
  Future<Admin?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AdminTable>? where,
    int? offset,
    _is.OrderByBuilder<AdminTable>? orderBy,
    _is.OrderByListBuilder<AdminTable>? orderByList,
    _is.Transaction? transaction,
    AdminInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Admin>(
      where: where?.call(Admin.t),
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Admin] by its [id] or null if no such row exists.
  Future<Admin?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    AdminInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Admin>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Admin]s in the list and returns the inserted rows.
  ///
  /// The returned [Admin]s will have their `id` fields set.
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
  Future<List<Admin>> insert(
    _is.DatabaseSession session,
    List<Admin> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Admin>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Admin] and returns the inserted row.
  ///
  /// The returned [Admin] will have its `id` field set.
  Future<Admin> insertRow(
    _is.DatabaseSession session,
    Admin row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Admin>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Admin]s in the list and returns the resulting rows.
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
  /// The returned [Admin]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Admin>> upsert(
    _is.DatabaseSession session,
    List<Admin> rows, {
    required _is.ColumnSelections<AdminTable> conflictColumns,
    _is.ColumnSelections<AdminTable>? updateColumns,
    _is.WhereExpressionBuilder<AdminTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Admin>(
      rows,
      conflictColumns: conflictColumns(Admin.t),
      updateColumns: updateColumns?.call(Admin.t),
      updateWhere: updateWhere?.call(Admin.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Admin] and returns the resulting row.
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
  /// The returned [Admin] will have its `id` field set.
  Future<Admin?> upsertRow(
    _is.DatabaseSession session,
    Admin row, {
    required _is.ColumnSelections<AdminTable> conflictColumns,
    _is.ColumnSelections<AdminTable>? updateColumns,
    _is.WhereExpressionBuilder<AdminTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Admin>(
      row,
      conflictColumns: conflictColumns(Admin.t),
      updateColumns: updateColumns?.call(Admin.t),
      updateWhere: updateWhere?.call(Admin.t),
      transaction: transaction,
    );
  }

  /// Updates all [Admin]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Admin>> update(
    _is.DatabaseSession session,
    List<Admin> rows, {
    _is.ColumnSelections<AdminTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Admin>(
      rows,
      columns: columns?.call(Admin.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Admin]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Admin> updateRow(
    _is.DatabaseSession session,
    Admin row, {
    _is.ColumnSelections<AdminTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Admin>(
      row,
      columns: columns?.call(Admin.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Admin] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Admin?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<AdminUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Admin>(
      id,
      columnValues: columnValues(Admin.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Admin]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Admin>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<AdminUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<AdminTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<AdminTable>? orderBy,
    _is.OrderByListBuilder<AdminTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Admin>(
      columnValues: columnValues(Admin.t.updateTable),
      where: where(Admin.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Admin]s in the list and returns the deleted rows.
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
  Future<List<Admin>> delete(
    _is.DatabaseSession session,
    List<Admin> rows, {
    _is.OrderByBuilder<AdminTable>? orderBy,
    _is.OrderByListBuilder<AdminTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Admin>(
      rows,
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Admin].
  Future<Admin> deleteRow(
    _is.DatabaseSession session,
    Admin row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Admin>(
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
  Future<List<Admin>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AdminTable> where,
    _is.OrderByBuilder<AdminTable>? orderBy,
    _is.OrderByListBuilder<AdminTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Admin>(
      where: where(Admin.t),
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Admin>(
      where: where?.call(Admin.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Admin] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<AdminTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Admin>(
      where: where(Admin.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class AdminAttachRowRepository {
  const AdminAttachRowRepository._();

  /// Creates a relation between the given [Admin] and [AppUser]
  /// by setting the [Admin]'s foreign key `userId` to refer to the [AppUser].
  Future<void> user(
    _is.DatabaseSession session,
    Admin admin,
    _i2j2xfrn.AppUser user, {
    _is.Transaction? transaction,
  }) async {
    if (admin.id == null) {
      throw ArgumentError.notNull('admin.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $admin = admin.copyWith(userId: user.id);
    await session.db.updateRow<Admin>(
      $admin,
      columns: [Admin.t.userId],
      transaction: transaction,
    );
  }
}
