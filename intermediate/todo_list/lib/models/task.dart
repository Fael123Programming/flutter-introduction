class Task {
  late String text;
  bool done = false;

  Task(this.text);

  Task.fromMap(Map task) {
    for (var key in task.keys) {
      if (key != 'text' && key != 'done') {
        throw 'invalid key: $key';
      }
    }
    text = task['text'];
    done = task['done'];
  }

  Map toMap() {
    return {
      'text': text,
      'done': done,
    };
  }
}
