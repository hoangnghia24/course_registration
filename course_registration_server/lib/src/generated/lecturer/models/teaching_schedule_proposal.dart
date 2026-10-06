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
import '../../lecturer.dart' as _ismqsd72;
import '../../lecturer/models/teaching_schedule_status.dart' as _i47qlg6c;
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class TeachingScheduleProposal
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  TeachingScheduleProposal._({
    this.id,
    required this.lecturerId,
    this.lecturer,
    required this.courseClassId,
    this.courseClass,
    required this.dayOfWeek,
    required this.startPeriod,
    required this.endPeriod,
    required this.room,
    _i47qlg6c.TeachingScheduleStatus? status,
    DateTime? createdAt,
  }) : status = status ?? _i47qlg6c.TeachingScheduleStatus.pending,
       createdAt = createdAt ?? DateTime.now();

  factory TeachingScheduleProposal({
    _is.UuidValue? id,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
    _i47qlg6c.TeachingScheduleStatus? status,
    DateTime? createdAt,
  }) = _TeachingScheduleProposalImpl;

  factory TeachingScheduleProposal.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TeachingScheduleProposal(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      lecturerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      dayOfWeek: jsonSerialization['dayOfWeek'] as int,
      startPeriod: jsonSerialization['startPeriod'] as int,
      endPeriod: jsonSerialization['endPeriod'] as int,
      room: jsonSerialization['room'] as String,
      status: jsonSerialization['status'] == null
          ? null
          : _i47qlg6c.TeachingScheduleStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = TeachingScheduleProposalTable();

  static const db = TeachingScheduleProposalRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  _is.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  int dayOfWeek;

  int startPeriod;

  int endPeriod;

  String room;

  _i47qlg6c.TeachingScheduleStatus status;

  DateTime createdAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [TeachingScheduleProposal]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  TeachingScheduleProposal copyWith({
    _is.UuidValue? id,
    _is.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    _is.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
    _i47qlg6c.TeachingScheduleStatus? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TeachingScheduleProposal',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TeachingScheduleProposal',
      if (id != null) 'id': id?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static TeachingScheduleProposalInclude include({
    _ismqsd72.LecturerInclude? lecturer,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    return TeachingScheduleProposalInclude._(
      lecturer: lecturer,
      courseClass: courseClass,
    );
  }

  static TeachingScheduleProposalIncludeList includeList({
    _is.WhereExpressionBuilder<TeachingScheduleProposalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TeachingScheduleProposalTable>? orderBy,
    _is.OrderByListBuilder<TeachingScheduleProposalTable>? orderByList,
    TeachingScheduleProposalInclude? include,
  }) {
    return TeachingScheduleProposalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeachingScheduleProposal.t),
      orderByList: orderByList?.call(TeachingScheduleProposal.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeachingScheduleProposalImpl extends TeachingScheduleProposal {
  _TeachingScheduleProposalImpl({
    _is.UuidValue? id,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
    _i47qlg6c.TeachingScheduleStatus? status,
    DateTime? createdAt,
  }) : super._(
         id: id,
         lecturerId: lecturerId,
         lecturer: lecturer,
         courseClassId: courseClassId,
         courseClass: courseClass,
         dayOfWeek: dayOfWeek,
         startPeriod: startPeriod,
         endPeriod: endPeriod,
         room: room,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [TeachingScheduleProposal]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  TeachingScheduleProposal copyWith({
    Object? id = _Undefined,
    _is.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    _is.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
    _i47qlg6c.TeachingScheduleStatus? status,
    DateTime? createdAt,
  }) {
    return TeachingScheduleProposal(
      id: id is _is.UuidValue? ? id : this.id,
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      room: room ?? this.room,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class TeachingScheduleProposalUpdateTable
    extends _is.UpdateTable<TeachingScheduleProposalTable> {
  TeachingScheduleProposalUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> lecturerId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.lecturerId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseClassId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.courseClassId,
    value,
  );

  _is.ColumnValue<int, int> dayOfWeek(int value) => _is.ColumnValue(
    table.dayOfWeek,
    value,
  );

  _is.ColumnValue<int, int> startPeriod(int value) => _is.ColumnValue(
    table.startPeriod,
    value,
  );

  _is.ColumnValue<int, int> endPeriod(int value) => _is.ColumnValue(
    table.endPeriod,
    value,
  );

  _is.ColumnValue<String, String> room(String value) => _is.ColumnValue(
    table.room,
    value,
  );

  _is.ColumnValue<
    _i47qlg6c.TeachingScheduleStatus,
    _i47qlg6c.TeachingScheduleStatus
  >
  status(_i47qlg6c.TeachingScheduleStatus value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class TeachingScheduleProposalTable extends _is.Table<_is.UuidValue?> {
  TeachingScheduleProposalTable({super.tableRelation})
    : super(tableName: 'teaching_schedule_proposals') {
    updateTable = TeachingScheduleProposalUpdateTable(this);
    lecturerId = _is.ColumnUuid(
      'lecturerId',
      this,
    );
    courseClassId = _is.ColumnUuid(
      'courseClassId',
      this,
    );
    dayOfWeek = _is.ColumnInt(
      'dayOfWeek',
      this,
    );
    startPeriod = _is.ColumnInt(
      'startPeriod',
      this,
    );
    endPeriod = _is.ColumnInt(
      'endPeriod',
      this,
    );
    room = _is.ColumnString(
      'room',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final TeachingScheduleProposalUpdateTable updateTable;

  late final _is.ColumnUuid lecturerId;

  _ismqsd72.LecturerTable? _lecturer;

  late final _is.ColumnUuid courseClassId;

  _igjwbat6.CourseClassTable? _courseClass;

  late final _is.ColumnInt dayOfWeek;

  late final _is.ColumnInt startPeriod;

  late final _is.ColumnInt endPeriod;

  late final _is.ColumnString room;

  late final _is.ColumnEnum<_i47qlg6c.TeachingScheduleStatus> status;

  late final _is.ColumnDateTime createdAt;

  _ismqsd72.LecturerTable get lecturer {
    if (_lecturer != null) return _lecturer!;
    _lecturer = _is.createRelationTable(
      relationFieldName: 'lecturer',
      field: TeachingScheduleProposal.t.lecturerId,
      foreignField: _ismqsd72.Lecturer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ismqsd72.LecturerTable(tableRelation: foreignTableRelation),
    );
    return _lecturer!;
  }

  _igjwbat6.CourseClassTable get courseClass {
    if (_courseClass != null) return _courseClass!;
    _courseClass = _is.createRelationTable(
      relationFieldName: 'courseClass',
      field: TeachingScheduleProposal.t.courseClassId,
      foreignField: _igjwbat6.CourseClass.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _igjwbat6.CourseClassTable(tableRelation: foreignTableRelation),
    );
    return _courseClass!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    lecturerId,
    courseClassId,
    dayOfWeek,
    startPeriod,
    endPeriod,
    room,
    status,
    createdAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'lecturer') {
      return lecturer;
    }
    if (relationField == 'courseClass') {
      return courseClass;
    }
    return null;
  }
}

class TeachingScheduleProposalInclude extends _is.IncludeObject {
  TeachingScheduleProposalInclude._({
    _ismqsd72.LecturerInclude? lecturer,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    _lecturer = lecturer;
    _courseClass = courseClass;
  }

  _ismqsd72.LecturerInclude? _lecturer;

  _igjwbat6.CourseClassInclude? _courseClass;

  @override
  Map<String, _is.Include?> get includes => {
    'lecturer': _lecturer,
    'courseClass': _courseClass,
  };

  @override
  _is.Table<_is.UuidValue?> get table => TeachingScheduleProposal.t;
}

class TeachingScheduleProposalIncludeList extends _is.IncludeList {
  TeachingScheduleProposalIncludeList._({
    _is.WhereExpressionBuilder<TeachingScheduleProposalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TeachingScheduleProposal.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => TeachingScheduleProposal.t;
}

class TeachingScheduleProposalRepository {
  const TeachingScheduleProposalRepository._();

  final attachRow = const TeachingScheduleProposalAttachRowRepository._();

  /// Returns a list of [TeachingScheduleProposal]s matching the given query parameters.
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
  Future<List<TeachingScheduleProposal>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TeachingScheduleProposalTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TeachingScheduleProposalTable>? orderBy,
    _is.OrderByListBuilder<TeachingScheduleProposalTable>? orderByList,
    _is.Transaction? transaction,
    TeachingScheduleProposalInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TeachingScheduleProposal>(
      where: where?.call(TeachingScheduleProposal.t),
      orderBy: orderBy?.call(TeachingScheduleProposal.t),
      orderByList: orderByList?.call(TeachingScheduleProposal.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TeachingScheduleProposal] matching the given query parameters.
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
  Future<TeachingScheduleProposal?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TeachingScheduleProposalTable>? where,
    int? offset,
    _is.OrderByBuilder<TeachingScheduleProposalTable>? orderBy,
    _is.OrderByListBuilder<TeachingScheduleProposalTable>? orderByList,
    _is.Transaction? transaction,
    TeachingScheduleProposalInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TeachingScheduleProposal>(
      where: where?.call(TeachingScheduleProposal.t),
      orderBy: orderBy?.call(TeachingScheduleProposal.t),
      orderByList: orderByList?.call(TeachingScheduleProposal.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TeachingScheduleProposal] by its [id] or null if no such row exists.
  Future<TeachingScheduleProposal?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    TeachingScheduleProposalInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TeachingScheduleProposal>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TeachingScheduleProposal]s in the list and returns the inserted rows.
  ///
  /// The returned [TeachingScheduleProposal]s will have their `id` fields set.
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
  Future<List<TeachingScheduleProposal>> insert(
    _is.DatabaseSession session,
    List<TeachingScheduleProposal> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<TeachingScheduleProposal>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [TeachingScheduleProposal] and returns the inserted row.
  ///
  /// The returned [TeachingScheduleProposal] will have its `id` field set.
  Future<TeachingScheduleProposal> insertRow(
    _is.DatabaseSession session,
    TeachingScheduleProposal row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<TeachingScheduleProposal>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [TeachingScheduleProposal]s in the list and returns the resulting rows.
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
  /// The returned [TeachingScheduleProposal]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TeachingScheduleProposal>> upsert(
    _is.DatabaseSession session,
    List<TeachingScheduleProposal> rows, {
    required _is.ColumnSelections<TeachingScheduleProposalTable>
    conflictColumns,
    _is.ColumnSelections<TeachingScheduleProposalTable>? updateColumns,
    _is.WhereExpressionBuilder<TeachingScheduleProposalTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<TeachingScheduleProposal>(
      rows,
      conflictColumns: conflictColumns(TeachingScheduleProposal.t),
      updateColumns: updateColumns?.call(TeachingScheduleProposal.t),
      updateWhere: updateWhere?.call(TeachingScheduleProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [TeachingScheduleProposal] and returns the resulting row.
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
  /// The returned [TeachingScheduleProposal] will have its `id` field set.
  Future<TeachingScheduleProposal?> upsertRow(
    _is.DatabaseSession session,
    TeachingScheduleProposal row, {
    required _is.ColumnSelections<TeachingScheduleProposalTable>
    conflictColumns,
    _is.ColumnSelections<TeachingScheduleProposalTable>? updateColumns,
    _is.WhereExpressionBuilder<TeachingScheduleProposalTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<TeachingScheduleProposal>(
      row,
      conflictColumns: conflictColumns(TeachingScheduleProposal.t),
      updateColumns: updateColumns?.call(TeachingScheduleProposal.t),
      updateWhere: updateWhere?.call(TeachingScheduleProposal.t),
      transaction: transaction,
    );
  }

  /// Updates all [TeachingScheduleProposal]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TeachingScheduleProposal>> update(
    _is.DatabaseSession session,
    List<TeachingScheduleProposal> rows, {
    _is.ColumnSelections<TeachingScheduleProposalTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<TeachingScheduleProposal>(
      rows,
      columns: columns?.call(TeachingScheduleProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [TeachingScheduleProposal]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TeachingScheduleProposal> updateRow(
    _is.DatabaseSession session,
    TeachingScheduleProposal row, {
    _is.ColumnSelections<TeachingScheduleProposalTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<TeachingScheduleProposal>(
      row,
      columns: columns?.call(TeachingScheduleProposal.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TeachingScheduleProposal] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TeachingScheduleProposal?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<TeachingScheduleProposalUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<TeachingScheduleProposal>(
      id,
      columnValues: columnValues(TeachingScheduleProposal.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TeachingScheduleProposal]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TeachingScheduleProposal>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<TeachingScheduleProposalUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<TeachingScheduleProposalTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TeachingScheduleProposalTable>? orderBy,
    _is.OrderByListBuilder<TeachingScheduleProposalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<TeachingScheduleProposal>(
      columnValues: columnValues(TeachingScheduleProposal.t.updateTable),
      where: where(TeachingScheduleProposal.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeachingScheduleProposal.t),
      orderByList: orderByList?.call(TeachingScheduleProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [TeachingScheduleProposal]s in the list and returns the deleted rows.
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
  Future<List<TeachingScheduleProposal>> delete(
    _is.DatabaseSession session,
    List<TeachingScheduleProposal> rows, {
    _is.OrderByBuilder<TeachingScheduleProposalTable>? orderBy,
    _is.OrderByListBuilder<TeachingScheduleProposalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<TeachingScheduleProposal>(
      rows,
      orderBy: orderBy?.call(TeachingScheduleProposal.t),
      orderByList: orderByList?.call(TeachingScheduleProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [TeachingScheduleProposal].
  Future<TeachingScheduleProposal> deleteRow(
    _is.DatabaseSession session,
    TeachingScheduleProposal row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TeachingScheduleProposal>(
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
  Future<List<TeachingScheduleProposal>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TeachingScheduleProposalTable> where,
    _is.OrderByBuilder<TeachingScheduleProposalTable>? orderBy,
    _is.OrderByListBuilder<TeachingScheduleProposalTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<TeachingScheduleProposal>(
      where: where(TeachingScheduleProposal.t),
      orderBy: orderBy?.call(TeachingScheduleProposal.t),
      orderByList: orderByList?.call(TeachingScheduleProposal.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TeachingScheduleProposalTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<TeachingScheduleProposal>(
      where: where?.call(TeachingScheduleProposal.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TeachingScheduleProposal] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TeachingScheduleProposalTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TeachingScheduleProposal>(
      where: where(TeachingScheduleProposal.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class TeachingScheduleProposalAttachRowRepository {
  const TeachingScheduleProposalAttachRowRepository._();

  /// Creates a relation between the given [TeachingScheduleProposal] and [Lecturer]
  /// by setting the [TeachingScheduleProposal]'s foreign key `lecturerId` to refer to the [Lecturer].
  Future<void> lecturer(
    _is.DatabaseSession session,
    TeachingScheduleProposal teachingScheduleProposal,
    _ismqsd72.Lecturer lecturer, {
    _is.Transaction? transaction,
  }) async {
    if (teachingScheduleProposal.id == null) {
      throw ArgumentError.notNull('teachingScheduleProposal.id');
    }
    if (lecturer.id == null) {
      throw ArgumentError.notNull('lecturer.id');
    }

    var $teachingScheduleProposal = teachingScheduleProposal.copyWith(
      lecturerId: lecturer.id,
    );
    await session.db.updateRow<TeachingScheduleProposal>(
      $teachingScheduleProposal,
      columns: [TeachingScheduleProposal.t.lecturerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TeachingScheduleProposal] and [CourseClass]
  /// by setting the [TeachingScheduleProposal]'s foreign key `courseClassId` to refer to the [CourseClass].
  Future<void> courseClass(
    _is.DatabaseSession session,
    TeachingScheduleProposal teachingScheduleProposal,
    _igjwbat6.CourseClass courseClass, {
    _is.Transaction? transaction,
  }) async {
    if (teachingScheduleProposal.id == null) {
      throw ArgumentError.notNull('teachingScheduleProposal.id');
    }
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }

    var $teachingScheduleProposal = teachingScheduleProposal.copyWith(
      courseClassId: courseClass.id,
    );
    await session.db.updateRow<TeachingScheduleProposal>(
      $teachingScheduleProposal,
      columns: [TeachingScheduleProposal.t.courseClassId],
      transaction: transaction,
    );
  }
}
