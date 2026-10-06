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

abstract class AdminPermission
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AdminPermission._({
    this.id,
    required this.adminId,
    this.admin,
    required this.permissionName,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory AdminPermission({
    _isc.UuidValue? id,
    required _isc.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    required String permissionName,
    DateTime? createdAt,
  }) = _AdminPermissionImpl;

  factory AdminPermission.fromJson(Map<String, dynamic> jsonSerialization) {
    return AdminPermission(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      adminId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['adminId'],
      ),
      admin: jsonSerialization['admin'] == null
          ? null
          : _iyxbdoua.Protocol().deserialize<_ikmszj0x.Admin>(
              jsonSerialization['admin'],
            ),
      permissionName: jsonSerialization['permissionName'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue adminId;

  _ikmszj0x.Admin? admin;

  String permissionName;

  DateTime createdAt;

  /// Returns a shallow copy of this [AdminPermission]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AdminPermission copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? adminId,
    _ikmszj0x.Admin? admin,
    String? permissionName,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AdminPermission',
      if (id != null) 'id': id?.toJson(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJson(),
      'permissionName': permissionName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AdminPermission',
      if (id != null) 'id': id?.toJson(),
      'adminId': adminId.toJson(),
      if (admin != null) 'admin': admin?.toJsonForProtocol(),
      'permissionName': permissionName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminPermissionImpl extends AdminPermission {
  _AdminPermissionImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue adminId,
    _ikmszj0x.Admin? admin,
    required String permissionName,
    DateTime? createdAt,
  }) : super._(
         id: id,
         adminId: adminId,
         admin: admin,
         permissionName: permissionName,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AdminPermission]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AdminPermission copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? adminId,
    Object? admin = _Undefined,
    String? permissionName,
    DateTime? createdAt,
  }) {
    return AdminPermission(
      id: id is _isc.UuidValue? ? id : this.id,
      adminId: adminId ?? this.adminId,
      admin: admin is _ikmszj0x.Admin? ? admin : this.admin?.copyWith(),
      permissionName: permissionName ?? this.permissionName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
