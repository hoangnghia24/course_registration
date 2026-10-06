/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:course_registration_client/src/protocol/protocol.dart'
    as _iyxbdoua;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../../admin/models/course_category.dart' as _i74j67hc;
import '../../student/models/course_type.dart' as _is8najfw;

abstract class Course
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
    _isc.UuidValue? id,
    required String courseCode,
    required String courseName,
    required int credits,
    String? description,
    required _is8najfw.CourseType courseType,
    _isc.UuidValue? categoryId,
    _i74j67hc.CourseCategory? category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CourseImpl;

  factory Course.fromJson(Map<String, dynamic> jsonSerialization) {
    return Course(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      courseCode: jsonSerialization['courseCode'] as String,
      courseName: jsonSerialization['courseName'] as String,
      credits: jsonSerialization['credits'] as int,
      description: jsonSerialization['description'] as String?,
      courseType: _is8najfw.CourseType.fromJson(
        (jsonSerialization['courseType'] as String),
      ),
      categoryId: jsonSerialization['categoryId'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['categoryId'],
            ),
      category: jsonSerialization['category'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i74j67hc.CourseCategory>(
              jsonSerialization['category'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  String courseCode;

  String courseName;

  int credits;

  String? description;

  _is8najfw.CourseType courseType;

  _isc.UuidValue? categoryId;

  _i74j67hc.CourseCategory? category;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Course]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Course copyWith({
    _isc.UuidValue? id,
    String? courseCode,
    String? courseName,
    int? credits,
    String? description,
    _is8najfw.CourseType? courseType,
    _isc.UuidValue? categoryId,
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseImpl extends Course {
  _CourseImpl({
    _isc.UuidValue? id,
    required String courseCode,
    required String courseName,
    required int credits,
    String? description,
    required _is8najfw.CourseType courseType,
    _isc.UuidValue? categoryId,
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
  @_isc.useResult
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
      id: id is _isc.UuidValue? ? id : this.id,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      credits: credits ?? this.credits,
      description: description is String? ? description : this.description,
      courseType: courseType ?? this.courseType,
      categoryId: categoryId is _isc.UuidValue? ? categoryId : this.categoryId,
      category: category is _i74j67hc.CourseCategory?
          ? category
          : this.category?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
