import 'package:sqflite/sqflite.dart';
import 'package:todo_list/persistence/data_persistence_entity.dart';
import 'package:todo_list/persistence/database_helper.dart';
import 'package:todo_list/models/task.dart';

class DatabasePersistence extends DataPersistenceEntity {
  static const mainTable = 'task';
  static const idColumn = 'id';
  static const textColumn = 'text';
  static const doneColumn = 'done';
  static const columnsList = [idColumn, textColumn, doneColumn];

  static String get createMainTableSQLStatement {
    return 'CREATE TABLE $mainTable ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $textColumn TEXT NOT NULL, $doneColumn INTEGER NOT NULL);';
  }

  static String get rebuildMainTableSQLStatement {
    return 'DROP TABLE $mainTable;$createMainTableSQLStatement';
  }

  @override
  Future create(Task task) async {
    Database? db = await DatabaseHelper().db;
    if (db == null) {
      return;
    }
    task.id = await db.insert(mainTable, task.toMap());
  }

  @override
  Future<List<Task>> readAll() async {
    Database? db = await DatabaseHelper().db;
    if (db == null) {
      return [];
    }
    List<Map> tasksFromDb = await db.query(mainTable,
        columns: columnsList);
    List<Task> tasks = [];
    for (Map map in tasksFromDb) {
      tasks.add(Task.fromMapDb(map));
    }
    return tasks;
  }

  @override
  Future<Task?>? readById(int id) async {
    Database? db;
    if (isInvalidId(id) || (db = await DatabaseHelper().db) == null) {
      return null;
    }
    List<Map> taskFromDb = await db!.query(
      mainTable,
      columns: columnsList,
      where: '$idColumn = ?',
      whereArgs: [id],
    );
    return Task.fromMapDb(taskFromDb.first);
  }

  @override
  void update(Task task) async {
    Database? db = await DatabaseHelper().db;
    if (db == null) {
      return;
    }
    await db.update(mainTable, task.toMap(),
        where: '$idColumn = ?', whereArgs: [task.id]);
  }

  @override
  void delete(int id) async {
    if (isInvalidId(id)) {
      return;
    }
    Database? db = await DatabaseHelper().db;
    if (db == null) {
      return;
    }
    await db.delete(mainTable,
        where: '$idColumn = ?', whereArgs: [id]);
  }
}
