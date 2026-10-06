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
import '../../student/models/faculty.dart' as _i97qkk0u;

abstract class Major
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Major._({
    this.id,
    required this.facultyId,
    this.faculty,
    required this.name,
    required this.code,
    this.description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Major({
    _is.UuidValue? id,
    required _is.UuidValue facultyId,
    _i97qkk0u.Faculty? faculty,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MajorImpl;

  factory Major.fromJson(Map<String, dynamic> jsonSerialization) {
    return Major(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      facultyId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['facultyId'],
      ),
      faculty: jsonSerialization['faculty'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i97qkk0u.Faculty>(
              jsonSerialization['faculty'],
            ),
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

  static final t = MajorTable();

  static const db = MajorRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue facultyId;

  _i97qkk0u.Faculty? faculty;

  String name;

  String code;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Major]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Major copyWith({
    _is.UuidValue? id,
    _is.UuidValue? facultyId,
    _i97qkk0u.Faculty? faculty,
    String? name,
    String? code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Major',
      if (id != null) 'id': id?.toJson(),
      'facultyId': facultyId.toJson(),
      if (faculty != null) 'faculty': faculty?.toJson(),
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
      '__className__': 'Major',
      if (id != null) 'id': id?.toJson(),
      'facultyId': facultyId.toJson(),
      if (faculty != null) 'faculty': faculty?.toJsonForProtocol(),
      'name': name,
      'code': code,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static MajorInclude include({_i97qkk0u.FacultyInclude? faculty}) {
    return MajorInclude._(faculty: faculty);
  }

  static MajorIncludeList includeList({
    _is.WhereExpressionBuilder<MajorTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MajorTable>? orderBy,
    _is.OrderByListBuilder<MajorTable>? orderByList,
    MajorInclude? include,
  }) {
    return MajorIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Major.t),
      orderByList: orderByList?.call(Major.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MajorImpl extends Major {
  _MajorImpl({
    _is.UuidValue? id,
    required _is.UuidValue facultyId,
    _i97qkk0u.Faculty? faculty,
    required String name,
    required String code,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         facultyId: facultyId,
         faculty: faculty,
         name: name,
         code: code,
         description: description,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Major]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Major copyWith({
    Object? id = _Undefined,
    _is.UuidValue? facultyId,
    Object? faculty = _Undefined,
    String? name,
    String? code,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Major(
      id: id is _is.UuidValue? ? id : this.id,
      facultyId: facultyId ?? this.facultyId,
      faculty: faculty is _i97qkk0u.Faculty?
          ? faculty
          : this.faculty?.copyWith(),
      name: name ?? this.name,
      code: code ?? this.code,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class MajorUpdateTable extends _is.UpdateTable<MajorTable> {
  MajorUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> facultyId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.facultyId,
    value,
  );

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

class MajorTable extends _is.Table<_is.UuidValue?> {
  MajorTable({super.tableRelation}) : super(tableName: 'majors') {
    updateTable = MajorUpdateTable(this);
    facultyId = _is.ColumnUuid(
      'facultyId',
      this,
    );
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

  late final MajorUpdateTable updateTable;

  late final _is.ColumnUuid facultyId;

  _i97qkk0u.FacultyTable? _faculty;

  late final _is.ColumnString name;

  late final _is.ColumnString code;

  late final _is.ColumnString description;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  _i97qkk0u.FacultyTable get faculty {
    if (_faculty != null) return _faculty!;
    _faculty = _is.createRelationTable(
      relationFieldName: 'faculty',
      field: Major.t.facultyId,
      foreignField: _i97qkk0u.Faculty.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i97qkk0u.FacultyTable(tableRelation: foreignTableRelation),
    );
    return _faculty!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    facultyId,
    name,
    code,
    description,
    createdAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'faculty') {
      return faculty;
    }
    return null;
  }
}

class MajorInclude extends _is.IncludeObject {
  MajorInclude._({_i97qkk0u.FacultyInclude? faculty}) {
    _faculty = faculty;
  }

  _i97qkk0u.FacultyInclude? _faculty;

  @override
  Map<String, _is.Include?> get includes => {'faculty': _faculty};

  @override
  _is.Table<_is.UuidValue?> get table => Major.t;
}

class MajorIncludeList extends _is.IncludeList {
  MajorIncludeList._({
    _is.WhereExpressionBuilder<MajorTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Major.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Major.t;
}

class MajorRepository {
  const MajorRepository._();

  final attachRow = const MajorAttachRowRepository._();

  /// Returns a list of [Major]s matching the given query parameters.
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
  Future<List<Major>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MajorTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MajorTable>? orderBy,
    _is.OrderByListBuilder<MajorTable>? orderByList,
    _is.Transaction? transaction,
    MajorInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Major>(
      where: where?.call(Major.t),
      orderBy: orderBy?.call(Major.t),
      orderByList: orderByList?.call(Major.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Major] matching the given query parameters.
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
  Future<Major?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MajorTable>? where,
    int? offset,
    _is.OrderByBuilder<MajorTable>? orderBy,
    _is.OrderByListBuilder<MajorTable>? orderByList,
    _is.Transaction? transaction,
    MajorInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Major>(
      where: where?.call(Major.t),
      orderBy: orderBy?.call(Major.t),
      orderByList: orderByList?.call(Major.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Major] by its [id] or null if no such row exists.
  Future<Major?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    MajorInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Major>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Major]s in the list and returns the inserted rows.
  ///
  /// The returned [Major]s will have their `id` fields set.
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
  Future<List<Major>> insert(
    _is.DatabaseSession session,
    List<Major> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Major>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Major] and returns the inserted row.
  ///
  /// The returned [Major] will have its `id` field set.
  Future<Major> insertRow(
    _is.DatabaseSession session,
    Major row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Major>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Major]s in the list and returns the resulting rows.
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
  /// The returned [Major]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Major>> upsert(
    _is.DatabaseSession session,
    List<Major> rows, {
    required _is.ColumnSelections<MajorTable> conflictColumns,
    _is.ColumnSelections<MajorTable>? updateColumns,
    _is.WhereExpressionBuilder<MajorTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Major>(
      rows,
      conflictColumns: conflictColumns(Major.t),
      updateColumns: updateColumns?.call(Major.t),
      updateWhere: updateWhere?.call(Major.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Major] and returns the resulting row.
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
  /// The returned [Major] will have its `id` field set.
  Future<Major?> upsertRow(
    _is.DatabaseSession session,
    Major row, {
    required _is.ColumnSelections<MajorTable> conflictColumns,
    _is.ColumnSelections<MajorTable>? updateColumns,
    _is.WhereExpressionBuilder<MajorTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Major>(
      row,
      conflictColumns: conflictColumns(Major.t),
      updateColumns: updateColumns?.call(Major.t),
      updateWhere: updateWhere?.call(Major.t),
      transaction: transaction,
    );
  }

  /// Updates all [Major]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Major>> update(
    _is.DatabaseSession session,
    List<Major> rows, {
    _is.ColumnSelections<MajorTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Major>(
      rows,
      columns: columns?.call(Major.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Major]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Major> updateRow(
    _is.DatabaseSession session,
    Major row, {
    _is.ColumnSelections<MajorTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Major>(
      row,
      columns: columns?.call(Major.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Major] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Major?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<MajorUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Major>(
      id,
      columnValues: columnValues(Major.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Major]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Major>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<MajorUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<MajorTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MajorTable>? orderBy,
    _is.OrderByListBuilder<MajorTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Major>(
      columnValues: columnValues(Major.t.updateTable),
      where: where(Major.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Major.t),
      orderByList: orderByList?.call(Major.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Major]s in the list and returns the deleted rows.
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
  Future<List<Major>> delete(
    _is.DatabaseSession session,
    List<Major> rows, {
    _is.OrderByBuilder<MajorTable>? orderBy,
    _is.OrderByListBuilder<MajorTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Major>(
      rows,
      orderBy: orderBy?.call(Major.t),
      orderByList: orderByList?.call(Major.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Major].
  Future<Major> deleteRow(
    _is.DatabaseSession session,
    Major row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Major>(
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
  Future<List<Major>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MajorTable> where,
    _is.OrderByBuilder<MajorTable>? orderBy,
    _is.OrderByListBuilder<MajorTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Major>(
      where: where(Major.t),
      orderBy: orderBy?.call(Major.t),
      orderByList: orderByList?.call(Major.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MajorTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Major>(
      where: where?.call(Major.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Major] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MajorTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Major>(
      where: where(Major.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class MajorAttachRowRepository {
  const MajorAttachRowRepository._();

  /// Creates a relation between the given [Major] and [Faculty]
  /// by setting the [Major]'s foreign key `facultyId` to refer to the [Faculty].
  Future<void> faculty(
    _is.DatabaseSession session,
    Major major,
    _i97qkk0u.Faculty faculty, {
    _is.Transaction? transaction,
  }) async {
    if (major.id == null) {
      throw ArgumentError.notNull('major.id');
    }
    if (faculty.id == null) {
      throw ArgumentError.notNull('faculty.id');
    }

    var $major = major.copyWith(facultyId: faculty.id);
    await session.db.updateRow<Major>(
      $major,
      columns: [Major.t.facultyId],
      transaction: transaction,
    );
  }
}
