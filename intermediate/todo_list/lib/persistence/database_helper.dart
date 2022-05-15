import 'package:sqflite/sqflite.dart';
import 'package:todo_list/persistence/database_persistence.dart';

class DatabaseHelper {
  Database? _db;
  static final _instance = DatabaseHelper.internal();
  static const databaseName = 'taskDatabase.db';

  DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  Future<Database?> get db async {
    //If _db is null it will receive the result of initDb().
    //Finally, its value will be returned.
    return _db ??= await initDb();
  }

  Future<Database?> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$databaseName';
    try {
      _db = await openDatabase(path,
          version: 1, onCreate: _onCreateDb, onUpgrade: _onUpgradeDb);
    } catch (error) {
      _db = null;
    }
    return _db;
  }

  Future _onCreateDb(Database db, int newVersion) async {
    await db.execute(DatabasePersistence.createMainTableSQLStatement);
  }

  Future _onUpgradeDb(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute(DatabasePersistence.rebuildMainTableSQLStatement);
    }
  }
}
