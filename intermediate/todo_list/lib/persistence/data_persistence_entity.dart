import 'package:todo_list/models/task.dart';

abstract class DataPersistenceEntity {
  void saveData(List<Task> tasks);

  Future<List<Task>> readData();

  Future<Task?>? readDataById(int id);
}
