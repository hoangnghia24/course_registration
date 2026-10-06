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
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../../registration/models/semester_status.dart' as _igaolepu;

abstract class Semester
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Semester._({
    this.id,
    required this.name,
    required this.academicYear,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory Semester({
    _isc.UuidValue? id,
    required String name,
    required int academicYear,
    required DateTime startDate,
    required DateTime endDate,
    required _igaolepu.SemesterStatus status,
  }) = _SemesterImpl;

  factory Semester.fromJson(Map<String, dynamic> jsonSerialization) {
    return Semester(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      academicYear: jsonSerialization['academicYear'] as int,
      startDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['startDate'],
      ),
      endDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['endDate'],
      ),
      status: _igaolepu.SemesterStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  String name;

  int academicYear;

  DateTime startDate;

  DateTime endDate;

  _igaolepu.SemesterStatus status;

  /// Returns a shallow copy of this [Semester]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Semester copyWith({
    _isc.UuidValue? id,
    String? name,
    int? academicYear,
    DateTime? startDate,
    DateTime? endDate,
    _igaolepu.SemesterStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Semester',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'academicYear': academicYear,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Semester',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'academicYear': academicYear,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SemesterImpl extends Semester {
  _SemesterImpl({
    _isc.UuidValue? id,
    required String name,
    required int academicYear,
    required DateTime startDate,
    required DateTime endDate,
    required _igaolepu.SemesterStatus status,
  }) : super._(
         id: id,
         name: name,
         academicYear: academicYear,
         startDate: startDate,
         endDate: endDate,
         status: status,
       );

  /// Returns a shallow copy of this [Semester]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Semester copyWith({
    Object? id = _Undefined,
    String? name,
    int? academicYear,
    DateTime? startDate,
    DateTime? endDate,
    _igaolepu.SemesterStatus? status,
  }) {
    return Semester(
      id: id is _isc.UuidValue? ? id : this.id,
      name: name ?? this.name,
      academicYear: academicYear ?? this.academicYear,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
    );
  }
}
