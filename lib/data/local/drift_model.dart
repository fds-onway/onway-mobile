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

class RouteDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get tags => text()();
  DateTimeColumn get dataCriacao => dateTime().withDefault(currentDateAndTime)();
}

class PointDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routeId =>
      integer().references(RouteDB, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get type => text()();
  TextColumn get description => text()();
  TextColumn get latitude => text()();
  TextColumn get longitude => text()();
  DateTimeColumn get dataCriacao => dateTime().withDefault(currentDateAndTime)();
}

class ImageDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routeId =>
      integer().nullable().references(RouteDB, #id, onDelete: KeyAction.cascade)();
  IntColumn get pointId =>
      integer().nullable().references(PointDB, #id, onDelete: KeyAction.cascade)();
  TextColumn get fileName => text()();
  TextColumn get imageUrl => text()();
}

@DriftDatabase(tables: [UserDB, RouteDB, PointDB, ImageDB])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());
  @override
  int get schemaVersion => 1;
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }

  static QueryExecutor _openConnection() {
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
