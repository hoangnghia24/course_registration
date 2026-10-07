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
import '../../lecturer.dart' as _ismqsd72;
import '../../lecturer/models/class_adjustment_status.dart' as _i45abhz5;
import '../../registration/models/course_class.dart' as _igjwbat6;

abstract class ClassAdjustmentRequest
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  ClassAdjustmentRequest._({
    this.id,
    required this.courseClassId,
    this.courseClass,
    required this.lecturerId,
    this.lecturer,
    required this.oldCapacity,
    required this.newCapacity,
    required this.oldSchedulesJson,
    required this.newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    this.reviewedAt,
    this.reviewedById,
    this.reviewedBy,
    this.rejectReason,
  }) : status = status ?? _i45abhz5.ClassAdjustmentStatus.pending,
       createdAt = createdAt ?? DateTime.now();

  factory ClassAdjustmentRequest({
    _is.UuidValue? id,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required int oldCapacity,
    required int newCapacity,
    required String oldSchedulesJson,
    required String newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    DateTime? reviewedAt,
    _is.UuidValue? reviewedById,
    _ikmszj0x.Admin? reviewedBy,
    String? rejectReason,
  }) = _ClassAdjustmentRequestImpl;

  factory ClassAdjustmentRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ClassAdjustmentRequest(
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
      lecturerId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['lecturerId'],
      ),
      lecturer: jsonSerialization['lecturer'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ismqsd72.Lecturer>(
              jsonSerialization['lecturer'],
            ),
      oldCapacity: jsonSerialization['oldCapacity'] as int,
      newCapacity: jsonSerialization['newCapacity'] as int,
      oldSchedulesJson: jsonSerialization['oldSchedulesJson'] as String,
      newSchedulesJson: jsonSerialization['newSchedulesJson'] as String,
      status: jsonSerialization['status'] == null
          ? null
          : _i45abhz5.ClassAdjustmentStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      reviewedAt: jsonSerialization['reviewedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['reviewedAt']),
      reviewedById: jsonSerialization['reviewedById'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['reviewedById'],
            ),
      reviewedBy: jsonSerialization['reviewedBy'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['reviewedBy'],
            ),
      rejectReason: jsonSerialization['rejectReason'] as String?,
    );
  }

  static final t = ClassAdjustmentRequestTable();

  static const db = ClassAdjustmentRequestRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue courseClassId;

  _igjwbat6.CourseClass? courseClass;

  _is.UuidValue lecturerId;

  _ismqsd72.Lecturer? lecturer;

  int oldCapacity;

  int newCapacity;

  String oldSchedulesJson;

  String newSchedulesJson;

  _i45abhz5.ClassAdjustmentStatus status;

  DateTime createdAt;

  DateTime? reviewedAt;

  _is.UuidValue? reviewedById;

  _ikmszj0x.Admin? reviewedBy;

  String? rejectReason;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [ClassAdjustmentRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClassAdjustmentRequest copyWith({
    _is.UuidValue? id,
    _is.UuidValue? courseClassId,
    _igjwbat6.CourseClass? courseClass,
    _is.UuidValue? lecturerId,
    _ismqsd72.Lecturer? lecturer,
    int? oldCapacity,
    int? newCapacity,
    String? oldSchedulesJson,
    String? newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    DateTime? reviewedAt,
    _is.UuidValue? reviewedById,
    _ikmszj0x.Admin? reviewedBy,
    String? rejectReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassAdjustmentRequest',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJson(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJson(),
      'oldCapacity': oldCapacity,
      'newCapacity': newCapacity,
      'oldSchedulesJson': oldSchedulesJson,
      'newSchedulesJson': newSchedulesJson,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
      if (reviewedById != null) 'reviewedById': reviewedById?.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy?.toJson(),
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassAdjustmentRequest',
      if (id != null) 'id': id?.toJson(),
      'courseClassId': courseClassId.toJson(),
      if (courseClass != null) 'courseClass': courseClass?.toJsonForProtocol(),
      'lecturerId': lecturerId.toJson(),
      if (lecturer != null) 'lecturer': lecturer?.toJsonForProtocol(),
      'oldCapacity': oldCapacity,
      'newCapacity': newCapacity,
      'oldSchedulesJson': oldSchedulesJson,
      'newSchedulesJson': newSchedulesJson,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      if (reviewedAt != null) 'reviewedAt': reviewedAt?.toJson(),
      if (reviewedById != null) 'reviewedById': reviewedById?.toJson(),
      if (reviewedBy != null) 'reviewedBy': reviewedBy?.toJsonForProtocol(),
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
  }

  static ClassAdjustmentRequestInclude include({
    _igjwbat6.CourseClassInclude? courseClass,
    _ismqsd72.LecturerInclude? lecturer,
    _ikmszj0x.AdminInclude? reviewedBy,
  }) {
    return ClassAdjustmentRequestInclude._(
      courseClass: courseClass,
      lecturer: lecturer,
      reviewedBy: reviewedBy,
    );
  }

  static ClassAdjustmentRequestIncludeList includeList({
    _is.WhereExpressionBuilder<ClassAdjustmentRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassAdjustmentRequestTable>? orderBy,
    _is.OrderByListBuilder<ClassAdjustmentRequestTable>? orderByList,
    ClassAdjustmentRequestInclude? include,
  }) {
    return ClassAdjustmentRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ClassAdjustmentRequest.t),
      orderByList: orderByList?.call(ClassAdjustmentRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ClassAdjustmentRequestImpl extends ClassAdjustmentRequest {
  _ClassAdjustmentRequestImpl({
    _is.UuidValue? id,
    required _is.UuidValue courseClassId,
    _igjwbat6.CourseClass? courseClass,
    required _is.UuidValue lecturerId,
    _ismqsd72.Lecturer? lecturer,
    required int oldCapacity,
    required int newCapacity,
    required String oldSchedulesJson,
    required String newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    DateTime? reviewedAt,
    _is.UuidValue? reviewedById,
    _ikmszj0x.Admin? reviewedBy,
    String? rejectReason,
  }) : super._(
         id: id,
         courseClassId: courseClassId,
         courseClass: courseClass,
         lecturerId: lecturerId,
         lecturer: lecturer,
         oldCapacity: oldCapacity,
         newCapacity: newCapacity,
         oldSchedulesJson: oldSchedulesJson,
         newSchedulesJson: newSchedulesJson,
         status: status,
         createdAt: createdAt,
         reviewedAt: reviewedAt,
         reviewedById: reviewedById,
         reviewedBy: reviewedBy,
         rejectReason: rejectReason,
       );

  /// Returns a shallow copy of this [ClassAdjustmentRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClassAdjustmentRequest copyWith({
    Object? id = _Undefined,
    _is.UuidValue? courseClassId,
    Object? courseClass = _Undefined,
    _is.UuidValue? lecturerId,
    Object? lecturer = _Undefined,
    int? oldCapacity,
    int? newCapacity,
    String? oldSchedulesJson,
    String? newSchedulesJson,
    _i45abhz5.ClassAdjustmentStatus? status,
    DateTime? createdAt,
    Object? reviewedAt = _Undefined,
    Object? reviewedById = _Undefined,
    Object? reviewedBy = _Undefined,
    Object? rejectReason = _Undefined,
  }) {
    return ClassAdjustmentRequest(
      id: id is _is.UuidValue? ? id : this.id,
      courseClassId: courseClassId ?? this.courseClassId,
      courseClass: courseClass is _igjwbat6.CourseClass?
          ? courseClass
          : this.courseClass?.copyWith(),
      lecturerId: lecturerId ?? this.lecturerId,
      lecturer: lecturer is _ismqsd72.Lecturer?
          ? lecturer
          : this.lecturer?.copyWith(),
      oldCapacity: oldCapacity ?? this.oldCapacity,
      newCapacity: newCapacity ?? this.newCapacity,
      oldSchedulesJson: oldSchedulesJson ?? this.oldSchedulesJson,
      newSchedulesJson: newSchedulesJson ?? this.newSchedulesJson,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      reviewedAt: reviewedAt is DateTime? ? reviewedAt : this.reviewedAt,
      reviewedById: reviewedById is _is.UuidValue?
          ? reviewedById
          : this.reviewedById,
      reviewedBy: reviewedBy is _ikmszj0x.Admin?
          ? reviewedBy
          : this.reviewedBy?.copyWith(),
      rejectReason: rejectReason is String? ? rejectReason : this.rejectReason,
    );
  }
}

class ClassAdjustmentRequestUpdateTable
    extends _is.UpdateTable<ClassAdjustmentRequestTable> {
  ClassAdjustmentRequestUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> courseClassId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.courseClassId,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> lecturerId(
    _is.UuidValue value,
  ) => _is.ColumnValue(
    table.lecturerId,
    value,
  );

  _is.ColumnValue<int, int> oldCapacity(int value) => _is.ColumnValue(
    table.oldCapacity,
    value,
  );

  _is.ColumnValue<int, int> newCapacity(int value) => _is.ColumnValue(
    table.newCapacity,
    value,
  );

  _is.ColumnValue<String, String> oldSchedulesJson(String value) =>
      _is.ColumnValue(
        table.oldSchedulesJson,
        value,
      );

  _is.ColumnValue<String, String> newSchedulesJson(String value) =>
      _is.ColumnValue(
        table.newSchedulesJson,
        value,
      );

  _is.ColumnValue<
    _i45abhz5.ClassAdjustmentStatus,
    _i45abhz5.ClassAdjustmentStatus
  >
  status(_i45abhz5.ClassAdjustmentStatus value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> reviewedAt(DateTime? value) =>
      _is.ColumnValue(
        table.reviewedAt,
        value,
      );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> reviewedById(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.reviewedById,
    value,
  );

  _is.ColumnValue<String, String> rejectReason(String? value) =>
      _is.ColumnValue(
        table.rejectReason,
        value,
      );
}

class ClassAdjustmentRequestTable extends _is.Table<_is.UuidValue?> {
  ClassAdjustmentRequestTable({super.tableRelation})
    : super(tableName: 'class_adjustment_requests') {
    updateTable = ClassAdjustmentRequestUpdateTable(this);
    courseClassId = _is.ColumnUuid(
      'courseClassId',
      this,
    );
    lecturerId = _is.ColumnUuid(
      'lecturerId',
      this,
    );
    oldCapacity = _is.ColumnInt(
      'oldCapacity',
      this,
    );
    newCapacity = _is.ColumnInt(
      'newCapacity',
      this,
    );
    oldSchedulesJson = _is.ColumnString(
      'oldSchedulesJson',
      this,
    );
    newSchedulesJson = _is.ColumnString(
      'newSchedulesJson',
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
    reviewedAt = _is.ColumnDateTime(
      'reviewedAt',
      this,
    );
    reviewedById = _is.ColumnUuid(
      'reviewedById',
      this,
    );
    rejectReason = _is.ColumnString(
      'rejectReason',
      this,
    );
  }

  late final ClassAdjustmentRequestUpdateTable updateTable;

  late final _is.ColumnUuid courseClassId;

  _igjwbat6.CourseClassTable? _courseClass;

  late final _is.ColumnUuid lecturerId;

  _ismqsd72.LecturerTable? _lecturer;

  late final _is.ColumnInt oldCapacity;

  late final _is.ColumnInt newCapacity;

  late final _is.ColumnString oldSchedulesJson;

  late final _is.ColumnString newSchedulesJson;

  late final _is.ColumnEnum<_i45abhz5.ClassAdjustmentStatus> status;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime reviewedAt;

  late final _is.ColumnUuid reviewedById;

  _ikmszj0x.AdminTable? _reviewedBy;

  late final _is.ColumnString rejectReason;

  _igjwbat6.CourseClassTable get courseClass {
    if (_courseClass != null) return _courseClass!;
    _courseClass = _is.createRelationTable(
      relationFieldName: 'courseClass',
      field: ClassAdjustmentRequest.t.courseClassId,
      foreignField: _igjwbat6.CourseClass.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _igjwbat6.CourseClassTable(tableRelation: foreignTableRelation),
    );
    return _courseClass!;
  }

  _ismqsd72.LecturerTable get lecturer {
    if (_lecturer != null) return _lecturer!;
    _lecturer = _is.createRelationTable(
      relationFieldName: 'lecturer',
      field: ClassAdjustmentRequest.t.lecturerId,
      foreignField: _ismqsd72.Lecturer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ismqsd72.LecturerTable(tableRelation: foreignTableRelation),
    );
    return _lecturer!;
  }

  _ikmszj0x.AdminTable get reviewedBy {
    if (_reviewedBy != null) return _reviewedBy!;
    _reviewedBy = _is.createRelationTable(
      relationFieldName: 'reviewedBy',
      field: ClassAdjustmentRequest.t.reviewedById,
      foreignField: _ikmszj0x.Admin.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ikmszj0x.AdminTable(tableRelation: foreignTableRelation),
    );
    return _reviewedBy!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    courseClassId,
    lecturerId,
    oldCapacity,
    newCapacity,
    oldSchedulesJson,
    newSchedulesJson,
    status,
    createdAt,
    reviewedAt,
    reviewedById,
    rejectReason,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'courseClass') {
      return courseClass;
    }
    if (relationField == 'lecturer') {
      return lecturer;
    }
    if (relationField == 'reviewedBy') {
      return reviewedBy;
    }
    return null;
  }
}

class ClassAdjustmentRequestInclude extends _is.IncludeObject {
  ClassAdjustmentRequestInclude._({
    _igjwbat6.CourseClassInclude? courseClass,
    _ismqsd72.LecturerInclude? lecturer,
    _ikmszj0x.AdminInclude? reviewedBy,
  }) {
    _courseClass = courseClass;
    _lecturer = lecturer;
    _reviewedBy = reviewedBy;
  }

  _igjwbat6.CourseClassInclude? _courseClass;

  _ismqsd72.LecturerInclude? _lecturer;

  _ikmszj0x.AdminInclude? _reviewedBy;

  @override
  Map<String, _is.Include?> get includes => {
    'courseClass': _courseClass,
    'lecturer': _lecturer,
    'reviewedBy': _reviewedBy,
  };

  @override
  _is.Table<_is.UuidValue?> get table => ClassAdjustmentRequest.t;
}

class ClassAdjustmentRequestIncludeList extends _is.IncludeList {
  ClassAdjustmentRequestIncludeList._({
    _is.WhereExpressionBuilder<ClassAdjustmentRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ClassAdjustmentRequest.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => ClassAdjustmentRequest.t;
}

class ClassAdjustmentRequestRepository {
  const ClassAdjustmentRequestRepository._();

  final attachRow = const ClassAdjustmentRequestAttachRowRepository._();

  final detachRow = const ClassAdjustmentRequestDetachRowRepository._();

  /// Returns a list of [ClassAdjustmentRequest]s matching the given query parameters.
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
  Future<List<ClassAdjustmentRequest>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassAdjustmentRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassAdjustmentRequestTable>? orderBy,
    _is.OrderByListBuilder<ClassAdjustmentRequestTable>? orderByList,
    _is.Transaction? transaction,
    ClassAdjustmentRequestInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ClassAdjustmentRequest>(
      where: where?.call(ClassAdjustmentRequest.t),
      orderBy: orderBy?.call(ClassAdjustmentRequest.t),
      orderByList: orderByList?.call(ClassAdjustmentRequest.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ClassAdjustmentRequest] matching the given query parameters.
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
  Future<ClassAdjustmentRequest?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassAdjustmentRequestTable>? where,
    int? offset,
    _is.OrderByBuilder<ClassAdjustmentRequestTable>? orderBy,
    _is.OrderByListBuilder<ClassAdjustmentRequestTable>? orderByList,
    _is.Transaction? transaction,
    ClassAdjustmentRequestInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ClassAdjustmentRequest>(
      where: where?.call(ClassAdjustmentRequest.t),
      orderBy: orderBy?.call(ClassAdjustmentRequest.t),
      orderByList: orderByList?.call(ClassAdjustmentRequest.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ClassAdjustmentRequest] by its [id] or null if no such row exists.
  Future<ClassAdjustmentRequest?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    ClassAdjustmentRequestInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ClassAdjustmentRequest>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ClassAdjustmentRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [ClassAdjustmentRequest]s will have their `id` fields set.
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
  Future<List<ClassAdjustmentRequest>> insert(
    _is.DatabaseSession session,
    List<ClassAdjustmentRequest> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ClassAdjustmentRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ClassAdjustmentRequest] and returns the inserted row.
  ///
  /// The returned [ClassAdjustmentRequest] will have its `id` field set.
  Future<ClassAdjustmentRequest> insertRow(
    _is.DatabaseSession session,
    ClassAdjustmentRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ClassAdjustmentRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ClassAdjustmentRequest]s in the list and returns the resulting rows.
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
  /// The returned [ClassAdjustmentRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassAdjustmentRequest>> upsert(
    _is.DatabaseSession session,
    List<ClassAdjustmentRequest> rows, {
    required _is.ColumnSelections<ClassAdjustmentRequestTable> conflictColumns,
    _is.ColumnSelections<ClassAdjustmentRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<ClassAdjustmentRequestTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ClassAdjustmentRequest>(
      rows,
      conflictColumns: conflictColumns(ClassAdjustmentRequest.t),
      updateColumns: updateColumns?.call(ClassAdjustmentRequest.t),
      updateWhere: updateWhere?.call(ClassAdjustmentRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ClassAdjustmentRequest] and returns the resulting row.
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
  /// The returned [ClassAdjustmentRequest] will have its `id` field set.
  Future<ClassAdjustmentRequest?> upsertRow(
    _is.DatabaseSession session,
    ClassAdjustmentRequest row, {
    required _is.ColumnSelections<ClassAdjustmentRequestTable> conflictColumns,
    _is.ColumnSelections<ClassAdjustmentRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<ClassAdjustmentRequestTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ClassAdjustmentRequest>(
      row,
      conflictColumns: conflictColumns(ClassAdjustmentRequest.t),
      updateColumns: updateColumns?.call(ClassAdjustmentRequest.t),
      updateWhere: updateWhere?.call(ClassAdjustmentRequest.t),
      transaction: transaction,
    );
  }

  /// Updates all [ClassAdjustmentRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassAdjustmentRequest>> update(
    _is.DatabaseSession session,
    List<ClassAdjustmentRequest> rows, {
    _is.ColumnSelections<ClassAdjustmentRequestTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ClassAdjustmentRequest>(
      rows,
      columns: columns?.call(ClassAdjustmentRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ClassAdjustmentRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ClassAdjustmentRequest> updateRow(
    _is.DatabaseSession session,
    ClassAdjustmentRequest row, {
    _is.ColumnSelections<ClassAdjustmentRequestTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ClassAdjustmentRequest>(
      row,
      columns: columns?.call(ClassAdjustmentRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ClassAdjustmentRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ClassAdjustmentRequest?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<ClassAdjustmentRequestUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ClassAdjustmentRequest>(
      id,
      columnValues: columnValues(ClassAdjustmentRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ClassAdjustmentRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ClassAdjustmentRequest>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ClassAdjustmentRequestUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<ClassAdjustmentRequestTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ClassAdjustmentRequestTable>? orderBy,
    _is.OrderByListBuilder<ClassAdjustmentRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ClassAdjustmentRequest>(
      columnValues: columnValues(ClassAdjustmentRequest.t.updateTable),
      where: where(ClassAdjustmentRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ClassAdjustmentRequest.t),
      orderByList: orderByList?.call(ClassAdjustmentRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ClassAdjustmentRequest]s in the list and returns the deleted rows.
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
  Future<List<ClassAdjustmentRequest>> delete(
    _is.DatabaseSession session,
    List<ClassAdjustmentRequest> rows, {
    _is.OrderByBuilder<ClassAdjustmentRequestTable>? orderBy,
    _is.OrderByListBuilder<ClassAdjustmentRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ClassAdjustmentRequest>(
      rows,
      orderBy: orderBy?.call(ClassAdjustmentRequest.t),
      orderByList: orderByList?.call(ClassAdjustmentRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ClassAdjustmentRequest].
  Future<ClassAdjustmentRequest> deleteRow(
    _is.DatabaseSession session,
    ClassAdjustmentRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ClassAdjustmentRequest>(
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
  Future<List<ClassAdjustmentRequest>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ClassAdjustmentRequestTable> where,
    _is.OrderByBuilder<ClassAdjustmentRequestTable>? orderBy,
    _is.OrderByListBuilder<ClassAdjustmentRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ClassAdjustmentRequest>(
      where: where(ClassAdjustmentRequest.t),
      orderBy: orderBy?.call(ClassAdjustmentRequest.t),
      orderByList: orderByList?.call(ClassAdjustmentRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ClassAdjustmentRequestTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ClassAdjustmentRequest>(
      where: where?.call(ClassAdjustmentRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ClassAdjustmentRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ClassAdjustmentRequestTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ClassAdjustmentRequest>(
      where: where(ClassAdjustmentRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class ClassAdjustmentRequestAttachRowRepository {
  const ClassAdjustmentRequestAttachRowRepository._();

  /// Creates a relation between the given [ClassAdjustmentRequest] and [CourseClass]
  /// by setting the [ClassAdjustmentRequest]'s foreign key `courseClassId` to refer to the [CourseClass].
  Future<void> courseClass(
    _is.DatabaseSession session,
    ClassAdjustmentRequest classAdjustmentRequest,
    _igjwbat6.CourseClass courseClass, {
    _is.Transaction? transaction,
  }) async {
    if (classAdjustmentRequest.id == null) {
      throw ArgumentError.notNull('classAdjustmentRequest.id');
    }
    if (courseClass.id == null) {
      throw ArgumentError.notNull('courseClass.id');
    }

    var $classAdjustmentRequest = classAdjustmentRequest.copyWith(
      courseClassId: courseClass.id,
    );
    await session.db.updateRow<ClassAdjustmentRequest>(
      $classAdjustmentRequest,
      columns: [ClassAdjustmentRequest.t.courseClassId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ClassAdjustmentRequest] and [Lecturer]
  /// by setting the [ClassAdjustmentRequest]'s foreign key `lecturerId` to refer to the [Lecturer].
  Future<void> lecturer(
    _is.DatabaseSession session,
    ClassAdjustmentRequest classAdjustmentRequest,
    _ismqsd72.Lecturer lecturer, {
    _is.Transaction? transaction,
  }) async {
    if (classAdjustmentRequest.id == null) {
      throw ArgumentError.notNull('classAdjustmentRequest.id');
    }
    if (lecturer.id == null) {
      throw ArgumentError.notNull('lecturer.id');
    }

    var $classAdjustmentRequest = classAdjustmentRequest.copyWith(
      lecturerId: lecturer.id,
    );
    await session.db.updateRow<ClassAdjustmentRequest>(
      $classAdjustmentRequest,
      columns: [ClassAdjustmentRequest.t.lecturerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ClassAdjustmentRequest] and [Admin]
  /// by setting the [ClassAdjustmentRequest]'s foreign key `reviewedById` to refer to the [Admin].
  Future<void> reviewedBy(
    _is.DatabaseSession session,
    ClassAdjustmentRequest classAdjustmentRequest,
    _ikmszj0x.Admin reviewedBy, {
    _is.Transaction? transaction,
  }) async {
    if (classAdjustmentRequest.id == null) {
      throw ArgumentError.notNull('classAdjustmentRequest.id');
    }
    if (reviewedBy.id == null) {
      throw ArgumentError.notNull('reviewedBy.id');
    }

    var $classAdjustmentRequest = classAdjustmentRequest.copyWith(
      reviewedById: reviewedBy.id,
    );
    await session.db.updateRow<ClassAdjustmentRequest>(
      $classAdjustmentRequest,
      columns: [ClassAdjustmentRequest.t.reviewedById],
      transaction: transaction,
    );
  }
}

class ClassAdjustmentRequestDetachRowRepository {
  const ClassAdjustmentRequestDetachRowRepository._();

  /// Detaches the relation between this [ClassAdjustmentRequest] and the [Admin] set in `reviewedBy`
  /// by setting the [ClassAdjustmentRequest]'s foreign key `reviewedById` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> reviewedBy(
    _is.DatabaseSession session,
    ClassAdjustmentRequest classAdjustmentRequest, {
    _is.Transaction? transaction,
  }) async {
    if (classAdjustmentRequest.id == null) {
      throw ArgumentError.notNull('classAdjustmentRequest.id');
    }

    var $classAdjustmentRequest = classAdjustmentRequest.copyWith(
      reviewedById: null,
    );
    await session.db.updateRow<ClassAdjustmentRequest>(
      $classAdjustmentRequest,
      columns: [ClassAdjustmentRequest.t.reviewedById],
      transaction: transaction,
    );
  }
}
