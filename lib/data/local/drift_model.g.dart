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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserDBTable userDB = $UserDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userDB];
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserDBTableTableManager get userDB =>
      $$UserDBTableTableManager(_db, _db.userDB);
}
