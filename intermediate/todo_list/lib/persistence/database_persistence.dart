import 'package:sqflite/sqflite.dart';
import 'package:todo_list/persistence/data_persistence_entity.dart';
import 'package:todo_list/persistence/database_helper.dart';
import 'package:todo_list/models/task.dart';

class DatabasePersistence extends DataPersistenceEntity {
  Database? _db;
  static final _instance = DatabasePersistence.internal();
  static const databaseName = 'taskDatabase.db';

  DatabasePersistence.internal();

  factory DatabasePersistence() => _instance;

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
    await db.execute(DatabaseHelper.createMainTableSQLStatement);
  }

  Future _onUpgradeDb(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute(DatabaseHelper.rebuildMainTableSQLStatement);
    }
  }

  @override
  void saveData(List<Task> tasks) async {
    Database? db = await DatabasePersistence().db;
    if (db == null) {
      return;
    }
    for (Task task in tasks) {
      task.id = await db.insert(DatabaseHelper.mainTable, task.toMapBd());
    }
  }

  @override
  Future<List<Task>> readData() async {
    Database? db = await DatabasePersistence().db;
    if (db == null) {
      return [];
    }
    List<Map> tasksFromDb = await db.query(DatabaseHelper.mainTable,
        columns: DatabaseHelper.columnsList);
    List<Task> tasks = [];
    for (Map map in tasksFromDb) {
      tasks.add(Task.fromMapDb(map));
    }
    return tasks;
  }

  @override
  Future<Task?>? readDataById(int id) async {
    Database? db;
    if (id < 0 || (db = await DatabasePersistence().db) == null) {
      return null;
    }
    List<Map> taskFromDb = await db!.query(
      DatabaseHelper.mainTable,
      columns: DatabaseHelper.columnsList,
      where: '${DatabaseHelper.idColumn} = ?',
      whereArgs: [id],
    );
    return Task.fromMapDb(taskFromDb.first);
  }
}
