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

abstract class NamedCountDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  NamedCountDto._({
    required this.name,
    required this.count,
  });

  factory NamedCountDto({
    required String name,
    required int count,
  }) = _NamedCountDtoImpl;

  factory NamedCountDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return NamedCountDto(
      name: jsonSerialization['name'] as String,
      count: jsonSerialization['count'] as int,
    );
  }

  String name;

  int count;

  /// Returns a shallow copy of this [NamedCountDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  NamedCountDto copyWith({
    String? name,
    int? count,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NamedCountDto',
      'name': name,
      'count': count,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NamedCountDto',
      'name': name,
      'count': count,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _NamedCountDtoImpl extends NamedCountDto {
  _NamedCountDtoImpl({
    required String name,
    required int count,
  }) : super._(
         name: name,
         count: count,
       );

  /// Returns a shallow copy of this [NamedCountDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  NamedCountDto copyWith({
    String? name,
    int? count,
  }) {
    return NamedCountDto(
      name: name ?? this.name,
      count: count ?? this.count,
    );
  }
}
