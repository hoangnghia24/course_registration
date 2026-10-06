// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersLocalTable extends UsersLocal
    with TableInfo<$UsersLocalTable, UsersLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authUserIdMeta = const VerificationMeta(
    'authUserId',
  );
  @override
  late final GeneratedColumn<String> authUserId = GeneratedColumn<String>(
    'auth_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    authUserId,
    email,
    fullName,
    phone,
    avatar,
    role,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsersLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('auth_user_id')) {
      context.handle(
        _authUserIdMeta,
        authUserId.isAcceptableOrUnknown(
          data['auth_user_id']!,
          _authUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_authUserIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersLocalData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      authUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}auth_user_id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UsersLocalTable createAlias(String alias) {
    return $UsersLocalTable(attachedDatabase, alias);
  }
}

class UsersLocalData extends DataClass implements Insertable<UsersLocalData> {
  final String id;
  final String authUserId;
  final String email;
  final String fullName;
  final String? phone;
  final String? avatar;
  final String role;
  final DateTime updatedAt;
  const UsersLocalData({
    required this.id,
    required this.authUserId,
    required this.email,
    required this.fullName,
    this.phone,
    this.avatar,
    required this.role,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['auth_user_id'] = Variable<String>(authUserId);
    map['email'] = Variable<String>(email);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    map['role'] = Variable<String>(role);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersLocalCompanion toCompanion(bool nullToAbsent) {
    return UsersLocalCompanion(
      id: Value(id),
      authUserId: Value(authUserId),
      email: Value(email),
      fullName: Value(fullName),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      role: Value(role),
      updatedAt: Value(updatedAt),
    );
  }

  factory UsersLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersLocalData(
      id: serializer.fromJson<String>(json['id']),
      authUserId: serializer.fromJson<String>(json['authUserId']),
      email: serializer.fromJson<String>(json['email']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phone: serializer.fromJson<String?>(json['phone']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      role: serializer.fromJson<String>(json['role']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'authUserId': serializer.toJson<String>(authUserId),
      'email': serializer.toJson<String>(email),
      'fullName': serializer.toJson<String>(fullName),
      'phone': serializer.toJson<String?>(phone),
      'avatar': serializer.toJson<String?>(avatar),
      'role': serializer.toJson<String>(role),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UsersLocalData copyWith({
    String? id,
    String? authUserId,
    String? email,
    String? fullName,
    Value<String?> phone = const Value.absent(),
    Value<String?> avatar = const Value.absent(),
    String? role,
    DateTime? updatedAt,
  }) => UsersLocalData(
    id: id ?? this.id,
    authUserId: authUserId ?? this.authUserId,
    email: email ?? this.email,
    fullName: fullName ?? this.fullName,
    phone: phone.present ? phone.value : this.phone,
    avatar: avatar.present ? avatar.value : this.avatar,
    role: role ?? this.role,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UsersLocalData copyWithCompanion(UsersLocalCompanion data) {
    return UsersLocalData(
      id: data.id.present ? data.id.value : this.id,
      authUserId: data.authUserId.present
          ? data.authUserId.value
          : this.authUserId,
      email: data.email.present ? data.email.value : this.email,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      phone: data.phone.present ? data.phone.value : this.phone,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      role: data.role.present ? data.role.value : this.role,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersLocalData(')
          ..write('id: $id, ')
          ..write('authUserId: $authUserId, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('avatar: $avatar, ')
          ..write('role: $role, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    authUserId,
    email,
    fullName,
    phone,
    avatar,
    role,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersLocalData &&
          other.id == this.id &&
          other.authUserId == this.authUserId &&
          other.email == this.email &&
          other.fullName == this.fullName &&
          other.phone == this.phone &&
          other.avatar == this.avatar &&
          other.role == this.role &&
          other.updatedAt == this.updatedAt);
}

class UsersLocalCompanion extends UpdateCompanion<UsersLocalData> {
  final Value<String> id;
  final Value<String> authUserId;
  final Value<String> email;
  final Value<String> fullName;
  final Value<String?> phone;
  final Value<String?> avatar;
  final Value<String> role;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UsersLocalCompanion({
    this.id = const Value.absent(),
    this.authUserId = const Value.absent(),
    this.email = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.avatar = const Value.absent(),
    this.role = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersLocalCompanion.insert({
    required String id,
    required String authUserId,
    required String email,
    required String fullName,
    this.phone = const Value.absent(),
    this.avatar = const Value.absent(),
    required String role,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       authUserId = Value(authUserId),
       email = Value(email),
       fullName = Value(fullName),
       role = Value(role),
       updatedAt = Value(updatedAt);
  static Insertable<UsersLocalData> custom({
    Expression<String>? id,
    Expression<String>? authUserId,
    Expression<String>? email,
    Expression<String>? fullName,
    Expression<String>? phone,
    Expression<String>? avatar,
    Expression<String>? role,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authUserId != null) 'auth_user_id': authUserId,
      if (email != null) 'email': email,
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      if (role != null) 'role': role,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersLocalCompanion copyWith({
    Value<String>? id,
    Value<String>? authUserId,
    Value<String>? email,
    Value<String>? fullName,
    Value<String?>? phone,
    Value<String?>? avatar,
    Value<String>? role,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UsersLocalCompanion(
      id: id ?? this.id,
      authUserId: authUserId ?? this.authUserId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (authUserId.present) {
      map['auth_user_id'] = Variable<String>(authUserId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersLocalCompanion(')
          ..write('id: $id, ')
          ..write('authUserId: $authUserId, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('avatar: $avatar, ')
          ..write('role: $role, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionsLocalTable extends SessionsLocal
    with TableInfo<$SessionsLocalTable, SessionsLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _authUserIdMeta = const VerificationMeta(
    'authUserId',
  );
  @override
  late final GeneratedColumn<String> authUserId = GeneratedColumn<String>(
    'auth_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    authUserId,
    email,
    role,
    expiresAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionsLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('auth_user_id')) {
      context.handle(
        _authUserIdMeta,
        authUserId.isAcceptableOrUnknown(
          data['auth_user_id']!,
          _authUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_authUserIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {authUserId};
  @override
  SessionsLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionsLocalData(
      authUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}auth_user_id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SessionsLocalTable createAlias(String alias) {
    return $SessionsLocalTable(attachedDatabase, alias);
  }
}

class SessionsLocalData extends DataClass
    implements Insertable<SessionsLocalData> {
  final String authUserId;
  final String email;
  final String role;
  final DateTime? expiresAt;
  final DateTime updatedAt;
  const SessionsLocalData({
    required this.authUserId,
    required this.email,
    required this.role,
    this.expiresAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['auth_user_id'] = Variable<String>(authUserId);
    map['email'] = Variable<String>(email);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SessionsLocalCompanion toCompanion(bool nullToAbsent) {
    return SessionsLocalCompanion(
      authUserId: Value(authUserId),
      email: Value(email),
      role: Value(role),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SessionsLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionsLocalData(
      authUserId: serializer.fromJson<String>(json['authUserId']),
      email: serializer.fromJson<String>(json['email']),
      role: serializer.fromJson<String>(json['role']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'authUserId': serializer.toJson<String>(authUserId),
      'email': serializer.toJson<String>(email),
      'role': serializer.toJson<String>(role),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SessionsLocalData copyWith({
    String? authUserId,
    String? email,
    String? role,
    Value<DateTime?> expiresAt = const Value.absent(),
    DateTime? updatedAt,
  }) => SessionsLocalData(
    authUserId: authUserId ?? this.authUserId,
    email: email ?? this.email,
    role: role ?? this.role,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SessionsLocalData copyWithCompanion(SessionsLocalCompanion data) {
    return SessionsLocalData(
      authUserId: data.authUserId.present
          ? data.authUserId.value
          : this.authUserId,
      email: data.email.present ? data.email.value : this.email,
      role: data.role.present ? data.role.value : this.role,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionsLocalData(')
          ..write('authUserId: $authUserId, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(authUserId, email, role, expiresAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionsLocalData &&
          other.authUserId == this.authUserId &&
          other.email == this.email &&
          other.role == this.role &&
          other.expiresAt == this.expiresAt &&
          other.updatedAt == this.updatedAt);
}

class SessionsLocalCompanion extends UpdateCompanion<SessionsLocalData> {
  final Value<String> authUserId;
  final Value<String> email;
  final Value<String> role;
  final Value<DateTime?> expiresAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SessionsLocalCompanion({
    this.authUserId = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsLocalCompanion.insert({
    required String authUserId,
    required String email,
    required String role,
    this.expiresAt = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : authUserId = Value(authUserId),
       email = Value(email),
       role = Value(role),
       updatedAt = Value(updatedAt);
  static Insertable<SessionsLocalData> custom({
    Expression<String>? authUserId,
    Expression<String>? email,
    Expression<String>? role,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (authUserId != null) 'auth_user_id': authUserId,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsLocalCompanion copyWith({
    Value<String>? authUserId,
    Value<String>? email,
    Value<String>? role,
    Value<DateTime?>? expiresAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SessionsLocalCompanion(
      authUserId: authUserId ?? this.authUserId,
      email: email ?? this.email,
      role: role ?? this.role,
      expiresAt: expiresAt ?? this.expiresAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (authUserId.present) {
      map['auth_user_id'] = Variable<String>(authUserId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsLocalCompanion(')
          ..write('authUserId: $authUserId, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
    'entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationTypeMeta = const VerificationMeta(
    'operationType',
  );
  @override
  late final GeneratedColumn<String> operationType = GeneratedColumn<String>(
    'operation_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('CREATE'),
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PENDING'),
  );
  static const VerificationMeta _attemptCountMeta = const VerificationMeta(
    'attemptCount',
  );
  @override
  late final GeneratedColumn<int> attemptCount = GeneratedColumn<int>(
    'attempt_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<String> errorCode = GeneratedColumn<String>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextRetryAtMeta = const VerificationMeta(
    'nextRetryAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextRetryAt = GeneratedColumn<DateTime>(
    'next_retry_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('legacy'),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _baseVersionMeta = const VerificationMeta(
    'baseVersion',
  );
  @override
  late final GeneratedColumn<int> baseVersion = GeneratedColumn<int>(
    'base_version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serverVersionMeta = const VerificationMeta(
    'serverVersion',
  );
  @override
  late final GeneratedColumn<int> serverVersion = GeneratedColumn<int>(
    'server_version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    action,
    entity,
    entityId,
    operationType,
    data,
    status,
    attemptCount,
    lastError,
    errorCode,
    nextRetryAt,
    clientId,
    userId,
    baseVersion,
    serverVersion,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity')) {
      context.handle(
        _entityMeta,
        entity.isAcceptableOrUnknown(data['entity']!, _entityMeta),
      );
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('operation_type')) {
      context.handle(
        _operationTypeMeta,
        operationType.isAcceptableOrUnknown(
          data['operation_type']!,
          _operationTypeMeta,
        ),
      );
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('attempt_count')) {
      context.handle(
        _attemptCountMeta,
        attemptCount.isAcceptableOrUnknown(
          data['attempt_count']!,
          _attemptCountMeta,
        ),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    if (data.containsKey('next_retry_at')) {
      context.handle(
        _nextRetryAtMeta,
        nextRetryAt.isAcceptableOrUnknown(
          data['next_retry_at']!,
          _nextRetryAtMeta,
        ),
      );
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('base_version')) {
      context.handle(
        _baseVersionMeta,
        baseVersion.isAcceptableOrUnknown(
          data['base_version']!,
          _baseVersionMeta,
        ),
      );
    }
    if (data.containsKey('server_version')) {
      context.handle(
        _serverVersionMeta,
        serverVersion.isAcceptableOrUnknown(
          data['server_version']!,
          _serverVersionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      ),
      operationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_type'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      attemptCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempt_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_code'],
      ),
      nextRetryAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_retry_at'],
      ),
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      baseVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_version'],
      ),
      serverVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_version'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final String id;
  final String action;
  final String entity;
  final String? entityId;
  final String operationType;
  final String data;
  final String status;
  final int attemptCount;
  final String? lastError;
  final String? errorCode;
  final DateTime? nextRetryAt;
  final String clientId;
  final String userId;
  final int? baseVersion;
  final int? serverVersion;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SyncQueueData({
    required this.id,
    required this.action,
    required this.entity,
    this.entityId,
    required this.operationType,
    required this.data,
    required this.status,
    required this.attemptCount,
    this.lastError,
    this.errorCode,
    this.nextRetryAt,
    required this.clientId,
    required this.userId,
    this.baseVersion,
    this.serverVersion,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['action'] = Variable<String>(action);
    map['entity'] = Variable<String>(entity);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String>(entityId);
    }
    map['operation_type'] = Variable<String>(operationType);
    map['data'] = Variable<String>(data);
    map['status'] = Variable<String>(status);
    map['attempt_count'] = Variable<int>(attemptCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<String>(errorCode);
    }
    if (!nullToAbsent || nextRetryAt != null) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt);
    }
    map['client_id'] = Variable<String>(clientId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || baseVersion != null) {
      map['base_version'] = Variable<int>(baseVersion);
    }
    if (!nullToAbsent || serverVersion != null) {
      map['server_version'] = Variable<int>(serverVersion);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      action: Value(action),
      entity: Value(entity),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      operationType: Value(operationType),
      data: Value(data),
      status: Value(status),
      attemptCount: Value(attemptCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      errorCode: errorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(errorCode),
      nextRetryAt: nextRetryAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextRetryAt),
      clientId: Value(clientId),
      userId: Value(userId),
      baseVersion: baseVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(baseVersion),
      serverVersion: serverVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(serverVersion),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<String>(json['id']),
      action: serializer.fromJson<String>(json['action']),
      entity: serializer.fromJson<String>(json['entity']),
      entityId: serializer.fromJson<String?>(json['entityId']),
      operationType: serializer.fromJson<String>(json['operationType']),
      data: serializer.fromJson<String>(json['data']),
      status: serializer.fromJson<String>(json['status']),
      attemptCount: serializer.fromJson<int>(json['attemptCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      errorCode: serializer.fromJson<String?>(json['errorCode']),
      nextRetryAt: serializer.fromJson<DateTime?>(json['nextRetryAt']),
      clientId: serializer.fromJson<String>(json['clientId']),
      userId: serializer.fromJson<String>(json['userId']),
      baseVersion: serializer.fromJson<int?>(json['baseVersion']),
      serverVersion: serializer.fromJson<int?>(json['serverVersion']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'action': serializer.toJson<String>(action),
      'entity': serializer.toJson<String>(entity),
      'entityId': serializer.toJson<String?>(entityId),
      'operationType': serializer.toJson<String>(operationType),
      'data': serializer.toJson<String>(data),
      'status': serializer.toJson<String>(status),
      'attemptCount': serializer.toJson<int>(attemptCount),
      'lastError': serializer.toJson<String?>(lastError),
      'errorCode': serializer.toJson<String?>(errorCode),
      'nextRetryAt': serializer.toJson<DateTime?>(nextRetryAt),
      'clientId': serializer.toJson<String>(clientId),
      'userId': serializer.toJson<String>(userId),
      'baseVersion': serializer.toJson<int?>(baseVersion),
      'serverVersion': serializer.toJson<int?>(serverVersion),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncQueueData copyWith({
    String? id,
    String? action,
    String? entity,
    Value<String?> entityId = const Value.absent(),
    String? operationType,
    String? data,
    String? status,
    int? attemptCount,
    Value<String?> lastError = const Value.absent(),
    Value<String?> errorCode = const Value.absent(),
    Value<DateTime?> nextRetryAt = const Value.absent(),
    String? clientId,
    String? userId,
    Value<int?> baseVersion = const Value.absent(),
    Value<int?> serverVersion = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SyncQueueData(
    id: id ?? this.id,
    action: action ?? this.action,
    entity: entity ?? this.entity,
    entityId: entityId.present ? entityId.value : this.entityId,
    operationType: operationType ?? this.operationType,
    data: data ?? this.data,
    status: status ?? this.status,
    attemptCount: attemptCount ?? this.attemptCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
    nextRetryAt: nextRetryAt.present ? nextRetryAt.value : this.nextRetryAt,
    clientId: clientId ?? this.clientId,
    userId: userId ?? this.userId,
    baseVersion: baseVersion.present ? baseVersion.value : this.baseVersion,
    serverVersion: serverVersion.present
        ? serverVersion.value
        : this.serverVersion,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      action: data.action.present ? data.action.value : this.action,
      entity: data.entity.present ? data.entity.value : this.entity,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      data: data.data.present ? data.data.value : this.data,
      status: data.status.present ? data.status.value : this.status,
      attemptCount: data.attemptCount.present
          ? data.attemptCount.value
          : this.attemptCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
      nextRetryAt: data.nextRetryAt.present
          ? data.nextRetryAt.value
          : this.nextRetryAt,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      userId: data.userId.present ? data.userId.value : this.userId,
      baseVersion: data.baseVersion.present
          ? data.baseVersion.value
          : this.baseVersion,
      serverVersion: data.serverVersion.present
          ? data.serverVersion.value
          : this.serverVersion,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('operationType: $operationType, ')
          ..write('data: $data, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastError: $lastError, ')
          ..write('errorCode: $errorCode, ')
          ..write('nextRetryAt: $nextRetryAt, ')
          ..write('clientId: $clientId, ')
          ..write('userId: $userId, ')
          ..write('baseVersion: $baseVersion, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    action,
    entity,
    entityId,
    operationType,
    data,
    status,
    attemptCount,
    lastError,
    errorCode,
    nextRetryAt,
    clientId,
    userId,
    baseVersion,
    serverVersion,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.action == this.action &&
          other.entity == this.entity &&
          other.entityId == this.entityId &&
          other.operationType == this.operationType &&
          other.data == this.data &&
          other.status == this.status &&
          other.attemptCount == this.attemptCount &&
          other.lastError == this.lastError &&
          other.errorCode == this.errorCode &&
          other.nextRetryAt == this.nextRetryAt &&
          other.clientId == this.clientId &&
          other.userId == this.userId &&
          other.baseVersion == this.baseVersion &&
          other.serverVersion == this.serverVersion &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<String> id;
  final Value<String> action;
  final Value<String> entity;
  final Value<String?> entityId;
  final Value<String> operationType;
  final Value<String> data;
  final Value<String> status;
  final Value<int> attemptCount;
  final Value<String?> lastError;
  final Value<String?> errorCode;
  final Value<DateTime?> nextRetryAt;
  final Value<String> clientId;
  final Value<String> userId;
  final Value<int?> baseVersion;
  final Value<int?> serverVersion;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.action = const Value.absent(),
    this.entity = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operationType = const Value.absent(),
    this.data = const Value.absent(),
    this.status = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.clientId = const Value.absent(),
    this.userId = const Value.absent(),
    this.baseVersion = const Value.absent(),
    this.serverVersion = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    required String id,
    required String action,
    required String entity,
    this.entityId = const Value.absent(),
    this.operationType = const Value.absent(),
    required String data,
    this.status = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.clientId = const Value.absent(),
    this.userId = const Value.absent(),
    this.baseVersion = const Value.absent(),
    this.serverVersion = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       action = Value(action),
       entity = Value(entity),
       data = Value(data),
       createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<String>? id,
    Expression<String>? action,
    Expression<String>? entity,
    Expression<String>? entityId,
    Expression<String>? operationType,
    Expression<String>? data,
    Expression<String>? status,
    Expression<int>? attemptCount,
    Expression<String>? lastError,
    Expression<String>? errorCode,
    Expression<DateTime>? nextRetryAt,
    Expression<String>? clientId,
    Expression<String>? userId,
    Expression<int>? baseVersion,
    Expression<int>? serverVersion,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (action != null) 'action': action,
      if (entity != null) 'entity': entity,
      if (entityId != null) 'entity_id': entityId,
      if (operationType != null) 'operation_type': operationType,
      if (data != null) 'data': data,
      if (status != null) 'status': status,
      if (attemptCount != null) 'attempt_count': attemptCount,
      if (lastError != null) 'last_error': lastError,
      if (errorCode != null) 'error_code': errorCode,
      if (nextRetryAt != null) 'next_retry_at': nextRetryAt,
      if (clientId != null) 'client_id': clientId,
      if (userId != null) 'user_id': userId,
      if (baseVersion != null) 'base_version': baseVersion,
      if (serverVersion != null) 'server_version': serverVersion,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncQueueCompanion copyWith({
    Value<String>? id,
    Value<String>? action,
    Value<String>? entity,
    Value<String?>? entityId,
    Value<String>? operationType,
    Value<String>? data,
    Value<String>? status,
    Value<int>? attemptCount,
    Value<String?>? lastError,
    Value<String?>? errorCode,
    Value<DateTime?>? nextRetryAt,
    Value<String>? clientId,
    Value<String>? userId,
    Value<int?>? baseVersion,
    Value<int?>? serverVersion,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      action: action ?? this.action,
      entity: entity ?? this.entity,
      entityId: entityId ?? this.entityId,
      operationType: operationType ?? this.operationType,
      data: data ?? this.data,
      status: status ?? this.status,
      attemptCount: attemptCount ?? this.attemptCount,
      lastError: lastError ?? this.lastError,
      errorCode: errorCode ?? this.errorCode,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
      clientId: clientId ?? this.clientId,
      userId: userId ?? this.userId,
      baseVersion: baseVersion ?? this.baseVersion,
      serverVersion: serverVersion ?? this.serverVersion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<String>(operationType.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (attemptCount.present) {
      map['attempt_count'] = Variable<int>(attemptCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<String>(errorCode.value);
    }
    if (nextRetryAt.present) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (baseVersion.present) {
      map['base_version'] = Variable<int>(baseVersion.value);
    }
    if (serverVersion.present) {
      map['server_version'] = Variable<int>(serverVersion.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('action: $action, ')
          ..write('entity: $entity, ')
          ..write('entityId: $entityId, ')
          ..write('operationType: $operationType, ')
          ..write('data: $data, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastError: $lastError, ')
          ..write('errorCode: $errorCode, ')
          ..write('nextRetryAt: $nextRetryAt, ')
          ..write('clientId: $clientId, ')
          ..write('userId: $userId, ')
          ..write('baseVersion: $baseVersion, ')
          ..write('serverVersion: $serverVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingRegistrationLocalTable extends PendingRegistrationLocal
    with
        TableInfo<
          $PendingRegistrationLocalTable,
          PendingRegistrationLocalData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingRegistrationLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _courseClassIdMeta = const VerificationMeta(
    'courseClassId',
  );
  @override
  late final GeneratedColumn<String> courseClassId = GeneratedColumn<String>(
    'course_class_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _registrationIdMeta = const VerificationMeta(
    'registrationId',
  );
  @override
  late final GeneratedColumn<String> registrationId = GeneratedColumn<String>(
    'registration_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<String> errorCode = GeneratedColumn<String>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    operationId,
    courseClassId,
    registrationId,
    action,
    status,
    payload,
    errorCode,
    errorMessage,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_registration_local';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingRegistrationLocalData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationIdMeta);
    }
    if (data.containsKey('course_class_id')) {
      context.handle(
        _courseClassIdMeta,
        courseClassId.isAcceptableOrUnknown(
          data['course_class_id']!,
          _courseClassIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseClassIdMeta);
    }
    if (data.containsKey('registration_id')) {
      context.handle(
        _registrationIdMeta,
        registrationId.isAcceptableOrUnknown(
          data['registration_id']!,
          _registrationIdMeta,
        ),
      );
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingRegistrationLocalData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingRegistrationLocalData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      )!,
      courseClassId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course_class_id'],
      )!,
      registrationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registration_id'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_code'],
      ),
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PendingRegistrationLocalTable createAlias(String alias) {
    return $PendingRegistrationLocalTable(attachedDatabase, alias);
  }
}

class PendingRegistrationLocalData extends DataClass
    implements Insertable<PendingRegistrationLocalData> {
  final String id;
  final String operationId;
  final String courseClassId;
  final String? registrationId;
  final String action;
  final String status;
  final String payload;
  final String? errorCode;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PendingRegistrationLocalData({
    required this.id,
    required this.operationId,
    required this.courseClassId,
    this.registrationId,
    required this.action,
    required this.status,
    required this.payload,
    this.errorCode,
    this.errorMessage,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['operation_id'] = Variable<String>(operationId);
    map['course_class_id'] = Variable<String>(courseClassId);
    if (!nullToAbsent || registrationId != null) {
      map['registration_id'] = Variable<String>(registrationId);
    }
    map['action'] = Variable<String>(action);
    map['status'] = Variable<String>(status);
    map['payload'] = Variable<String>(payload);
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<String>(errorCode);
    }
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PendingRegistrationLocalCompanion toCompanion(bool nullToAbsent) {
    return PendingRegistrationLocalCompanion(
      id: Value(id),
      operationId: Value(operationId),
      courseClassId: Value(courseClassId),
      registrationId: registrationId == null && nullToAbsent
          ? const Value.absent()
          : Value(registrationId),
      action: Value(action),
      status: Value(status),
      payload: Value(payload),
      errorCode: errorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(errorCode),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PendingRegistrationLocalData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingRegistrationLocalData(
      id: serializer.fromJson<String>(json['id']),
      operationId: serializer.fromJson<String>(json['operationId']),
      courseClassId: serializer.fromJson<String>(json['courseClassId']),
      registrationId: serializer.fromJson<String?>(json['registrationId']),
      action: serializer.fromJson<String>(json['action']),
      status: serializer.fromJson<String>(json['status']),
      payload: serializer.fromJson<String>(json['payload']),
      errorCode: serializer.fromJson<String?>(json['errorCode']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'operationId': serializer.toJson<String>(operationId),
      'courseClassId': serializer.toJson<String>(courseClassId),
      'registrationId': serializer.toJson<String?>(registrationId),
      'action': serializer.toJson<String>(action),
      'status': serializer.toJson<String>(status),
      'payload': serializer.toJson<String>(payload),
      'errorCode': serializer.toJson<String?>(errorCode),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PendingRegistrationLocalData copyWith({
    String? id,
    String? operationId,
    String? courseClassId,
    Value<String?> registrationId = const Value.absent(),
    String? action,
    String? status,
    String? payload,
    Value<String?> errorCode = const Value.absent(),
    Value<String?> errorMessage = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PendingRegistrationLocalData(
    id: id ?? this.id,
    operationId: operationId ?? this.operationId,
    courseClassId: courseClassId ?? this.courseClassId,
    registrationId: registrationId.present
        ? registrationId.value
        : this.registrationId,
    action: action ?? this.action,
    status: status ?? this.status,
    payload: payload ?? this.payload,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PendingRegistrationLocalData copyWithCompanion(
    PendingRegistrationLocalCompanion data,
  ) {
    return PendingRegistrationLocalData(
      id: data.id.present ? data.id.value : this.id,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      courseClassId: data.courseClassId.present
          ? data.courseClassId.value
          : this.courseClassId,
      registrationId: data.registrationId.present
          ? data.registrationId.value
          : this.registrationId,
      action: data.action.present ? data.action.value : this.action,
      status: data.status.present ? data.status.value : this.status,
      payload: data.payload.present ? data.payload.value : this.payload,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingRegistrationLocalData(')
          ..write('id: $id, ')
          ..write('operationId: $operationId, ')
          ..write('courseClassId: $courseClassId, ')
          ..write('registrationId: $registrationId, ')
          ..write('action: $action, ')
          ..write('status: $status, ')
          ..write('payload: $payload, ')
          ..write('errorCode: $errorCode, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    operationId,
    courseClassId,
    registrationId,
    action,
    status,
    payload,
    errorCode,
    errorMessage,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingRegistrationLocalData &&
          other.id == this.id &&
          other.operationId == this.operationId &&
          other.courseClassId == this.courseClassId &&
          other.registrationId == this.registrationId &&
          other.action == this.action &&
          other.status == this.status &&
          other.payload == this.payload &&
          other.errorCode == this.errorCode &&
          other.errorMessage == this.errorMessage &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PendingRegistrationLocalCompanion
    extends UpdateCompanion<PendingRegistrationLocalData> {
  final Value<String> id;
  final Value<String> operationId;
  final Value<String> courseClassId;
  final Value<String?> registrationId;
  final Value<String> action;
  final Value<String> status;
  final Value<String> payload;
  final Value<String?> errorCode;
  final Value<String?> errorMessage;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PendingRegistrationLocalCompanion({
    this.id = const Value.absent(),
    this.operationId = const Value.absent(),
    this.courseClassId = const Value.absent(),
    this.registrationId = const Value.absent(),
    this.action = const Value.absent(),
    this.status = const Value.absent(),
    this.payload = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingRegistrationLocalCompanion.insert({
    required String id,
    required String operationId,
    required String courseClassId,
    this.registrationId = const Value.absent(),
    required String action,
    required String status,
    required String payload,
    this.errorCode = const Value.absent(),
    this.errorMessage = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       operationId = Value(operationId),
       courseClassId = Value(courseClassId),
       action = Value(action),
       status = Value(status),
       payload = Value(payload),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PendingRegistrationLocalData> custom({
    Expression<String>? id,
    Expression<String>? operationId,
    Expression<String>? courseClassId,
    Expression<String>? registrationId,
    Expression<String>? action,
    Expression<String>? status,
    Expression<String>? payload,
    Expression<String>? errorCode,
    Expression<String>? errorMessage,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operationId != null) 'operation_id': operationId,
      if (courseClassId != null) 'course_class_id': courseClassId,
      if (registrationId != null) 'registration_id': registrationId,
      if (action != null) 'action': action,
      if (status != null) 'status': status,
      if (payload != null) 'payload': payload,
      if (errorCode != null) 'error_code': errorCode,
      if (errorMessage != null) 'error_message': errorMessage,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingRegistrationLocalCompanion copyWith({
    Value<String>? id,
    Value<String>? operationId,
    Value<String>? courseClassId,
    Value<String?>? registrationId,
    Value<String>? action,
    Value<String>? status,
    Value<String>? payload,
    Value<String?>? errorCode,
    Value<String?>? errorMessage,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PendingRegistrationLocalCompanion(
      id: id ?? this.id,
      operationId: operationId ?? this.operationId,
      courseClassId: courseClassId ?? this.courseClassId,
      registrationId: registrationId ?? this.registrationId,
      action: action ?? this.action,
      status: status ?? this.status,
      payload: payload ?? this.payload,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (courseClassId.present) {
      map['course_class_id'] = Variable<String>(courseClassId.value);
    }
    if (registrationId.present) {
      map['registration_id'] = Variable<String>(registrationId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<String>(errorCode.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingRegistrationLocalCompanion(')
          ..write('id: $id, ')
          ..write('operationId: $operationId, ')
          ..write('courseClassId: $courseClassId, ')
          ..write('registrationId: $registrationId, ')
          ..write('action: $action, ')
          ..write('status: $status, ')
          ..write('payload: $payload, ')
          ..write('errorCode: $errorCode, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncAtMeta = const VerificationMeta(
    'lastSyncAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncAt = GeneratedColumn<DateTime>(
    'last_sync_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [userId, lastSyncAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('last_sync_at')) {
      context.handle(
        _lastSyncAtMeta,
        lastSyncAt.isAcceptableOrUnknown(
          data['last_sync_at']!,
          _lastSyncAtMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  SyncMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      lastSyncAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataData extends DataClass
    implements Insertable<SyncMetadataData> {
  final String userId;
  final DateTime? lastSyncAt;
  final DateTime updatedAt;
  const SyncMetadataData({
    required this.userId,
    this.lastSyncAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || lastSyncAt != null) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      userId: Value(userId),
      lastSyncAt: lastSyncAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataData(
      userId: serializer.fromJson<String>(json['userId']),
      lastSyncAt: serializer.fromJson<DateTime?>(json['lastSyncAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'lastSyncAt': serializer.toJson<DateTime?>(lastSyncAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncMetadataData copyWith({
    String? userId,
    Value<DateTime?> lastSyncAt = const Value.absent(),
    DateTime? updatedAt,
  }) => SyncMetadataData(
    userId: userId ?? this.userId,
    lastSyncAt: lastSyncAt.present ? lastSyncAt.value : this.lastSyncAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncMetadataData copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataData(
      userId: data.userId.present ? data.userId.value : this.userId,
      lastSyncAt: data.lastSyncAt.present
          ? data.lastSyncAt.value
          : this.lastSyncAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataData(')
          ..write('userId: $userId, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, lastSyncAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataData &&
          other.userId == this.userId &&
          other.lastSyncAt == this.lastSyncAt &&
          other.updatedAt == this.updatedAt);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataData> {
  final Value<String> userId;
  final Value<DateTime?> lastSyncAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.userId = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String userId,
    this.lastSyncAt = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       updatedAt = Value(updatedAt);
  static Insertable<SyncMetadataData> custom({
    Expression<String>? userId,
    Expression<DateTime>? lastSyncAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (lastSyncAt != null) 'last_sync_at': lastSyncAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith({
    Value<String>? userId,
    Value<DateTime?>? lastSyncAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncMetadataCompanion(
      userId: userId ?? this.userId,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (lastSyncAt.present) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('userId: $userId, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudentProfileCacheTable extends StudentProfileCache
    with TableInfo<$StudentProfileCacheTable, StudentProfileCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentProfileCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    studentId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_profile_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentProfileCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  StudentProfileCacheData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentProfileCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $StudentProfileCacheTable createAlias(String alias) {
    return $StudentProfileCacheTable(attachedDatabase, alias);
  }
}

class StudentProfileCacheData extends DataClass
    implements Insertable<StudentProfileCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String studentId;
  final String payload;
  final DateTime syncedAt;
  const StudentProfileCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.studentId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['student_id'] = Variable<String>(studentId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  StudentProfileCacheCompanion toCompanion(bool nullToAbsent) {
    return StudentProfileCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      studentId: Value(studentId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory StudentProfileCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentProfileCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      studentId: serializer.fromJson<String>(json['studentId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'studentId': serializer.toJson<String>(studentId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  StudentProfileCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? studentId,
    String? payload,
    DateTime? syncedAt,
  }) => StudentProfileCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    studentId: studentId ?? this.studentId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  StudentProfileCacheData copyWithCompanion(StudentProfileCacheCompanion data) {
    return StudentProfileCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentProfileCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, studentId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentProfileCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.studentId == this.studentId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class StudentProfileCacheCompanion
    extends UpdateCompanion<StudentProfileCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> studentId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const StudentProfileCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.studentId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentProfileCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String studentId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : studentId = Value(studentId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<StudentProfileCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? studentId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (studentId != null) 'student_id': studentId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentProfileCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? studentId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return StudentProfileCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      studentId: studentId ?? this.studentId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentProfileCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingProgramCacheTable extends TrainingProgramCache
    with TableInfo<$TrainingProgramCacheTable, TrainingProgramCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingProgramCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    studentId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_program_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainingProgramCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  TrainingProgramCacheData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingProgramCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $TrainingProgramCacheTable createAlias(String alias) {
    return $TrainingProgramCacheTable(attachedDatabase, alias);
  }
}

class TrainingProgramCacheData extends DataClass
    implements Insertable<TrainingProgramCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String studentId;
  final String payload;
  final DateTime syncedAt;
  const TrainingProgramCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.studentId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['student_id'] = Variable<String>(studentId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  TrainingProgramCacheCompanion toCompanion(bool nullToAbsent) {
    return TrainingProgramCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      studentId: Value(studentId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory TrainingProgramCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingProgramCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      studentId: serializer.fromJson<String>(json['studentId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'studentId': serializer.toJson<String>(studentId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  TrainingProgramCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? studentId,
    String? payload,
    DateTime? syncedAt,
  }) => TrainingProgramCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    studentId: studentId ?? this.studentId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  TrainingProgramCacheData copyWithCompanion(
    TrainingProgramCacheCompanion data,
  ) {
    return TrainingProgramCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingProgramCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, studentId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingProgramCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.studentId == this.studentId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class TrainingProgramCacheCompanion
    extends UpdateCompanion<TrainingProgramCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> studentId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const TrainingProgramCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.studentId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingProgramCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String studentId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : studentId = Value(studentId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<TrainingProgramCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? studentId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (studentId != null) 'student_id': studentId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingProgramCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? studentId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return TrainingProgramCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      studentId: studentId ?? this.studentId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingProgramCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TranscriptCacheTable extends TranscriptCache
    with TableInfo<$TranscriptCacheTable, TranscriptCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranscriptCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    studentId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transcript_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<TranscriptCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  TranscriptCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranscriptCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $TranscriptCacheTable createAlias(String alias) {
    return $TranscriptCacheTable(attachedDatabase, alias);
  }
}

class TranscriptCacheData extends DataClass
    implements Insertable<TranscriptCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String studentId;
  final String payload;
  final DateTime syncedAt;
  const TranscriptCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.studentId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['student_id'] = Variable<String>(studentId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  TranscriptCacheCompanion toCompanion(bool nullToAbsent) {
    return TranscriptCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      studentId: Value(studentId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory TranscriptCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranscriptCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      studentId: serializer.fromJson<String>(json['studentId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'studentId': serializer.toJson<String>(studentId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  TranscriptCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? studentId,
    String? payload,
    DateTime? syncedAt,
  }) => TranscriptCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    studentId: studentId ?? this.studentId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  TranscriptCacheData copyWithCompanion(TranscriptCacheCompanion data) {
    return TranscriptCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, studentId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranscriptCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.studentId == this.studentId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class TranscriptCacheCompanion extends UpdateCompanion<TranscriptCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> studentId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const TranscriptCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.studentId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TranscriptCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String studentId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : studentId = Value(studentId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<TranscriptCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? studentId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (studentId != null) 'student_id': studentId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TranscriptCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? studentId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return TranscriptCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      studentId: studentId ?? this.studentId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OpenClassesCacheTable extends OpenClassesCache
    with TableInfo<$OpenClassesCacheTable, OpenClassesCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OpenClassesCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _semesterIdMeta = const VerificationMeta(
    'semesterId',
  );
  @override
  late final GeneratedColumn<String> semesterId = GeneratedColumn<String>(
    'semester_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    semesterId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'open_classes_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<OpenClassesCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('semester_id')) {
      context.handle(
        _semesterIdMeta,
        semesterId.isAcceptableOrUnknown(data['semester_id']!, _semesterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semesterIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {semesterId};
  @override
  OpenClassesCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OpenClassesCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      semesterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}semester_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $OpenClassesCacheTable createAlias(String alias) {
    return $OpenClassesCacheTable(attachedDatabase, alias);
  }
}

class OpenClassesCacheData extends DataClass
    implements Insertable<OpenClassesCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String semesterId;
  final String payload;
  final DateTime syncedAt;
  const OpenClassesCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.semesterId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['semester_id'] = Variable<String>(semesterId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  OpenClassesCacheCompanion toCompanion(bool nullToAbsent) {
    return OpenClassesCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      semesterId: Value(semesterId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory OpenClassesCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OpenClassesCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      semesterId: serializer.fromJson<String>(json['semesterId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'semesterId': serializer.toJson<String>(semesterId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  OpenClassesCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? semesterId,
    String? payload,
    DateTime? syncedAt,
  }) => OpenClassesCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    semesterId: semesterId ?? this.semesterId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  OpenClassesCacheData copyWithCompanion(OpenClassesCacheCompanion data) {
    return OpenClassesCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      semesterId: data.semesterId.present
          ? data.semesterId.value
          : this.semesterId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OpenClassesCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('semesterId: $semesterId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, semesterId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OpenClassesCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.semesterId == this.semesterId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class OpenClassesCacheCompanion extends UpdateCompanion<OpenClassesCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> semesterId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const OpenClassesCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.semesterId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OpenClassesCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String semesterId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : semesterId = Value(semesterId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<OpenClassesCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? semesterId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (semesterId != null) 'semester_id': semesterId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OpenClassesCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? semesterId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return OpenClassesCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      semesterId: semesterId ?? this.semesterId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (semesterId.present) {
      map['semester_id'] = Variable<String>(semesterId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OpenClassesCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('semesterId: $semesterId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RegisteredCoursesCacheTable extends RegisteredCoursesCache
    with TableInfo<$RegisteredCoursesCacheTable, RegisteredCoursesCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegisteredCoursesCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _semesterIdMeta = const VerificationMeta(
    'semesterId',
  );
  @override
  late final GeneratedColumn<String> semesterId = GeneratedColumn<String>(
    'semester_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    semesterId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'registered_courses_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<RegisteredCoursesCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('semester_id')) {
      context.handle(
        _semesterIdMeta,
        semesterId.isAcceptableOrUnknown(data['semester_id']!, _semesterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semesterIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {semesterId};
  @override
  RegisteredCoursesCacheData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegisteredCoursesCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      semesterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}semester_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $RegisteredCoursesCacheTable createAlias(String alias) {
    return $RegisteredCoursesCacheTable(attachedDatabase, alias);
  }
}

class RegisteredCoursesCacheData extends DataClass
    implements Insertable<RegisteredCoursesCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String semesterId;
  final String payload;
  final DateTime syncedAt;
  const RegisteredCoursesCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.semesterId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['semester_id'] = Variable<String>(semesterId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  RegisteredCoursesCacheCompanion toCompanion(bool nullToAbsent) {
    return RegisteredCoursesCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      semesterId: Value(semesterId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory RegisteredCoursesCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegisteredCoursesCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      semesterId: serializer.fromJson<String>(json['semesterId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'semesterId': serializer.toJson<String>(semesterId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  RegisteredCoursesCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? semesterId,
    String? payload,
    DateTime? syncedAt,
  }) => RegisteredCoursesCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    semesterId: semesterId ?? this.semesterId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  RegisteredCoursesCacheData copyWithCompanion(
    RegisteredCoursesCacheCompanion data,
  ) {
    return RegisteredCoursesCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      semesterId: data.semesterId.present
          ? data.semesterId.value
          : this.semesterId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegisteredCoursesCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('semesterId: $semesterId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, semesterId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegisteredCoursesCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.semesterId == this.semesterId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class RegisteredCoursesCacheCompanion
    extends UpdateCompanion<RegisteredCoursesCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> semesterId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const RegisteredCoursesCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.semesterId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RegisteredCoursesCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String semesterId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : semesterId = Value(semesterId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<RegisteredCoursesCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? semesterId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (semesterId != null) 'semester_id': semesterId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RegisteredCoursesCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? semesterId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return RegisteredCoursesCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      semesterId: semesterId ?? this.semesterId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (semesterId.present) {
      map['semester_id'] = Variable<String>(semesterId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegisteredCoursesCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('semesterId: $semesterId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CurrentSemesterCacheTable extends CurrentSemesterCache
    with TableInfo<$CurrentSemesterCacheTable, CurrentSemesterCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrentSemesterCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    cacheKey,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'current_semester_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<CurrentSemesterCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  CurrentSemesterCacheData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrentSemesterCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $CurrentSemesterCacheTable createAlias(String alias) {
    return $CurrentSemesterCacheTable(attachedDatabase, alias);
  }
}

class CurrentSemesterCacheData extends DataClass
    implements Insertable<CurrentSemesterCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String cacheKey;
  final String payload;
  final DateTime syncedAt;
  const CurrentSemesterCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.cacheKey,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['cache_key'] = Variable<String>(cacheKey);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  CurrentSemesterCacheCompanion toCompanion(bool nullToAbsent) {
    return CurrentSemesterCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      cacheKey: Value(cacheKey),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory CurrentSemesterCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrentSemesterCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'cacheKey': serializer.toJson<String>(cacheKey),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  CurrentSemesterCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? cacheKey,
    String? payload,
    DateTime? syncedAt,
  }) => CurrentSemesterCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    cacheKey: cacheKey ?? this.cacheKey,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  CurrentSemesterCacheData copyWithCompanion(
    CurrentSemesterCacheCompanion data,
  ) {
    return CurrentSemesterCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrentSemesterCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, cacheKey, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrentSemesterCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.cacheKey == this.cacheKey &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class CurrentSemesterCacheCompanion
    extends UpdateCompanion<CurrentSemesterCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> cacheKey;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const CurrentSemesterCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.cacheKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrentSemesterCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String cacheKey,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<CurrentSemesterCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? cacheKey,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (cacheKey != null) 'cache_key': cacheKey,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrentSemesterCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? cacheKey,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return CurrentSemesterCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      cacheKey: cacheKey ?? this.cacheKey,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrentSemesterCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CourseOpeningRequestsCacheTable extends CourseOpeningRequestsCache
    with
        TableInfo<
          $CourseOpeningRequestsCacheTable,
          CourseOpeningRequestsCacheData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseOpeningRequestsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    cacheKey,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_opening_requests_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseOpeningRequestsCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  CourseOpeningRequestsCacheData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseOpeningRequestsCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $CourseOpeningRequestsCacheTable createAlias(String alias) {
    return $CourseOpeningRequestsCacheTable(attachedDatabase, alias);
  }
}

class CourseOpeningRequestsCacheData extends DataClass
    implements Insertable<CourseOpeningRequestsCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String cacheKey;
  final String payload;
  final DateTime syncedAt;
  const CourseOpeningRequestsCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.cacheKey,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['cache_key'] = Variable<String>(cacheKey);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  CourseOpeningRequestsCacheCompanion toCompanion(bool nullToAbsent) {
    return CourseOpeningRequestsCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      cacheKey: Value(cacheKey),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory CourseOpeningRequestsCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseOpeningRequestsCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'cacheKey': serializer.toJson<String>(cacheKey),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  CourseOpeningRequestsCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? cacheKey,
    String? payload,
    DateTime? syncedAt,
  }) => CourseOpeningRequestsCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    cacheKey: cacheKey ?? this.cacheKey,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  CourseOpeningRequestsCacheData copyWithCompanion(
    CourseOpeningRequestsCacheCompanion data,
  ) {
    return CourseOpeningRequestsCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseOpeningRequestsCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, cacheKey, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseOpeningRequestsCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.cacheKey == this.cacheKey &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class CourseOpeningRequestsCacheCompanion
    extends UpdateCompanion<CourseOpeningRequestsCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> cacheKey;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const CourseOpeningRequestsCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.cacheKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseOpeningRequestsCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String cacheKey,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<CourseOpeningRequestsCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? cacheKey,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (cacheKey != null) 'cache_key': cacheKey,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseOpeningRequestsCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? cacheKey,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return CourseOpeningRequestsCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      cacheKey: cacheKey ?? this.cacheKey,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseOpeningRequestsCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LecturerProfileCacheTable extends LecturerProfileCache
    with TableInfo<$LecturerProfileCacheTable, LecturerProfileCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LecturerProfileCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lecturerIdMeta = const VerificationMeta(
    'lecturerId',
  );
  @override
  late final GeneratedColumn<String> lecturerId = GeneratedColumn<String>(
    'lecturer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    lecturerId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lecturer_profile_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<LecturerProfileCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('lecturer_id')) {
      context.handle(
        _lecturerIdMeta,
        lecturerId.isAcceptableOrUnknown(data['lecturer_id']!, _lecturerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lecturerIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lecturerId};
  @override
  LecturerProfileCacheData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LecturerProfileCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      lecturerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lecturer_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $LecturerProfileCacheTable createAlias(String alias) {
    return $LecturerProfileCacheTable(attachedDatabase, alias);
  }
}

class LecturerProfileCacheData extends DataClass
    implements Insertable<LecturerProfileCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String lecturerId;
  final String payload;
  final DateTime syncedAt;
  const LecturerProfileCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.lecturerId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['lecturer_id'] = Variable<String>(lecturerId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  LecturerProfileCacheCompanion toCompanion(bool nullToAbsent) {
    return LecturerProfileCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      lecturerId: Value(lecturerId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory LecturerProfileCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LecturerProfileCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      lecturerId: serializer.fromJson<String>(json['lecturerId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'lecturerId': serializer.toJson<String>(lecturerId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  LecturerProfileCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? lecturerId,
    String? payload,
    DateTime? syncedAt,
  }) => LecturerProfileCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    lecturerId: lecturerId ?? this.lecturerId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  LecturerProfileCacheData copyWithCompanion(
    LecturerProfileCacheCompanion data,
  ) {
    return LecturerProfileCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      lecturerId: data.lecturerId.present
          ? data.lecturerId.value
          : this.lecturerId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LecturerProfileCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('lecturerId: $lecturerId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, lecturerId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LecturerProfileCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.lecturerId == this.lecturerId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class LecturerProfileCacheCompanion
    extends UpdateCompanion<LecturerProfileCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> lecturerId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const LecturerProfileCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.lecturerId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LecturerProfileCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String lecturerId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : lecturerId = Value(lecturerId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<LecturerProfileCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? lecturerId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (lecturerId != null) 'lecturer_id': lecturerId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LecturerProfileCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? lecturerId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return LecturerProfileCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      lecturerId: lecturerId ?? this.lecturerId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (lecturerId.present) {
      map['lecturer_id'] = Variable<String>(lecturerId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LecturerProfileCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('lecturerId: $lecturerId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MyClassesCacheTable extends MyClassesCache
    with TableInfo<$MyClassesCacheTable, MyClassesCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyClassesCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lecturerIdMeta = const VerificationMeta(
    'lecturerId',
  );
  @override
  late final GeneratedColumn<String> lecturerId = GeneratedColumn<String>(
    'lecturer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    lecturerId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_classes_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<MyClassesCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('lecturer_id')) {
      context.handle(
        _lecturerIdMeta,
        lecturerId.isAcceptableOrUnknown(data['lecturer_id']!, _lecturerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lecturerIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lecturerId};
  @override
  MyClassesCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyClassesCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      lecturerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lecturer_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $MyClassesCacheTable createAlias(String alias) {
    return $MyClassesCacheTable(attachedDatabase, alias);
  }
}

class MyClassesCacheData extends DataClass
    implements Insertable<MyClassesCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String lecturerId;
  final String payload;
  final DateTime syncedAt;
  const MyClassesCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.lecturerId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['lecturer_id'] = Variable<String>(lecturerId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  MyClassesCacheCompanion toCompanion(bool nullToAbsent) {
    return MyClassesCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      lecturerId: Value(lecturerId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory MyClassesCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyClassesCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      lecturerId: serializer.fromJson<String>(json['lecturerId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'lecturerId': serializer.toJson<String>(lecturerId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  MyClassesCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? lecturerId,
    String? payload,
    DateTime? syncedAt,
  }) => MyClassesCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    lecturerId: lecturerId ?? this.lecturerId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  MyClassesCacheData copyWithCompanion(MyClassesCacheCompanion data) {
    return MyClassesCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      lecturerId: data.lecturerId.present
          ? data.lecturerId.value
          : this.lecturerId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyClassesCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('lecturerId: $lecturerId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, lecturerId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyClassesCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.lecturerId == this.lecturerId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class MyClassesCacheCompanion extends UpdateCompanion<MyClassesCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> lecturerId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const MyClassesCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.lecturerId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MyClassesCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String lecturerId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : lecturerId = Value(lecturerId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<MyClassesCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? lecturerId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (lecturerId != null) 'lecturer_id': lecturerId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MyClassesCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? lecturerId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return MyClassesCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      lecturerId: lecturerId ?? this.lecturerId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (lecturerId.present) {
      map['lecturer_id'] = Variable<String>(lecturerId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyClassesCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('lecturerId: $lecturerId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScheduleCacheTable extends ScheduleCache
    with TableInfo<$ScheduleCacheTable, ScheduleCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lecturerIdMeta = const VerificationMeta(
    'lecturerId',
  );
  @override
  late final GeneratedColumn<String> lecturerId = GeneratedColumn<String>(
    'lecturer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    lecturerId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('lecturer_id')) {
      context.handle(
        _lecturerIdMeta,
        lecturerId.isAcceptableOrUnknown(data['lecturer_id']!, _lecturerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lecturerIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lecturerId};
  @override
  ScheduleCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      lecturerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lecturer_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $ScheduleCacheTable createAlias(String alias) {
    return $ScheduleCacheTable(attachedDatabase, alias);
  }
}

class ScheduleCacheData extends DataClass
    implements Insertable<ScheduleCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String lecturerId;
  final String payload;
  final DateTime syncedAt;
  const ScheduleCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.lecturerId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['lecturer_id'] = Variable<String>(lecturerId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  ScheduleCacheCompanion toCompanion(bool nullToAbsent) {
    return ScheduleCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      lecturerId: Value(lecturerId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory ScheduleCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      lecturerId: serializer.fromJson<String>(json['lecturerId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'lecturerId': serializer.toJson<String>(lecturerId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  ScheduleCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? lecturerId,
    String? payload,
    DateTime? syncedAt,
  }) => ScheduleCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    lecturerId: lecturerId ?? this.lecturerId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  ScheduleCacheData copyWithCompanion(ScheduleCacheCompanion data) {
    return ScheduleCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      lecturerId: data.lecturerId.present
          ? data.lecturerId.value
          : this.lecturerId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('lecturerId: $lecturerId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, lecturerId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.lecturerId == this.lecturerId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class ScheduleCacheCompanion extends UpdateCompanion<ScheduleCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> lecturerId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const ScheduleCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.lecturerId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScheduleCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String lecturerId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : lecturerId = Value(lecturerId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<ScheduleCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? lecturerId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (lecturerId != null) 'lecturer_id': lecturerId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScheduleCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? lecturerId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return ScheduleCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      lecturerId: lecturerId ?? this.lecturerId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (lecturerId.present) {
      map['lecturer_id'] = Variable<String>(lecturerId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('lecturerId: $lecturerId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudentListCacheTable extends StudentListCache
    with TableInfo<$StudentListCacheTable, StudentListCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentListCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _courseClassIdMeta = const VerificationMeta(
    'courseClassId',
  );
  @override
  late final GeneratedColumn<String> courseClassId = GeneratedColumn<String>(
    'course_class_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    courseClassId,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_list_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentListCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('course_class_id')) {
      context.handle(
        _courseClassIdMeta,
        courseClassId.isAcceptableOrUnknown(
          data['course_class_id']!,
          _courseClassIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_courseClassIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {courseClassId};
  @override
  StudentListCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentListCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      courseClassId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}course_class_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $StudentListCacheTable createAlias(String alias) {
    return $StudentListCacheTable(attachedDatabase, alias);
  }
}

class StudentListCacheData extends DataClass
    implements Insertable<StudentListCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String courseClassId;
  final String payload;
  final DateTime syncedAt;
  const StudentListCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.courseClassId,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['course_class_id'] = Variable<String>(courseClassId);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  StudentListCacheCompanion toCompanion(bool nullToAbsent) {
    return StudentListCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      courseClassId: Value(courseClassId),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory StudentListCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentListCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      courseClassId: serializer.fromJson<String>(json['courseClassId']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'courseClassId': serializer.toJson<String>(courseClassId),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  StudentListCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? courseClassId,
    String? payload,
    DateTime? syncedAt,
  }) => StudentListCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    courseClassId: courseClassId ?? this.courseClassId,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  StudentListCacheData copyWithCompanion(StudentListCacheCompanion data) {
    return StudentListCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      courseClassId: data.courseClassId.present
          ? data.courseClassId.value
          : this.courseClassId,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentListCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('courseClassId: $courseClassId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, courseClassId, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentListCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.courseClassId == this.courseClassId &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class StudentListCacheCompanion extends UpdateCompanion<StudentListCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> courseClassId;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const StudentListCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.courseClassId = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentListCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String courseClassId,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : courseClassId = Value(courseClassId),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<StudentListCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? courseClassId,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (courseClassId != null) 'course_class_id': courseClassId,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentListCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? courseClassId,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return StudentListCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      courseClassId: courseClassId ?? this.courseClassId,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (courseClassId.present) {
      map['course_class_id'] = Variable<String>(courseClassId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentListCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('courseClassId: $courseClassId, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AdminDashboardCacheTable extends AdminDashboardCache
    with TableInfo<$AdminDashboardCacheTable, AdminDashboardCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminDashboardCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    cacheKey,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admin_dashboard_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdminDashboardCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  AdminDashboardCacheData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdminDashboardCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $AdminDashboardCacheTable createAlias(String alias) {
    return $AdminDashboardCacheTable(attachedDatabase, alias);
  }
}

class AdminDashboardCacheData extends DataClass
    implements Insertable<AdminDashboardCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String cacheKey;
  final String payload;
  final DateTime syncedAt;
  const AdminDashboardCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.cacheKey,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['cache_key'] = Variable<String>(cacheKey);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  AdminDashboardCacheCompanion toCompanion(bool nullToAbsent) {
    return AdminDashboardCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      cacheKey: Value(cacheKey),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory AdminDashboardCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdminDashboardCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'cacheKey': serializer.toJson<String>(cacheKey),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  AdminDashboardCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? cacheKey,
    String? payload,
    DateTime? syncedAt,
  }) => AdminDashboardCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    cacheKey: cacheKey ?? this.cacheKey,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  AdminDashboardCacheData copyWithCompanion(AdminDashboardCacheCompanion data) {
    return AdminDashboardCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdminDashboardCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, cacheKey, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminDashboardCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.cacheKey == this.cacheKey &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class AdminDashboardCacheCompanion
    extends UpdateCompanion<AdminDashboardCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> cacheKey;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const AdminDashboardCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.cacheKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdminDashboardCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String cacheKey,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<AdminDashboardCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? cacheKey,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (cacheKey != null) 'cache_key': cacheKey,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdminDashboardCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? cacheKey,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return AdminDashboardCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      cacheKey: cacheKey ?? this.cacheKey,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminDashboardCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CourseCacheTable extends CourseCache
    with TableInfo<$CourseCacheTable, CourseCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    cacheKey,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<CourseCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  CourseCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $CourseCacheTable createAlias(String alias) {
    return $CourseCacheTable(attachedDatabase, alias);
  }
}

class CourseCacheData extends DataClass implements Insertable<CourseCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String cacheKey;
  final String payload;
  final DateTime syncedAt;
  const CourseCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.cacheKey,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['cache_key'] = Variable<String>(cacheKey);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  CourseCacheCompanion toCompanion(bool nullToAbsent) {
    return CourseCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      cacheKey: Value(cacheKey),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory CourseCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'cacheKey': serializer.toJson<String>(cacheKey),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  CourseCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? cacheKey,
    String? payload,
    DateTime? syncedAt,
  }) => CourseCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    cacheKey: cacheKey ?? this.cacheKey,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  CourseCacheData copyWithCompanion(CourseCacheCompanion data) {
    return CourseCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CourseCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, cacheKey, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.cacheKey == this.cacheKey &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class CourseCacheCompanion extends UpdateCompanion<CourseCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> cacheKey;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const CourseCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.cacheKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CourseCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String cacheKey,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<CourseCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? cacheKey,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (cacheKey != null) 'cache_key': cacheKey,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CourseCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? cacheKey,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return CourseCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      cacheKey: cacheKey ?? this.cacheKey,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReportCacheTable extends ReportCache
    with TableInfo<$ReportCacheTable, ReportCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _cacheKeyMeta = const VerificationMeta(
    'cacheKey',
  );
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
    'cache_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serverUpdatedAt,
    version,
    cacheKey,
    payload,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'report_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReportCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('cache_key')) {
      context.handle(
        _cacheKeyMeta,
        cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cacheKey};
  @override
  ReportCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportCacheData(
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      cacheKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cache_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $ReportCacheTable createAlias(String alias) {
    return $ReportCacheTable(attachedDatabase, alias);
  }
}

class ReportCacheData extends DataClass implements Insertable<ReportCacheData> {
  final DateTime? serverUpdatedAt;
  final int version;
  final String cacheKey;
  final String payload;
  final DateTime syncedAt;
  const ReportCacheData({
    this.serverUpdatedAt,
    required this.version,
    required this.cacheKey,
    required this.payload,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    map['version'] = Variable<int>(version);
    map['cache_key'] = Variable<String>(cacheKey);
    map['payload'] = Variable<String>(payload);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  ReportCacheCompanion toCompanion(bool nullToAbsent) {
    return ReportCacheCompanion(
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      version: Value(version),
      cacheKey: Value(cacheKey),
      payload: Value(payload),
      syncedAt: Value(syncedAt),
    );
  }

  factory ReportCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportCacheData(
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      version: serializer.fromJson<int>(json['version']),
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      payload: serializer.fromJson<String>(json['payload']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'version': serializer.toJson<int>(version),
      'cacheKey': serializer.toJson<String>(cacheKey),
      'payload': serializer.toJson<String>(payload),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  ReportCacheData copyWith({
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    int? version,
    String? cacheKey,
    String? payload,
    DateTime? syncedAt,
  }) => ReportCacheData(
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    version: version ?? this.version,
    cacheKey: cacheKey ?? this.cacheKey,
    payload: payload ?? this.payload,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  ReportCacheData copyWithCompanion(ReportCacheCompanion data) {
    return ReportCacheData(
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      version: data.version.present ? data.version.value : this.version,
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      payload: data.payload.present ? data.payload.value : this.payload,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportCacheData(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serverUpdatedAt, version, cacheKey, payload, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportCacheData &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.version == this.version &&
          other.cacheKey == this.cacheKey &&
          other.payload == this.payload &&
          other.syncedAt == this.syncedAt);
}

class ReportCacheCompanion extends UpdateCompanion<ReportCacheData> {
  final Value<DateTime?> serverUpdatedAt;
  final Value<int> version;
  final Value<String> cacheKey;
  final Value<String> payload;
  final Value<DateTime> syncedAt;
  final Value<int> rowid;
  const ReportCacheCompanion({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.cacheKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReportCacheCompanion.insert({
    this.serverUpdatedAt = const Value.absent(),
    this.version = const Value.absent(),
    required String cacheKey,
    required String payload,
    required DateTime syncedAt,
    this.rowid = const Value.absent(),
  }) : cacheKey = Value(cacheKey),
       payload = Value(payload),
       syncedAt = Value(syncedAt);
  static Insertable<ReportCacheData> custom({
    Expression<DateTime>? serverUpdatedAt,
    Expression<int>? version,
    Expression<String>? cacheKey,
    Expression<String>? payload,
    Expression<DateTime>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (version != null) 'version': version,
      if (cacheKey != null) 'cache_key': cacheKey,
      if (payload != null) 'payload': payload,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReportCacheCompanion copyWith({
    Value<DateTime?>? serverUpdatedAt,
    Value<int>? version,
    Value<String>? cacheKey,
    Value<String>? payload,
    Value<DateTime>? syncedAt,
    Value<int>? rowid,
  }) {
    return ReportCacheCompanion(
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      version: version ?? this.version,
      cacheKey: cacheKey ?? this.cacheKey,
      payload: payload ?? this.payload,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportCacheCompanion(')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('version: $version, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('payload: $payload, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersLocalTable usersLocal = $UsersLocalTable(this);
  late final $SessionsLocalTable sessionsLocal = $SessionsLocalTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $PendingRegistrationLocalTable pendingRegistrationLocal =
      $PendingRegistrationLocalTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  late final $StudentProfileCacheTable studentProfileCache =
      $StudentProfileCacheTable(this);
  late final $TrainingProgramCacheTable trainingProgramCache =
      $TrainingProgramCacheTable(this);
  late final $TranscriptCacheTable transcriptCache = $TranscriptCacheTable(
    this,
  );
  late final $OpenClassesCacheTable openClassesCache = $OpenClassesCacheTable(
    this,
  );
  late final $RegisteredCoursesCacheTable registeredCoursesCache =
      $RegisteredCoursesCacheTable(this);
  late final $CurrentSemesterCacheTable currentSemesterCache =
      $CurrentSemesterCacheTable(this);
  late final $CourseOpeningRequestsCacheTable courseOpeningRequestsCache =
      $CourseOpeningRequestsCacheTable(this);
  late final $LecturerProfileCacheTable lecturerProfileCache =
      $LecturerProfileCacheTable(this);
  late final $MyClassesCacheTable myClassesCache = $MyClassesCacheTable(this);
  late final $ScheduleCacheTable scheduleCache = $ScheduleCacheTable(this);
  late final $StudentListCacheTable studentListCache = $StudentListCacheTable(
    this,
  );
  late final $AdminDashboardCacheTable adminDashboardCache =
      $AdminDashboardCacheTable(this);
  late final $CourseCacheTable courseCache = $CourseCacheTable(this);
  late final $ReportCacheTable reportCache = $ReportCacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usersLocal,
    sessionsLocal,
    syncQueue,
    pendingRegistrationLocal,
    syncMetadata,
    studentProfileCache,
    trainingProgramCache,
    transcriptCache,
    openClassesCache,
    registeredCoursesCache,
    currentSemesterCache,
    courseOpeningRequestsCache,
    lecturerProfileCache,
    myClassesCache,
    scheduleCache,
    studentListCache,
    adminDashboardCache,
    courseCache,
    reportCache,
  ];
}

typedef $$UsersLocalTableCreateCompanionBuilder =
    UsersLocalCompanion Function({
      required String id,
      required String authUserId,
      required String email,
      required String fullName,
      Value<String?> phone,
      Value<String?> avatar,
      required String role,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UsersLocalTableUpdateCompanionBuilder =
    UsersLocalCompanion Function({
      Value<String> id,
      Value<String> authUserId,
      Value<String> email,
      Value<String> fullName,
      Value<String?> phone,
      Value<String?> avatar,
      Value<String> role,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$UsersLocalTableFilterComposer
    extends Composer<_$AppDatabase, $UsersLocalTable> {
  $$UsersLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authUserId => $composableBuilder(
    column: $table.authUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersLocalTable> {
  $$UsersLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authUserId => $composableBuilder(
    column: $table.authUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersLocalTable> {
  $$UsersLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get authUserId => $composableBuilder(
    column: $table.authUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UsersLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersLocalTable,
          UsersLocalData,
          $$UsersLocalTableFilterComposer,
          $$UsersLocalTableOrderingComposer,
          $$UsersLocalTableAnnotationComposer,
          $$UsersLocalTableCreateCompanionBuilder,
          $$UsersLocalTableUpdateCompanionBuilder,
          (
            UsersLocalData,
            BaseReferences<_$AppDatabase, $UsersLocalTable, UsersLocalData>,
          ),
          UsersLocalData,
          PrefetchHooks Function()
        > {
  $$UsersLocalTableTableManager(_$AppDatabase db, $UsersLocalTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersLocalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> authUserId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersLocalCompanion(
                id: id,
                authUserId: authUserId,
                email: email,
                fullName: fullName,
                phone: phone,
                avatar: avatar,
                role: role,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String authUserId,
                required String email,
                required String fullName,
                Value<String?> phone = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                required String role,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersLocalCompanion.insert(
                id: id,
                authUserId: authUserId,
                email: email,
                fullName: fullName,
                phone: phone,
                avatar: avatar,
                role: role,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersLocalTable,
      UsersLocalData,
      $$UsersLocalTableFilterComposer,
      $$UsersLocalTableOrderingComposer,
      $$UsersLocalTableAnnotationComposer,
      $$UsersLocalTableCreateCompanionBuilder,
      $$UsersLocalTableUpdateCompanionBuilder,
      (
        UsersLocalData,
        BaseReferences<_$AppDatabase, $UsersLocalTable, UsersLocalData>,
      ),
      UsersLocalData,
      PrefetchHooks Function()
    >;
typedef $$SessionsLocalTableCreateCompanionBuilder =
    SessionsLocalCompanion Function({
      required String authUserId,
      required String email,
      required String role,
      Value<DateTime?> expiresAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SessionsLocalTableUpdateCompanionBuilder =
    SessionsLocalCompanion Function({
      Value<String> authUserId,
      Value<String> email,
      Value<String> role,
      Value<DateTime?> expiresAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SessionsLocalTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsLocalTable> {
  $$SessionsLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get authUserId => $composableBuilder(
    column: $table.authUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionsLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsLocalTable> {
  $$SessionsLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get authUserId => $composableBuilder(
    column: $table.authUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionsLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsLocalTable> {
  $$SessionsLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get authUserId => $composableBuilder(
    column: $table.authUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SessionsLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsLocalTable,
          SessionsLocalData,
          $$SessionsLocalTableFilterComposer,
          $$SessionsLocalTableOrderingComposer,
          $$SessionsLocalTableAnnotationComposer,
          $$SessionsLocalTableCreateCompanionBuilder,
          $$SessionsLocalTableUpdateCompanionBuilder,
          (
            SessionsLocalData,
            BaseReferences<
              _$AppDatabase,
              $SessionsLocalTable,
              SessionsLocalData
            >,
          ),
          SessionsLocalData,
          PrefetchHooks Function()
        > {
  $$SessionsLocalTableTableManager(_$AppDatabase db, $SessionsLocalTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsLocalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> authUserId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsLocalCompanion(
                authUserId: authUserId,
                email: email,
                role: role,
                expiresAt: expiresAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String authUserId,
                required String email,
                required String role,
                Value<DateTime?> expiresAt = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SessionsLocalCompanion.insert(
                authUserId: authUserId,
                email: email,
                role: role,
                expiresAt: expiresAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionsLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsLocalTable,
      SessionsLocalData,
      $$SessionsLocalTableFilterComposer,
      $$SessionsLocalTableOrderingComposer,
      $$SessionsLocalTableAnnotationComposer,
      $$SessionsLocalTableCreateCompanionBuilder,
      $$SessionsLocalTableUpdateCompanionBuilder,
      (
        SessionsLocalData,
        BaseReferences<_$AppDatabase, $SessionsLocalTable, SessionsLocalData>,
      ),
      SessionsLocalData,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      required String id,
      required String action,
      required String entity,
      Value<String?> entityId,
      Value<String> operationType,
      required String data,
      Value<String> status,
      Value<int> attemptCount,
      Value<String?> lastError,
      Value<String?> errorCode,
      Value<DateTime?> nextRetryAt,
      Value<String> clientId,
      Value<String> userId,
      Value<int?> baseVersion,
      Value<int?> serverVersion,
      required DateTime createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<String> id,
      Value<String> action,
      Value<String> entity,
      Value<String?> entityId,
      Value<String> operationType,
      Value<String> data,
      Value<String> status,
      Value<int> attemptCount,
      Value<String?> lastError,
      Value<String?> errorCode,
      Value<DateTime?> nextRetryAt,
      Value<String> clientId,
      Value<String> userId,
      Value<int?> baseVersion,
      Value<int?> serverVersion,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseVersion => $composableBuilder(
    column: $table.baseVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entity => $composableBuilder(
    column: $table.entity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseVersion => $composableBuilder(
    column: $table.baseVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entity =>
      $composableBuilder(column: $table.entity, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<String> get errorCode =>
      $composableBuilder(column: $table.errorCode, builder: (column) => column);

  GeneratedColumn<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get baseVersion => $composableBuilder(
    column: $table.baseVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get serverVersion => $composableBuilder(
    column: $table.serverVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> entity = const Value.absent(),
                Value<String?> entityId = const Value.absent(),
                Value<String> operationType = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<DateTime?> nextRetryAt = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int?> baseVersion = const Value.absent(),
                Value<int?> serverVersion = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                action: action,
                entity: entity,
                entityId: entityId,
                operationType: operationType,
                data: data,
                status: status,
                attemptCount: attemptCount,
                lastError: lastError,
                errorCode: errorCode,
                nextRetryAt: nextRetryAt,
                clientId: clientId,
                userId: userId,
                baseVersion: baseVersion,
                serverVersion: serverVersion,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String action,
                required String entity,
                Value<String?> entityId = const Value.absent(),
                Value<String> operationType = const Value.absent(),
                required String data,
                Value<String> status = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<DateTime?> nextRetryAt = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<int?> baseVersion = const Value.absent(),
                Value<int?> serverVersion = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                id: id,
                action: action,
                entity: entity,
                entityId: entityId,
                operationType: operationType,
                data: data,
                status: status,
                attemptCount: attemptCount,
                lastError: lastError,
                errorCode: errorCode,
                nextRetryAt: nextRetryAt,
                clientId: clientId,
                userId: userId,
                baseVersion: baseVersion,
                serverVersion: serverVersion,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;
typedef $$PendingRegistrationLocalTableCreateCompanionBuilder =
    PendingRegistrationLocalCompanion Function({
      required String id,
      required String operationId,
      required String courseClassId,
      Value<String?> registrationId,
      required String action,
      required String status,
      required String payload,
      Value<String?> errorCode,
      Value<String?> errorMessage,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PendingRegistrationLocalTableUpdateCompanionBuilder =
    PendingRegistrationLocalCompanion Function({
      Value<String> id,
      Value<String> operationId,
      Value<String> courseClassId,
      Value<String?> registrationId,
      Value<String> action,
      Value<String> status,
      Value<String> payload,
      Value<String?> errorCode,
      Value<String?> errorMessage,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PendingRegistrationLocalTableFilterComposer
    extends Composer<_$AppDatabase, $PendingRegistrationLocalTable> {
  $$PendingRegistrationLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registrationId => $composableBuilder(
    column: $table.registrationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingRegistrationLocalTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingRegistrationLocalTable> {
  $$PendingRegistrationLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registrationId => $composableBuilder(
    column: $table.registrationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingRegistrationLocalTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingRegistrationLocalTable> {
  $$PendingRegistrationLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registrationId => $composableBuilder(
    column: $table.registrationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get errorCode =>
      $composableBuilder(column: $table.errorCode, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PendingRegistrationLocalTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingRegistrationLocalTable,
          PendingRegistrationLocalData,
          $$PendingRegistrationLocalTableFilterComposer,
          $$PendingRegistrationLocalTableOrderingComposer,
          $$PendingRegistrationLocalTableAnnotationComposer,
          $$PendingRegistrationLocalTableCreateCompanionBuilder,
          $$PendingRegistrationLocalTableUpdateCompanionBuilder,
          (
            PendingRegistrationLocalData,
            BaseReferences<
              _$AppDatabase,
              $PendingRegistrationLocalTable,
              PendingRegistrationLocalData
            >,
          ),
          PendingRegistrationLocalData,
          PrefetchHooks Function()
        > {
  $$PendingRegistrationLocalTableTableManager(
    _$AppDatabase db,
    $PendingRegistrationLocalTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingRegistrationLocalTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PendingRegistrationLocalTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PendingRegistrationLocalTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> operationId = const Value.absent(),
                Value<String> courseClassId = const Value.absent(),
                Value<String?> registrationId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingRegistrationLocalCompanion(
                id: id,
                operationId: operationId,
                courseClassId: courseClassId,
                registrationId: registrationId,
                action: action,
                status: status,
                payload: payload,
                errorCode: errorCode,
                errorMessage: errorMessage,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String operationId,
                required String courseClassId,
                Value<String?> registrationId = const Value.absent(),
                required String action,
                required String status,
                required String payload,
                Value<String?> errorCode = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PendingRegistrationLocalCompanion.insert(
                id: id,
                operationId: operationId,
                courseClassId: courseClassId,
                registrationId: registrationId,
                action: action,
                status: status,
                payload: payload,
                errorCode: errorCode,
                errorMessage: errorMessage,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingRegistrationLocalTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingRegistrationLocalTable,
      PendingRegistrationLocalData,
      $$PendingRegistrationLocalTableFilterComposer,
      $$PendingRegistrationLocalTableOrderingComposer,
      $$PendingRegistrationLocalTableAnnotationComposer,
      $$PendingRegistrationLocalTableCreateCompanionBuilder,
      $$PendingRegistrationLocalTableUpdateCompanionBuilder,
      (
        PendingRegistrationLocalData,
        BaseReferences<
          _$AppDatabase,
          $PendingRegistrationLocalTable,
          PendingRegistrationLocalData
        >,
      ),
      PendingRegistrationLocalData,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadataTableCreateCompanionBuilder =
    SyncMetadataCompanion Function({
      required String userId,
      Value<DateTime?> lastSyncAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SyncMetadataTableUpdateCompanionBuilder =
    SyncMetadataCompanion Function({
      Value<String> userId,
      Value<DateTime?> lastSyncAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadataTable,
          SyncMetadataData,
          $$SyncMetadataTableFilterComposer,
          $$SyncMetadataTableOrderingComposer,
          $$SyncMetadataTableAnnotationComposer,
          $$SyncMetadataTableCreateCompanionBuilder,
          $$SyncMetadataTableUpdateCompanionBuilder,
          (
            SyncMetadataData,
            BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>,
          ),
          SyncMetadataData,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableManager(_$AppDatabase db, $SyncMetadataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion(
                userId: userId,
                lastSyncAt: lastSyncAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                Value<DateTime?> lastSyncAt = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataCompanion.insert(
                userId: userId,
                lastSyncAt: lastSyncAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadataTable,
      SyncMetadataData,
      $$SyncMetadataTableFilterComposer,
      $$SyncMetadataTableOrderingComposer,
      $$SyncMetadataTableAnnotationComposer,
      $$SyncMetadataTableCreateCompanionBuilder,
      $$SyncMetadataTableUpdateCompanionBuilder,
      (
        SyncMetadataData,
        BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>,
      ),
      SyncMetadataData,
      PrefetchHooks Function()
    >;
typedef $$StudentProfileCacheTableCreateCompanionBuilder =
    StudentProfileCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String studentId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$StudentProfileCacheTableUpdateCompanionBuilder =
    StudentProfileCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> studentId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$StudentProfileCacheTableFilterComposer
    extends Composer<_$AppDatabase, $StudentProfileCacheTable> {
  $$StudentProfileCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudentProfileCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentProfileCacheTable> {
  $$StudentProfileCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudentProfileCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentProfileCacheTable> {
  $$StudentProfileCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$StudentProfileCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentProfileCacheTable,
          StudentProfileCacheData,
          $$StudentProfileCacheTableFilterComposer,
          $$StudentProfileCacheTableOrderingComposer,
          $$StudentProfileCacheTableAnnotationComposer,
          $$StudentProfileCacheTableCreateCompanionBuilder,
          $$StudentProfileCacheTableUpdateCompanionBuilder,
          (
            StudentProfileCacheData,
            BaseReferences<
              _$AppDatabase,
              $StudentProfileCacheTable,
              StudentProfileCacheData
            >,
          ),
          StudentProfileCacheData,
          PrefetchHooks Function()
        > {
  $$StudentProfileCacheTableTableManager(
    _$AppDatabase db,
    $StudentProfileCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentProfileCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentProfileCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$StudentProfileCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> studentId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentProfileCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                studentId: studentId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String studentId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => StudentProfileCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                studentId: studentId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudentProfileCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentProfileCacheTable,
      StudentProfileCacheData,
      $$StudentProfileCacheTableFilterComposer,
      $$StudentProfileCacheTableOrderingComposer,
      $$StudentProfileCacheTableAnnotationComposer,
      $$StudentProfileCacheTableCreateCompanionBuilder,
      $$StudentProfileCacheTableUpdateCompanionBuilder,
      (
        StudentProfileCacheData,
        BaseReferences<
          _$AppDatabase,
          $StudentProfileCacheTable,
          StudentProfileCacheData
        >,
      ),
      StudentProfileCacheData,
      PrefetchHooks Function()
    >;
typedef $$TrainingProgramCacheTableCreateCompanionBuilder =
    TrainingProgramCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String studentId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$TrainingProgramCacheTableUpdateCompanionBuilder =
    TrainingProgramCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> studentId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$TrainingProgramCacheTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingProgramCacheTable> {
  $$TrainingProgramCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrainingProgramCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingProgramCacheTable> {
  $$TrainingProgramCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrainingProgramCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingProgramCacheTable> {
  $$TrainingProgramCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$TrainingProgramCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainingProgramCacheTable,
          TrainingProgramCacheData,
          $$TrainingProgramCacheTableFilterComposer,
          $$TrainingProgramCacheTableOrderingComposer,
          $$TrainingProgramCacheTableAnnotationComposer,
          $$TrainingProgramCacheTableCreateCompanionBuilder,
          $$TrainingProgramCacheTableUpdateCompanionBuilder,
          (
            TrainingProgramCacheData,
            BaseReferences<
              _$AppDatabase,
              $TrainingProgramCacheTable,
              TrainingProgramCacheData
            >,
          ),
          TrainingProgramCacheData,
          PrefetchHooks Function()
        > {
  $$TrainingProgramCacheTableTableManager(
    _$AppDatabase db,
    $TrainingProgramCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingProgramCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingProgramCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TrainingProgramCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> studentId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainingProgramCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                studentId: studentId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String studentId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => TrainingProgramCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                studentId: studentId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrainingProgramCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainingProgramCacheTable,
      TrainingProgramCacheData,
      $$TrainingProgramCacheTableFilterComposer,
      $$TrainingProgramCacheTableOrderingComposer,
      $$TrainingProgramCacheTableAnnotationComposer,
      $$TrainingProgramCacheTableCreateCompanionBuilder,
      $$TrainingProgramCacheTableUpdateCompanionBuilder,
      (
        TrainingProgramCacheData,
        BaseReferences<
          _$AppDatabase,
          $TrainingProgramCacheTable,
          TrainingProgramCacheData
        >,
      ),
      TrainingProgramCacheData,
      PrefetchHooks Function()
    >;
typedef $$TranscriptCacheTableCreateCompanionBuilder =
    TranscriptCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String studentId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$TranscriptCacheTableUpdateCompanionBuilder =
    TranscriptCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> studentId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$TranscriptCacheTableFilterComposer
    extends Composer<_$AppDatabase, $TranscriptCacheTable> {
  $$TranscriptCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TranscriptCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $TranscriptCacheTable> {
  $$TranscriptCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TranscriptCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $TranscriptCacheTable> {
  $$TranscriptCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$TranscriptCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TranscriptCacheTable,
          TranscriptCacheData,
          $$TranscriptCacheTableFilterComposer,
          $$TranscriptCacheTableOrderingComposer,
          $$TranscriptCacheTableAnnotationComposer,
          $$TranscriptCacheTableCreateCompanionBuilder,
          $$TranscriptCacheTableUpdateCompanionBuilder,
          (
            TranscriptCacheData,
            BaseReferences<
              _$AppDatabase,
              $TranscriptCacheTable,
              TranscriptCacheData
            >,
          ),
          TranscriptCacheData,
          PrefetchHooks Function()
        > {
  $$TranscriptCacheTableTableManager(
    _$AppDatabase db,
    $TranscriptCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TranscriptCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TranscriptCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TranscriptCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> studentId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TranscriptCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                studentId: studentId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String studentId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => TranscriptCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                studentId: studentId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TranscriptCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TranscriptCacheTable,
      TranscriptCacheData,
      $$TranscriptCacheTableFilterComposer,
      $$TranscriptCacheTableOrderingComposer,
      $$TranscriptCacheTableAnnotationComposer,
      $$TranscriptCacheTableCreateCompanionBuilder,
      $$TranscriptCacheTableUpdateCompanionBuilder,
      (
        TranscriptCacheData,
        BaseReferences<
          _$AppDatabase,
          $TranscriptCacheTable,
          TranscriptCacheData
        >,
      ),
      TranscriptCacheData,
      PrefetchHooks Function()
    >;
typedef $$OpenClassesCacheTableCreateCompanionBuilder =
    OpenClassesCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String semesterId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$OpenClassesCacheTableUpdateCompanionBuilder =
    OpenClassesCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> semesterId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$OpenClassesCacheTableFilterComposer
    extends Composer<_$AppDatabase, $OpenClassesCacheTable> {
  $$OpenClassesCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get semesterId => $composableBuilder(
    column: $table.semesterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OpenClassesCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $OpenClassesCacheTable> {
  $$OpenClassesCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semesterId => $composableBuilder(
    column: $table.semesterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OpenClassesCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $OpenClassesCacheTable> {
  $$OpenClassesCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get semesterId => $composableBuilder(
    column: $table.semesterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$OpenClassesCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OpenClassesCacheTable,
          OpenClassesCacheData,
          $$OpenClassesCacheTableFilterComposer,
          $$OpenClassesCacheTableOrderingComposer,
          $$OpenClassesCacheTableAnnotationComposer,
          $$OpenClassesCacheTableCreateCompanionBuilder,
          $$OpenClassesCacheTableUpdateCompanionBuilder,
          (
            OpenClassesCacheData,
            BaseReferences<
              _$AppDatabase,
              $OpenClassesCacheTable,
              OpenClassesCacheData
            >,
          ),
          OpenClassesCacheData,
          PrefetchHooks Function()
        > {
  $$OpenClassesCacheTableTableManager(
    _$AppDatabase db,
    $OpenClassesCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OpenClassesCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OpenClassesCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OpenClassesCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> semesterId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OpenClassesCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                semesterId: semesterId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String semesterId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => OpenClassesCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                semesterId: semesterId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OpenClassesCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OpenClassesCacheTable,
      OpenClassesCacheData,
      $$OpenClassesCacheTableFilterComposer,
      $$OpenClassesCacheTableOrderingComposer,
      $$OpenClassesCacheTableAnnotationComposer,
      $$OpenClassesCacheTableCreateCompanionBuilder,
      $$OpenClassesCacheTableUpdateCompanionBuilder,
      (
        OpenClassesCacheData,
        BaseReferences<
          _$AppDatabase,
          $OpenClassesCacheTable,
          OpenClassesCacheData
        >,
      ),
      OpenClassesCacheData,
      PrefetchHooks Function()
    >;
typedef $$RegisteredCoursesCacheTableCreateCompanionBuilder =
    RegisteredCoursesCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String semesterId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$RegisteredCoursesCacheTableUpdateCompanionBuilder =
    RegisteredCoursesCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> semesterId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$RegisteredCoursesCacheTableFilterComposer
    extends Composer<_$AppDatabase, $RegisteredCoursesCacheTable> {
  $$RegisteredCoursesCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get semesterId => $composableBuilder(
    column: $table.semesterId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RegisteredCoursesCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $RegisteredCoursesCacheTable> {
  $$RegisteredCoursesCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semesterId => $composableBuilder(
    column: $table.semesterId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RegisteredCoursesCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $RegisteredCoursesCacheTable> {
  $$RegisteredCoursesCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get semesterId => $composableBuilder(
    column: $table.semesterId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$RegisteredCoursesCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RegisteredCoursesCacheTable,
          RegisteredCoursesCacheData,
          $$RegisteredCoursesCacheTableFilterComposer,
          $$RegisteredCoursesCacheTableOrderingComposer,
          $$RegisteredCoursesCacheTableAnnotationComposer,
          $$RegisteredCoursesCacheTableCreateCompanionBuilder,
          $$RegisteredCoursesCacheTableUpdateCompanionBuilder,
          (
            RegisteredCoursesCacheData,
            BaseReferences<
              _$AppDatabase,
              $RegisteredCoursesCacheTable,
              RegisteredCoursesCacheData
            >,
          ),
          RegisteredCoursesCacheData,
          PrefetchHooks Function()
        > {
  $$RegisteredCoursesCacheTableTableManager(
    _$AppDatabase db,
    $RegisteredCoursesCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RegisteredCoursesCacheTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RegisteredCoursesCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RegisteredCoursesCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> semesterId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RegisteredCoursesCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                semesterId: semesterId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String semesterId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => RegisteredCoursesCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                semesterId: semesterId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RegisteredCoursesCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RegisteredCoursesCacheTable,
      RegisteredCoursesCacheData,
      $$RegisteredCoursesCacheTableFilterComposer,
      $$RegisteredCoursesCacheTableOrderingComposer,
      $$RegisteredCoursesCacheTableAnnotationComposer,
      $$RegisteredCoursesCacheTableCreateCompanionBuilder,
      $$RegisteredCoursesCacheTableUpdateCompanionBuilder,
      (
        RegisteredCoursesCacheData,
        BaseReferences<
          _$AppDatabase,
          $RegisteredCoursesCacheTable,
          RegisteredCoursesCacheData
        >,
      ),
      RegisteredCoursesCacheData,
      PrefetchHooks Function()
    >;
typedef $$CurrentSemesterCacheTableCreateCompanionBuilder =
    CurrentSemesterCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String cacheKey,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$CurrentSemesterCacheTableUpdateCompanionBuilder =
    CurrentSemesterCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> cacheKey,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$CurrentSemesterCacheTableFilterComposer
    extends Composer<_$AppDatabase, $CurrentSemesterCacheTable> {
  $$CurrentSemesterCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CurrentSemesterCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $CurrentSemesterCacheTable> {
  $$CurrentSemesterCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CurrentSemesterCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurrentSemesterCacheTable> {
  $$CurrentSemesterCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$CurrentSemesterCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CurrentSemesterCacheTable,
          CurrentSemesterCacheData,
          $$CurrentSemesterCacheTableFilterComposer,
          $$CurrentSemesterCacheTableOrderingComposer,
          $$CurrentSemesterCacheTableAnnotationComposer,
          $$CurrentSemesterCacheTableCreateCompanionBuilder,
          $$CurrentSemesterCacheTableUpdateCompanionBuilder,
          (
            CurrentSemesterCacheData,
            BaseReferences<
              _$AppDatabase,
              $CurrentSemesterCacheTable,
              CurrentSemesterCacheData
            >,
          ),
          CurrentSemesterCacheData,
          PrefetchHooks Function()
        > {
  $$CurrentSemesterCacheTableTableManager(
    _$AppDatabase db,
    $CurrentSemesterCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurrentSemesterCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurrentSemesterCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CurrentSemesterCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> cacheKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrentSemesterCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String cacheKey,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => CurrentSemesterCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CurrentSemesterCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CurrentSemesterCacheTable,
      CurrentSemesterCacheData,
      $$CurrentSemesterCacheTableFilterComposer,
      $$CurrentSemesterCacheTableOrderingComposer,
      $$CurrentSemesterCacheTableAnnotationComposer,
      $$CurrentSemesterCacheTableCreateCompanionBuilder,
      $$CurrentSemesterCacheTableUpdateCompanionBuilder,
      (
        CurrentSemesterCacheData,
        BaseReferences<
          _$AppDatabase,
          $CurrentSemesterCacheTable,
          CurrentSemesterCacheData
        >,
      ),
      CurrentSemesterCacheData,
      PrefetchHooks Function()
    >;
typedef $$CourseOpeningRequestsCacheTableCreateCompanionBuilder =
    CourseOpeningRequestsCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String cacheKey,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$CourseOpeningRequestsCacheTableUpdateCompanionBuilder =
    CourseOpeningRequestsCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> cacheKey,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$CourseOpeningRequestsCacheTableFilterComposer
    extends Composer<_$AppDatabase, $CourseOpeningRequestsCacheTable> {
  $$CourseOpeningRequestsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CourseOpeningRequestsCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseOpeningRequestsCacheTable> {
  $$CourseOpeningRequestsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CourseOpeningRequestsCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseOpeningRequestsCacheTable> {
  $$CourseOpeningRequestsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$CourseOpeningRequestsCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseOpeningRequestsCacheTable,
          CourseOpeningRequestsCacheData,
          $$CourseOpeningRequestsCacheTableFilterComposer,
          $$CourseOpeningRequestsCacheTableOrderingComposer,
          $$CourseOpeningRequestsCacheTableAnnotationComposer,
          $$CourseOpeningRequestsCacheTableCreateCompanionBuilder,
          $$CourseOpeningRequestsCacheTableUpdateCompanionBuilder,
          (
            CourseOpeningRequestsCacheData,
            BaseReferences<
              _$AppDatabase,
              $CourseOpeningRequestsCacheTable,
              CourseOpeningRequestsCacheData
            >,
          ),
          CourseOpeningRequestsCacheData,
          PrefetchHooks Function()
        > {
  $$CourseOpeningRequestsCacheTableTableManager(
    _$AppDatabase db,
    $CourseOpeningRequestsCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseOpeningRequestsCacheTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CourseOpeningRequestsCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CourseOpeningRequestsCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> cacheKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseOpeningRequestsCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String cacheKey,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => CourseOpeningRequestsCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CourseOpeningRequestsCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseOpeningRequestsCacheTable,
      CourseOpeningRequestsCacheData,
      $$CourseOpeningRequestsCacheTableFilterComposer,
      $$CourseOpeningRequestsCacheTableOrderingComposer,
      $$CourseOpeningRequestsCacheTableAnnotationComposer,
      $$CourseOpeningRequestsCacheTableCreateCompanionBuilder,
      $$CourseOpeningRequestsCacheTableUpdateCompanionBuilder,
      (
        CourseOpeningRequestsCacheData,
        BaseReferences<
          _$AppDatabase,
          $CourseOpeningRequestsCacheTable,
          CourseOpeningRequestsCacheData
        >,
      ),
      CourseOpeningRequestsCacheData,
      PrefetchHooks Function()
    >;
typedef $$LecturerProfileCacheTableCreateCompanionBuilder =
    LecturerProfileCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String lecturerId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$LecturerProfileCacheTableUpdateCompanionBuilder =
    LecturerProfileCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> lecturerId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$LecturerProfileCacheTableFilterComposer
    extends Composer<_$AppDatabase, $LecturerProfileCacheTable> {
  $$LecturerProfileCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LecturerProfileCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $LecturerProfileCacheTable> {
  $$LecturerProfileCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LecturerProfileCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $LecturerProfileCacheTable> {
  $$LecturerProfileCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$LecturerProfileCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LecturerProfileCacheTable,
          LecturerProfileCacheData,
          $$LecturerProfileCacheTableFilterComposer,
          $$LecturerProfileCacheTableOrderingComposer,
          $$LecturerProfileCacheTableAnnotationComposer,
          $$LecturerProfileCacheTableCreateCompanionBuilder,
          $$LecturerProfileCacheTableUpdateCompanionBuilder,
          (
            LecturerProfileCacheData,
            BaseReferences<
              _$AppDatabase,
              $LecturerProfileCacheTable,
              LecturerProfileCacheData
            >,
          ),
          LecturerProfileCacheData,
          PrefetchHooks Function()
        > {
  $$LecturerProfileCacheTableTableManager(
    _$AppDatabase db,
    $LecturerProfileCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LecturerProfileCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LecturerProfileCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LecturerProfileCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> lecturerId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LecturerProfileCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                lecturerId: lecturerId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String lecturerId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => LecturerProfileCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                lecturerId: lecturerId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LecturerProfileCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LecturerProfileCacheTable,
      LecturerProfileCacheData,
      $$LecturerProfileCacheTableFilterComposer,
      $$LecturerProfileCacheTableOrderingComposer,
      $$LecturerProfileCacheTableAnnotationComposer,
      $$LecturerProfileCacheTableCreateCompanionBuilder,
      $$LecturerProfileCacheTableUpdateCompanionBuilder,
      (
        LecturerProfileCacheData,
        BaseReferences<
          _$AppDatabase,
          $LecturerProfileCacheTable,
          LecturerProfileCacheData
        >,
      ),
      LecturerProfileCacheData,
      PrefetchHooks Function()
    >;
typedef $$MyClassesCacheTableCreateCompanionBuilder =
    MyClassesCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String lecturerId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$MyClassesCacheTableUpdateCompanionBuilder =
    MyClassesCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> lecturerId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$MyClassesCacheTableFilterComposer
    extends Composer<_$AppDatabase, $MyClassesCacheTable> {
  $$MyClassesCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MyClassesCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $MyClassesCacheTable> {
  $$MyClassesCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MyClassesCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $MyClassesCacheTable> {
  $$MyClassesCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$MyClassesCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MyClassesCacheTable,
          MyClassesCacheData,
          $$MyClassesCacheTableFilterComposer,
          $$MyClassesCacheTableOrderingComposer,
          $$MyClassesCacheTableAnnotationComposer,
          $$MyClassesCacheTableCreateCompanionBuilder,
          $$MyClassesCacheTableUpdateCompanionBuilder,
          (
            MyClassesCacheData,
            BaseReferences<
              _$AppDatabase,
              $MyClassesCacheTable,
              MyClassesCacheData
            >,
          ),
          MyClassesCacheData,
          PrefetchHooks Function()
        > {
  $$MyClassesCacheTableTableManager(
    _$AppDatabase db,
    $MyClassesCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MyClassesCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MyClassesCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MyClassesCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> lecturerId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MyClassesCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                lecturerId: lecturerId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String lecturerId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => MyClassesCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                lecturerId: lecturerId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MyClassesCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MyClassesCacheTable,
      MyClassesCacheData,
      $$MyClassesCacheTableFilterComposer,
      $$MyClassesCacheTableOrderingComposer,
      $$MyClassesCacheTableAnnotationComposer,
      $$MyClassesCacheTableCreateCompanionBuilder,
      $$MyClassesCacheTableUpdateCompanionBuilder,
      (
        MyClassesCacheData,
        BaseReferences<_$AppDatabase, $MyClassesCacheTable, MyClassesCacheData>,
      ),
      MyClassesCacheData,
      PrefetchHooks Function()
    >;
typedef $$ScheduleCacheTableCreateCompanionBuilder =
    ScheduleCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String lecturerId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$ScheduleCacheTableUpdateCompanionBuilder =
    ScheduleCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> lecturerId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$ScheduleCacheTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleCacheTable> {
  $$ScheduleCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScheduleCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleCacheTable> {
  $$ScheduleCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScheduleCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleCacheTable> {
  $$ScheduleCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get lecturerId => $composableBuilder(
    column: $table.lecturerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$ScheduleCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleCacheTable,
          ScheduleCacheData,
          $$ScheduleCacheTableFilterComposer,
          $$ScheduleCacheTableOrderingComposer,
          $$ScheduleCacheTableAnnotationComposer,
          $$ScheduleCacheTableCreateCompanionBuilder,
          $$ScheduleCacheTableUpdateCompanionBuilder,
          (
            ScheduleCacheData,
            BaseReferences<
              _$AppDatabase,
              $ScheduleCacheTable,
              ScheduleCacheData
            >,
          ),
          ScheduleCacheData,
          PrefetchHooks Function()
        > {
  $$ScheduleCacheTableTableManager(_$AppDatabase db, $ScheduleCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> lecturerId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScheduleCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                lecturerId: lecturerId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String lecturerId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => ScheduleCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                lecturerId: lecturerId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScheduleCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleCacheTable,
      ScheduleCacheData,
      $$ScheduleCacheTableFilterComposer,
      $$ScheduleCacheTableOrderingComposer,
      $$ScheduleCacheTableAnnotationComposer,
      $$ScheduleCacheTableCreateCompanionBuilder,
      $$ScheduleCacheTableUpdateCompanionBuilder,
      (
        ScheduleCacheData,
        BaseReferences<_$AppDatabase, $ScheduleCacheTable, ScheduleCacheData>,
      ),
      ScheduleCacheData,
      PrefetchHooks Function()
    >;
typedef $$StudentListCacheTableCreateCompanionBuilder =
    StudentListCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String courseClassId,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$StudentListCacheTableUpdateCompanionBuilder =
    StudentListCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> courseClassId,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$StudentListCacheTableFilterComposer
    extends Composer<_$AppDatabase, $StudentListCacheTable> {
  $$StudentListCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudentListCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentListCacheTable> {
  $$StudentListCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudentListCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentListCacheTable> {
  $$StudentListCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get courseClassId => $composableBuilder(
    column: $table.courseClassId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$StudentListCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentListCacheTable,
          StudentListCacheData,
          $$StudentListCacheTableFilterComposer,
          $$StudentListCacheTableOrderingComposer,
          $$StudentListCacheTableAnnotationComposer,
          $$StudentListCacheTableCreateCompanionBuilder,
          $$StudentListCacheTableUpdateCompanionBuilder,
          (
            StudentListCacheData,
            BaseReferences<
              _$AppDatabase,
              $StudentListCacheTable,
              StudentListCacheData
            >,
          ),
          StudentListCacheData,
          PrefetchHooks Function()
        > {
  $$StudentListCacheTableTableManager(
    _$AppDatabase db,
    $StudentListCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentListCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentListCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentListCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> courseClassId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentListCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                courseClassId: courseClassId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String courseClassId,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => StudentListCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                courseClassId: courseClassId,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudentListCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentListCacheTable,
      StudentListCacheData,
      $$StudentListCacheTableFilterComposer,
      $$StudentListCacheTableOrderingComposer,
      $$StudentListCacheTableAnnotationComposer,
      $$StudentListCacheTableCreateCompanionBuilder,
      $$StudentListCacheTableUpdateCompanionBuilder,
      (
        StudentListCacheData,
        BaseReferences<
          _$AppDatabase,
          $StudentListCacheTable,
          StudentListCacheData
        >,
      ),
      StudentListCacheData,
      PrefetchHooks Function()
    >;
typedef $$AdminDashboardCacheTableCreateCompanionBuilder =
    AdminDashboardCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String cacheKey,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$AdminDashboardCacheTableUpdateCompanionBuilder =
    AdminDashboardCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> cacheKey,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$AdminDashboardCacheTableFilterComposer
    extends Composer<_$AppDatabase, $AdminDashboardCacheTable> {
  $$AdminDashboardCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdminDashboardCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $AdminDashboardCacheTable> {
  $$AdminDashboardCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdminDashboardCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdminDashboardCacheTable> {
  $$AdminDashboardCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$AdminDashboardCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdminDashboardCacheTable,
          AdminDashboardCacheData,
          $$AdminDashboardCacheTableFilterComposer,
          $$AdminDashboardCacheTableOrderingComposer,
          $$AdminDashboardCacheTableAnnotationComposer,
          $$AdminDashboardCacheTableCreateCompanionBuilder,
          $$AdminDashboardCacheTableUpdateCompanionBuilder,
          (
            AdminDashboardCacheData,
            BaseReferences<
              _$AppDatabase,
              $AdminDashboardCacheTable,
              AdminDashboardCacheData
            >,
          ),
          AdminDashboardCacheData,
          PrefetchHooks Function()
        > {
  $$AdminDashboardCacheTableTableManager(
    _$AppDatabase db,
    $AdminDashboardCacheTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdminDashboardCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdminDashboardCacheTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AdminDashboardCacheTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> cacheKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdminDashboardCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String cacheKey,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => AdminDashboardCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdminDashboardCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdminDashboardCacheTable,
      AdminDashboardCacheData,
      $$AdminDashboardCacheTableFilterComposer,
      $$AdminDashboardCacheTableOrderingComposer,
      $$AdminDashboardCacheTableAnnotationComposer,
      $$AdminDashboardCacheTableCreateCompanionBuilder,
      $$AdminDashboardCacheTableUpdateCompanionBuilder,
      (
        AdminDashboardCacheData,
        BaseReferences<
          _$AppDatabase,
          $AdminDashboardCacheTable,
          AdminDashboardCacheData
        >,
      ),
      AdminDashboardCacheData,
      PrefetchHooks Function()
    >;
typedef $$CourseCacheTableCreateCompanionBuilder =
    CourseCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String cacheKey,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$CourseCacheTableUpdateCompanionBuilder =
    CourseCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> cacheKey,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$CourseCacheTableFilterComposer
    extends Composer<_$AppDatabase, $CourseCacheTable> {
  $$CourseCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CourseCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $CourseCacheTable> {
  $$CourseCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CourseCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $CourseCacheTable> {
  $$CourseCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$CourseCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CourseCacheTable,
          CourseCacheData,
          $$CourseCacheTableFilterComposer,
          $$CourseCacheTableOrderingComposer,
          $$CourseCacheTableAnnotationComposer,
          $$CourseCacheTableCreateCompanionBuilder,
          $$CourseCacheTableUpdateCompanionBuilder,
          (
            CourseCacheData,
            BaseReferences<_$AppDatabase, $CourseCacheTable, CourseCacheData>,
          ),
          CourseCacheData,
          PrefetchHooks Function()
        > {
  $$CourseCacheTableTableManager(_$AppDatabase db, $CourseCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CourseCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CourseCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CourseCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> cacheKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CourseCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String cacheKey,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => CourseCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CourseCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CourseCacheTable,
      CourseCacheData,
      $$CourseCacheTableFilterComposer,
      $$CourseCacheTableOrderingComposer,
      $$CourseCacheTableAnnotationComposer,
      $$CourseCacheTableCreateCompanionBuilder,
      $$CourseCacheTableUpdateCompanionBuilder,
      (
        CourseCacheData,
        BaseReferences<_$AppDatabase, $CourseCacheTable, CourseCacheData>,
      ),
      CourseCacheData,
      PrefetchHooks Function()
    >;
typedef $$ReportCacheTableCreateCompanionBuilder =
    ReportCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      required String cacheKey,
      required String payload,
      required DateTime syncedAt,
      Value<int> rowid,
    });
typedef $$ReportCacheTableUpdateCompanionBuilder =
    ReportCacheCompanion Function({
      Value<DateTime?> serverUpdatedAt,
      Value<int> version,
      Value<String> cacheKey,
      Value<String> payload,
      Value<DateTime> syncedAt,
      Value<int> rowid,
    });

class $$ReportCacheTableFilterComposer
    extends Composer<_$AppDatabase, $ReportCacheTable> {
  $$ReportCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReportCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $ReportCacheTable> {
  $$ReportCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cacheKey => $composableBuilder(
    column: $table.cacheKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReportCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReportCacheTable> {
  $$ReportCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$ReportCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReportCacheTable,
          ReportCacheData,
          $$ReportCacheTableFilterComposer,
          $$ReportCacheTableOrderingComposer,
          $$ReportCacheTableAnnotationComposer,
          $$ReportCacheTableCreateCompanionBuilder,
          $$ReportCacheTableUpdateCompanionBuilder,
          (
            ReportCacheData,
            BaseReferences<_$AppDatabase, $ReportCacheTable, ReportCacheData>,
          ),
          ReportCacheData,
          PrefetchHooks Function()
        > {
  $$ReportCacheTableTableManager(_$AppDatabase db, $ReportCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> cacheKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReportCacheCompanion(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<int> version = const Value.absent(),
                required String cacheKey,
                required String payload,
                required DateTime syncedAt,
                Value<int> rowid = const Value.absent(),
              }) => ReportCacheCompanion.insert(
                serverUpdatedAt: serverUpdatedAt,
                version: version,
                cacheKey: cacheKey,
                payload: payload,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReportCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReportCacheTable,
      ReportCacheData,
      $$ReportCacheTableFilterComposer,
      $$ReportCacheTableOrderingComposer,
      $$ReportCacheTableAnnotationComposer,
      $$ReportCacheTableCreateCompanionBuilder,
      $$ReportCacheTableUpdateCompanionBuilder,
      (
        ReportCacheData,
        BaseReferences<_$AppDatabase, $ReportCacheTable, ReportCacheData>,
      ),
      ReportCacheData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersLocalTableTableManager get usersLocal =>
      $$UsersLocalTableTableManager(_db, _db.usersLocal);
  $$SessionsLocalTableTableManager get sessionsLocal =>
      $$SessionsLocalTableTableManager(_db, _db.sessionsLocal);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$PendingRegistrationLocalTableTableManager get pendingRegistrationLocal =>
      $$PendingRegistrationLocalTableTableManager(
        _db,
        _db.pendingRegistrationLocal,
      );
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
  $$StudentProfileCacheTableTableManager get studentProfileCache =>
      $$StudentProfileCacheTableTableManager(_db, _db.studentProfileCache);
  $$TrainingProgramCacheTableTableManager get trainingProgramCache =>
      $$TrainingProgramCacheTableTableManager(_db, _db.trainingProgramCache);
  $$TranscriptCacheTableTableManager get transcriptCache =>
      $$TranscriptCacheTableTableManager(_db, _db.transcriptCache);
  $$OpenClassesCacheTableTableManager get openClassesCache =>
      $$OpenClassesCacheTableTableManager(_db, _db.openClassesCache);
  $$RegisteredCoursesCacheTableTableManager get registeredCoursesCache =>
      $$RegisteredCoursesCacheTableTableManager(
        _db,
        _db.registeredCoursesCache,
      );
  $$CurrentSemesterCacheTableTableManager get currentSemesterCache =>
      $$CurrentSemesterCacheTableTableManager(_db, _db.currentSemesterCache);
  $$CourseOpeningRequestsCacheTableTableManager
  get courseOpeningRequestsCache =>
      $$CourseOpeningRequestsCacheTableTableManager(
        _db,
        _db.courseOpeningRequestsCache,
      );
  $$LecturerProfileCacheTableTableManager get lecturerProfileCache =>
      $$LecturerProfileCacheTableTableManager(_db, _db.lecturerProfileCache);
  $$MyClassesCacheTableTableManager get myClassesCache =>
      $$MyClassesCacheTableTableManager(_db, _db.myClassesCache);
  $$ScheduleCacheTableTableManager get scheduleCache =>
      $$ScheduleCacheTableTableManager(_db, _db.scheduleCache);
  $$StudentListCacheTableTableManager get studentListCache =>
      $$StudentListCacheTableTableManager(_db, _db.studentListCache);
  $$AdminDashboardCacheTableTableManager get adminDashboardCache =>
      $$AdminDashboardCacheTableTableManager(_db, _db.adminDashboardCache);
  $$CourseCacheTableTableManager get courseCache =>
      $$CourseCacheTableTableManager(_db, _db.courseCache);
  $$ReportCacheTableTableManager get reportCache =>
      $$ReportCacheTableTableManager(_db, _db.reportCache);
}
