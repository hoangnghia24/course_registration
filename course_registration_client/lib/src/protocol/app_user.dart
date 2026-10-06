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
import 'user_role.dart' as _ir0y0iu6;

abstract class AppUser
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AppUser._({
    this.id,
    required this.authUserId,
    required this.email,
    required this.fullName,
    this.phone,
    this.avatar,
    _ir0y0iu6.UserRole? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : role = role ?? _ir0y0iu6.UserRole.student,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory AppUser({
    _isc.UuidValue? id,
    required _isc.UuidValue authUserId,
    required String email,
    required String fullName,
    String? phone,
    String? avatar,
    _ir0y0iu6.UserRole? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AppUserImpl;

  factory AppUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppUser(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      authUserId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      email: jsonSerialization['email'] as String,
      fullName: jsonSerialization['fullName'] as String,
      phone: jsonSerialization['phone'] as String?,
      avatar: jsonSerialization['avatar'] as String?,
      role: jsonSerialization['role'] == null
          ? null
          : _ir0y0iu6.UserRole.fromJson((jsonSerialization['role'] as String)),
      isActive: jsonSerialization['isActive'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
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

  _isc.UuidValue authUserId;

  String email;

  String fullName;

  String? phone;

  String? avatar;

  _ir0y0iu6.UserRole role;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [AppUser]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AppUser copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? authUserId,
    String? email,
    String? fullName,
    String? phone,
    String? avatar,
    _ir0y0iu6.UserRole? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppUser',
      if (id != null) 'id': id?.toJson(),
      'authUserId': authUserId.toJson(),
      'email': email,
      'fullName': fullName,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      'role': role.toJson(),
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppUser',
      if (id != null) 'id': id?.toJson(),
      'authUserId': authUserId.toJson(),
      'email': email,
      'fullName': fullName,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      'role': role.toJson(),
      'isActive': isActive,
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

class _AppUserImpl extends AppUser {
  _AppUserImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue authUserId,
    required String email,
    required String fullName,
    String? phone,
    String? avatar,
    _ir0y0iu6.UserRole? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         email: email,
         fullName: fullName,
         phone: phone,
         avatar: avatar,
         role: role,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AppUser]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AppUser copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? authUserId,
    String? email,
    String? fullName,
    Object? phone = _Undefined,
    Object? avatar = _Undefined,
    _ir0y0iu6.UserRole? role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppUser(
      id: id is _isc.UuidValue? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone is String? ? phone : this.phone,
      avatar: avatar is String? ? avatar : this.avatar,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
