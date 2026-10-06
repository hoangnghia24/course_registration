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
import '../../student/models/course.dart' as _ibp0tzhj;
import '../../student/models/training_program.dart' as _i1ofsz02;

abstract class TrainingProgramCourse
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  TrainingProgramCourse._({
    this.id,
    required this.trainingProgramId,
    this.trainingProgram,
    required this.courseId,
    this.course,
    required this.semesterNumber,
    required this.isRequired,
  });

  factory TrainingProgramCourse({
    _is.UuidValue? id,
    required _is.UuidValue trainingProgramId,
    _i1ofsz02.TrainingProgram? trainingProgram,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required int semesterNumber,
    required bool isRequired,
  }) = _TrainingProgramCourseImpl;

  factory TrainingProgramCourse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TrainingProgramCourse(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      trainingProgramId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['trainingProgramId'],
      ),
      trainingProgram: jsonSerialization['trainingProgram'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i1ofsz02.TrainingProgram>(
              jsonSerialization['trainingProgram'],
            ),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      course: jsonSerialization['course'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ibp0tzhj.Course>(
              jsonSerialization['course'],
            ),
      semesterNumber: jsonSerialization['semesterNumber'] as int,
      isRequired: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isRequired'],
      ),
    );
  }

  static final t = TrainingProgramCourseTable();

  static const db = TrainingProgramCourseRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue trainingProgramId;

  _i1ofsz02.TrainingProgram? trainingProgram;

  _is.UuidValue courseId;

  _ibp0tzhj.Course? course;

  int semesterNumber;

  bool isRequired;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [TrainingProgramCourse]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  TrainingProgramCourse copyWith({
    _is.UuidValue? id,
    _is.UuidValue? trainingProgramId,
    _i1ofsz02.TrainingProgram? trainingProgram,
    _is.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    int? semesterNumber,
    bool? isRequired,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TrainingProgramCourse',
      if (id != null) 'id': id?.toJson(),
      'trainingProgramId': trainingProgramId.toJson(),
      if (trainingProgram != null) 'trainingProgram': trainingProgram?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'semesterNumber': semesterNumber,
      'isRequired': isRequired,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TrainingProgramCourse',
      if (id != null) 'id': id?.toJson(),
      'trainingProgramId': trainingProgramId.toJson(),
      if (trainingProgram != null)
        'trainingProgram': trainingProgram?.toJsonForProtocol(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'semesterNumber': semesterNumber,
      'isRequired': isRequired,
    };
  }

  static TrainingProgramCourseInclude include({
    _i1ofsz02.TrainingProgramInclude? trainingProgram,
    _ibp0tzhj.CourseInclude? course,
  }) {
    return TrainingProgramCourseInclude._(
      trainingProgram: trainingProgram,
      course: course,
    );
  }

  static TrainingProgramCourseIncludeList includeList({
    _is.WhereExpressionBuilder<TrainingProgramCourseTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TrainingProgramCourseTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramCourseTable>? orderByList,
    TrainingProgramCourseInclude? include,
  }) {
    return TrainingProgramCourseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TrainingProgramCourse.t),
      orderByList: orderByList?.call(TrainingProgramCourse.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrainingProgramCourseImpl extends TrainingProgramCourse {
  _TrainingProgramCourseImpl({
    _is.UuidValue? id,
    required _is.UuidValue trainingProgramId,
    _i1ofsz02.TrainingProgram? trainingProgram,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required int semesterNumber,
    required bool isRequired,
  }) : super._(
         id: id,
         trainingProgramId: trainingProgramId,
         trainingProgram: trainingProgram,
         courseId: courseId,
         course: course,
         semesterNumber: semesterNumber,
         isRequired: isRequired,
       );

  /// Returns a shallow copy of this [TrainingProgramCourse]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  TrainingProgramCourse copyWith({
    Object? id = _Undefined,
    _is.UuidValue? trainingProgramId,
    Object? trainingProgram = _Undefined,
    _is.UuidValue? courseId,
    Object? course = _Undefined,
    int? semesterNumber,
    bool? isRequired,
  }) {
    return TrainingProgramCourse(
      id: id is _is.UuidValue? ? id : this.id,
      trainingProgramId: trainingProgramId ?? this.trainingProgramId,
      trainingProgram: trainingProgram is _i1ofsz02.TrainingProgram?
          ? trainingProgram
          : this.trainingProgram?.copyWith(),
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      semesterNumber: semesterNumber ?? this.semesterNumber,
      isRequired: isRequired ?? this.isRequired,
    );
  }
}

class TrainingProgramCourseUpdateTable
    extends _is.UpdateTable<TrainingProgramCourseTable> {
  TrainingProgramCourseUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> trainingProgramId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.trainingProgramId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.courseId,
        value,
      );

  _is.ColumnValue<int, int> semesterNumber(int value) => _is.ColumnValue(
    table.semesterNumber,
    value,
  );

  _is.ColumnValue<bool, bool> isRequired(bool value) => _is.ColumnValue(
    table.isRequired,
    value,
  );
}

class TrainingProgramCourseTable extends _is.Table<_is.UuidValue?> {
  TrainingProgramCourseTable({super.tableRelation})
    : super(tableName: 'training_program_courses') {
    updateTable = TrainingProgramCourseUpdateTable(this);
    trainingProgramId = _is.ColumnUuid(
      'trainingProgramId',
      this,
    );
    courseId = _is.ColumnUuid(
      'courseId',
      this,
    );
    semesterNumber = _is.ColumnInt(
      'semesterNumber',
      this,
    );
    isRequired = _is.ColumnBool(
      'isRequired',
      this,
    );
  }

  late final TrainingProgramCourseUpdateTable updateTable;

  late final _is.ColumnUuid trainingProgramId;

  _i1ofsz02.TrainingProgramTable? _trainingProgram;

  late final _is.ColumnUuid courseId;

  _ibp0tzhj.CourseTable? _course;

  late final _is.ColumnInt semesterNumber;

  late final _is.ColumnBool isRequired;

  _i1ofsz02.TrainingProgramTable get trainingProgram {
    if (_trainingProgram != null) return _trainingProgram!;
    _trainingProgram = _is.createRelationTable(
      relationFieldName: 'trainingProgram',
      field: TrainingProgramCourse.t.trainingProgramId,
      foreignField: _i1ofsz02.TrainingProgram.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i1ofsz02.TrainingProgramTable(tableRelation: foreignTableRelation),
    );
    return _trainingProgram!;
  }

  _ibp0tzhj.CourseTable get course {
    if (_course != null) return _course!;
    _course = _is.createRelationTable(
      relationFieldName: 'course',
      field: TrainingProgramCourse.t.courseId,
      foreignField: _ibp0tzhj.Course.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ibp0tzhj.CourseTable(tableRelation: foreignTableRelation),
    );
    return _course!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    trainingProgramId,
    courseId,
    semesterNumber,
    isRequired,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'trainingProgram') {
      return trainingProgram;
    }
    if (relationField == 'course') {
      return course;
    }
    return null;
  }
}

class TrainingProgramCourseInclude extends _is.IncludeObject {
  TrainingProgramCourseInclude._({
    _i1ofsz02.TrainingProgramInclude? trainingProgram,
    _ibp0tzhj.CourseInclude? course,
  }) {
    _trainingProgram = trainingProgram;
    _course = course;
  }

  _i1ofsz02.TrainingProgramInclude? _trainingProgram;

  _ibp0tzhj.CourseInclude? _course;

  @override
  Map<String, _is.Include?> get includes => {
    'trainingProgram': _trainingProgram,
    'course': _course,
  };

  @override
  _is.Table<_is.UuidValue?> get table => TrainingProgramCourse.t;
}

class TrainingProgramCourseIncludeList extends _is.IncludeList {
  TrainingProgramCourseIncludeList._({
    _is.WhereExpressionBuilder<TrainingProgramCourseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TrainingProgramCourse.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => TrainingProgramCourse.t;
}

class TrainingProgramCourseRepository {
  const TrainingProgramCourseRepository._();

  final attachRow = const TrainingProgramCourseAttachRowRepository._();

  /// Returns a list of [TrainingProgramCourse]s matching the given query parameters.
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
  Future<List<TrainingProgramCourse>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TrainingProgramCourseTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TrainingProgramCourseTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramCourseTable>? orderByList,
    _is.Transaction? transaction,
    TrainingProgramCourseInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TrainingProgramCourse>(
      where: where?.call(TrainingProgramCourse.t),
      orderBy: orderBy?.call(TrainingProgramCourse.t),
      orderByList: orderByList?.call(TrainingProgramCourse.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TrainingProgramCourse] matching the given query parameters.
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
  Future<TrainingProgramCourse?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TrainingProgramCourseTable>? where,
    int? offset,
    _is.OrderByBuilder<TrainingProgramCourseTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramCourseTable>? orderByList,
    _is.Transaction? transaction,
    TrainingProgramCourseInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TrainingProgramCourse>(
      where: where?.call(TrainingProgramCourse.t),
      orderBy: orderBy?.call(TrainingProgramCourse.t),
      orderByList: orderByList?.call(TrainingProgramCourse.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TrainingProgramCourse] by its [id] or null if no such row exists.
  Future<TrainingProgramCourse?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    TrainingProgramCourseInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TrainingProgramCourse>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TrainingProgramCourse]s in the list and returns the inserted rows.
  ///
  /// The returned [TrainingProgramCourse]s will have their `id` fields set.
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
  Future<List<TrainingProgramCourse>> insert(
    _is.DatabaseSession session,
    List<TrainingProgramCourse> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<TrainingProgramCourse>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [TrainingProgramCourse] and returns the inserted row.
  ///
  /// The returned [TrainingProgramCourse] will have its `id` field set.
  Future<TrainingProgramCourse> insertRow(
    _is.DatabaseSession session,
    TrainingProgramCourse row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<TrainingProgramCourse>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [TrainingProgramCourse]s in the list and returns the resulting rows.
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
  /// The returned [TrainingProgramCourse]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TrainingProgramCourse>> upsert(
    _is.DatabaseSession session,
    List<TrainingProgramCourse> rows, {
    required _is.ColumnSelections<TrainingProgramCourseTable> conflictColumns,
    _is.ColumnSelections<TrainingProgramCourseTable>? updateColumns,
    _is.WhereExpressionBuilder<TrainingProgramCourseTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<TrainingProgramCourse>(
      rows,
      conflictColumns: conflictColumns(TrainingProgramCourse.t),
      updateColumns: updateColumns?.call(TrainingProgramCourse.t),
      updateWhere: updateWhere?.call(TrainingProgramCourse.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [TrainingProgramCourse] and returns the resulting row.
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
  /// The returned [TrainingProgramCourse] will have its `id` field set.
  Future<TrainingProgramCourse?> upsertRow(
    _is.DatabaseSession session,
    TrainingProgramCourse row, {
    required _is.ColumnSelections<TrainingProgramCourseTable> conflictColumns,
    _is.ColumnSelections<TrainingProgramCourseTable>? updateColumns,
    _is.WhereExpressionBuilder<TrainingProgramCourseTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<TrainingProgramCourse>(
      row,
      conflictColumns: conflictColumns(TrainingProgramCourse.t),
      updateColumns: updateColumns?.call(TrainingProgramCourse.t),
      updateWhere: updateWhere?.call(TrainingProgramCourse.t),
      transaction: transaction,
    );
  }

  /// Updates all [TrainingProgramCourse]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TrainingProgramCourse>> update(
    _is.DatabaseSession session,
    List<TrainingProgramCourse> rows, {
    _is.ColumnSelections<TrainingProgramCourseTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<TrainingProgramCourse>(
      rows,
      columns: columns?.call(TrainingProgramCourse.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [TrainingProgramCourse]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TrainingProgramCourse> updateRow(
    _is.DatabaseSession session,
    TrainingProgramCourse row, {
    _is.ColumnSelections<TrainingProgramCourseTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<TrainingProgramCourse>(
      row,
      columns: columns?.call(TrainingProgramCourse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TrainingProgramCourse] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TrainingProgramCourse?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<TrainingProgramCourseUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<TrainingProgramCourse>(
      id,
      columnValues: columnValues(TrainingProgramCourse.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TrainingProgramCourse]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<TrainingProgramCourse>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<TrainingProgramCourseUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<TrainingProgramCourseTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<TrainingProgramCourseTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramCourseTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<TrainingProgramCourse>(
      columnValues: columnValues(TrainingProgramCourse.t.updateTable),
      where: where(TrainingProgramCourse.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TrainingProgramCourse.t),
      orderByList: orderByList?.call(TrainingProgramCourse.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [TrainingProgramCourse]s in the list and returns the deleted rows.
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
  Future<List<TrainingProgramCourse>> delete(
    _is.DatabaseSession session,
    List<TrainingProgramCourse> rows, {
    _is.OrderByBuilder<TrainingProgramCourseTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramCourseTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<TrainingProgramCourse>(
      rows,
      orderBy: orderBy?.call(TrainingProgramCourse.t),
      orderByList: orderByList?.call(TrainingProgramCourse.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [TrainingProgramCourse].
  Future<TrainingProgramCourse> deleteRow(
    _is.DatabaseSession session,
    TrainingProgramCourse row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TrainingProgramCourse>(
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
  Future<List<TrainingProgramCourse>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TrainingProgramCourseTable> where,
    _is.OrderByBuilder<TrainingProgramCourseTable>? orderBy,
    _is.OrderByListBuilder<TrainingProgramCourseTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<TrainingProgramCourse>(
      where: where(TrainingProgramCourse.t),
      orderBy: orderBy?.call(TrainingProgramCourse.t),
      orderByList: orderByList?.call(TrainingProgramCourse.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<TrainingProgramCourseTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<TrainingProgramCourse>(
      where: where?.call(TrainingProgramCourse.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TrainingProgramCourse] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<TrainingProgramCourseTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TrainingProgramCourse>(
      where: where(TrainingProgramCourse.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class TrainingProgramCourseAttachRowRepository {
  const TrainingProgramCourseAttachRowRepository._();

  /// Creates a relation between the given [TrainingProgramCourse] and [TrainingProgram]
  /// by setting the [TrainingProgramCourse]'s foreign key `trainingProgramId` to refer to the [TrainingProgram].
  Future<void> trainingProgram(
    _is.DatabaseSession session,
    TrainingProgramCourse trainingProgramCourse,
    _i1ofsz02.TrainingProgram trainingProgram, {
    _is.Transaction? transaction,
  }) async {
    if (trainingProgramCourse.id == null) {
      throw ArgumentError.notNull('trainingProgramCourse.id');
    }
    if (trainingProgram.id == null) {
      throw ArgumentError.notNull('trainingProgram.id');
    }

    var $trainingProgramCourse = trainingProgramCourse.copyWith(
      trainingProgramId: trainingProgram.id,
    );
    await session.db.updateRow<TrainingProgramCourse>(
      $trainingProgramCourse,
      columns: [TrainingProgramCourse.t.trainingProgramId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TrainingProgramCourse] and [Course]
  /// by setting the [TrainingProgramCourse]'s foreign key `courseId` to refer to the [Course].
  Future<void> course(
    _is.DatabaseSession session,
    TrainingProgramCourse trainingProgramCourse,
    _ibp0tzhj.Course course, {
    _is.Transaction? transaction,
  }) async {
    if (trainingProgramCourse.id == null) {
      throw ArgumentError.notNull('trainingProgramCourse.id');
    }
    if (course.id == null) {
      throw ArgumentError.notNull('course.id');
    }

    var $trainingProgramCourse = trainingProgramCourse.copyWith(
      courseId: course.id,
    );
    await session.db.updateRow<TrainingProgramCourse>(
      $trainingProgramCourse,
      columns: [TrainingProgramCourse.t.courseId],
      transaction: transaction,
    );
  }
}
