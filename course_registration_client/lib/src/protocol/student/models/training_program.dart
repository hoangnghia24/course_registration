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
import '../../student/models/major.dart' as _imik5j2n;
import '../../student/models/training_program_status.dart' as _iwtxfpeu;

abstract class TrainingProgram
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  TrainingProgram._({
    this.id,
    required this.majorId,
    this.major,
    required this.code,
    required this.name,
    required this.academicYear,
    required this.totalCredits,
    required this.semesterCount,
    _iwtxfpeu.TrainingProgramStatus? status,
    this.description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : status = status ?? _iwtxfpeu.TrainingProgramStatus.draft,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory TrainingProgram({
    _isc.UuidValue? id,
    required _isc.UuidValue majorId,
    _imik5j2n.Major? major,
    required String code,
    required String name,
    required int academicYear,
    required int totalCredits,
    required int semesterCount,
    _iwtxfpeu.TrainingProgramStatus? status,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TrainingProgramImpl;

  factory TrainingProgram.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrainingProgram(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      majorId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['majorId'],
      ),
      major: jsonSerialization['major'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_imik5j2n.Major>(
              jsonSerialization['major'],
            ),
      code: jsonSerialization['code'] as String,
      name: jsonSerialization['name'] as String,
      academicYear: jsonSerialization['academicYear'] as int,
      totalCredits: jsonSerialization['totalCredits'] as int,
      semesterCount: jsonSerialization['semesterCount'] as int,
      status: jsonSerialization['status'] == null
          ? null
          : _iwtxfpeu.TrainingProgramStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      description: jsonSerialization['description'] as String?,
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

  _isc.UuidValue majorId;

  _imik5j2n.Major? major;

  String code;

  String name;

  int academicYear;

  int totalCredits;

  int semesterCount;

  _iwtxfpeu.TrainingProgramStatus status;

  String? description;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [TrainingProgram]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  TrainingProgram copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? majorId,
    _imik5j2n.Major? major,
    String? code,
    String? name,
    int? academicYear,
    int? totalCredits,
    int? semesterCount,
    _iwtxfpeu.TrainingProgramStatus? status,
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
      'code': code,
      'name': name,
      'academicYear': academicYear,
      'totalCredits': totalCredits,
      'semesterCount': semesterCount,
      'status': status.toJson(),
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
      'code': code,
      'name': name,
      'academicYear': academicYear,
      'totalCredits': totalCredits,
      'semesterCount': semesterCount,
      'status': status.toJson(),
      if (description != null) 'description': description,
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

class _TrainingProgramImpl extends TrainingProgram {
  _TrainingProgramImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue majorId,
    _imik5j2n.Major? major,
    required String code,
    required String name,
    required int academicYear,
    required int totalCredits,
    required int semesterCount,
    _iwtxfpeu.TrainingProgramStatus? status,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         majorId: majorId,
         major: major,
         code: code,
         name: name,
         academicYear: academicYear,
         totalCredits: totalCredits,
         semesterCount: semesterCount,
         status: status,
         description: description,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [TrainingProgram]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  TrainingProgram copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? majorId,
    Object? major = _Undefined,
    String? code,
    String? name,
    int? academicYear,
    int? totalCredits,
    int? semesterCount,
    _iwtxfpeu.TrainingProgramStatus? status,
    Object? description = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TrainingProgram(
      id: id is _isc.UuidValue? ? id : this.id,
      majorId: majorId ?? this.majorId,
      major: major is _imik5j2n.Major? ? major : this.major?.copyWith(),
      code: code ?? this.code,
      name: name ?? this.name,
      academicYear: academicYear ?? this.academicYear,
      totalCredits: totalCredits ?? this.totalCredits,
      semesterCount: semesterCount ?? this.semesterCount,
      status: status ?? this.status,
      description: description is String? ? description : this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
