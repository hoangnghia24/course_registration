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
import '../../registration/dto/registered_course_dto.dart' as _iwj8m45o;

abstract class RegistrationResultDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RegistrationResultDto._({
    required this.success,
    required this.message,
    this.registration,
    this.errorCode,
  });

  factory RegistrationResultDto({
    required bool success,
    required String message,
    _iwj8m45o.RegisteredCourseDto? registration,
    String? errorCode,
  }) = _RegistrationResultDtoImpl;

  factory RegistrationResultDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RegistrationResultDto(
      success: _isc.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String,
      registration: jsonSerialization['registration'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_iwj8m45o.RegisteredCourseDto>(
              jsonSerialization['registration'],
            ),
      errorCode: jsonSerialization['errorCode'] as String?,
    );
  }

  bool success;

  String message;

  _iwj8m45o.RegisteredCourseDto? registration;

  String? errorCode;

  /// Returns a shallow copy of this [RegistrationResultDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RegistrationResultDto copyWith({
    bool? success,
    String? message,
    _iwj8m45o.RegisteredCourseDto? registration,
    String? errorCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegistrationResultDto',
      'success': success,
      'message': message,
      if (registration != null) 'registration': registration?.toJson(),
      if (errorCode != null) 'errorCode': errorCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegistrationResultDto',
      'success': success,
      'message': message,
      if (registration != null)
        'registration': registration?.toJsonForProtocol(),
      if (errorCode != null) 'errorCode': errorCode,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegistrationResultDtoImpl extends RegistrationResultDto {
  _RegistrationResultDtoImpl({
    required bool success,
    required String message,
    _iwj8m45o.RegisteredCourseDto? registration,
    String? errorCode,
  }) : super._(
         success: success,
         message: message,
         registration: registration,
         errorCode: errorCode,
       );

  /// Returns a shallow copy of this [RegistrationResultDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RegistrationResultDto copyWith({
    bool? success,
    String? message,
    Object? registration = _Undefined,
    Object? errorCode = _Undefined,
  }) {
    return RegistrationResultDto(
      success: success ?? this.success,
      message: message ?? this.message,
      registration: registration is _iwj8m45o.RegisteredCourseDto?
          ? registration
          : this.registration?.copyWith(),
      errorCode: errorCode is String? ? errorCode : this.errorCode,
    );
  }
}
