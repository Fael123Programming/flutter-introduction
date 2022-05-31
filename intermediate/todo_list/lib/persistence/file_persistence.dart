import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/models/task.dart';

class FilePersistence {
  static const localFileName = 'taskList.json';

  static Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    String localPath = dir.path;
    return File('$localPath/$localFileName');
  }

  void save(List<Task> tasks) async {
    final localFile = await FilePersistence._getLocalFile();
    List<Map> mapTasks = [];
    for (Task t in tasks) {
      mapTasks.add(t.toMap());
    }
    String dataToWrite = json.encode(mapTasks);
    localFile.writeAsString(dataToWrite);
  }

  Future<List<Task>?> read() async {
    List<Task> tasks = [];
    final localFile = await FilePersistence._getLocalFile();
    String jsonTasks = await localFile.readAsString();
    List mapTasks = json.decode(jsonTasks);
    for (Map mapTask in mapTasks) {
      tasks.add(Task.fromMap(mapTask));
    }
    return tasks;
  }
}
