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
import '../../user_role.dart' as _itj20m7p;

abstract class AdminUserDto
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AdminUserDto._({
    required this.userId,
    required this.authUserId,
    required this.email,
    required this.fullName,
    this.phone,
    required this.role,
    required this.isActive,
    this.roleCode,
  });

  factory AdminUserDto({
    required _isc.UuidValue userId,
    required _isc.UuidValue authUserId,
    required String email,
    required String fullName,
    String? phone,
    required _itj20m7p.UserRole role,
    required bool isActive,
    String? roleCode,
  }) = _AdminUserDtoImpl;

  factory AdminUserDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return AdminUserDto(
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      authUserId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      email: jsonSerialization['email'] as String,
      fullName: jsonSerialization['fullName'] as String,
      phone: jsonSerialization['phone'] as String?,
      role: _itj20m7p.UserRole.fromJson((jsonSerialization['role'] as String)),
      isActive: _isc.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      roleCode: jsonSerialization['roleCode'] as String?,
    );
  }

  _isc.UuidValue userId;

  _isc.UuidValue authUserId;

  String email;

  String fullName;

  String? phone;

  _itj20m7p.UserRole role;

  bool isActive;

  String? roleCode;

  /// Returns a shallow copy of this [AdminUserDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AdminUserDto copyWith({
    _isc.UuidValue? userId,
    _isc.UuidValue? authUserId,
    String? email,
    String? fullName,
    String? phone,
    _itj20m7p.UserRole? role,
    bool? isActive,
    String? roleCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AdminUserDto',
      'userId': userId.toJson(),
      'authUserId': authUserId.toJson(),
      'email': email,
      'fullName': fullName,
      if (phone != null) 'phone': phone,
      'role': role.toJson(),
      'isActive': isActive,
      if (roleCode != null) 'roleCode': roleCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AdminUserDto',
      'userId': userId.toJson(),
      'authUserId': authUserId.toJson(),
      'email': email,
      'fullName': fullName,
      if (phone != null) 'phone': phone,
      'role': role.toJson(),
      'isActive': isActive,
      if (roleCode != null) 'roleCode': roleCode,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminUserDtoImpl extends AdminUserDto {
  _AdminUserDtoImpl({
    required _isc.UuidValue userId,
    required _isc.UuidValue authUserId,
    required String email,
    required String fullName,
    String? phone,
    required _itj20m7p.UserRole role,
    required bool isActive,
    String? roleCode,
  }) : super._(
         userId: userId,
         authUserId: authUserId,
         email: email,
         fullName: fullName,
         phone: phone,
         role: role,
         isActive: isActive,
         roleCode: roleCode,
       );

  /// Returns a shallow copy of this [AdminUserDto]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AdminUserDto copyWith({
    _isc.UuidValue? userId,
    _isc.UuidValue? authUserId,
    String? email,
    String? fullName,
    Object? phone = _Undefined,
    _itj20m7p.UserRole? role,
    bool? isActive,
    Object? roleCode = _Undefined,
  }) {
    return AdminUserDto(
      userId: userId ?? this.userId,
      authUserId: authUserId ?? this.authUserId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone is String? ? phone : this.phone,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      roleCode: roleCode is String? ? roleCode : this.roleCode,
    );
  }
}
