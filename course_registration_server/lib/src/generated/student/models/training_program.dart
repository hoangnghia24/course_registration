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
import '../../student/models/major.dart' as _imik5j2n;

abstract class TrainingProgram
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  TrainingProgram._({
    this.id,
    required this.majorId,
    this.major,
    required this.name,
    required this.academicYear,
    required this.totalCredits,
    this.description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory TrainingProgram({
    _is.UuidValue? id,
    required _is.UuidValue majorId,
    _imik5j2n.Major? major,
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TrainingProgramImpl;

  factory TrainingProgram.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrainingProgram(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      majorId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['majorId'],
      ),
      major: jsonSerialization['major'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_imik5j2n.Major>(
              jsonSerialization['major'],
            ),
      name: jsonSerialization['name'] as String,
      academicYear: jsonSerialization['academicYear'] as int,
      totalCredits: jsonSerialization['totalCredits'] as int,
      description: jsonSerialization['description'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = TrainingProgramTable();

  static const db = TrainingProgramRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue majorId;

  _imik5j2n.Major? major;

  String name;

  int academicYear;

  int totalCredits;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [TrainingProgram]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  TrainingProgram copyWith({
    _is.UuidValue? id,
    _is.UuidValue? majorId,
    _imik5j2n.Major? major,
    String? name,
    int? academicYear,
    int? totalCredits,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrainingProgram',
      if (id != null) 'id': id?.toJson(),
      'majorId': majorId.toJson(),
      if (major != null) 'major': major?.toJson(),
      'name': name,
      'academicYear': academicYear,
      'totalCredits': totalCredits,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TrainingProgram',
      if (id != null) 'id': id?.toJson(),
      'majorId': majorId.toJson(),
      if (major != null) 'major': major?.toJsonForProtocol(),
      'name': name,
      'academicYear': academicYear,
      'totalCredits': totalCredits,
      if (description != null) 'description': description,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static TrainingProgramInclude include({_imik5j2n.MajorInclude? major}) {
    return TrainingProgramInclude._(major: major);
  }

  static TrainingProgramIncludeList includeList({
    _is.WhereExpressionBuilder<TrainingProgramTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TrainingProgramTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramTable>? orderByList,
    TrainingProgramInclude? include,
  }) {
    return TrainingProgramIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TrainingProgram.t),
      orderByList: orderByList?.call(TrainingProgram.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrainingProgramImpl extends TrainingProgram {
  _TrainingProgramImpl({
    _is.UuidValue? id,
    required _is.UuidValue majorId,
    _imik5j2n.Major? major,
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         majorId: majorId,
         major: major,
         name: name,
         academicYear: academicYear,
         totalCredits: totalCredits,
         description: description,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [TrainingProgram]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  TrainingProgram copyWith({
    Object? id = _Undefined,
    _is.UuidValue? majorId,
    Object? major = _Undefined,
    String? name,
    int? academicYear,
    int? totalCredits,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TrainingProgram(
      id: id is _is.UuidValue? ? id : this.id,
      majorId: majorId ?? this.majorId,
      major: major is _imik5j2n.Major? ? major : this.major?.copyWith(),
      name: name ?? this.name,
      academicYear: academicYear ?? this.academicYear,
      totalCredits: totalCredits ?? this.totalCredits,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TrainingProgramUpdateTable extends _is.UpdateTable<TrainingProgramTable> {
  TrainingProgramUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> majorId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.majorId,
        value,
      );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<int, int> academicYear(int value) => _is.ColumnValue(
    table.academicYear,
    value,
  );

  _is.ColumnValue<int, int> totalCredits(int value) => _is.ColumnValue(
    table.totalCredits,
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

class TrainingProgramTable extends _is.Table<_is.UuidValue?> {
  TrainingProgramTable({super.tableRelation})
    : super(tableName: 'training_programs') {
    updateTable = TrainingProgramUpdateTable(this);
    majorId = _is.ColumnUuid(
      'majorId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    academicYear = _is.ColumnInt(
      'academicYear',
      this,
    );
    totalCredits = _is.ColumnInt(
      'totalCredits',
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

  late final TrainingProgramUpdateTable updateTable;

  late final _is.ColumnUuid majorId;

  _imik5j2n.MajorTable? _major;

  late final _is.ColumnString name;

  late final _is.ColumnInt academicYear;

  late final _is.ColumnInt totalCredits;

  late final _is.ColumnString description;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  _imik5j2n.MajorTable get major {
    if (_major != null) return _major!;
    _major = _is.createRelationTable(
      relationFieldName: 'major',
      field: TrainingProgram.t.majorId,
      foreignField: _imik5j2n.Major.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _imik5j2n.MajorTable(tableRelation: foreignTableRelation),
    );
    return _major!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    majorId,
    name,
    academicYear,
    totalCredits,
    description,
    createdAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'major') {
      return major;
    }
    return null;
  }
}

class TrainingProgramInclude extends _is.IncludeObject {
  TrainingProgramInclude._({_imik5j2n.MajorInclude? major}) {
    _major = major;
  }

  _imik5j2n.MajorInclude? _major;

  @override
  Map<String, _is.Include?> get includes => {'major': _major};

  @override
  _is.Table<_is.UuidValue?> get table => TrainingProgram.t;
}

class TrainingProgramIncludeList extends _is.IncludeList {
  TrainingProgramIncludeList._({
    _is.WhereExpressionBuilder<TrainingProgramTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TrainingProgram.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => TrainingProgram.t;
}

class TrainingProgramRepository {
  const TrainingProgramRepository._();

  final attachRow = const TrainingProgramAttachRowRepository._();

  /// Returns a list of [TrainingProgram]s matching the given query parameters.
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
  Future<List<TrainingProgram>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TrainingProgramTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TrainingProgramTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramTable>? orderByList,
    _is.Transaction? transaction,
    TrainingProgramInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TrainingProgram>(
      where: where?.call(TrainingProgram.t),
      orderBy: orderBy?.call(TrainingProgram.t),
      orderByList: orderByList?.call(TrainingProgram.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TrainingProgram] matching the given query parameters.
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
  Future<TrainingProgram?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TrainingProgramTable>? where,
    int? offset,
    _is.OrderByBuilder<TrainingProgramTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramTable>? orderByList,
    _is.Transaction? transaction,
    TrainingProgramInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TrainingProgram>(
      where: where?.call(TrainingProgram.t),
      orderBy: orderBy?.call(TrainingProgram.t),
      orderByList: orderByList?.call(TrainingProgram.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TrainingProgram] by its [id] or null if no such row exists.
  Future<TrainingProgram?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    TrainingProgramInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TrainingProgram>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TrainingProgram]s in the list and returns the inserted rows.
  ///
  /// The returned [TrainingProgram]s will have their `id` fields set.
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
  Future<List<TrainingProgram>> insert(
    _is.DatabaseSession session,
    List<TrainingProgram> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<TrainingProgram>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [TrainingProgram] and returns the inserted row.
  ///
  /// The returned [TrainingProgram] will have its `id` field set.
  Future<TrainingProgram> insertRow(
    _is.DatabaseSession session,
    TrainingProgram row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<TrainingProgram>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [TrainingProgram]s in the list and returns the resulting rows.
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
  /// The returned [TrainingProgram]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TrainingProgram>> upsert(
    _is.DatabaseSession session,
    List<TrainingProgram> rows, {
    required _is.ColumnSelections<TrainingProgramTable> conflictColumns,
    _is.ColumnSelections<TrainingProgramTable>? updateColumns,
    _is.WhereExpressionBuilder<TrainingProgramTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<TrainingProgram>(
      rows,
      conflictColumns: conflictColumns(TrainingProgram.t),
      updateColumns: updateColumns?.call(TrainingProgram.t),
      updateWhere: updateWhere?.call(TrainingProgram.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [TrainingProgram] and returns the resulting row.
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
  /// The returned [TrainingProgram] will have its `id` field set.
  Future<TrainingProgram?> upsertRow(
    _is.DatabaseSession session,
    TrainingProgram row, {
    required _is.ColumnSelections<TrainingProgramTable> conflictColumns,
    _is.ColumnSelections<TrainingProgramTable>? updateColumns,
    _is.WhereExpressionBuilder<TrainingProgramTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<TrainingProgram>(
      row,
      conflictColumns: conflictColumns(TrainingProgram.t),
      updateColumns: updateColumns?.call(TrainingProgram.t),
      updateWhere: updateWhere?.call(TrainingProgram.t),
      transaction: transaction,
    );
  }

  /// Updates all [TrainingProgram]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TrainingProgram>> update(
    _is.DatabaseSession session,
    List<TrainingProgram> rows, {
    _is.ColumnSelections<TrainingProgramTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<TrainingProgram>(
      rows,
      columns: columns?.call(TrainingProgram.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [TrainingProgram]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TrainingProgram> updateRow(
    _is.DatabaseSession session,
    TrainingProgram row, {
    _is.ColumnSelections<TrainingProgramTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<TrainingProgram>(
      row,
      columns: columns?.call(TrainingProgram.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TrainingProgram] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TrainingProgram?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<TrainingProgramUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<TrainingProgram>(
      id,
      columnValues: columnValues(TrainingProgram.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TrainingProgram]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TrainingProgram>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<TrainingProgramUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<TrainingProgramTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TrainingProgramTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<TrainingProgram>(
      columnValues: columnValues(TrainingProgram.t.updateTable),
      where: where(TrainingProgram.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TrainingProgram.t),
      orderByList: orderByList?.call(TrainingProgram.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [TrainingProgram]s in the list and returns the deleted rows.
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
  Future<List<TrainingProgram>> delete(
    _is.DatabaseSession session,
    List<TrainingProgram> rows, {
    _is.OrderByBuilder<TrainingProgramTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<TrainingProgram>(
      rows,
      orderBy: orderBy?.call(TrainingProgram.t),
      orderByList: orderByList?.call(TrainingProgram.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [TrainingProgram].
  Future<TrainingProgram> deleteRow(
    _is.DatabaseSession session,
    TrainingProgram row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TrainingProgram>(
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
  Future<List<TrainingProgram>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TrainingProgramTable> where,
    _is.OrderByBuilder<TrainingProgramTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<TrainingProgram>(
      where: where(TrainingProgram.t),
      orderBy: orderBy?.call(TrainingProgram.t),
      orderByList: orderByList?.call(TrainingProgram.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TrainingProgramTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<TrainingProgram>(
      where: where?.call(TrainingProgram.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TrainingProgram] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TrainingProgramTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TrainingProgram>(
      where: where(TrainingProgram.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class TrainingProgramAttachRowRepository {
  const TrainingProgramAttachRowRepository._();

  /// Creates a relation between the given [TrainingProgram] and [Major]
  /// by setting the [TrainingProgram]'s foreign key `majorId` to refer to the [Major].
  Future<void> major(
    _is.DatabaseSession session,
    TrainingProgram trainingProgram,
    _imik5j2n.Major major, {
    _is.Transaction? transaction,
  }) async {
    if (trainingProgram.id == null) {
      throw ArgumentError.notNull('trainingProgram.id');
    }
    if (major.id == null) {
      throw ArgumentError.notNull('major.id');
    }

    var $trainingProgram = trainingProgram.copyWith(majorId: major.id);
    await session.db.updateRow<TrainingProgram>(
      $trainingProgram,
      columns: [TrainingProgram.t.majorId],
      transaction: transaction,
    );
  }
}
