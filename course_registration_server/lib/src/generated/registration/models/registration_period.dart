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
import '../../registration/models/registration_period_status.dart' as _ievbuj9v;
import '../../registration/models/semester.dart' as _i975wtvt;

abstract class RegistrationPeriod
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  RegistrationPeriod._({
    this.id,
    required this.semesterId,
    this.semester,
    required this.startTime,
    required this.endTime,
    required this.lecturerStartTime,
    required this.lecturerEndTime,
    _ievbuj9v.RegistrationPeriodStatus? status,
    this.updatedById,
    this.updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : status = status ?? _ievbuj9v.RegistrationPeriodStatus.draft,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory RegistrationPeriod({
    _is.UuidValue? id,
    required _is.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required DateTime startTime,
    required DateTime endTime,
    required DateTime lecturerStartTime,
    required DateTime lecturerEndTime,
    _ievbuj9v.RegistrationPeriodStatus? status,
    _is.UuidValue? updatedById,
    _ikmszj0x.Admin? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RegistrationPeriodImpl;

  factory RegistrationPeriod.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegistrationPeriod(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      semesterId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      semester: jsonSerialization['semester'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i975wtvt.Semester>(
              jsonSerialization['semester'],
            ),
      startTime: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _is.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      lecturerStartTime: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['lecturerStartTime'],
      ),
      lecturerEndTime: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['lecturerEndTime'],
      ),
      status: jsonSerialization['status'] == null
          ? null
          : _ievbuj9v.RegistrationPeriodStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      updatedById: jsonSerialization['updatedById'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['updatedById'],
            ),
      updatedBy: jsonSerialization['updatedBy'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['updatedBy'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = RegistrationPeriodTable();

  static const db = RegistrationPeriodRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue semesterId;

  _i975wtvt.Semester? semester;

  DateTime startTime;

  DateTime endTime;

  DateTime lecturerStartTime;

  DateTime lecturerEndTime;

  _ievbuj9v.RegistrationPeriodStatus status;

  _is.UuidValue? updatedById;

  _ikmszj0x.Admin? updatedBy;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [RegistrationPeriod]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RegistrationPeriod copyWith({
    _is.UuidValue? id,
    _is.UuidValue? semesterId,
    _i975wtvt.Semester? semester,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? lecturerStartTime,
    DateTime? lecturerEndTime,
    _ievbuj9v.RegistrationPeriodStatus? status,
    _is.UuidValue? updatedById,
    _ikmszj0x.Admin? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegistrationPeriod',
      if (id != null) 'id': id?.toJson(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJson(),
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      'lecturerStartTime': lecturerStartTime.toJson(),
      'lecturerEndTime': lecturerEndTime.toJson(),
      'status': status.toJson(),
      if (updatedById != null) 'updatedById': updatedById?.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegistrationPeriod',
      if (id != null) 'id': id?.toJson(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJsonForProtocol(),
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      'lecturerStartTime': lecturerStartTime.toJson(),
      'lecturerEndTime': lecturerEndTime.toJson(),
      'status': status.toJson(),
      if (updatedById != null) 'updatedById': updatedById?.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static RegistrationPeriodInclude include({
    _i975wtvt.SemesterInclude? semester,
    _ikmszj0x.AdminInclude? updatedBy,
  }) {
    return RegistrationPeriodInclude._(
      semester: semester,
      updatedBy: updatedBy,
    );
  }

  static RegistrationPeriodIncludeList includeList({
    _is.WhereExpressionBuilder<RegistrationPeriodTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationPeriodTable>? orderBy,
    _is.OrderByListBuilder<RegistrationPeriodTable>? orderByList,
    RegistrationPeriodInclude? include,
  }) {
    return RegistrationPeriodIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RegistrationPeriod.t),
      orderByList: orderByList?.call(RegistrationPeriod.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationPeriodImpl extends RegistrationPeriod {
  _RegistrationPeriodImpl({
    _is.UuidValue? id,
    required _is.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required DateTime startTime,
    required DateTime endTime,
    required DateTime lecturerStartTime,
    required DateTime lecturerEndTime,
    _ievbuj9v.RegistrationPeriodStatus? status,
    _is.UuidValue? updatedById,
    _ikmszj0x.Admin? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         semesterId: semesterId,
         semester: semester,
         startTime: startTime,
         endTime: endTime,
         lecturerStartTime: lecturerStartTime,
         lecturerEndTime: lecturerEndTime,
         status: status,
         updatedById: updatedById,
         updatedBy: updatedBy,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [RegistrationPeriod]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RegistrationPeriod copyWith({
    Object? id = _Undefined,
    _is.UuidValue? semesterId,
    Object? semester = _Undefined,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? lecturerStartTime,
    DateTime? lecturerEndTime,
    _ievbuj9v.RegistrationPeriodStatus? status,
    Object? updatedById = _Undefined,
    Object? updatedBy = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RegistrationPeriod(
      id: id is _is.UuidValue? ? id : this.id,
      semesterId: semesterId ?? this.semesterId,
      semester: semester is _i975wtvt.Semester?
          ? semester
          : this.semester?.copyWith(),
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      lecturerStartTime: lecturerStartTime ?? this.lecturerStartTime,
      lecturerEndTime: lecturerEndTime ?? this.lecturerEndTime,
      status: status ?? this.status,
      updatedById: updatedById is _is.UuidValue?
          ? updatedById
          : this.updatedById,
      updatedBy: updatedBy is _ikmszj0x.Admin?
          ? updatedBy
          : this.updatedBy?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class RegistrationPeriodUpdateTable
    extends _is.UpdateTable<RegistrationPeriodTable> {
  RegistrationPeriodUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> semesterId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.semesterId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> startTime(DateTime value) =>
      _is.ColumnValue(
        table.startTime,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> endTime(DateTime value) =>
      _is.ColumnValue(
        table.endTime,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> lecturerStartTime(DateTime value) =>
      _is.ColumnValue(
        table.lecturerStartTime,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> lecturerEndTime(DateTime value) =>
      _is.ColumnValue(
        table.lecturerEndTime,
        value,
      );

  _is.ColumnValue<
    _ievbuj9v.RegistrationPeriodStatus,
    _ievbuj9v.RegistrationPeriodStatus
  >
  status(_ievbuj9v.RegistrationPeriodStatus value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> updatedById(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.updatedById,
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

class RegistrationPeriodTable extends _is.Table<_is.UuidValue?> {
  RegistrationPeriodTable({super.tableRelation})
    : super(tableName: 'registration_periods') {
    updateTable = RegistrationPeriodUpdateTable(this);
    semesterId = _is.ColumnUuid(
      'semesterId',
      this,
    );
    startTime = _is.ColumnDateTime(
      'startTime',
      this,
    );
    endTime = _is.ColumnDateTime(
      'endTime',
      this,
    );
    lecturerStartTime = _is.ColumnDateTime(
      'lecturerStartTime',
      this,
    );
    lecturerEndTime = _is.ColumnDateTime(
      'lecturerEndTime',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    updatedById = _is.ColumnUuid(
      'updatedById',
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

  late final RegistrationPeriodUpdateTable updateTable;

  late final _is.ColumnUuid semesterId;

  _i975wtvt.SemesterTable? _semester;

  late final _is.ColumnDateTime startTime;

  late final _is.ColumnDateTime endTime;

  late final _is.ColumnDateTime lecturerStartTime;

  late final _is.ColumnDateTime lecturerEndTime;

  late final _is.ColumnEnum<_ievbuj9v.RegistrationPeriodStatus> status;

  late final _is.ColumnUuid updatedById;

  _ikmszj0x.AdminTable? _updatedBy;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  _i975wtvt.SemesterTable get semester {
    if (_semester != null) return _semester!;
    _semester = _is.createRelationTable(
      relationFieldName: 'semester',
      field: RegistrationPeriod.t.semesterId,
      foreignField: _i975wtvt.Semester.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i975wtvt.SemesterTable(tableRelation: foreignTableRelation),
    );
    return _semester!;
  }

  _ikmszj0x.AdminTable get updatedBy {
    if (_updatedBy != null) return _updatedBy!;
    _updatedBy = _is.createRelationTable(
      relationFieldName: 'updatedBy',
      field: RegistrationPeriod.t.updatedById,
      foreignField: _ikmszj0x.Admin.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ikmszj0x.AdminTable(tableRelation: foreignTableRelation),
    );
    return _updatedBy!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    semesterId,
    startTime,
    endTime,
    lecturerStartTime,
    lecturerEndTime,
    status,
    updatedById,
    createdAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'semester') {
      return semester;
    }
    if (relationField == 'updatedBy') {
      return updatedBy;
    }
    return null;
  }
}

class RegistrationPeriodInclude extends _is.IncludeObject {
  RegistrationPeriodInclude._({
    _i975wtvt.SemesterInclude? semester,
    _ikmszj0x.AdminInclude? updatedBy,
  }) {
    _semester = semester;
    _updatedBy = updatedBy;
  }

  _i975wtvt.SemesterInclude? _semester;

  _ikmszj0x.AdminInclude? _updatedBy;

  @override
  Map<String, _is.Include?> get includes => {
    'semester': _semester,
    'updatedBy': _updatedBy,
  };

  @override
  _is.Table<_is.UuidValue?> get table => RegistrationPeriod.t;
}

class RegistrationPeriodIncludeList extends _is.IncludeList {
  RegistrationPeriodIncludeList._({
    _is.WhereExpressionBuilder<RegistrationPeriodTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RegistrationPeriod.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => RegistrationPeriod.t;
}

class RegistrationPeriodRepository {
  const RegistrationPeriodRepository._();

  final attachRow = const RegistrationPeriodAttachRowRepository._();

  final detachRow = const RegistrationPeriodDetachRowRepository._();

  /// Returns a list of [RegistrationPeriod]s matching the given query parameters.
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
  Future<List<RegistrationPeriod>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationPeriodTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationPeriodTable>? orderBy,
    _is.OrderByListBuilder<RegistrationPeriodTable>? orderByList,
    _is.Transaction? transaction,
    RegistrationPeriodInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RegistrationPeriod>(
      where: where?.call(RegistrationPeriod.t),
      orderBy: orderBy?.call(RegistrationPeriod.t),
      orderByList: orderByList?.call(RegistrationPeriod.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RegistrationPeriod] matching the given query parameters.
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
  Future<RegistrationPeriod?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationPeriodTable>? where,
    int? offset,
    _is.OrderByBuilder<RegistrationPeriodTable>? orderBy,
    _is.OrderByListBuilder<RegistrationPeriodTable>? orderByList,
    _is.Transaction? transaction,
    RegistrationPeriodInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RegistrationPeriod>(
      where: where?.call(RegistrationPeriod.t),
      orderBy: orderBy?.call(RegistrationPeriod.t),
      orderByList: orderByList?.call(RegistrationPeriod.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RegistrationPeriod] by its [id] or null if no such row exists.
  Future<RegistrationPeriod?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    RegistrationPeriodInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RegistrationPeriod>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RegistrationPeriod]s in the list and returns the inserted rows.
  ///
  /// The returned [RegistrationPeriod]s will have their `id` fields set.
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
  Future<List<RegistrationPeriod>> insert(
    _is.DatabaseSession session,
    List<RegistrationPeriod> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RegistrationPeriod>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RegistrationPeriod] and returns the inserted row.
  ///
  /// The returned [RegistrationPeriod] will have its `id` field set.
  Future<RegistrationPeriod> insertRow(
    _is.DatabaseSession session,
    RegistrationPeriod row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RegistrationPeriod>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RegistrationPeriod]s in the list and returns the resulting rows.
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
  /// The returned [RegistrationPeriod]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RegistrationPeriod>> upsert(
    _is.DatabaseSession session,
    List<RegistrationPeriod> rows, {
    required _is.ColumnSelections<RegistrationPeriodTable> conflictColumns,
    _is.ColumnSelections<RegistrationPeriodTable>? updateColumns,
    _is.WhereExpressionBuilder<RegistrationPeriodTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RegistrationPeriod>(
      rows,
      conflictColumns: conflictColumns(RegistrationPeriod.t),
      updateColumns: updateColumns?.call(RegistrationPeriod.t),
      updateWhere: updateWhere?.call(RegistrationPeriod.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RegistrationPeriod] and returns the resulting row.
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
  /// The returned [RegistrationPeriod] will have its `id` field set.
  Future<RegistrationPeriod?> upsertRow(
    _is.DatabaseSession session,
    RegistrationPeriod row, {
    required _is.ColumnSelections<RegistrationPeriodTable> conflictColumns,
    _is.ColumnSelections<RegistrationPeriodTable>? updateColumns,
    _is.WhereExpressionBuilder<RegistrationPeriodTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RegistrationPeriod>(
      row,
      conflictColumns: conflictColumns(RegistrationPeriod.t),
      updateColumns: updateColumns?.call(RegistrationPeriod.t),
      updateWhere: updateWhere?.call(RegistrationPeriod.t),
      transaction: transaction,
    );
  }

  /// Updates all [RegistrationPeriod]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RegistrationPeriod>> update(
    _is.DatabaseSession session,
    List<RegistrationPeriod> rows, {
    _is.ColumnSelections<RegistrationPeriodTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RegistrationPeriod>(
      rows,
      columns: columns?.call(RegistrationPeriod.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RegistrationPeriod]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RegistrationPeriod> updateRow(
    _is.DatabaseSession session,
    RegistrationPeriod row, {
    _is.ColumnSelections<RegistrationPeriodTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RegistrationPeriod>(
      row,
      columns: columns?.call(RegistrationPeriod.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RegistrationPeriod] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RegistrationPeriod?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<RegistrationPeriodUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RegistrationPeriod>(
      id,
      columnValues: columnValues(RegistrationPeriod.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RegistrationPeriod]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RegistrationPeriod>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RegistrationPeriodUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<RegistrationPeriodTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationPeriodTable>? orderBy,
    _is.OrderByListBuilder<RegistrationPeriodTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RegistrationPeriod>(
      columnValues: columnValues(RegistrationPeriod.t.updateTable),
      where: where(RegistrationPeriod.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RegistrationPeriod.t),
      orderByList: orderByList?.call(RegistrationPeriod.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RegistrationPeriod]s in the list and returns the deleted rows.
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
  Future<List<RegistrationPeriod>> delete(
    _is.DatabaseSession session,
    List<RegistrationPeriod> rows, {
    _is.OrderByBuilder<RegistrationPeriodTable>? orderBy,
    _is.OrderByListBuilder<RegistrationPeriodTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RegistrationPeriod>(
      rows,
      orderBy: orderBy?.call(RegistrationPeriod.t),
      orderByList: orderByList?.call(RegistrationPeriod.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RegistrationPeriod].
  Future<RegistrationPeriod> deleteRow(
    _is.DatabaseSession session,
    RegistrationPeriod row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RegistrationPeriod>(
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
  Future<List<RegistrationPeriod>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RegistrationPeriodTable> where,
    _is.OrderByBuilder<RegistrationPeriodTable>? orderBy,
    _is.OrderByListBuilder<RegistrationPeriodTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RegistrationPeriod>(
      where: where(RegistrationPeriod.t),
      orderBy: orderBy?.call(RegistrationPeriod.t),
      orderByList: orderByList?.call(RegistrationPeriod.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationPeriodTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RegistrationPeriod>(
      where: where?.call(RegistrationPeriod.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RegistrationPeriod] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RegistrationPeriodTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RegistrationPeriod>(
      where: where(RegistrationPeriod.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class RegistrationPeriodAttachRowRepository {
  const RegistrationPeriodAttachRowRepository._();

  /// Creates a relation between the given [RegistrationPeriod] and [Semester]
  /// by setting the [RegistrationPeriod]'s foreign key `semesterId` to refer to the [Semester].
  Future<void> semester(
    _is.DatabaseSession session,
    RegistrationPeriod registrationPeriod,
    _i975wtvt.Semester semester, {
    _is.Transaction? transaction,
  }) async {
    if (registrationPeriod.id == null) {
      throw ArgumentError.notNull('registrationPeriod.id');
    }
    if (semester.id == null) {
      throw ArgumentError.notNull('semester.id');
    }

    var $registrationPeriod = registrationPeriod.copyWith(
      semesterId: semester.id,
    );
    await session.db.updateRow<RegistrationPeriod>(
      $registrationPeriod,
      columns: [RegistrationPeriod.t.semesterId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [RegistrationPeriod] and [Admin]
  /// by setting the [RegistrationPeriod]'s foreign key `updatedById` to refer to the [Admin].
  Future<void> updatedBy(
    _is.DatabaseSession session,
    RegistrationPeriod registrationPeriod,
    _ikmszj0x.Admin updatedBy, {
    _is.Transaction? transaction,
  }) async {
    if (registrationPeriod.id == null) {
      throw ArgumentError.notNull('registrationPeriod.id');
    }
    if (updatedBy.id == null) {
      throw ArgumentError.notNull('updatedBy.id');
    }

    var $registrationPeriod = registrationPeriod.copyWith(
      updatedById: updatedBy.id,
    );
    await session.db.updateRow<RegistrationPeriod>(
      $registrationPeriod,
      columns: [RegistrationPeriod.t.updatedById],
      transaction: transaction,
    );
  }
}

class RegistrationPeriodDetachRowRepository {
  const RegistrationPeriodDetachRowRepository._();

  /// Detaches the relation between this [RegistrationPeriod] and the [Admin] set in `updatedBy`
  /// by setting the [RegistrationPeriod]'s foreign key `updatedById` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> updatedBy(
    _is.DatabaseSession session,
    RegistrationPeriod registrationPeriod, {
    _is.Transaction? transaction,
  }) async {
    if (registrationPeriod.id == null) {
      throw ArgumentError.notNull('registrationPeriod.id');
    }

    var $registrationPeriod = registrationPeriod.copyWith(updatedById: null);
    await session.db.updateRow<RegistrationPeriod>(
      $registrationPeriod,
      columns: [RegistrationPeriod.t.updatedById],
      transaction: transaction,
    );
  }
}
