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
import 'app_user.dart' as _i2j2xfrn;

abstract class Admin
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Admin._({
    this.id,
    required this.userId,
    this.user,
    int? permissionLevel,
  }) : permissionLevel = permissionLevel ?? 1;

  factory Admin({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    int? permissionLevel,
  }) = _AdminImpl;

  factory Admin.fromJson(Map<String, dynamic> jsonSerialization) {
    return Admin(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_i2j2xfrn.AppUser>(
              jsonSerialization['user'],
            ),
      permissionLevel: jsonSerialization['permissionLevel'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue userId;

  _i2j2xfrn.AppUser? user;

  int permissionLevel;

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Admin copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? userId,
    _i2j2xfrn.AppUser? user,
    int? permissionLevel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Admin',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'permissionLevel': permissionLevel,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Admin',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'permissionLevel': permissionLevel,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminImpl extends Admin {
  _AdminImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    _i2j2xfrn.AppUser? user,
    int? permissionLevel,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         permissionLevel: permissionLevel,
       );

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Admin copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? userId,
    Object? user = _Undefined,
    int? permissionLevel,
  }) {
    return Admin(
      id: id is _isc.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2j2xfrn.AppUser? ? user : this.user?.copyWith(),
      permissionLevel: permissionLevel ?? this.permissionLevel,
    );
  }
}
