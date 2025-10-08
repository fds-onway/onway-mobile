import 'dart:async';
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'drift_model.g.dart';

class UserDB extends Table {
  IntColumn get id => integer()();
  TextColumn get login => text()();
  TextColumn get password => text()();
  TextColumn get cnpj => text()();

  DateTimeColumn get dataAlteracao => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [UserDB])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  //@Deprecated('Não use diretamente. Utilize através do getIt para manter somente uma instância (Singleton pattern)')
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      // onUpgrade: (m, from, to) async {
      //   /// Run migration steps without foreign keys and re-enable them later
      //   /// (https://drift.simonbinder.eu/docs/advanced-features/migrations/#tips)
      //   await customStatement('PRAGMA foreign_keys = OFF');

      //   /// [migrationSteps] method coming from db_migration.dart file
      //   /// which drift generated
      //   await transaction(
      //     () => VersionedSchema.runMigrationSteps(
      //       migrator: m,
      //       from: from,
      //       to: to,
      //       steps: migrationSteps(
      //         /// From version 1 to 2
      //         from1To2: (Migrator m, Schema2 schema) async {
      //           /// Write version 2 changes here
      //           ///
      //           /// Add new columns to [TaskTable]
      //           await m.addColumn(schema.ocorrenciaDB, schema.ocorrenciaDB.motivoDescricao);
      //         },
      //         from2To3: (Migrator m, Schema3 schema) async {
      //           await m.createTable(schema.emitenteGeolocalizacaoDB);
      //         },
      //         from3To4: (Migrator m, Schema4 schema) async {
      //           await m.createTable(schema.loginLogDB);
      //         },
      //       ),
      //     ),
      //   );
      // },
      // beforeOpen: (details) async {
      //   /// Enable foreign_keys
      //   await customStatement('PRAGMA foreign_keys = ON');
      // },
    );
  }

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.

    return driftDatabase(name: 'MultiAppDrift').interceptWith(LogInterceptor());
  }
}

class LogInterceptor extends QueryInterceptor {
  final String logName = 'Drift:';
  Future<T> _run<T>(
    String description,
    FutureOr<T> Function() operation,
  ) async {
    final stopwatch = Stopwatch()..start();
    log(name: logName, 'Running $description');

    try {
      final result = await operation();
      log(
        name: logName,
        ' => succeeded after ${stopwatch.elapsedMilliseconds}ms',
      );
      return result;
    } on Object catch (e) {
      log(
        name: logName,
        ' => failed after ${stopwatch.elapsedMilliseconds}ms ($e)',
      );
      rethrow;
    }
  }

  @override
  TransactionExecutor beginTransaction(QueryExecutor parent) {
    log(name: logName, 'begin');
    return super.beginTransaction(parent);
  }

  @override
  Future<void> commitTransaction(TransactionExecutor inner) {
    return _run('commit', () => inner.send());
  }

  @override
  Future<void> rollbackTransaction(TransactionExecutor inner) {
    return _run('rollback', () => inner.rollback());
  }

  @override
  Future<void> runBatched(
    QueryExecutor executor,
    BatchedStatements statements,
  ) {
    return _run(
      'batch with $statements',
      () => executor.runBatched(statements),
    );
  }

  @override
  Future<int> runInsert(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    return _run(
      '$statement with $args',
      () => executor.runInsert(statement, args),
    );
  }

  @override
  Future<int> runUpdate(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    return _run(
      '$statement with $args',
      () => executor.runUpdate(statement, args),
    );
  }

  @override
  Future<int> runDelete(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    return _run(
      '$statement with $args',
      () => executor.runDelete(statement, args),
    );
  }

  @override
  Future<void> runCustom(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    return _run(
      '$statement with $args',
      () => executor.runCustom(statement, args),
    );
  }

  @override
  Future<List<Map<String, Object?>>> runSelect(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    return _run(
      '$statement with $args',
      () => executor.runSelect(statement, args),
    );
  }
}
