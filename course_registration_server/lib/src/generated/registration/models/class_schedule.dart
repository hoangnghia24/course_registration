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
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class ClassSchedule
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  ClassSchedule._({
    this.id,
    required this.courseClassId,
    this.courseClass,
    required this.dayOfWeek,
    required this.startPeriod,
    required this.endPeriod,
    required this.room,
  });

  factory ClassSchedule({
    _is.UuidValue? id,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
  }) = _ClassScheduleImpl;

  factory ClassSchedule.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClassSchedule(
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
      dayOfWeek: jsonSerialization['dayOfWeek'] as int,
      startPeriod: jsonSerialization['startPeriod'] as int,
      endPeriod: jsonSerialization['endPeriod'] as int,
      room: jsonSerialization['room'] as String,
    );
  }

  static final t = ClassScheduleTable();

  static const db = ClassScheduleRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  int dayOfWeek;

  int startPeriod;

  int endPeriod;

  String room;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [ClassSchedule]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClassSchedule copyWith({
    _is.UuidValue? id,
    _is.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassSchedule',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassSchedule',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
    };
  }

  static ClassScheduleInclude include({
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    return ClassScheduleInclude._(courseClass: courseClass);
  }

  static ClassScheduleIncludeList includeList({
    _is.WhereExpressionBuilder<ClassScheduleTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassScheduleTable>? orderBy,
    _is.OrderByListBuilder<ClassScheduleTable>? orderByList,
    ClassScheduleInclude? include,
  }) {
    return ClassScheduleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ClassSchedule.t),
      orderByList: orderByList?.call(ClassSchedule.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClassScheduleImpl extends ClassSchedule {
  _ClassScheduleImpl({
    _is.UuidValue? id,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
  }) : super._(
         id: id,
         courseClassId: courseClassId,
         courseClass: courseClass,
         dayOfWeek: dayOfWeek,
         startPeriod: startPeriod,
         endPeriod: endPeriod,
         room: room,
       );

  /// Returns a shallow copy of this [ClassSchedule]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClassSchedule copyWith({
    Object? id = _Undefined,
    _is.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
  }) {
    return ClassSchedule(
      id: id is _is.UuidValue? ? id : this.id,
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      room: room ?? this.room,
    );
  }
}

class ClassScheduleUpdateTable extends _is.UpdateTable<ClassScheduleTable> {
  ClassScheduleUpdateTable(super.table);

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
}

class ClassScheduleTable extends _is.Table<_is.UuidValue?> {
  ClassScheduleTable({super.tableRelation})
    : super(tableName: 'class_schedules') {
    updateTable = ClassScheduleUpdateTable(this);
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
  }

  late final ClassScheduleUpdateTable updateTable;

  late final _is.ColumnUuid courseClassId;

  _igjwbat6.CourseClassTable? _courseClass;

  late final _is.ColumnInt dayOfWeek;

  late final _is.ColumnInt startPeriod;

  late final _is.ColumnInt endPeriod;

  late final _is.ColumnString room;

  _igjwbat6.CourseClassTable get courseClass {
    if (_courseClass != null) return _courseClass!;
    _courseClass = _is.createRelationTable(
      relationFieldName: 'courseClass',
      field: ClassSchedule.t.courseClassId,
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
    courseClassId,
    dayOfWeek,
    startPeriod,
    endPeriod,
    room,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'courseClass') {
      return courseClass;
    }
    return null;
  }
}

class ClassScheduleInclude extends _is.IncludeObject {
  ClassScheduleInclude._({_igjwbat6.CourseClassInclude? courseClass}) {
    _courseClass = courseClass;
  }

  _igjwbat6.CourseClassInclude? _courseClass;

  @override
  Map<String, _is.Include?> get includes => {'courseClass': _courseClass};

  @override
  _is.Table<_is.UuidValue?> get table => ClassSchedule.t;
}

class ClassScheduleIncludeList extends _is.IncludeList {
  ClassScheduleIncludeList._({
    _is.WhereExpressionBuilder<ClassScheduleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ClassSchedule.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => ClassSchedule.t;
}

class ClassScheduleRepository {
  const ClassScheduleRepository._();

  final attachRow = const ClassScheduleAttachRowRepository._();

  /// Returns a list of [ClassSchedule]s matching the given query parameters.
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
  Future<List<ClassSchedule>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassScheduleTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassScheduleTable>? orderBy,
    _is.OrderByListBuilder<ClassScheduleTable>? orderByList,
    _is.Transaction? transaction,
    ClassScheduleInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ClassSchedule>(
      where: where?.call(ClassSchedule.t),
      orderBy: orderBy?.call(ClassSchedule.t),
      orderByList: orderByList?.call(ClassSchedule.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ClassSchedule] matching the given query parameters.
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
  Future<ClassSchedule?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassScheduleTable>? where,
    int? offset,
    _is.OrderByBuilder<ClassScheduleTable>? orderBy,
    _is.OrderByListBuilder<ClassScheduleTable>? orderByList,
    _is.Transaction? transaction,
    ClassScheduleInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ClassSchedule>(
      where: where?.call(ClassSchedule.t),
      orderBy: orderBy?.call(ClassSchedule.t),
      orderByList: orderByList?.call(ClassSchedule.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ClassSchedule] by its [id] or null if no such row exists.
  Future<ClassSchedule?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    ClassScheduleInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ClassSchedule>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ClassSchedule]s in the list and returns the inserted rows.
  ///
  /// The returned [ClassSchedule]s will have their `id` fields set.
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
  Future<List<ClassSchedule>> insert(
    _is.DatabaseSession session,
    List<ClassSchedule> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ClassSchedule>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ClassSchedule] and returns the inserted row.
  ///
  /// The returned [ClassSchedule] will have its `id` field set.
  Future<ClassSchedule> insertRow(
    _is.DatabaseSession session,
    ClassSchedule row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ClassSchedule>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ClassSchedule]s in the list and returns the resulting rows.
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
  /// The returned [ClassSchedule]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassSchedule>> upsert(
    _is.DatabaseSession session,
    List<ClassSchedule> rows, {
    required _is.ColumnSelections<ClassScheduleTable> conflictColumns,
    _is.ColumnSelections<ClassScheduleTable>? updateColumns,
    _is.WhereExpressionBuilder<ClassScheduleTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ClassSchedule>(
      rows,
      conflictColumns: conflictColumns(ClassSchedule.t),
      updateColumns: updateColumns?.call(ClassSchedule.t),
      updateWhere: updateWhere?.call(ClassSchedule.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ClassSchedule] and returns the resulting row.
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
  /// The returned [ClassSchedule] will have its `id` field set.
  Future<ClassSchedule?> upsertRow(
    _is.DatabaseSession session,
    ClassSchedule row, {
    required _is.ColumnSelections<ClassScheduleTable> conflictColumns,
    _is.ColumnSelections<ClassScheduleTable>? updateColumns,
    _is.WhereExpressionBuilder<ClassScheduleTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ClassSchedule>(
      row,
      conflictColumns: conflictColumns(ClassSchedule.t),
      updateColumns: updateColumns?.call(ClassSchedule.t),
      updateWhere: updateWhere?.call(ClassSchedule.t),
      transaction: transaction,
    );
  }

  /// Updates all [ClassSchedule]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassSchedule>> update(
    _is.DatabaseSession session,
    List<ClassSchedule> rows, {
    _is.ColumnSelections<ClassScheduleTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ClassSchedule>(
      rows,
      columns: columns?.call(ClassSchedule.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ClassSchedule]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ClassSchedule> updateRow(
    _is.DatabaseSession session,
    ClassSchedule row, {
    _is.ColumnSelections<ClassScheduleTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ClassSchedule>(
      row,
      columns: columns?.call(ClassSchedule.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ClassSchedule] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ClassSchedule?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<ClassScheduleUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ClassSchedule>(
      id,
      columnValues: columnValues(ClassSchedule.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ClassSchedule]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassSchedule>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ClassScheduleUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ClassScheduleTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassScheduleTable>? orderBy,
    _is.OrderByListBuilder<ClassScheduleTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ClassSchedule>(
      columnValues: columnValues(ClassSchedule.t.updateTable),
      where: where(ClassSchedule.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ClassSchedule.t),
      orderByList: orderByList?.call(ClassSchedule.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ClassSchedule]s in the list and returns the deleted rows.
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
  Future<List<ClassSchedule>> delete(
    _is.DatabaseSession session,
    List<ClassSchedule> rows, {
    _is.OrderByBuilder<ClassScheduleTable>? orderBy,
    _is.OrderByListBuilder<ClassScheduleTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ClassSchedule>(
      rows,
      orderBy: orderBy?.call(ClassSchedule.t),
      orderByList: orderByList?.call(ClassSchedule.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ClassSchedule].
  Future<ClassSchedule> deleteRow(
    _is.DatabaseSession session,
    ClassSchedule row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ClassSchedule>(
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
  Future<List<ClassSchedule>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ClassScheduleTable> where,
    _is.OrderByBuilder<ClassScheduleTable>? orderBy,
    _is.OrderByListBuilder<ClassScheduleTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ClassSchedule>(
      where: where(ClassSchedule.t),
      orderBy: orderBy?.call(ClassSchedule.t),
      orderByList: orderByList?.call(ClassSchedule.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassScheduleTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ClassSchedule>(
      where: where?.call(ClassSchedule.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ClassSchedule] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ClassScheduleTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ClassSchedule>(
      where: where(ClassSchedule.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class ClassScheduleAttachRowRepository {
  const ClassScheduleAttachRowRepository._();

  /// Creates a relation between the given [ClassSchedule] and [CourseClass]
  /// by setting the [ClassSchedule]'s foreign key `courseClassId` to refer to the [CourseClass].
  Future<void> courseClass(
    _is.DatabaseSession session,
    ClassSchedule classSchedule,
    _igjwbat6.CourseClass courseClass, {
    _is.Transaction? transaction,
  }) async {
    if (classSchedule.id == null) {
      throw ArgumentError.notNull('classSchedule.id');
    }
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }

    var $classSchedule = classSchedule.copyWith(courseClassId: courseClass.id);
    await session.db.updateRow<ClassSchedule>(
      $classSchedule,
      columns: [ClassSchedule.t.courseClassId],
      transaction: transaction,
    );
  }
}
