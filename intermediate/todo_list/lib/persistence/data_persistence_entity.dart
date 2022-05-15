import 'package:todo_list/models/task.dart';

abstract class DataPersistenceEntity {
  void create(Task task);

  Future<List<Task>> readAll();

  Future<Task?>? readById(int id);

  void update(Task task);

  void delete(int id);

  bool isInvalidId(int id) {
    return id < 0;
  }
}
