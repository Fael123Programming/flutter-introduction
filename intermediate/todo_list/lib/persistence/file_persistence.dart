import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/persistence/data_persistence_entity.dart';

class FilePersistence extends DataPersistenceEntity {
  static const localFileName = 'taskList.json';

  static Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    String localPath = dir.path;
    return File('$localPath/$localFileName');
  }

  @override
  void create(Task task) async {
    final localFile = await FilePersistence._getLocalFile();
    String jsonTask = json.encode(task.toMap());
    localFile.writeAsStringSync(jsonTask, flush: true, mode: FileMode.append);
  }

  @override
  Future<List<Task>> readAll() async {
    List<Task> tasks = [];
    final localFile = await FilePersistence._getLocalFile();
    String jsonTasks = await localFile.readAsString();
    List<Map> mapTasks = json.decode(jsonTasks);
    for (Map task in mapTasks) {
      tasks.add(Task.fromMap(task));
    }
    return tasks;
  }

  @override
  Future<Task?>? readById(int id) async {
    if (isInvalidId(id)) {
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
  void update(Task task) async {
    //Getting the list of tasks from the local file.
    List<Task> tasks = await readAll();
    //Getting the position of the task to be updated in the list of tasks.
    int i = 0;
    while (tasks[i].id != task.id) {
      i++;
      //This task's id does not exist on the list.
      if (i == tasks.length) {
        return;
      }
    }
    //Remove the former task.
    tasks.removeAt(i);
    //Inserting the newer, updated.
    tasks.insert(i, task);
    //A list to contain all tasks converted into maps.
    List<Map> mapTasks = Task.convertIntoMaps(tasks);
    //Accessing the local file to record all tasks that have been converted into maps.
    FilePersistence._writeMapTasksIntoLocalFile(mapTasks);
    //This update preserves the order of the tasks recorded in the file,
  }

  @override
  void delete(int id) async {
    if (isInvalidId(id)) {
      return;
    }
    List<Task> tasks = await readAll();
    if (id >= tasks.length) {
      return;
    }
    int i = 0;
    while (tasks[i].id != id) {
      i++;
      //This task's id does not exist on the list.
      if (i == tasks.length) {
        return;
      }
    }
    tasks.removeAt(i);
    List<Map> mapTasks = Task.convertIntoMaps(tasks);
    FilePersistence._writeMapTasksIntoLocalFile(mapTasks);
  }

  static void _writeMapTasksIntoLocalFile(List<Map> mapTasks) async {
    final localFile = await FilePersistence._getLocalFile();
    String jsonTasks = json.encode(mapTasks);
    localFile.writeAsStringSync(jsonTasks, flush: true);
  }
}
