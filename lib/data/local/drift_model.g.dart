// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_model.dart';

// ignore_for_file: type=lint
class $UserDBTable extends UserDB with TableInfo<$UserDBTable, UserDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cnpjMeta = const VerificationMeta('cnpj');
  @override
  late final GeneratedColumn<String> cnpj = GeneratedColumn<String>(
    'cnpj',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataAlteracaoMeta = const VerificationMeta(
    'dataAlteracao',
  );
  @override
  late final GeneratedColumn<DateTime> dataAlteracao =
      GeneratedColumn<DateTime>(
        'data_alteracao',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    login,
    password,
    cnpj,
    dataAlteracao,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('cnpj')) {
      context.handle(
        _cnpjMeta,
        cnpj.isAcceptableOrUnknown(data['cnpj']!, _cnpjMeta),
      );
    } else if (isInserting) {
      context.missing(_cnpjMeta);
    }
    if (data.containsKey('data_alteracao')) {
      context.handle(
        _dataAlteracaoMeta,
        dataAlteracao.isAcceptableOrUnknown(
          data['data_alteracao']!,
          _dataAlteracaoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dataAlteracaoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      login: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      cnpj: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cnpj'],
      )!,
      dataAlteracao: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_alteracao'],
      )!,
    );
  }

  @override
  $UserDBTable createAlias(String alias) {
    return $UserDBTable(attachedDatabase, alias);
  }
}

class UserDBData extends DataClass implements Insertable<UserDBData> {
  final int id;
  final String login;
  final String password;
  final String cnpj;
  final DateTime dataAlteracao;
  const UserDBData({
    required this.id,
    required this.login,
    required this.password,
    required this.cnpj,
    required this.dataAlteracao,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['login'] = Variable<String>(login);
    map['password'] = Variable<String>(password);
    map['cnpj'] = Variable<String>(cnpj);
    map['data_alteracao'] = Variable<DateTime>(dataAlteracao);
    return map;
  }

  UserDBCompanion toCompanion(bool nullToAbsent) {
    return UserDBCompanion(
      id: Value(id),
      login: Value(login),
      password: Value(password),
      cnpj: Value(cnpj),
      dataAlteracao: Value(dataAlteracao),
    );
  }

  factory UserDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDBData(
      id: serializer.fromJson<int>(json['id']),
      login: serializer.fromJson<String>(json['login']),
      password: serializer.fromJson<String>(json['password']),
      cnpj: serializer.fromJson<String>(json['cnpj']),
      dataAlteracao: serializer.fromJson<DateTime>(json['dataAlteracao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'login': serializer.toJson<String>(login),
      'password': serializer.toJson<String>(password),
      'cnpj': serializer.toJson<String>(cnpj),
      'dataAlteracao': serializer.toJson<DateTime>(dataAlteracao),
    };
  }

  UserDBData copyWith({
    int? id,
    String? login,
    String? password,
    String? cnpj,
    DateTime? dataAlteracao,
  }) => UserDBData(
    id: id ?? this.id,
    login: login ?? this.login,
    password: password ?? this.password,
    cnpj: cnpj ?? this.cnpj,
    dataAlteracao: dataAlteracao ?? this.dataAlteracao,
  );
  UserDBData copyWithCompanion(UserDBCompanion data) {
    return UserDBData(
      id: data.id.present ? data.id.value : this.id,
      login: data.login.present ? data.login.value : this.login,
      password: data.password.present ? data.password.value : this.password,
      cnpj: data.cnpj.present ? data.cnpj.value : this.cnpj,
      dataAlteracao: data.dataAlteracao.present
          ? data.dataAlteracao.value
          : this.dataAlteracao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDBData(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('cnpj: $cnpj, ')
          ..write('dataAlteracao: $dataAlteracao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, login, password, cnpj, dataAlteracao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDBData &&
          other.id == this.id &&
          other.login == this.login &&
          other.password == this.password &&
          other.cnpj == this.cnpj &&
          other.dataAlteracao == this.dataAlteracao);
}

class UserDBCompanion extends UpdateCompanion<UserDBData> {
  final Value<int> id;
  final Value<String> login;
  final Value<String> password;
  final Value<String> cnpj;
  final Value<DateTime> dataAlteracao;
  const UserDBCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.cnpj = const Value.absent(),
    this.dataAlteracao = const Value.absent(),
  });
  UserDBCompanion.insert({
    this.id = const Value.absent(),
    required String login,
    required String password,
    required String cnpj,
    required DateTime dataAlteracao,
  }) : login = Value(login),
       password = Value(password),
       cnpj = Value(cnpj),
       dataAlteracao = Value(dataAlteracao);
  static Insertable<UserDBData> custom({
    Expression<int>? id,
    Expression<String>? login,
    Expression<String>? password,
    Expression<String>? cnpj,
    Expression<DateTime>? dataAlteracao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (cnpj != null) 'cnpj': cnpj,
      if (dataAlteracao != null) 'data_alteracao': dataAlteracao,
    });
  }

  UserDBCompanion copyWith({
    Value<int>? id,
    Value<String>? login,
    Value<String>? password,
    Value<String>? cnpj,
    Value<DateTime>? dataAlteracao,
  }) {
    return UserDBCompanion(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      cnpj: cnpj ?? this.cnpj,
      dataAlteracao: dataAlteracao ?? this.dataAlteracao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (cnpj.present) {
      map['cnpj'] = Variable<String>(cnpj.value);
    }
    if (dataAlteracao.present) {
      map['data_alteracao'] = Variable<DateTime>(dataAlteracao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDBCompanion(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('cnpj: $cnpj, ')
          ..write('dataAlteracao: $dataAlteracao')
          ..write(')'))
        .toString();
  }
}

class $RouteDBTable extends RouteDB with TableInfo<$RouteDBTable, RouteDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataCriacaoMeta = const VerificationMeta(
    'dataCriacao',
  );
  @override
  late final GeneratedColumn<DateTime> dataCriacao = GeneratedColumn<DateTime>(
    'data_criacao',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    tags,
    dataCriacao,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<RouteDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('data_criacao')) {
      context.handle(
        _dataCriacaoMeta,
        dataCriacao.isAcceptableOrUnknown(
          data['data_criacao']!,
          _dataCriacaoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      dataCriacao: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_criacao'],
      )!,
    );
  }

  @override
  $RouteDBTable createAlias(String alias) {
    return $RouteDBTable(attachedDatabase, alias);
  }
}

class RouteDBData extends DataClass implements Insertable<RouteDBData> {
  final int id;
  final String name;
  final String description;
  final String tags;
  final DateTime dataCriacao;
  const RouteDBData({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.dataCriacao,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['tags'] = Variable<String>(tags);
    map['data_criacao'] = Variable<DateTime>(dataCriacao);
    return map;
  }

  RouteDBCompanion toCompanion(bool nullToAbsent) {
    return RouteDBCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      tags: Value(tags),
      dataCriacao: Value(dataCriacao),
    );
  }

  factory RouteDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteDBData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      tags: serializer.fromJson<String>(json['tags']),
      dataCriacao: serializer.fromJson<DateTime>(json['dataCriacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'tags': serializer.toJson<String>(tags),
      'dataCriacao': serializer.toJson<DateTime>(dataCriacao),
    };
  }

  RouteDBData copyWith({
    int? id,
    String? name,
    String? description,
    String? tags,
    DateTime? dataCriacao,
  }) => RouteDBData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    tags: tags ?? this.tags,
    dataCriacao: dataCriacao ?? this.dataCriacao,
  );
  RouteDBData copyWithCompanion(RouteDBCompanion data) {
    return RouteDBData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      tags: data.tags.present ? data.tags.value : this.tags,
      dataCriacao: data.dataCriacao.present
          ? data.dataCriacao.value
          : this.dataCriacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteDBData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('tags: $tags, ')
          ..write('dataCriacao: $dataCriacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, tags, dataCriacao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteDBData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.tags == this.tags &&
          other.dataCriacao == this.dataCriacao);
}

class RouteDBCompanion extends UpdateCompanion<RouteDBData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> tags;
  final Value<DateTime> dataCriacao;
  const RouteDBCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.tags = const Value.absent(),
    this.dataCriacao = const Value.absent(),
  });
  RouteDBCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String tags,
    this.dataCriacao = const Value.absent(),
  }) : name = Value(name),
       description = Value(description),
       tags = Value(tags);
  static Insertable<RouteDBData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? tags,
    Expression<DateTime>? dataCriacao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (dataCriacao != null) 'data_criacao': dataCriacao,
    });
  }

  RouteDBCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? tags,
    Value<DateTime>? dataCriacao,
  }) {
    return RouteDBCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      dataCriacao: dataCriacao ?? this.dataCriacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (dataCriacao.present) {
      map['data_criacao'] = Variable<DateTime>(dataCriacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteDBCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('tags: $tags, ')
          ..write('dataCriacao: $dataCriacao')
          ..write(')'))
        .toString();
  }
}

class $PointDBTable extends PointDB with TableInfo<$PointDBTable, PointDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _routeIdMeta = const VerificationMeta(
    'routeId',
  );
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
    'route_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES route_d_b (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<String> latitude = GeneratedColumn<String>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<String> longitude = GeneratedColumn<String>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataCriacaoMeta = const VerificationMeta(
    'dataCriacao',
  );
  @override
  late final GeneratedColumn<DateTime> dataCriacao = GeneratedColumn<DateTime>(
    'data_criacao',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routeId,
    name,
    type,
    description,
    latitude,
    longitude,
    dataCriacao,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'point_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<PointDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('route_id')) {
      context.handle(
        _routeIdMeta,
        routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('data_criacao')) {
      context.handle(
        _dataCriacaoMeta,
        dataCriacao.isAcceptableOrUnknown(
          data['data_criacao']!,
          _dataCriacaoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PointDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      routeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}route_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}longitude'],
      )!,
      dataCriacao: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data_criacao'],
      )!,
    );
  }

  @override
  $PointDBTable createAlias(String alias) {
    return $PointDBTable(attachedDatabase, alias);
  }
}

class PointDBData extends DataClass implements Insertable<PointDBData> {
  final int id;
  final int routeId;
  final String name;
  final String type;
  final String description;
  final String latitude;
  final String longitude;
  final DateTime dataCriacao;
  const PointDBData({
    required this.id,
    required this.routeId,
    required this.name,
    required this.type,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.dataCriacao,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['route_id'] = Variable<int>(routeId);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['description'] = Variable<String>(description);
    map['latitude'] = Variable<String>(latitude);
    map['longitude'] = Variable<String>(longitude);
    map['data_criacao'] = Variable<DateTime>(dataCriacao);
    return map;
  }

  PointDBCompanion toCompanion(bool nullToAbsent) {
    return PointDBCompanion(
      id: Value(id),
      routeId: Value(routeId),
      name: Value(name),
      type: Value(type),
      description: Value(description),
      latitude: Value(latitude),
      longitude: Value(longitude),
      dataCriacao: Value(dataCriacao),
    );
  }

  factory PointDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointDBData(
      id: serializer.fromJson<int>(json['id']),
      routeId: serializer.fromJson<int>(json['routeId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String>(json['description']),
      latitude: serializer.fromJson<String>(json['latitude']),
      longitude: serializer.fromJson<String>(json['longitude']),
      dataCriacao: serializer.fromJson<DateTime>(json['dataCriacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'routeId': serializer.toJson<int>(routeId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String>(description),
      'latitude': serializer.toJson<String>(latitude),
      'longitude': serializer.toJson<String>(longitude),
      'dataCriacao': serializer.toJson<DateTime>(dataCriacao),
    };
  }

  PointDBData copyWith({
    int? id,
    int? routeId,
    String? name,
    String? type,
    String? description,
    String? latitude,
    String? longitude,
    DateTime? dataCriacao,
  }) => PointDBData(
    id: id ?? this.id,
    routeId: routeId ?? this.routeId,
    name: name ?? this.name,
    type: type ?? this.type,
    description: description ?? this.description,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    dataCriacao: dataCriacao ?? this.dataCriacao,
  );
  PointDBData copyWithCompanion(PointDBCompanion data) {
    return PointDBData(
      id: data.id.present ? data.id.value : this.id,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      dataCriacao: data.dataCriacao.present
          ? data.dataCriacao.value
          : this.dataCriacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointDBData(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('dataCriacao: $dataCriacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    routeId,
    name,
    type,
    description,
    latitude,
    longitude,
    dataCriacao,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointDBData &&
          other.id == this.id &&
          other.routeId == this.routeId &&
          other.name == this.name &&
          other.type == this.type &&
          other.description == this.description &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.dataCriacao == this.dataCriacao);
}

class PointDBCompanion extends UpdateCompanion<PointDBData> {
  final Value<int> id;
  final Value<int> routeId;
  final Value<String> name;
  final Value<String> type;
  final Value<String> description;
  final Value<String> latitude;
  final Value<String> longitude;
  final Value<DateTime> dataCriacao;
  const PointDBCompanion({
    this.id = const Value.absent(),
    this.routeId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.dataCriacao = const Value.absent(),
  });
  PointDBCompanion.insert({
    this.id = const Value.absent(),
    required int routeId,
    required String name,
    required String type,
    required String description,
    required String latitude,
    required String longitude,
    this.dataCriacao = const Value.absent(),
  }) : routeId = Value(routeId),
       name = Value(name),
       type = Value(type),
       description = Value(description),
       latitude = Value(latitude),
       longitude = Value(longitude);
  static Insertable<PointDBData> custom({
    Expression<int>? id,
    Expression<int>? routeId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? description,
    Expression<String>? latitude,
    Expression<String>? longitude,
    Expression<DateTime>? dataCriacao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routeId != null) 'route_id': routeId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (dataCriacao != null) 'data_criacao': dataCriacao,
    });
  }

  PointDBCompanion copyWith({
    Value<int>? id,
    Value<int>? routeId,
    Value<String>? name,
    Value<String>? type,
    Value<String>? description,
    Value<String>? latitude,
    Value<String>? longitude,
    Value<DateTime>? dataCriacao,
  }) {
    return PointDBCompanion(
      id: id ?? this.id,
      routeId: routeId ?? this.routeId,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dataCriacao: dataCriacao ?? this.dataCriacao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String>(longitude.value);
    }
    if (dataCriacao.present) {
      map['data_criacao'] = Variable<DateTime>(dataCriacao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointDBCompanion(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('dataCriacao: $dataCriacao')
          ..write(')'))
        .toString();
  }
}

class $ImageDBTable extends ImageDB with TableInfo<$ImageDBTable, ImageDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImageDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _routeIdMeta = const VerificationMeta(
    'routeId',
  );
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
    'route_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES route_d_b (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _pointIdMeta = const VerificationMeta(
    'pointId',
  );
  @override
  late final GeneratedColumn<int> pointId = GeneratedColumn<int>(
    'point_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES point_d_b (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    routeId,
    pointId,
    fileName,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'image_d_b';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImageDBData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('route_id')) {
      context.handle(
        _routeIdMeta,
        routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta),
      );
    }
    if (data.containsKey('point_id')) {
      context.handle(
        _pointIdMeta,
        pointId.isAcceptableOrUnknown(data['point_id']!, _pointIdMeta),
      );
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ImageDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImageDBData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      routeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}route_id'],
      ),
      pointId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}point_id'],
      ),
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
    );
  }

  @override
  $ImageDBTable createAlias(String alias) {
    return $ImageDBTable(attachedDatabase, alias);
  }
}

class ImageDBData extends DataClass implements Insertable<ImageDBData> {
  final int id;
  final int? routeId;
  final int? pointId;
  final String fileName;
  final String imageUrl;
  const ImageDBData({
    required this.id,
    this.routeId,
    this.pointId,
    required this.fileName,
    required this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || routeId != null) {
      map['route_id'] = Variable<int>(routeId);
    }
    if (!nullToAbsent || pointId != null) {
      map['point_id'] = Variable<int>(pointId);
    }
    map['file_name'] = Variable<String>(fileName);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  ImageDBCompanion toCompanion(bool nullToAbsent) {
    return ImageDBCompanion(
      id: Value(id),
      routeId: routeId == null && nullToAbsent
          ? const Value.absent()
          : Value(routeId),
      pointId: pointId == null && nullToAbsent
          ? const Value.absent()
          : Value(pointId),
      fileName: Value(fileName),
      imageUrl: Value(imageUrl),
    );
  }

  factory ImageDBData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImageDBData(
      id: serializer.fromJson<int>(json['id']),
      routeId: serializer.fromJson<int?>(json['routeId']),
      pointId: serializer.fromJson<int?>(json['pointId']),
      fileName: serializer.fromJson<String>(json['fileName']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'routeId': serializer.toJson<int?>(routeId),
      'pointId': serializer.toJson<int?>(pointId),
      'fileName': serializer.toJson<String>(fileName),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  ImageDBData copyWith({
    int? id,
    Value<int?> routeId = const Value.absent(),
    Value<int?> pointId = const Value.absent(),
    String? fileName,
    String? imageUrl,
  }) => ImageDBData(
    id: id ?? this.id,
    routeId: routeId.present ? routeId.value : this.routeId,
    pointId: pointId.present ? pointId.value : this.pointId,
    fileName: fileName ?? this.fileName,
    imageUrl: imageUrl ?? this.imageUrl,
  );
  ImageDBData copyWithCompanion(ImageDBCompanion data) {
    return ImageDBData(
      id: data.id.present ? data.id.value : this.id,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      pointId: data.pointId.present ? data.pointId.value : this.pointId,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImageDBData(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('pointId: $pointId, ')
          ..write('fileName: $fileName, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, routeId, pointId, fileName, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageDBData &&
          other.id == this.id &&
          other.routeId == this.routeId &&
          other.pointId == this.pointId &&
          other.fileName == this.fileName &&
          other.imageUrl == this.imageUrl);
}

class ImageDBCompanion extends UpdateCompanion<ImageDBData> {
  final Value<int> id;
  final Value<int?> routeId;
  final Value<int?> pointId;
  final Value<String> fileName;
  final Value<String> imageUrl;
  const ImageDBCompanion({
    this.id = const Value.absent(),
    this.routeId = const Value.absent(),
    this.pointId = const Value.absent(),
    this.fileName = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  ImageDBCompanion.insert({
    this.id = const Value.absent(),
    this.routeId = const Value.absent(),
    this.pointId = const Value.absent(),
    required String fileName,
    required String imageUrl,
  }) : fileName = Value(fileName),
       imageUrl = Value(imageUrl);
  static Insertable<ImageDBData> custom({
    Expression<int>? id,
    Expression<int>? routeId,
    Expression<int>? pointId,
    Expression<String>? fileName,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (routeId != null) 'route_id': routeId,
      if (pointId != null) 'point_id': pointId,
      if (fileName != null) 'file_name': fileName,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  ImageDBCompanion copyWith({
    Value<int>? id,
    Value<int?>? routeId,
    Value<int?>? pointId,
    Value<String>? fileName,
    Value<String>? imageUrl,
  }) {
    return ImageDBCompanion(
      id: id ?? this.id,
      routeId: routeId ?? this.routeId,
      pointId: pointId ?? this.pointId,
      fileName: fileName ?? this.fileName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (pointId.present) {
      map['point_id'] = Variable<int>(pointId.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImageDBCompanion(')
          ..write('id: $id, ')
          ..write('routeId: $routeId, ')
          ..write('pointId: $pointId, ')
          ..write('fileName: $fileName, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserDBTable userDB = $UserDBTable(this);
  late final $RouteDBTable routeDB = $RouteDBTable(this);
  late final $PointDBTable pointDB = $PointDBTable(this);
  late final $ImageDBTable imageDB = $ImageDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userDB,
    routeDB,
    pointDB,
    imageDB,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'route_d_b',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('point_d_b', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'route_d_b',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('image_d_b', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'point_d_b',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('image_d_b', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UserDBTableCreateCompanionBuilder =
    UserDBCompanion Function({
      Value<int> id,
      required String login,
      required String password,
      required String cnpj,
      required DateTime dataAlteracao,
    });
typedef $$UserDBTableUpdateCompanionBuilder =
    UserDBCompanion Function({
      Value<int> id,
      Value<String> login,
      Value<String> password,
      Value<String> cnpj,
      Value<DateTime> dataAlteracao,
    });

class $$UserDBTableFilterComposer
    extends Composer<_$AppDatabase, $UserDBTable> {
  $$UserDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cnpj => $composableBuilder(
    column: $table.cnpj,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataAlteracao => $composableBuilder(
    column: $table.dataAlteracao,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserDBTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDBTable> {
  $$UserDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cnpj => $composableBuilder(
    column: $table.cnpj,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataAlteracao => $composableBuilder(
    column: $table.dataAlteracao,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDBTable> {
  $$UserDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get cnpj =>
      $composableBuilder(column: $table.cnpj, builder: (column) => column);

  GeneratedColumn<DateTime> get dataAlteracao => $composableBuilder(
    column: $table.dataAlteracao,
    builder: (column) => column,
  );
}

class $$UserDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserDBTable,
          UserDBData,
          $$UserDBTableFilterComposer,
          $$UserDBTableOrderingComposer,
          $$UserDBTableAnnotationComposer,
          $$UserDBTableCreateCompanionBuilder,
          $$UserDBTableUpdateCompanionBuilder,
          (UserDBData, BaseReferences<_$AppDatabase, $UserDBTable, UserDBData>),
          UserDBData,
          PrefetchHooks Function()
        > {
  $$UserDBTableTableManager(_$AppDatabase db, $UserDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> login = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> cnpj = const Value.absent(),
                Value<DateTime> dataAlteracao = const Value.absent(),
              }) => UserDBCompanion(
                id: id,
                login: login,
                password: password,
                cnpj: cnpj,
                dataAlteracao: dataAlteracao,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String login,
                required String password,
                required String cnpj,
                required DateTime dataAlteracao,
              }) => UserDBCompanion.insert(
                id: id,
                login: login,
                password: password,
                cnpj: cnpj,
                dataAlteracao: dataAlteracao,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserDBTable,
      UserDBData,
      $$UserDBTableFilterComposer,
      $$UserDBTableOrderingComposer,
      $$UserDBTableAnnotationComposer,
      $$UserDBTableCreateCompanionBuilder,
      $$UserDBTableUpdateCompanionBuilder,
      (UserDBData, BaseReferences<_$AppDatabase, $UserDBTable, UserDBData>),
      UserDBData,
      PrefetchHooks Function()
    >;
typedef $$RouteDBTableCreateCompanionBuilder =
    RouteDBCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String tags,
      Value<DateTime> dataCriacao,
    });
typedef $$RouteDBTableUpdateCompanionBuilder =
    RouteDBCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> tags,
      Value<DateTime> dataCriacao,
    });

final class $$RouteDBTableReferences
    extends BaseReferences<_$AppDatabase, $RouteDBTable, RouteDBData> {
  $$RouteDBTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PointDBTable, List<PointDBData>>
  _pointDBRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pointDB,
    aliasName: $_aliasNameGenerator(db.routeDB.id, db.pointDB.routeId),
  );

  $$PointDBTableProcessedTableManager get pointDBRefs {
    final manager = $$PointDBTableTableManager(
      $_db,
      $_db.pointDB,
    ).filter((f) => f.routeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pointDBRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ImageDBTable, List<ImageDBData>>
  _imageDBRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.imageDB,
    aliasName: $_aliasNameGenerator(db.routeDB.id, db.imageDB.routeId),
  );

  $$ImageDBTableProcessedTableManager get imageDBRefs {
    final manager = $$ImageDBTableTableManager(
      $_db,
      $_db.imageDB,
    ).filter((f) => f.routeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_imageDBRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RouteDBTableFilterComposer
    extends Composer<_$AppDatabase, $RouteDBTable> {
  $$RouteDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataCriacao => $composableBuilder(
    column: $table.dataCriacao,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> pointDBRefs(
    Expression<bool> Function($$PointDBTableFilterComposer f) f,
  ) {
    final $$PointDBTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pointDB,
      getReferencedColumn: (t) => t.routeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointDBTableFilterComposer(
            $db: $db,
            $table: $db.pointDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> imageDBRefs(
    Expression<bool> Function($$ImageDBTableFilterComposer f) f,
  ) {
    final $$ImageDBTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.imageDB,
      getReferencedColumn: (t) => t.routeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImageDBTableFilterComposer(
            $db: $db,
            $table: $db.imageDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RouteDBTableOrderingComposer
    extends Composer<_$AppDatabase, $RouteDBTable> {
  $$RouteDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataCriacao => $composableBuilder(
    column: $table.dataCriacao,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RouteDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $RouteDBTable> {
  $$RouteDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get dataCriacao => $composableBuilder(
    column: $table.dataCriacao,
    builder: (column) => column,
  );

  Expression<T> pointDBRefs<T extends Object>(
    Expression<T> Function($$PointDBTableAnnotationComposer a) f,
  ) {
    final $$PointDBTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pointDB,
      getReferencedColumn: (t) => t.routeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointDBTableAnnotationComposer(
            $db: $db,
            $table: $db.pointDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> imageDBRefs<T extends Object>(
    Expression<T> Function($$ImageDBTableAnnotationComposer a) f,
  ) {
    final $$ImageDBTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.imageDB,
      getReferencedColumn: (t) => t.routeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImageDBTableAnnotationComposer(
            $db: $db,
            $table: $db.imageDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RouteDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RouteDBTable,
          RouteDBData,
          $$RouteDBTableFilterComposer,
          $$RouteDBTableOrderingComposer,
          $$RouteDBTableAnnotationComposer,
          $$RouteDBTableCreateCompanionBuilder,
          $$RouteDBTableUpdateCompanionBuilder,
          (RouteDBData, $$RouteDBTableReferences),
          RouteDBData,
          PrefetchHooks Function({bool pointDBRefs, bool imageDBRefs})
        > {
  $$RouteDBTableTableManager(_$AppDatabase db, $RouteDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RouteDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RouteDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RouteDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> dataCriacao = const Value.absent(),
              }) => RouteDBCompanion(
                id: id,
                name: name,
                description: description,
                tags: tags,
                dataCriacao: dataCriacao,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                required String tags,
                Value<DateTime> dataCriacao = const Value.absent(),
              }) => RouteDBCompanion.insert(
                id: id,
                name: name,
                description: description,
                tags: tags,
                dataCriacao: dataCriacao,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RouteDBTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pointDBRefs = false, imageDBRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pointDBRefs) db.pointDB,
                if (imageDBRefs) db.imageDB,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pointDBRefs)
                    await $_getPrefetchedData<
                      RouteDBData,
                      $RouteDBTable,
                      PointDBData
                    >(
                      currentTable: table,
                      referencedTable: $$RouteDBTableReferences
                          ._pointDBRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RouteDBTableReferences(db, table, p0).pointDBRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.routeId == item.id),
                      typedResults: items,
                    ),
                  if (imageDBRefs)
                    await $_getPrefetchedData<
                      RouteDBData,
                      $RouteDBTable,
                      ImageDBData
                    >(
                      currentTable: table,
                      referencedTable: $$RouteDBTableReferences
                          ._imageDBRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RouteDBTableReferences(db, table, p0).imageDBRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.routeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RouteDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RouteDBTable,
      RouteDBData,
      $$RouteDBTableFilterComposer,
      $$RouteDBTableOrderingComposer,
      $$RouteDBTableAnnotationComposer,
      $$RouteDBTableCreateCompanionBuilder,
      $$RouteDBTableUpdateCompanionBuilder,
      (RouteDBData, $$RouteDBTableReferences),
      RouteDBData,
      PrefetchHooks Function({bool pointDBRefs, bool imageDBRefs})
    >;
typedef $$PointDBTableCreateCompanionBuilder =
    PointDBCompanion Function({
      Value<int> id,
      required int routeId,
      required String name,
      required String type,
      required String description,
      required String latitude,
      required String longitude,
      Value<DateTime> dataCriacao,
    });
typedef $$PointDBTableUpdateCompanionBuilder =
    PointDBCompanion Function({
      Value<int> id,
      Value<int> routeId,
      Value<String> name,
      Value<String> type,
      Value<String> description,
      Value<String> latitude,
      Value<String> longitude,
      Value<DateTime> dataCriacao,
    });

final class $$PointDBTableReferences
    extends BaseReferences<_$AppDatabase, $PointDBTable, PointDBData> {
  $$PointDBTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RouteDBTable _routeIdTable(_$AppDatabase db) => db.routeDB
      .createAlias($_aliasNameGenerator(db.pointDB.routeId, db.routeDB.id));

  $$RouteDBTableProcessedTableManager get routeId {
    final $_column = $_itemColumn<int>('route_id')!;

    final manager = $$RouteDBTableTableManager(
      $_db,
      $_db.routeDB,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ImageDBTable, List<ImageDBData>>
  _imageDBRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.imageDB,
    aliasName: $_aliasNameGenerator(db.pointDB.id, db.imageDB.pointId),
  );

  $$ImageDBTableProcessedTableManager get imageDBRefs {
    final manager = $$ImageDBTableTableManager(
      $_db,
      $_db.imageDB,
    ).filter((f) => f.pointId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_imageDBRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PointDBTableFilterComposer
    extends Composer<_$AppDatabase, $PointDBTable> {
  $$PointDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dataCriacao => $composableBuilder(
    column: $table.dataCriacao,
    builder: (column) => ColumnFilters(column),
  );

  $$RouteDBTableFilterComposer get routeId {
    final $$RouteDBTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routeDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteDBTableFilterComposer(
            $db: $db,
            $table: $db.routeDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> imageDBRefs(
    Expression<bool> Function($$ImageDBTableFilterComposer f) f,
  ) {
    final $$ImageDBTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.imageDB,
      getReferencedColumn: (t) => t.pointId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImageDBTableFilterComposer(
            $db: $db,
            $table: $db.imageDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PointDBTableOrderingComposer
    extends Composer<_$AppDatabase, $PointDBTable> {
  $$PointDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dataCriacao => $composableBuilder(
    column: $table.dataCriacao,
    builder: (column) => ColumnOrderings(column),
  );

  $$RouteDBTableOrderingComposer get routeId {
    final $$RouteDBTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routeDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteDBTableOrderingComposer(
            $db: $db,
            $table: $db.routeDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PointDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $PointDBTable> {
  $$PointDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<String> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get dataCriacao => $composableBuilder(
    column: $table.dataCriacao,
    builder: (column) => column,
  );

  $$RouteDBTableAnnotationComposer get routeId {
    final $$RouteDBTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routeDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteDBTableAnnotationComposer(
            $db: $db,
            $table: $db.routeDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> imageDBRefs<T extends Object>(
    Expression<T> Function($$ImageDBTableAnnotationComposer a) f,
  ) {
    final $$ImageDBTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.imageDB,
      getReferencedColumn: (t) => t.pointId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImageDBTableAnnotationComposer(
            $db: $db,
            $table: $db.imageDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PointDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PointDBTable,
          PointDBData,
          $$PointDBTableFilterComposer,
          $$PointDBTableOrderingComposer,
          $$PointDBTableAnnotationComposer,
          $$PointDBTableCreateCompanionBuilder,
          $$PointDBTableUpdateCompanionBuilder,
          (PointDBData, $$PointDBTableReferences),
          PointDBData,
          PrefetchHooks Function({bool routeId, bool imageDBRefs})
        > {
  $$PointDBTableTableManager(_$AppDatabase db, $PointDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PointDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> routeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> latitude = const Value.absent(),
                Value<String> longitude = const Value.absent(),
                Value<DateTime> dataCriacao = const Value.absent(),
              }) => PointDBCompanion(
                id: id,
                routeId: routeId,
                name: name,
                type: type,
                description: description,
                latitude: latitude,
                longitude: longitude,
                dataCriacao: dataCriacao,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int routeId,
                required String name,
                required String type,
                required String description,
                required String latitude,
                required String longitude,
                Value<DateTime> dataCriacao = const Value.absent(),
              }) => PointDBCompanion.insert(
                id: id,
                routeId: routeId,
                name: name,
                type: type,
                description: description,
                latitude: latitude,
                longitude: longitude,
                dataCriacao: dataCriacao,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PointDBTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({routeId = false, imageDBRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (imageDBRefs) db.imageDB],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (routeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.routeId,
                                referencedTable: $$PointDBTableReferences
                                    ._routeIdTable(db),
                                referencedColumn: $$PointDBTableReferences
                                    ._routeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (imageDBRefs)
                    await $_getPrefetchedData<
                      PointDBData,
                      $PointDBTable,
                      ImageDBData
                    >(
                      currentTable: table,
                      referencedTable: $$PointDBTableReferences
                          ._imageDBRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PointDBTableReferences(db, table, p0).imageDBRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.pointId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PointDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PointDBTable,
      PointDBData,
      $$PointDBTableFilterComposer,
      $$PointDBTableOrderingComposer,
      $$PointDBTableAnnotationComposer,
      $$PointDBTableCreateCompanionBuilder,
      $$PointDBTableUpdateCompanionBuilder,
      (PointDBData, $$PointDBTableReferences),
      PointDBData,
      PrefetchHooks Function({bool routeId, bool imageDBRefs})
    >;
typedef $$ImageDBTableCreateCompanionBuilder =
    ImageDBCompanion Function({
      Value<int> id,
      Value<int?> routeId,
      Value<int?> pointId,
      required String fileName,
      required String imageUrl,
    });
typedef $$ImageDBTableUpdateCompanionBuilder =
    ImageDBCompanion Function({
      Value<int> id,
      Value<int?> routeId,
      Value<int?> pointId,
      Value<String> fileName,
      Value<String> imageUrl,
    });

final class $$ImageDBTableReferences
    extends BaseReferences<_$AppDatabase, $ImageDBTable, ImageDBData> {
  $$ImageDBTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RouteDBTable _routeIdTable(_$AppDatabase db) => db.routeDB
      .createAlias($_aliasNameGenerator(db.imageDB.routeId, db.routeDB.id));

  $$RouteDBTableProcessedTableManager? get routeId {
    final $_column = $_itemColumn<int>('route_id');
    if ($_column == null) return null;
    final manager = $$RouteDBTableTableManager(
      $_db,
      $_db.routeDB,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_routeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PointDBTable _pointIdTable(_$AppDatabase db) => db.pointDB
      .createAlias($_aliasNameGenerator(db.imageDB.pointId, db.pointDB.id));

  $$PointDBTableProcessedTableManager? get pointId {
    final $_column = $_itemColumn<int>('point_id');
    if ($_column == null) return null;
    final manager = $$PointDBTableTableManager(
      $_db,
      $_db.pointDB,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pointIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ImageDBTableFilterComposer
    extends Composer<_$AppDatabase, $ImageDBTable> {
  $$ImageDBTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$RouteDBTableFilterComposer get routeId {
    final $$RouteDBTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routeDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteDBTableFilterComposer(
            $db: $db,
            $table: $db.routeDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointDBTableFilterComposer get pointId {
    final $$PointDBTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pointId,
      referencedTable: $db.pointDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointDBTableFilterComposer(
            $db: $db,
            $table: $db.pointDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImageDBTableOrderingComposer
    extends Composer<_$AppDatabase, $ImageDBTable> {
  $$ImageDBTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$RouteDBTableOrderingComposer get routeId {
    final $$RouteDBTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routeDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteDBTableOrderingComposer(
            $db: $db,
            $table: $db.routeDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointDBTableOrderingComposer get pointId {
    final $$PointDBTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pointId,
      referencedTable: $db.pointDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointDBTableOrderingComposer(
            $db: $db,
            $table: $db.pointDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImageDBTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImageDBTable> {
  $$ImageDBTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$RouteDBTableAnnotationComposer get routeId {
    final $$RouteDBTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.routeId,
      referencedTable: $db.routeDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RouteDBTableAnnotationComposer(
            $db: $db,
            $table: $db.routeDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointDBTableAnnotationComposer get pointId {
    final $$PointDBTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pointId,
      referencedTable: $db.pointDB,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointDBTableAnnotationComposer(
            $db: $db,
            $table: $db.pointDB,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImageDBTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImageDBTable,
          ImageDBData,
          $$ImageDBTableFilterComposer,
          $$ImageDBTableOrderingComposer,
          $$ImageDBTableAnnotationComposer,
          $$ImageDBTableCreateCompanionBuilder,
          $$ImageDBTableUpdateCompanionBuilder,
          (ImageDBData, $$ImageDBTableReferences),
          ImageDBData,
          PrefetchHooks Function({bool routeId, bool pointId})
        > {
  $$ImageDBTableTableManager(_$AppDatabase db, $ImageDBTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImageDBTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImageDBTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImageDBTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> routeId = const Value.absent(),
                Value<int?> pointId = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
              }) => ImageDBCompanion(
                id: id,
                routeId: routeId,
                pointId: pointId,
                fileName: fileName,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> routeId = const Value.absent(),
                Value<int?> pointId = const Value.absent(),
                required String fileName,
                required String imageUrl,
              }) => ImageDBCompanion.insert(
                id: id,
                routeId: routeId,
                pointId: pointId,
                fileName: fileName,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ImageDBTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({routeId = false, pointId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (routeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.routeId,
                                referencedTable: $$ImageDBTableReferences
                                    ._routeIdTable(db),
                                referencedColumn: $$ImageDBTableReferences
                                    ._routeIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (pointId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pointId,
                                referencedTable: $$ImageDBTableReferences
                                    ._pointIdTable(db),
                                referencedColumn: $$ImageDBTableReferences
                                    ._pointIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ImageDBTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImageDBTable,
      ImageDBData,
      $$ImageDBTableFilterComposer,
      $$ImageDBTableOrderingComposer,
      $$ImageDBTableAnnotationComposer,
      $$ImageDBTableCreateCompanionBuilder,
      $$ImageDBTableUpdateCompanionBuilder,
      (ImageDBData, $$ImageDBTableReferences),
      ImageDBData,
      PrefetchHooks Function({bool routeId, bool pointId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserDBTableTableManager get userDB =>
      $$UserDBTableTableManager(_db, _db.userDB);
  $$RouteDBTableTableManager get routeDB =>
      $$RouteDBTableTableManager(_db, _db.routeDB);
  $$PointDBTableTableManager get pointDB =>
      $$PointDBTableTableManager(_db, _db.pointDB);
  $$ImageDBTableTableManager get imageDB =>
      $$ImageDBTableTableManager(_db, _db.imageDB);
}
