class Task {
  int? id;
  late String text;
  bool done = false;

  Task(this.text);

  Task.fromMapDb(Map task) {
    id = task['id'];
    text = task['text'];
    done = task['done'] == 1 ? true : false; //SQLite does not have bool type.
  }

  Task.fromMap(Map task) {
    id = task['id'];
    text = task['text'];
    done = task['done'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'done': done,
    };
  }

  static List<Map> convertIntoMaps(List<Task> tasks) {
    List<Map> mapsList = [];
    for (Task t in tasks) {
      mapsList.add(t.toMap());
    }
    return mapsList;
  }

  @override
  String toString() {
    return "Task(id: $id, text: $text, done: $done)";
  }
}
