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

abstract class Lecturer
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Lecturer._({
    this.id,
    required this.userId,
    this.user,
    required this.lecturerCode,
    this.facultyId,
    this.academicDegree,
    this.department,
    this.academicTitle,
    this.specialization,
  });

  factory Lecturer({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String lecturerCode,
    _is.UuidValue? facultyId,
    String? academicDegree,
    String? department,
    String? academicTitle,
    String? specialization,
  }) = _LecturerImpl;

  factory Lecturer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Lecturer(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _is.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i2j2xfrn.AppUser>(
              jsonSerialization['user'],
            ),
      lecturerCode: jsonSerialization['lecturerCode'] as String,
      facultyId: jsonSerialization['facultyId'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['facultyId']),
      academicDegree: jsonSerialization['academicDegree'] as String?,
      department: jsonSerialization['department'] as String?,
      academicTitle: jsonSerialization['academicTitle'] as String?,
      specialization: jsonSerialization['specialization'] as String?,
    );
  }

  static final t = LecturerTable();

  static const db = LecturerRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue userId;

  _i2j2xfrn.AppUser? user;

  String lecturerCode;

  _is.UuidValue? facultyId;

  String? academicDegree;

  String? department;

  String? academicTitle;

  String? specialization;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Lecturer]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Lecturer copyWith({
    _is.UuidValue? id,
    _is.UuidValue? userId,
    _i2j2xfrn.AppUser? user,
    String? lecturerCode,
    _is.UuidValue? facultyId,
    String? academicDegree,
    String? department,
    String? academicTitle,
    String? specialization,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Lecturer',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'lecturerCode': lecturerCode,
      if (facultyId != null) 'facultyId': facultyId?.toJson(),
      if (academicDegree != null) 'academicDegree': academicDegree,
      if (department != null) 'department': department,
      if (academicTitle != null) 'academicTitle': academicTitle,
      if (specialization != null) 'specialization': specialization,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Lecturer',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'lecturerCode': lecturerCode,
      if (facultyId != null) 'facultyId': facultyId?.toJson(),
      if (academicDegree != null) 'academicDegree': academicDegree,
      if (department != null) 'department': department,
      if (academicTitle != null) 'academicTitle': academicTitle,
      if (specialization != null) 'specialization': specialization,
    };
  }

  static LecturerInclude include({_i2j2xfrn.AppUserInclude? user}) {
    return LecturerInclude._(user: user);
  }

  static LecturerIncludeList includeList({
    _is.WhereExpressionBuilder<LecturerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerTable>? orderBy,
    _is.OrderByListBuilder<LecturerTable>? orderByList,
    LecturerInclude? include,
  }) {
    return LecturerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Lecturer.t),
      orderByList: orderByList?.call(Lecturer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LecturerImpl extends Lecturer {
  _LecturerImpl({
    _is.UuidValue? id,
    required _is.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    required String lecturerCode,
    _is.UuidValue? facultyId,
    String? academicDegree,
    String? department,
    String? academicTitle,
    String? specialization,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         lecturerCode: lecturerCode,
         facultyId: facultyId,
         academicDegree: academicDegree,
         department: department,
         academicTitle: academicTitle,
         specialization: specialization,
       );

  /// Returns a shallow copy of this [Lecturer]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Lecturer copyWith({
    Object? id = _Undefined,
    _is.UuidValue? userId,
    Object? user = _Undefined,
    String? lecturerCode,
    Object? facultyId = _Undefined,
    Object? academicDegree = _Undefined,
    Object? department = _Undefined,
    Object? academicTitle = _Undefined,
    Object? specialization = _Undefined,
  }) {
    return Lecturer(
      id: id is _is.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2j2xfrn.AppUser? ? user : this.user?.copyWith(),
      lecturerCode: lecturerCode ?? this.lecturerCode,
      facultyId: facultyId is _is.UuidValue? ? facultyId : this.facultyId,
      academicDegree: academicDegree is String?
          ? academicDegree
          : this.academicDegree,
      department: department is String? ? department : this.department,
      academicTitle: academicTitle is String?
          ? academicTitle
          : this.academicTitle,
      specialization: specialization is String?
          ? specialization
          : this.specialization,
    );
  }
}

class LecturerUpdateTable extends _is.UpdateTable<LecturerTable> {
  LecturerUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> userId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> lecturerCode(String value) => _is.ColumnValue(
    table.lecturerCode,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> facultyId(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.facultyId,
    value,
  );

  _is.ColumnValue<String, String> academicDegree(String? value) =>
      _is.ColumnValue(
        table.academicDegree,
        value,
      );

  _is.ColumnValue<String, String> department(String? value) => _is.ColumnValue(
    table.department,
    value,
  );

  _is.ColumnValue<String, String> academicTitle(String? value) =>
      _is.ColumnValue(
        table.academicTitle,
        value,
      );

  _is.ColumnValue<String, String> specialization(String? value) =>
      _is.ColumnValue(
        table.specialization,
        value,
      );
}

class LecturerTable extends _is.Table<_is.UuidValue?> {
  LecturerTable({super.tableRelation}) : super(tableName: 'lecturers') {
    updateTable = LecturerUpdateTable(this);
    userId = _is.ColumnUuid(
      'userId',
      this,
    );
    lecturerCode = _is.ColumnString(
      'lecturerCode',
      this,
    );
    facultyId = _is.ColumnUuid(
      'facultyId',
      this,
    );
    academicDegree = _is.ColumnString(
      'academicDegree',
      this,
    );
    department = _is.ColumnString(
      'department',
      this,
    );
    academicTitle = _is.ColumnString(
      'academicTitle',
      this,
    );
    specialization = _is.ColumnString(
      'specialization',
      this,
    );
  }

  late final LecturerUpdateTable updateTable;

  late final _is.ColumnUuid userId;

  _i2j2xfrn.AppUserTable? _user;

  late final _is.ColumnString lecturerCode;

  late final _is.ColumnUuid facultyId;

  late final _is.ColumnString academicDegree;

  late final _is.ColumnString department;

  late final _is.ColumnString academicTitle;

  late final _is.ColumnString specialization;

  _i2j2xfrn.AppUserTable get user {
    if (_user != null) return _user!;
    _user = _is.createRelationTable(
      relationFieldName: 'user',
      field: Lecturer.t.userId,
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
    lecturerCode,
    facultyId,
    academicDegree,
    department,
    academicTitle,
    specialization,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class LecturerInclude extends _is.IncludeObject {
  LecturerInclude._({_i2j2xfrn.AppUserInclude? user}) {
    _user = user;
  }

  _i2j2xfrn.AppUserInclude? _user;

  @override
  Map<String, _is.Include?> get includes => {'user': _user};

  @override
  _is.Table<_is.UuidValue?> get table => Lecturer.t;
}

class LecturerIncludeList extends _is.IncludeList {
  LecturerIncludeList._({
    _is.WhereExpressionBuilder<LecturerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Lecturer.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Lecturer.t;
}

class LecturerRepository {
  const LecturerRepository._();

  final attachRow = const LecturerAttachRowRepository._();

  /// Returns a list of [Lecturer]s matching the given query parameters.
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
  Future<List<Lecturer>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerTable>? orderBy,
    _is.OrderByListBuilder<LecturerTable>? orderByList,
    _is.Transaction? transaction,
    LecturerInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Lecturer>(
      where: where?.call(Lecturer.t),
      orderBy: orderBy?.call(Lecturer.t),
      orderByList: orderByList?.call(Lecturer.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Lecturer] matching the given query parameters.
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
  Future<Lecturer?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerTable>? where,
    int? offset,
    _is.OrderByBuilder<LecturerTable>? orderBy,
    _is.OrderByListBuilder<LecturerTable>? orderByList,
    _is.Transaction? transaction,
    LecturerInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Lecturer>(
      where: where?.call(Lecturer.t),
      orderBy: orderBy?.call(Lecturer.t),
      orderByList: orderByList?.call(Lecturer.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Lecturer] by its [id] or null if no such row exists.
  Future<Lecturer?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    LecturerInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Lecturer>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Lecturer]s in the list and returns the inserted rows.
  ///
  /// The returned [Lecturer]s will have their `id` fields set.
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
  Future<List<Lecturer>> insert(
    _is.DatabaseSession session,
    List<Lecturer> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Lecturer>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Lecturer] and returns the inserted row.
  ///
  /// The returned [Lecturer] will have its `id` field set.
  Future<Lecturer> insertRow(
    _is.DatabaseSession session,
    Lecturer row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Lecturer>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Lecturer]s in the list and returns the resulting rows.
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
  /// The returned [Lecturer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Lecturer>> upsert(
    _is.DatabaseSession session,
    List<Lecturer> rows, {
    required _is.ColumnSelections<LecturerTable> conflictColumns,
    _is.ColumnSelections<LecturerTable>? updateColumns,
    _is.WhereExpressionBuilder<LecturerTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Lecturer>(
      rows,
      conflictColumns: conflictColumns(Lecturer.t),
      updateColumns: updateColumns?.call(Lecturer.t),
      updateWhere: updateWhere?.call(Lecturer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Lecturer] and returns the resulting row.
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
  /// The returned [Lecturer] will have its `id` field set.
  Future<Lecturer?> upsertRow(
    _is.DatabaseSession session,
    Lecturer row, {
    required _is.ColumnSelections<LecturerTable> conflictColumns,
    _is.ColumnSelections<LecturerTable>? updateColumns,
    _is.WhereExpressionBuilder<LecturerTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Lecturer>(
      row,
      conflictColumns: conflictColumns(Lecturer.t),
      updateColumns: updateColumns?.call(Lecturer.t),
      updateWhere: updateWhere?.call(Lecturer.t),
      transaction: transaction,
    );
  }

  /// Updates all [Lecturer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Lecturer>> update(
    _is.DatabaseSession session,
    List<Lecturer> rows, {
    _is.ColumnSelections<LecturerTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Lecturer>(
      rows,
      columns: columns?.call(Lecturer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Lecturer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Lecturer> updateRow(
    _is.DatabaseSession session,
    Lecturer row, {
    _is.ColumnSelections<LecturerTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Lecturer>(
      row,
      columns: columns?.call(Lecturer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Lecturer] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Lecturer?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<LecturerUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Lecturer>(
      id,
      columnValues: columnValues(Lecturer.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Lecturer]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Lecturer>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<LecturerUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<LecturerTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LecturerTable>? orderBy,
    _is.OrderByListBuilder<LecturerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Lecturer>(
      columnValues: columnValues(Lecturer.t.updateTable),
      where: where(Lecturer.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Lecturer.t),
      orderByList: orderByList?.call(Lecturer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Lecturer]s in the list and returns the deleted rows.
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
  Future<List<Lecturer>> delete(
    _is.DatabaseSession session,
    List<Lecturer> rows, {
    _is.OrderByBuilder<LecturerTable>? orderBy,
    _is.OrderByListBuilder<LecturerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Lecturer>(
      rows,
      orderBy: orderBy?.call(Lecturer.t),
      orderByList: orderByList?.call(Lecturer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Lecturer].
  Future<Lecturer> deleteRow(
    _is.DatabaseSession session,
    Lecturer row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Lecturer>(
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
  Future<List<Lecturer>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LecturerTable> where,
    _is.OrderByBuilder<LecturerTable>? orderBy,
    _is.OrderByListBuilder<LecturerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Lecturer>(
      where: where(Lecturer.t),
      orderBy: orderBy?.call(Lecturer.t),
      orderByList: orderByList?.call(Lecturer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LecturerTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Lecturer>(
      where: where?.call(Lecturer.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Lecturer] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LecturerTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Lecturer>(
      where: where(Lecturer.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class LecturerAttachRowRepository {
  const LecturerAttachRowRepository._();

  /// Creates a relation between the given [Lecturer] and [AppUser]
  /// by setting the [Lecturer]'s foreign key `userId` to refer to the [AppUser].
  Future<void> user(
    _is.DatabaseSession session,
    Lecturer lecturer,
    _i2j2xfrn.AppUser user, {
    _is.Transaction? transaction,
  }) async {
    if (lecturer.id == null) {
      throw ArgumentError.notNull('lecturer.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $lecturer = lecturer.copyWith(userId: user.id);
    await session.db.updateRow<Lecturer>(
      $lecturer,
      columns: [Lecturer.t.userId],
      transaction: transaction,
    );
  }
}
