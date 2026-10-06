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
import 'package:serverpod/serverpod.dart' as _is;

abstract class ClassScheduleDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  ClassScheduleDto._({
    required this.dayOfWeek,
    required this.startPeriod,
    required this.endPeriod,
    required this.room,
  });

  factory ClassScheduleDto({
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
  }) = _ClassScheduleDtoImpl;

  factory ClassScheduleDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return ClassScheduleDto(
      dayOfWeek: jsonSerialization['dayOfWeek'] as int,
      startPeriod: jsonSerialization['startPeriod'] as int,
      endPeriod: jsonSerialization['endPeriod'] as int,
      room: jsonSerialization['room'] as String,
    );
  }

  int dayOfWeek;

  int startPeriod;

  int endPeriod;

  String room;

  /// Returns a shallow copy of this [ClassScheduleDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  ClassScheduleDto copyWith({
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ClassScheduleDto',
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ClassScheduleDto',
      'dayOfWeek': dayOfWeek,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'room': room,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _ClassScheduleDtoImpl extends ClassScheduleDto {
  _ClassScheduleDtoImpl({
    required int dayOfWeek,
    required int startPeriod,
    required int endPeriod,
    required String room,
  }) : super._(
         dayOfWeek: dayOfWeek,
         startPeriod: startPeriod,
         endPeriod: endPeriod,
         room: room,
       );

  /// Returns a shallow copy of this [ClassScheduleDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  ClassScheduleDto copyWith({
    int? dayOfWeek,
    int? startPeriod,
    int? endPeriod,
    String? room,
  }) {
    return ClassScheduleDto(
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      room: room ?? this.room,
    );
  }
}
