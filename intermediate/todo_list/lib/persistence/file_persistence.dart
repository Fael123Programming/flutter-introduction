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
  void saveData(List<Task> tasks) async {
    final localFile = await _getLocalFile();
    List mapTasksList = [];
    for (var task in tasks) {
      mapTasksList.add(task.toMap());
    }
    String jsonTasks = json.encode(mapTasksList);
    localFile.writeAsStringSync(jsonTasks, flush: true);
  }

  @override
  Future<List<Task>> readData() async {
    List<Task> tasks = [];
    try {
      final localFile = await _getLocalFile();
      String jsonTasks = await localFile.readAsString();
      List jsonTasksList = json.decode(jsonTasks);
      for (var task in jsonTasksList) {
        tasks.add(Task.fromMap(task));
      }
    } catch (error) {
      print('The following error was thrown: $error');
    }
    return tasks;
  }
}
