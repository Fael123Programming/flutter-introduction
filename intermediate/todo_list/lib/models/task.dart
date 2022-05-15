class Task {
  int? id;
  late String text;
  bool done = false;

  Task(this.text);

  Task.fromMapFile(Map task) {
    text = task['text'];
    done = task['done'];
  }

  Map toMapFile() {
    return {
      'text': text,
      'done': done,
    };
  }

  Task.fromMapDb(Map task) {
    id = task['id'];
    text = task['text'];
    done = task['done'] == 1 ? true : false; //SQLite does not have bool type.
  }

  Map<String, dynamic> toMapBd() {
    return {
      'id': id,
      'text': text,
      'done': done,
    };
  }

  @override
  String toString() {
    return "Task(id: $id, text: $text, done: $done)";
  }
}