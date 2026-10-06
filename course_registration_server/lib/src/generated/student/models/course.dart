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
import '../../admin/models/course_category.dart' as _i74j67hc;
import '../../student/models/course_type.dart' as _is8najfw;

abstract class Course
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  Course._({
    this.id,
    required this.courseCode,
    required this.courseName,
    required this.credits,
    this.description,
    required this.courseType,
    this.categoryId,
    this.category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Course({
    _is.UuidValue? id,
    required String courseCode,
    required String courseName,
    required int credits,
    String? description,
    required _is8najfw.CourseType courseType,
    _is.UuidValue? categoryId,
    _i74j67hc.CourseCategory? category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseImpl;

  factory Course.fromJson(Map<String, dynamic> jsonSerialization) {
    return Course(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      credits: jsonSerialization['credits'] as int,
      description: jsonSerialization['description'] as String?,
      courseType: _is8najfw.CourseType.fromJson(
        (jsonSerialization['courseType'] as String),
      ),
      categoryId: jsonSerialization['categoryId'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(
              jsonSerialization['categoryId'],
            ),
      category: jsonSerialization['category'] == null
          ? null
          : _i9p8z86v.Protocol().deserialize<_i74j67hc.CourseCategory>(
              jsonSerialization['category'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = CourseTable();

  static const db = CourseRepository._();

  @override
  _is.UuidValue? id;

  String courseCode;

  String courseName;

  int credits;

  String? description;

  _is8najfw.CourseType courseType;

  _is.UuidValue? categoryId;

  _i74j67hc.CourseCategory? category;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Course]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Course copyWith({
    _is.UuidValue? id,
    String? courseCode,
    String? courseName,
    int? credits,
    String? description,
    _is8najfw.CourseType? courseType,
    _is.UuidValue? categoryId,
    _i74j67hc.CourseCategory? category,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Course',
      if (id != null) 'id': id?.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      if (description != null) 'description': description,
      'courseType': courseType.toJson(),
      if (categoryId != null) 'categoryId': categoryId?.toJson(),
      if (category != null) 'category': category?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Course',
      if (id != null) 'id': id?.toJson(),
      'courseCode': courseCode,
      'courseName': courseName,
      'credits': credits,
      if (description != null) 'description': description,
      'courseType': courseType.toJson(),
      if (categoryId != null) 'categoryId': categoryId?.toJson(),
      if (category != null) 'category': category?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CourseInclude include({_i74j67hc.CourseCategoryInclude? category}) {
    return CourseInclude._(category: category);
  }

  static CourseIncludeList includeList({
    _is.WhereExpressionBuilder<CourseTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseTable>? orderBy,
    _is.OrderByListBuilder<CourseTable>? orderByList,
    CourseInclude? include,
  }) {
    return CourseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Course.t),
      orderByList: orderByList?.call(Course.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseImpl extends Course {
  _CourseImpl({
    _is.UuidValue? id,
    required String courseCode,
    required String courseName,
    required int credits,
    String? description,
    required _is8najfw.CourseType courseType,
    _is.UuidValue? categoryId,
    _i74j67hc.CourseCategory? category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         courseCode: courseCode,
         courseName: courseName,
         credits: credits,
         description: description,
         courseType: courseType,
         categoryId: categoryId,
         category: category,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Course]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Course copyWith({
    Object? id = _Undefined,
    String? courseCode,
    String? courseName,
    int? credits,
    Object? description = _Undefined,
    _is8najfw.CourseType? courseType,
    Object? categoryId = _Undefined,
    Object? category = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Course(
      id: id is _is.UuidValue? ? id : this.id,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      credits: credits ?? this.credits,
      description: description is String? ? description : this.description,
      courseType: courseType ?? this.courseType,
      categoryId: categoryId is _is.UuidValue? ? categoryId : this.categoryId,
      category: category is _i74j67hc.CourseCategory?
          ? category
          : this.category?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CourseUpdateTable extends _is.UpdateTable<CourseTable> {
  CourseUpdateTable(super.table);

  _is.ColumnValue<String, String> courseCode(String value) => _is.ColumnValue(
    table.courseCode,
    value,
  );

  _is.ColumnValue<String, String> courseName(String value) => _is.ColumnValue(
    table.courseName,
    value,
  );

  _is.ColumnValue<int, int> credits(int value) => _is.ColumnValue(
    table.credits,
    value,
  );

  _is.ColumnValue<String, String> description(String? value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<_is8najfw.CourseType, _is8najfw.CourseType> courseType(
    _is8najfw.CourseType value,
  ) => _is.ColumnValue(
    table.courseType,
    value,
  );

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> categoryId(
    _is.UuidValue? value,
  ) => _is.ColumnValue(
    table.categoryId,
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

class CourseTable extends _is.Table<_is.UuidValue?> {
  CourseTable({super.tableRelation}) : super(tableName: 'courses') {
    updateTable = CourseUpdateTable(this);
    courseCode = _is.ColumnString(
      'courseCode',
      this,
    );
    courseName = _is.ColumnString(
      'courseName',
      this,
    );
    credits = _is.ColumnInt(
      'credits',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    courseType = _is.ColumnEnum(
      'courseType',
      this,
      _is.EnumSerialization.byName,
    );
    categoryId = _is.ColumnUuid(
      'categoryId',
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

  late final CourseUpdateTable updateTable;

  late final _is.ColumnString courseCode;

  late final _is.ColumnString courseName;

  late final _is.ColumnInt credits;

  late final _is.ColumnString description;

  late final _is.ColumnEnum<_is8najfw.CourseType> courseType;

  late final _is.ColumnUuid categoryId;

  _i74j67hc.CourseCategoryTable? _category;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  _i74j67hc.CourseCategoryTable get category {
    if (_category != null) return _category!;
    _category = _is.createRelationTable(
      relationFieldName: 'category',
      field: Course.t.categoryId,
      foreignField: _i74j67hc.CourseCategory.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i74j67hc.CourseCategoryTable(tableRelation: foreignTableRelation),
    );
    return _category!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    courseCode,
    courseName,
    credits,
    description,
    courseType,
    categoryId,
    createdAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'category') {
      return category;
    }
    return null;
  }
}

class CourseInclude extends _is.IncludeObject {
  CourseInclude._({_i74j67hc.CourseCategoryInclude? category}) {
    _category = category;
  }

  _i74j67hc.CourseCategoryInclude? _category;

  @override
  Map<String, _is.Include?> get includes => {'category': _category};

  @override
  _is.Table<_is.UuidValue?> get table => Course.t;
}

class CourseIncludeList extends _is.IncludeList {
  CourseIncludeList._({
    _is.WhereExpressionBuilder<CourseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Course.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => Course.t;
}

class CourseRepository {
  const CourseRepository._();

  final attachRow = const CourseAttachRowRepository._();

  final detachRow = const CourseDetachRowRepository._();

  /// Returns a list of [Course]s matching the given query parameters.
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
  Future<List<Course>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseTable>? orderBy,
    _is.OrderByListBuilder<CourseTable>? orderByList,
    _is.Transaction? transaction,
    CourseInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Course>(
      where: where?.call(Course.t),
      orderBy: orderBy?.call(Course.t),
      orderByList: orderByList?.call(Course.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Course] matching the given query parameters.
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
  Future<Course?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseTable>? where,
    int? offset,
    _is.OrderByBuilder<CourseTable>? orderBy,
    _is.OrderByListBuilder<CourseTable>? orderByList,
    _is.Transaction? transaction,
    CourseInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Course>(
      where: where?.call(Course.t),
      orderBy: orderBy?.call(Course.t),
      orderByList: orderByList?.call(Course.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Course] by its [id] or null if no such row exists.
  Future<Course?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    CourseInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Course>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Course]s in the list and returns the inserted rows.
  ///
  /// The returned [Course]s will have their `id` fields set.
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
  Future<List<Course>> insert(
    _is.DatabaseSession session,
    List<Course> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Course>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Course] and returns the inserted row.
  ///
  /// The returned [Course] will have its `id` field set.
  Future<Course> insertRow(
    _is.DatabaseSession session,
    Course row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Course>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Course]s in the list and returns the resulting rows.
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
  /// The returned [Course]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Course>> upsert(
    _is.DatabaseSession session,
    List<Course> rows, {
    required _is.ColumnSelections<CourseTable> conflictColumns,
    _is.ColumnSelections<CourseTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Course>(
      rows,
      conflictColumns: conflictColumns(Course.t),
      updateColumns: updateColumns?.call(Course.t),
      updateWhere: updateWhere?.call(Course.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Course] and returns the resulting row.
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
  /// The returned [Course] will have its `id` field set.
  Future<Course?> upsertRow(
    _is.DatabaseSession session,
    Course row, {
    required _is.ColumnSelections<CourseTable> conflictColumns,
    _is.ColumnSelections<CourseTable>? updateColumns,
    _is.WhereExpressionBuilder<CourseTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Course>(
      row,
      conflictColumns: conflictColumns(Course.t),
      updateColumns: updateColumns?.call(Course.t),
      updateWhere: updateWhere?.call(Course.t),
      transaction: transaction,
    );
  }

  /// Updates all [Course]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Course>> update(
    _is.DatabaseSession session,
    List<Course> rows, {
    _is.ColumnSelections<CourseTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Course>(
      rows,
      columns: columns?.call(Course.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Course]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Course> updateRow(
    _is.DatabaseSession session,
    Course row, {
    _is.ColumnSelections<CourseTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Course>(
      row,
      columns: columns?.call(Course.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Course] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Course?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<CourseUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Course>(
      id,
      columnValues: columnValues(Course.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Course]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Course>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CourseUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CourseTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CourseTable>? orderBy,
    _is.OrderByListBuilder<CourseTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Course>(
      columnValues: columnValues(Course.t.updateTable),
      where: where(Course.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Course.t),
      orderByList: orderByList?.call(Course.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Course]s in the list and returns the deleted rows.
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
  Future<List<Course>> delete(
    _is.DatabaseSession session,
    List<Course> rows, {
    _is.OrderByBuilder<CourseTable>? orderBy,
    _is.OrderByListBuilder<CourseTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Course>(
      rows,
      orderBy: orderBy?.call(Course.t),
      orderByList: orderByList?.call(Course.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Course].
  Future<Course> deleteRow(
    _is.DatabaseSession session,
    Course row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Course>(
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
  Future<List<Course>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseTable> where,
    _is.OrderByBuilder<CourseTable>? orderBy,
    _is.OrderByListBuilder<CourseTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Course>(
      where: where(Course.t),
      orderBy: orderBy?.call(Course.t),
      orderByList: orderByList?.call(Course.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CourseTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Course>(
      where: where?.call(Course.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Course] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CourseTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Course>(
      where: where(Course.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class CourseAttachRowRepository {
  const CourseAttachRowRepository._();

  /// Creates a relation between the given [Course] and [CourseCategory]
  /// by setting the [Course]'s foreign key `categoryId` to refer to the [CourseCategory].
  Future<void> category(
    _is.DatabaseSession session,
    Course course,
    _i74j67hc.CourseCategory category, {
    _is.Transaction? transaction,
  }) async {
    if (course.id == null) {
      throw ArgumentError.notNull('course.id');
    }
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }

    var $course = course.copyWith(categoryId: category.id);
    await session.db.updateRow<Course>(
      $course,
      columns: [Course.t.categoryId],
      transaction: transaction,
    );
  }
}

class CourseDetachRowRepository {
  const CourseDetachRowRepository._();

  /// Detaches the relation between this [Course] and the [CourseCategory] set in `category`
  /// by setting the [Course]'s foreign key `categoryId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> category(
    _is.DatabaseSession session,
    Course course, {
    _is.Transaction? transaction,
  }) async {
    if (course.id == null) {
      throw ArgumentError.notNull('course.id');
    }

    var $course = course.copyWith(categoryId: null);
    await session.db.updateRow<Course>(
      $course,
      columns: [Course.t.categoryId],
      transaction: transaction,
    );
  }
}
