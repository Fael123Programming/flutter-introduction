class DatabaseHelper {
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
}
