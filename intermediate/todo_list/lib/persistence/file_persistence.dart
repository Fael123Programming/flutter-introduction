import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/persistence/data_persistence_entity.dart';

class FilePersistence extends DataPersistenceEntity {
  static const localFileName = 'taskList.json';

  Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    String localPath = dir.path;
    return File('$localPath/$localFileName');
  }

  @override
  void create(Task task) async {
    final localFile = await _getLocalFile();
    String jsonTask = json.encode(task.toMap());
    localFile.writeAsStringSync(jsonTask, flush: true, mode: FileMode.append);
  }

  @override
  Future<List<Task>> readAll() async {
    List<Task> tasks = [];
    try {
      final localFile = await _getLocalFile();
      String jsonTasks = await localFile.readAsString();
      List mapTasksList = json.decode(jsonTasks);
      for (var task in mapTasksList) {
        tasks.add(Task.fromMap(task));
      }
    } catch (error) {}
    return tasks;
  }

  @override
  Future<Task?>? readById(int id) async {
    if (id < 0) {
      return null;
    }
    List<Task> tasks = await readAll();
    for (Task task in tasks) {
      if (task.id == id) {
        return task;
      }
    }
    return null;
  }

  @override
  void update(Task task) {}

  @override
  void delete(int id) {}
}
