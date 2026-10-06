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
import '../../registration/models/registration_status.dart' as _iqegjhnz;
import '../../student.dart' as _io7vu6m1;

abstract class Registration
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Registration._({
    this.id,
    required this.studentId,
    this.student,
    required this.courseClassId,
    this.courseClass,
    DateTime? registeredAt,
    required this.status,
  }) : registeredAt = registeredAt ?? DateTime.now();

  factory Registration({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? registeredAt,
    required _iqegjhnz.RegistrationStatus status,
  }) = _RegistrationImpl;

  factory Registration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Registration(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      studentId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['studentId'],
      ),
      student: jsonSerialization['student'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_io7vu6m1.Student>(
              jsonSerialization['student'],
            ),
      courseClassId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['courseClassId'],
      ),
      courseClass: jsonSerialization['courseClass'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_igjwbat6.CourseClass>(
              jsonSerialization['courseClass'],
            ),
      registeredAt: jsonSerialization['registeredAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['registeredAt'],
            ),
      status: _iqegjhnz.RegistrationStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
    );
  }

  static final t = RegistrationTable();

  static const db = RegistrationRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue studentId;

  _io7vu6m1.Student? student;

  _is.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  DateTime registeredAt;

  _iqegjhnz.RegistrationStatus status;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Registration]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Registration copyWith({
    _is.UuidValue? id,
    _is.UuidValue? studentId,
    _io7vu6m1.Student? student,
    _is.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? registeredAt,
    _iqegjhnz.RegistrationStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Registration',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'registeredAt': registeredAt.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Registration',
      if (id != null) 'id': id?.toJson(),
      'studentId': studentId.toJson(),
      if (student != null) 'student': student?.toJsonForProtocol(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'registeredAt': registeredAt.toJson(),
      'status': status.toJson(),
    };
  }

  static RegistrationInclude include({
    _io7vu6m1.StudentInclude? student,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    return RegistrationInclude._(
      student: student,
      courseClass: courseClass,
    );
  }

  static RegistrationIncludeList includeList({
    _is.WhereExpressionBuilder<RegistrationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationTable>? orderBy,
    _is.OrderByListBuilder<RegistrationTable>? orderByList,
    RegistrationInclude? include,
  }) {
    return RegistrationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationImpl extends Registration {
  _RegistrationImpl({
    _is.UuidValue? id,
    required _is.UuidValue studentId,
    _io7vu6m1.Student? student,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    DateTime? registeredAt,
    required _iqegjhnz.RegistrationStatus status,
  }) : super._(
         id: id,
         studentId: studentId,
         student: student,
         courseClassId: courseClassId,
         courseClass: courseClass,
         registeredAt: registeredAt,
         status: status,
       );

  /// Returns a shallow copy of this [Registration]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Registration copyWith({
    Object? id = _Undefined,
    _is.UuidValue? studentId,
    Object? student = _Undefined,
    _is.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    DateTime? registeredAt,
    _iqegjhnz.RegistrationStatus? status,
  }) {
    return Registration(
      id: id is _is.UuidValue? ? id : this.id,
      studentId: studentId ?? this.studentId,
      student: student is _io7vu6m1.Student?
          ? student
          : this.student?.copyWith(),
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      registeredAt: registeredAt ?? this.registeredAt,
      status: status ?? this.status,
    );
  }
}

class RegistrationUpdateTable extends _is.UpdateTable<RegistrationTable> {
  RegistrationUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> studentId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.studentId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseClassId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.courseClassId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> registeredAt(DateTime value) =>
      _is.ColumnValue(
        table.registeredAt,
        value,
      );

  _is.ColumnValue<_iqegjhnz.RegistrationStatus, _iqegjhnz.RegistrationStatus>
  status(_iqegjhnz.RegistrationStatus value) => _is.ColumnValue(
    table.status,
    value,
  );
}

class RegistrationTable extends _is.Table<_is.UuidValue?> {
  RegistrationTable({super.tableRelation}) : super(tableName: 'registrations') {
    updateTable = RegistrationUpdateTable(this);
    studentId = _is.ColumnUuid(
      'studentId',
      this,
    );
    courseClassId = _is.ColumnUuid(
      'courseClassId',
      this,
    );
    registeredAt = _is.ColumnDateTime(
      'registeredAt',
      this,
      hasDefault: true,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
  }

  late final RegistrationUpdateTable updateTable;

  late final _is.ColumnUuid studentId;

  _io7vu6m1.StudentTable? _student;

  late final _is.ColumnUuid courseClassId;

  _igjwbat6.CourseClassTable? _courseClass;

  late final _is.ColumnDateTime registeredAt;

  late final _is.ColumnEnum<_iqegjhnz.RegistrationStatus> status;

  _io7vu6m1.StudentTable get student {
    if (_student != null) return _student!;
    _student = _is.createRelationTable(
      relationFieldName: 'student',
      field: Registration.t.studentId,
      foreignField: _io7vu6m1.Student.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _io7vu6m1.StudentTable(tableRelation: foreignTableRelation),
    );
    return _student!;
  }

  _igjwbat6.CourseClassTable get courseClass {
    if (_courseClass != null) return _courseClass!;
    _courseClass = _is.createRelationTable(
      relationFieldName: 'courseClass',
      field: Registration.t.courseClassId,
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
    studentId,
    courseClassId,
    registeredAt,
    status,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'student') {
      return student;
    }
    if (relationField == 'courseClass') {
      return courseClass;
    }
    return null;
  }
}

class RegistrationInclude extends _is.IncludeObject {
  RegistrationInclude._({
    _io7vu6m1.StudentInclude? student,
    _igjwbat6.CourseClassInclude? courseClass,
  }) {
    _student = student;
    _courseClass = courseClass;
  }

  _io7vu6m1.StudentInclude? _student;

  _igjwbat6.CourseClassInclude? _courseClass;

  @override
  Map<String, _is.Include?> get includes => {
    'student': _student,
    'courseClass': _courseClass,
  };

  @override
  _is.Table<_is.UuidValue?> get table => Registration.t;
}

class RegistrationIncludeList extends _is.IncludeList {
  RegistrationIncludeList._({
    _is.WhereExpressionBuilder<RegistrationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Registration.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Registration.t;
}

class RegistrationRepository {
  const RegistrationRepository._();

  final attachRow = const RegistrationAttachRowRepository._();

  /// Returns a list of [Registration]s matching the given query parameters.
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
  Future<List<Registration>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationTable>? orderBy,
    _is.OrderByListBuilder<RegistrationTable>? orderByList,
    _is.Transaction? transaction,
    RegistrationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Registration>(
      where: where?.call(Registration.t),
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Registration] matching the given query parameters.
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
  Future<Registration?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationTable>? where,
    int? offset,
    _is.OrderByBuilder<RegistrationTable>? orderBy,
    _is.OrderByListBuilder<RegistrationTable>? orderByList,
    _is.Transaction? transaction,
    RegistrationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Registration>(
      where: where?.call(Registration.t),
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Registration] by its [id] or null if no such row exists.
  Future<Registration?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    RegistrationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Registration>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Registration]s in the list and returns the inserted rows.
  ///
  /// The returned [Registration]s will have their `id` fields set.
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
  Future<List<Registration>> insert(
    _is.DatabaseSession session,
    List<Registration> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Registration>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Registration] and returns the inserted row.
  ///
  /// The returned [Registration] will have its `id` field set.
  Future<Registration> insertRow(
    _is.DatabaseSession session,
    Registration row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Registration>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Registration]s in the list and returns the resulting rows.
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
  /// The returned [Registration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Registration>> upsert(
    _is.DatabaseSession session,
    List<Registration> rows, {
    required _is.ColumnSelections<RegistrationTable> conflictColumns,
    _is.ColumnSelections<RegistrationTable>? updateColumns,
    _is.WhereExpressionBuilder<RegistrationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Registration>(
      rows,
      conflictColumns: conflictColumns(Registration.t),
      updateColumns: updateColumns?.call(Registration.t),
      updateWhere: updateWhere?.call(Registration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Registration] and returns the resulting row.
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
  /// The returned [Registration] will have its `id` field set.
  Future<Registration?> upsertRow(
    _is.DatabaseSession session,
    Registration row, {
    required _is.ColumnSelections<RegistrationTable> conflictColumns,
    _is.ColumnSelections<RegistrationTable>? updateColumns,
    _is.WhereExpressionBuilder<RegistrationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Registration>(
      row,
      conflictColumns: conflictColumns(Registration.t),
      updateColumns: updateColumns?.call(Registration.t),
      updateWhere: updateWhere?.call(Registration.t),
      transaction: transaction,
    );
  }

  /// Updates all [Registration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Registration>> update(
    _is.DatabaseSession session,
    List<Registration> rows, {
    _is.ColumnSelections<RegistrationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Registration>(
      rows,
      columns: columns?.call(Registration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Registration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Registration> updateRow(
    _is.DatabaseSession session,
    Registration row, {
    _is.ColumnSelections<RegistrationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Registration>(
      row,
      columns: columns?.call(Registration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Registration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Registration?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<RegistrationUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Registration>(
      id,
      columnValues: columnValues(Registration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Registration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Registration>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RegistrationUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RegistrationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RegistrationTable>? orderBy,
    _is.OrderByListBuilder<RegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Registration>(
      columnValues: columnValues(Registration.t.updateTable),
      where: where(Registration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Registration]s in the list and returns the deleted rows.
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
  Future<List<Registration>> delete(
    _is.DatabaseSession session,
    List<Registration> rows, {
    _is.OrderByBuilder<RegistrationTable>? orderBy,
    _is.OrderByListBuilder<RegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Registration>(
      rows,
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Registration].
  Future<Registration> deleteRow(
    _is.DatabaseSession session,
    Registration row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Registration>(
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
  Future<List<Registration>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RegistrationTable> where,
    _is.OrderByBuilder<RegistrationTable>? orderBy,
    _is.OrderByListBuilder<RegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Registration>(
      where: where(Registration.t),
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RegistrationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Registration>(
      where: where?.call(Registration.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Registration] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RegistrationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Registration>(
      where: where(Registration.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class RegistrationAttachRowRepository {
  const RegistrationAttachRowRepository._();

  /// Creates a relation between the given [Registration] and [Student]
  /// by setting the [Registration]'s foreign key `studentId` to refer to the [Student].
  Future<void> student(
    _is.DatabaseSession session,
    Registration registration,
    _io7vu6m1.Student student, {
    _is.Transaction? transaction,
  }) async {
    if (registration.id == null) {
      throw ArgumentError.notNull('registration.id');
    }
    if (student.id == null) {
      throw ArgumentError.notNull('student.id');
    }

    var $registration = registration.copyWith(studentId: student.id);
    await session.db.updateRow<Registration>(
      $registration,
      columns: [Registration.t.studentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Registration] and [CourseClass]
  /// by setting the [Registration]'s foreign key `courseClassId` to refer to the [CourseClass].
  Future<void> courseClass(
    _is.DatabaseSession session,
    Registration registration,
    _igjwbat6.CourseClass courseClass, {
    _is.Transaction? transaction,
  }) async {
    if (registration.id == null) {
      throw ArgumentError.notNull('registration.id');
    }
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }

    var $registration = registration.copyWith(courseClassId: courseClass.id);
    await session.db.updateRow<Registration>(
      $registration,
      columns: [Registration.t.courseClassId],
      transaction: transaction,
    );
  }
}
