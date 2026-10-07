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
import '../../admin.dart' as _ikmszj0x;
import '../../registration/models/semester.dart' as _i975wtvt;

abstract class RegistrationPeriod
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RegistrationPeriod._({
    this.id,
    required this.semesterId,
    this.semester,
    required this.startTime,
    required this.endTime,
    this.updatedById,
    this.updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory RegistrationPeriod({
    _isc.UuidValue? id,
    required _isc.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required DateTime startTime,
    required DateTime endTime,
    _isc.UuidValue? updatedById,
    _ikmszj0x.Admin? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RegistrationPeriodImpl;

  factory RegistrationPeriod.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegistrationPeriod(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      semesterId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['semesterId'],
      ),
      semester: jsonSerialization['semester'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i975wtvt.Semester>(
              jsonSerialization['semester'],
            ),
      startTime: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['endTime'],
      ),
      updatedById: jsonSerialization['updatedById'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(
              jsonSerialization['updatedById'],
            ),
      updatedBy: jsonSerialization['updatedBy'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['updatedBy'],
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

  _isc.UuidValue semesterId;

  _i975wtvt.Semester? semester;

  DateTime startTime;

  DateTime endTime;

  _isc.UuidValue? updatedById;

  _ikmszj0x.Admin? updatedBy;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [RegistrationPeriod]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RegistrationPeriod copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? semesterId,
    _i975wtvt.Semester? semester,
    DateTime? startTime,
    DateTime? endTime,
    _isc.UuidValue? updatedById,
    _ikmszj0x.Admin? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegistrationPeriod',
      if (id != null) 'id': id?.toJson(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJson(),
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      if (updatedById != null) 'updatedById': updatedById?.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegistrationPeriod',
      if (id != null) 'id': id?.toJson(),
      'semesterId': semesterId.toJson(),
      if (semester != null) 'semester': semester?.toJsonForProtocol(),
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      if (updatedById != null) 'updatedById': updatedById?.toJson(),
      if (updatedBy != null) 'updatedBy': updatedBy?.toJsonForProtocol(),
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

class _RegistrationPeriodImpl extends RegistrationPeriod {
  _RegistrationPeriodImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue semesterId,
    _i975wtvt.Semester? semester,
    required DateTime startTime,
    required DateTime endTime,
    _isc.UuidValue? updatedById,
    _ikmszj0x.Admin? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         semesterId: semesterId,
         semester: semester,
         startTime: startTime,
         endTime: endTime,
         updatedById: updatedById,
         updatedBy: updatedBy,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [RegistrationPeriod]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RegistrationPeriod copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? semesterId,
    Object? semester = _Undefined,
    DateTime? startTime,
    DateTime? endTime,
    Object? updatedById = _Undefined,
    Object? updatedBy = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RegistrationPeriod(
      id: id is _isc.UuidValue? ? id : this.id,
      semesterId: semesterId ?? this.semesterId,
      semester: semester is _i975wtvt.Semester?
          ? semester
          : this.semester?.copyWith(),
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      updatedById: updatedById is _isc.UuidValue?
          ? updatedById
          : this.updatedById,
      updatedBy: updatedBy is _ikmszj0x.Admin?
          ? updatedBy
          : this.updatedBy?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
