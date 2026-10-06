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
import '../../admin/models/class_approval_status.dart' as _ie7gue25;
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class ClassApproval
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  ClassApproval._({
    this.id,
    required this.courseClassId,
    this.courseClass,
    required this.adminId,
    this.admin,
    _ie7gue25.ClassApprovalStatus? status,
    this.comment,
    DateTime? createdAt,
  }) : status = status ?? _ie7gue25.ClassApprovalStatus.pending,
       createdAt = createdAt ?? DateTime.now();

  factory ClassApproval({
    _is.UuidValue? id,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _is.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    _ie7gue25.ClassApprovalStatus? status,
    String? comment,
    DateTime? createdAt,
  }) = _ClassApprovalImpl;

  factory ClassApproval.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClassApproval(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      adminId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['adminId'],
      ),
      admin: jsonSerialization['admin'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['admin'],
            ),
      status: jsonSerialization['status'] == null
          ? null
          : _ie7gue25.ClassApprovalStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      comment: jsonSerialization['comment'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ClassApprovalTable();

  static const db = ClassApprovalRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  _is.UuidValue adminId;

  _ikmszj0x.Admin? admin;

  _ie7gue25.ClassApprovalStatus status;

  String? comment;

  DateTime createdAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [ClassApproval]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClassApproval copyWith({
    _is.UuidValue? id,
    _is.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    _is.UuidValue? adminId,
    _ikmszj0x.Admin? admin,
    _ie7gue25.ClassApprovalStatus? status,
    String? comment,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassApproval',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJson(),
      'status': status.toJson(),
      if (comment != null) 'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassApproval',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJsonForProtocol(),
      'status': status.toJson(),
      if (comment != null) 'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  static ClassApprovalInclude include({
    _igjwbat6.CourseClassInclude? courseClass,
    _ikmszj0x.AdminInclude? admin,
  }) {
    return ClassApprovalInclude._(
      courseClass: courseClass,
      admin: admin,
    );
  }

  static ClassApprovalIncludeList includeList({
    _is.WhereExpressionBuilder<ClassApprovalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassApprovalTable>? orderBy,
    _is.OrderByListBuilder<ClassApprovalTable>? orderByList,
    ClassApprovalInclude? include,
  }) {
    return ClassApprovalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ClassApproval.t),
      orderByList: orderByList?.call(ClassApproval.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClassApprovalImpl extends ClassApproval {
  _ClassApprovalImpl({
    _is.UuidValue? id,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _is.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    _ie7gue25.ClassApprovalStatus? status,
    String? comment,
    DateTime? createdAt,
  }) : super._(
         id: id,
         courseClassId: courseClassId,
         courseClass: courseClass,
         adminId: adminId,
         admin: admin,
         status: status,
         comment: comment,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ClassApproval]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClassApproval copyWith({
    Object? id = _Undefined,
    _is.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    _is.UuidValue? adminId,
    Object? admin = _Undefined,
    _ie7gue25.ClassApprovalStatus? status,
    Object? comment = _Undefined,
    DateTime? createdAt,
  }) {
    return ClassApproval(
      id: id is _is.UuidValue? ? id : this.id,
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      adminId: adminId ?? this.adminId,
      admin: admin is _ikmszj0x.Admin? ? admin : this.admin?.copyWith(),
      status: status ?? this.status,
      comment: comment is String? ? comment : this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ClassApprovalUpdateTable extends _is.UpdateTable<ClassApprovalTable> {
  ClassApprovalUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseClassId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.courseClassId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> adminId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.adminId,
        value,
      );

  _is.ColumnValue<_ie7gue25.ClassApprovalStatus, _ie7gue25.ClassApprovalStatus>
  status(_ie7gue25.ClassApprovalStatus value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<String, String> comment(String? value) => _is.ColumnValue(
    table.comment,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class ClassApprovalTable extends _is.Table<_is.UuidValue?> {
  ClassApprovalTable({super.tableRelation})
    : super(tableName: 'class_approvals') {
    updateTable = ClassApprovalUpdateTable(this);
    courseClassId = _is.ColumnUuid(
      'courseClassId',
      this,
    );
    adminId = _is.ColumnUuid(
      'adminId',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    comment = _is.ColumnString(
      'comment',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ClassApprovalUpdateTable updateTable;

  late final _is.ColumnUuid courseClassId;

  _igjwbat6.CourseClassTable? _courseClass;

  late final _is.ColumnUuid adminId;

  _ikmszj0x.AdminTable? _admin;

  late final _is.ColumnEnum<_ie7gue25.ClassApprovalStatus> status;

  late final _is.ColumnString comment;

  late final _is.ColumnDateTime createdAt;

  _igjwbat6.CourseClassTable get courseClass {
    if (_courseClass != null) return _courseClass!;
    _courseClass = _is.createRelationTable(
      relationFieldName: 'courseClass',
      field: ClassApproval.t.courseClassId,
      foreignField: _igjwbat6.CourseClass.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _igjwbat6.CourseClassTable(tableRelation: foreignTableRelation),
    );
    return _courseClass!;
  }

  _ikmszj0x.AdminTable get admin {
    if (_admin != null) return _admin!;
    _admin = _is.createRelationTable(
      relationFieldName: 'admin',
      field: ClassApproval.t.adminId,
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
    courseClassId,
    adminId,
    status,
    comment,
    createdAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'courseClass') {
      return courseClass;
    }
    if (relationField == 'admin') {
      return admin;
    }
    return null;
  }
}

class ClassApprovalInclude extends _is.IncludeObject {
  ClassApprovalInclude._({
    _igjwbat6.CourseClassInclude? courseClass,
    _ikmszj0x.AdminInclude? admin,
  }) {
    _courseClass = courseClass;
    _admin = admin;
  }

  _igjwbat6.CourseClassInclude? _courseClass;

  _ikmszj0x.AdminInclude? _admin;

  @override
  Map<String, _is.Include?> get includes => {
    'courseClass': _courseClass,
    'admin': _admin,
  };

  @override
  _is.Table<_is.UuidValue?> get table => ClassApproval.t;
}

class ClassApprovalIncludeList extends _is.IncludeList {
  ClassApprovalIncludeList._({
    _is.WhereExpressionBuilder<ClassApprovalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ClassApproval.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => ClassApproval.t;
}

class ClassApprovalRepository {
  const ClassApprovalRepository._();

  final attachRow = const ClassApprovalAttachRowRepository._();

  /// Returns a list of [ClassApproval]s matching the given query parameters.
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
  Future<List<ClassApproval>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassApprovalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassApprovalTable>? orderBy,
    _is.OrderByListBuilder<ClassApprovalTable>? orderByList,
    _is.Transaction? transaction,
    ClassApprovalInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ClassApproval>(
      where: where?.call(ClassApproval.t),
      orderBy: orderBy?.call(ClassApproval.t),
      orderByList: orderByList?.call(ClassApproval.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ClassApproval] matching the given query parameters.
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
  Future<ClassApproval?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassApprovalTable>? where,
    int? offset,
    _is.OrderByBuilder<ClassApprovalTable>? orderBy,
    _is.OrderByListBuilder<ClassApprovalTable>? orderByList,
    _is.Transaction? transaction,
    ClassApprovalInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ClassApproval>(
      where: where?.call(ClassApproval.t),
      orderBy: orderBy?.call(ClassApproval.t),
      orderByList: orderByList?.call(ClassApproval.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ClassApproval] by its [id] or null if no such row exists.
  Future<ClassApproval?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    ClassApprovalInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ClassApproval>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ClassApproval]s in the list and returns the inserted rows.
  ///
  /// The returned [ClassApproval]s will have their `id` fields set.
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
  Future<List<ClassApproval>> insert(
    _is.DatabaseSession session,
    List<ClassApproval> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ClassApproval>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ClassApproval] and returns the inserted row.
  ///
  /// The returned [ClassApproval] will have its `id` field set.
  Future<ClassApproval> insertRow(
    _is.DatabaseSession session,
    ClassApproval row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ClassApproval>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ClassApproval]s in the list and returns the resulting rows.
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
  /// The returned [ClassApproval]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassApproval>> upsert(
    _is.DatabaseSession session,
    List<ClassApproval> rows, {
    required _is.ColumnSelections<ClassApprovalTable> conflictColumns,
    _is.ColumnSelections<ClassApprovalTable>? updateColumns,
    _is.WhereExpressionBuilder<ClassApprovalTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ClassApproval>(
      rows,
      conflictColumns: conflictColumns(ClassApproval.t),
      updateColumns: updateColumns?.call(ClassApproval.t),
      updateWhere: updateWhere?.call(ClassApproval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ClassApproval] and returns the resulting row.
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
  /// The returned [ClassApproval] will have its `id` field set.
  Future<ClassApproval?> upsertRow(
    _is.DatabaseSession session,
    ClassApproval row, {
    required _is.ColumnSelections<ClassApprovalTable> conflictColumns,
    _is.ColumnSelections<ClassApprovalTable>? updateColumns,
    _is.WhereExpressionBuilder<ClassApprovalTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ClassApproval>(
      row,
      conflictColumns: conflictColumns(ClassApproval.t),
      updateColumns: updateColumns?.call(ClassApproval.t),
      updateWhere: updateWhere?.call(ClassApproval.t),
      transaction: transaction,
    );
  }

  /// Updates all [ClassApproval]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassApproval>> update(
    _is.DatabaseSession session,
    List<ClassApproval> rows, {
    _is.ColumnSelections<ClassApprovalTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ClassApproval>(
      rows,
      columns: columns?.call(ClassApproval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ClassApproval]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ClassApproval> updateRow(
    _is.DatabaseSession session,
    ClassApproval row, {
    _is.ColumnSelections<ClassApprovalTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ClassApproval>(
      row,
      columns: columns?.call(ClassApproval.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ClassApproval] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ClassApproval?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<ClassApprovalUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ClassApproval>(
      id,
      columnValues: columnValues(ClassApproval.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ClassApproval]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassApproval>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ClassApprovalUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ClassApprovalTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassApprovalTable>? orderBy,
    _is.OrderByListBuilder<ClassApprovalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ClassApproval>(
      columnValues: columnValues(ClassApproval.t.updateTable),
      where: where(ClassApproval.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ClassApproval.t),
      orderByList: orderByList?.call(ClassApproval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ClassApproval]s in the list and returns the deleted rows.
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
  Future<List<ClassApproval>> delete(
    _is.DatabaseSession session,
    List<ClassApproval> rows, {
    _is.OrderByBuilder<ClassApprovalTable>? orderBy,
    _is.OrderByListBuilder<ClassApprovalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ClassApproval>(
      rows,
      orderBy: orderBy?.call(ClassApproval.t),
      orderByList: orderByList?.call(ClassApproval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ClassApproval].
  Future<ClassApproval> deleteRow(
    _is.DatabaseSession session,
    ClassApproval row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ClassApproval>(
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
  Future<List<ClassApproval>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ClassApprovalTable> where,
    _is.OrderByBuilder<ClassApprovalTable>? orderBy,
    _is.OrderByListBuilder<ClassApprovalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ClassApproval>(
      where: where(ClassApproval.t),
      orderBy: orderBy?.call(ClassApproval.t),
      orderByList: orderByList?.call(ClassApproval.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassApprovalTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ClassApproval>(
      where: where?.call(ClassApproval.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ClassApproval] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ClassApprovalTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ClassApproval>(
      where: where(ClassApproval.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class ClassApprovalAttachRowRepository {
  const ClassApprovalAttachRowRepository._();

  /// Creates a relation between the given [ClassApproval] and [CourseClass]
  /// by setting the [ClassApproval]'s foreign key `courseClassId` to refer to the [CourseClass].
  Future<void> courseClass(
    _is.DatabaseSession session,
    ClassApproval classApproval,
    _igjwbat6.CourseClass courseClass, {
    _is.Transaction? transaction,
  }) async {
    if (classApproval.id == null) {
      throw ArgumentError.notNull('classApproval.id');
    }
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }

    var $classApproval = classApproval.copyWith(courseClassId: courseClass.id);
    await session.db.updateRow<ClassApproval>(
      $classApproval,
      columns: [ClassApproval.t.courseClassId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ClassApproval] and [Admin]
  /// by setting the [ClassApproval]'s foreign key `adminId` to refer to the [Admin].
  Future<void> admin(
    _is.DatabaseSession session,
    ClassApproval classApproval,
    _ikmszj0x.Admin admin, {
    _is.Transaction? transaction,
  }) async {
    if (classApproval.id == null) {
      throw ArgumentError.notNull('classApproval.id');
    }
    if (admin.id == null) {
      throw ArgumentError.notNull('admin.id');
    }

    var $classApproval = classApproval.copyWith(adminId: admin.id);
    await session.db.updateRow<ClassApproval>(
      $classApproval,
      columns: [ClassApproval.t.adminId],
      transaction: transaction,
    );
  }
}
