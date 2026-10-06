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
import '../../registration/models/course_class_status.dart' as _i5mo64p9;
import '../../registration/models/semester.dart' as _i975wtvt;
import '../../student/models/course.dart' as _ibp0tzhj;

abstract class CourseClass
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  CourseClass._({
    this.id,
    required this.courseId,
    this.course,
    required this.lecturerId,
    this.lecturer,
    required this.semesterId,
    this.semester,
    required this.classCode,
    required this.capacity,
    int? registeredCount,
    required this.status,
  }) : registeredCount = registeredCount ?? 0;

  factory CourseClass({
    _is.UuidValue? id,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _is.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required String classCode,
    required int capacity,
    int? registeredCount,
    required _i5mo64p9.CourseClassStatus status,
  }) = _CourseClassImpl;

  factory CourseClass.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseClass(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseId'],
      ),
      course: jsonSerialization['course'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ibp0tzhj.Course>(
              jsonSerialization['course'],
            ),
      lecturerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      semesterId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      semester: jsonSerialization['semester'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i975wtvt.Semester>(
              jsonSerialization['semester'],
            ),
      classCode: jsonSerialization['classCode'] as String,
      capacity: jsonSerialization['capacity'] as int,
      registeredCount: jsonSerialization['registeredCount'] as int?,
      status: _i5mo64p9.CourseClassStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
    );
  }

  static final t = CourseClassTable();

  static const db = CourseClassRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue courseId;

  _ibp0tzhj.Course? course;

  _is.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  _is.UuidValue semesterId;

  _i975wtvt.Semester? semester;

  String classCode;

  int capacity;

  int registeredCount;

  _i5mo64p9.CourseClassStatus status;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [CourseClass]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CourseClass copyWith({
    _is.UuidValue? id,
    _is.UuidValue? courseId,
    _ibp0tzhj.Course? course,
    _is.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    _is.UuidValue? semesterId,
    _i975wtvt.Semester? semester,
    String? classCode,
    int? capacity,
    int? registeredCount,
    _i5mo64p9.CourseClassStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseClass',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJson(),
      'classCode': classCode,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseClass',
      if (id != null) 'id': id?.toJson(),
      'courseId': courseId.toJson(),
      if (course != null) 'course': course?.toJsonForProtocol(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJsonForProtocol(),
      'classCode': classCode,
      'capacity': capacity,
      'registeredCount': registeredCount,
      'status': status.toJson(),
    };
  }

  static CourseClassInclude include({
    _ibp0tzhj.CourseInclude? course,
    _ismqsd72.LecturerInclude? lecturer,
    _i975wtvt.SemesterInclude? semester,
  }) {
    return CourseClassInclude._(
      course: course,
      lecturer: lecturer,
      semester: semester,
    );
  }

  static CourseClassIncludeList includeList({
    _is.WhereExpressionBuilder<CourseClassTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseClassTable>? orderBy,
    _is.OrderByListBuilder<CourseClassTable>? orderByList,
    CourseClassInclude? include,
  }) {
    return CourseClassIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseClass.t),
      orderByList: orderByList?.call(CourseClass.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseClassImpl extends CourseClass {
  _CourseClassImpl({
    _is.UuidValue? id,
    required _is.UuidValue courseId,
    _ibp0tzhj.Course? course,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required _is.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required String classCode,
    required int capacity,
    int? registeredCount,
    required _i5mo64p9.CourseClassStatus status,
  }) : super._(
         id: id,
         courseId: courseId,
         course: course,
         lecturerId: lecturerId,
         lecturer: lecturer,
         semesterId: semesterId,
         semester: semester,
         classCode: classCode,
         capacity: capacity,
         registeredCount: registeredCount,
         status: status,
       );

  /// Returns a shallow copy of this [CourseClass]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CourseClass copyWith({
    Object? id = _Undefined,
    _is.UuidValue? courseId,
    Object? course = _Undefined,
    _is.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    _is.UuidValue? semesterId,
    Object? semester = _Undefined,
    String? classCode,
    int? capacity,
    int? registeredCount,
    _i5mo64p9.CourseClassStatus? status,
  }) {
    return CourseClass(
      id: id is _is.UuidValue? ? id : this.id,
      courseId: courseId ?? this.courseId,
      course: course is _ibp0tzhj.Course? ? course : this.course?.copyWith(),
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      semesterId: semesterId ?? this.semesterId,
      semester: semester is _i975wtvt.Semester?
          ? semester
          : this.semester?.copyWith(),
      classCode: classCode ?? this.classCode,
      capacity: capacity ?? this.capacity,
      registeredCount: registeredCount ?? this.registeredCount,
      status: status ?? this.status,
    );
  }
}

class CourseClassUpdateTable extends _is.UpdateTable<CourseClassTable> {
  CourseClassUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.courseId,
        value,
      );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> lecturerId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.lecturerId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> semesterId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.semesterId,
    value,
  );

  _is.ColumnValue<String, String> classCode(String value) => _is.ColumnValue(
    table.classCode,
    value,
  );

  _is.ColumnValue<int, int> capacity(int value) => _is.ColumnValue(
    table.capacity,
    value,
  );

  _is.ColumnValue<int, int> registeredCount(int value) => _is.ColumnValue(
    table.registeredCount,
    value,
  );

  _is.ColumnValue<_i5mo64p9.CourseClassStatus, _i5mo64p9.CourseClassStatus>
  status(_i5mo64p9.CourseClassStatus value) => _is.ColumnValue(
    table.status,
    value,
  );
}

class CourseClassTable extends _is.Table<_is.UuidValue?> {
  CourseClassTable({super.tableRelation}) : super(tableName: 'course_classes') {
    updateTable = CourseClassUpdateTable(this);
    courseId = _is.ColumnUuid(
      'courseId',
      this,
    );
    lecturerId = _is.ColumnUuid(
      'lecturerId',
      this,
    );
    semesterId = _is.ColumnUuid(
      'semesterId',
      this,
    );
    classCode = _is.ColumnString(
      'classCode',
      this,
    );
    capacity = _is.ColumnInt(
      'capacity',
      this,
    );
    registeredCount = _is.ColumnInt(
      'registeredCount',
      this,
      hasDefault: true,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
  }

  late final CourseClassUpdateTable updateTable;

  late final _is.ColumnUuid courseId;

  _ibp0tzhj.CourseTable? _course;

  late final _is.ColumnUuid lecturerId;

  _ismqsd72.LecturerTable? _lecturer;

  late final _is.ColumnUuid semesterId;

  _i975wtvt.SemesterTable? _semester;

  late final _is.ColumnString classCode;

  late final _is.ColumnInt capacity;

  late final _is.ColumnInt registeredCount;

  late final _is.ColumnEnum<_i5mo64p9.CourseClassStatus> status;

  _ibp0tzhj.CourseTable get course {
    if (_course != null) return _course!;
    _course = _is.createRelationTable(
      relationFieldName: 'course',
      field: CourseClass.t.courseId,
      foreignField: _ibp0tzhj.Course.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ibp0tzhj.CourseTable(tableRelation: foreignTableRelation),
    );
    return _course!;
  }

  _ismqsd72.LecturerTable get lecturer {
    if (_lecturer != null) return _lecturer!;
    _lecturer = _is.createRelationTable(
      relationFieldName: 'lecturer',
      field: CourseClass.t.lecturerId,
      foreignField: _ismqsd72.Lecturer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ismqsd72.LecturerTable(tableRelation: foreignTableRelation),
    );
    return _lecturer!;
  }

  _i975wtvt.SemesterTable get semester {
    if (_semester != null) return _semester!;
    _semester = _is.createRelationTable(
      relationFieldName: 'semester',
      field: CourseClass.t.semesterId,
      foreignField: _i975wtvt.Semester.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i975wtvt.SemesterTable(tableRelation: foreignTableRelation),
    );
    return _semester!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    courseId,
    lecturerId,
    semesterId,
    classCode,
    capacity,
    registeredCount,
    status,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'course') {
      return course;
    }
    if (relationField == 'lecturer') {
      return lecturer;
    }
    if (relationField == 'semester') {
      return semester;
    }
    return null;
  }
}

class CourseClassInclude extends _is.IncludeObject {
  CourseClassInclude._({
    _ibp0tzhj.CourseInclude? course,
    _ismqsd72.LecturerInclude? lecturer,
    _i975wtvt.SemesterInclude? semester,
  }) {
    _course = course;
    _lecturer = lecturer;
    _semester = semester;
  }

  _ibp0tzhj.CourseInclude? _course;

  _ismqsd72.LecturerInclude? _lecturer;

  _i975wtvt.SemesterInclude? _semester;

  @override
  Map<String, _is.Include?> get includes => {
    'course': _course,
    'lecturer': _lecturer,
    'semester': _semester,
  };

  @override
  _is.Table<_is.UuidValue?> get table => CourseClass.t;
}

class CourseClassIncludeList extends _is.IncludeList {
  CourseClassIncludeList._({
    _is.WhereExpressionBuilder<CourseClassTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CourseClass.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => CourseClass.t;
}

class CourseClassRepository {
  const CourseClassRepository._();

  final attachRow = const CourseClassAttachRowRepository._();

  /// Returns a list of [CourseClass]s matching the given query parameters.
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
  Future<List<CourseClass>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseClassTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseClassTable>? orderBy,
    _is.OrderByListBuilder<CourseClassTable>? orderByList,
    _is.Transaction? transaction,
    CourseClassInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CourseClass>(
      where: where?.call(CourseClass.t),
      orderBy: orderBy?.call(CourseClass.t),
      orderByList: orderByList?.call(CourseClass.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CourseClass] matching the given query parameters.
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
  Future<CourseClass?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseClassTable>? where,
    int? offset,
    _is.OrderByBuilder<CourseClassTable>? orderBy,
    _is.OrderByListBuilder<CourseClassTable>? orderByList,
    _is.Transaction? transaction,
    CourseClassInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CourseClass>(
      where: where?.call(CourseClass.t),
      orderBy: orderBy?.call(CourseClass.t),
      orderByList: orderByList?.call(CourseClass.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CourseClass] by its [id] or null if no such row exists.
  Future<CourseClass?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    CourseClassInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CourseClass>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CourseClass]s in the list and returns the inserted rows.
  ///
  /// The returned [CourseClass]s will have their `id` fields set.
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
  Future<List<CourseClass>> insert(
    _is.DatabaseSession session,
    List<CourseClass> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CourseClass>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CourseClass] and returns the inserted row.
  ///
  /// The returned [CourseClass] will have its `id` field set.
  Future<CourseClass> insertRow(
    _is.DatabaseSession session,
    CourseClass row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CourseClass>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CourseClass]s in the list and returns the resulting rows.
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
  /// The returned [CourseClass]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseClass>> upsert(
    _is.DatabaseSession session,
    List<CourseClass> rows, {
    required _is.ColumnSelections<CourseClassTable> conflictColumns,
    _is.ColumnSelections<CourseClassTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseClassTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CourseClass>(
      rows,
      conflictColumns: conflictColumns(CourseClass.t),
      updateColumns: updateColumns?.call(CourseClass.t),
      updateWhere: updateWhere?.call(CourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CourseClass] and returns the resulting row.
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
  /// The returned [CourseClass] will have its `id` field set.
  Future<CourseClass?> upsertRow(
    _is.DatabaseSession session,
    CourseClass row, {
    required _is.ColumnSelections<CourseClassTable> conflictColumns,
    _is.ColumnSelections<CourseClassTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseClassTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CourseClass>(
      row,
      conflictColumns: conflictColumns(CourseClass.t),
      updateColumns: updateColumns?.call(CourseClass.t),
      updateWhere: updateWhere?.call(CourseClass.t),
      transaction: transaction,
    );
  }

  /// Updates all [CourseClass]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseClass>> update(
    _is.DatabaseSession session,
    List<CourseClass> rows, {
    _is.ColumnSelections<CourseClassTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CourseClass>(
      rows,
      columns: columns?.call(CourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CourseClass]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CourseClass> updateRow(
    _is.DatabaseSession session,
    CourseClass row, {
    _is.ColumnSelections<CourseClassTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CourseClass>(
      row,
      columns: columns?.call(CourseClass.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CourseClass] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CourseClass?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<CourseClassUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CourseClass>(
      id,
      columnValues: columnValues(CourseClass.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CourseClass]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CourseClass>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CourseClassUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CourseClassTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseClassTable>? orderBy,
    _is.OrderByListBuilder<CourseClassTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CourseClass>(
      columnValues: columnValues(CourseClass.t.updateTable),
      where: where(CourseClass.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseClass.t),
      orderByList: orderByList?.call(CourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CourseClass]s in the list and returns the deleted rows.
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
  Future<List<CourseClass>> delete(
    _is.DatabaseSession session,
    List<CourseClass> rows, {
    _is.OrderByBuilder<CourseClassTable>? orderBy,
    _is.OrderByListBuilder<CourseClassTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CourseClass>(
      rows,
      orderBy: orderBy?.call(CourseClass.t),
      orderByList: orderByList?.call(CourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CourseClass].
  Future<CourseClass> deleteRow(
    _is.DatabaseSession session,
    CourseClass row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CourseClass>(
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
  Future<List<CourseClass>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseClassTable> where,
    _is.OrderByBuilder<CourseClassTable>? orderBy,
    _is.OrderByListBuilder<CourseClassTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CourseClass>(
      where: where(CourseClass.t),
      orderBy: orderBy?.call(CourseClass.t),
      orderByList: orderByList?.call(CourseClass.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseClassTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CourseClass>(
      where: where?.call(CourseClass.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CourseClass] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseClassTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CourseClass>(
      where: where(CourseClass.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class CourseClassAttachRowRepository {
  const CourseClassAttachRowRepository._();

  /// Creates a relation between the given [CourseClass] and [Course]
  /// by setting the [CourseClass]'s foreign key `courseId` to refer to the [Course].
  Future<void> course(
    _is.DatabaseSession session,
    CourseClass courseClass,
    _ibp0tzhj.Course course, {
    _is.Transaction? transaction,
  }) async {
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }
    if (course.id == null) {
      throw ArgumentError.notNull('course.id');
    }

    var $courseClass = courseClass.copyWith(courseId: course.id);
    await session.db.updateRow<CourseClass>(
      $courseClass,
      columns: [CourseClass.t.courseId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CourseClass] and [Lecturer]
  /// by setting the [CourseClass]'s foreign key `lecturerId` to refer to the [Lecturer].
  Future<void> lecturer(
    _is.DatabaseSession session,
    CourseClass courseClass,
    _ismqsd72.Lecturer lecturer, {
    _is.Transaction? transaction,
  }) async {
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }
    if (lecturer.id == null) {
      throw ArgumentError.notNull('lecturer.id');
    }

    var $courseClass = courseClass.copyWith(lecturerId: lecturer.id);
    await session.db.updateRow<CourseClass>(
      $courseClass,
      columns: [CourseClass.t.lecturerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CourseClass] and [Semester]
  /// by setting the [CourseClass]'s foreign key `semesterId` to refer to the [Semester].
  Future<void> semester(
    _is.DatabaseSession session,
    CourseClass courseClass,
    _i975wtvt.Semester semester, {
    _is.Transaction? transaction,
  }) async {
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }
    if (semester.id == null) {
      throw ArgumentError.notNull('semester.id');
    }

    var $courseClass = courseClass.copyWith(semesterId: semester.id);
    await session.db.updateRow<CourseClass>(
      $courseClass,
      columns: [CourseClass.t.semesterId],
      transaction: transaction,
    );
  }
}
