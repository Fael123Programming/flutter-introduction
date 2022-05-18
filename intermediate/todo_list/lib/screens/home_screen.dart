import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
// import 'package:todo_list/persistence/database_persistence.dart';
import 'package:todo_list/persistence/file_persistence.dart';
import 'package:todo_list/screens/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //A list to keep track of all tasks user has created.
  late List<Task> tasks = [];
  //The way the tasks are being saved in the disc.
  FilePersistence filePersistence = FilePersistence();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filePersistence.read().then((readTasks) {
      setState(() {
        if (readTasks != null) {
          tasks = readTasks;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task App"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text(
                "No tasks yet",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            )
          : ListView.separated(
              itemCount: tasks.length,
              itemBuilder: (context, position) {
                //The current task user is handling.
                Task task = tasks[position];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.green,
                    child: const Align(
                      alignment: Alignment(-0.9, 0),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment(0.9, 0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    bool deleteTask = false;
                    if (direction == DismissDirection.startToEnd) {
                      //Scrolling from left to right, edit the task.
                      //The edited task after user have edited it.
                      Task editedTask = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(
                            task: task,
                            editing: true,
                          ),
                        ),
                      );
                      setState(
                        () {
                          tasks.removeAt(position);
                          tasks.insert(position, editedTask);
                          filePersistence.save(tasks);
                        },
                      );
                    } else {
                      //Scrolling from right to left, deletes the task.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Deleted"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      setState(() {
                        //Deleting the task in the disc using its id.
                        tasks.removeAt(position);
                        filePersistence.save(tasks);
                      });
                      deleteTask = true;
                    }
                    return deleteTask;
                  },
                  child: ListTile(
                    title: Text(
                      task.text,
                      style: TextStyle(
                        color: task.done ? Colors.grey : Colors.black,
                        decoration: task.done
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        task.done = !task.done;
                        filePersistence.save(tasks);
                      });
                    },
                    onLongPress: () async {
                      Task editedTask = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(
                            task: task,
                            editing: true,
                          ),
                        ),
                      );
                      setState(() {
                        tasks.removeAt(position);
                        tasks.insert(position, editedTask);
                        filePersistence.save(tasks);
                      });
                    },
                    trailing: task.done
                        ? const Icon(
                            Icons.check_box,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.check_box,
                            color: Colors.grey,
                          ),
                  ),
                );
              },
              separatorBuilder: (context, position) => const Divider(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            Task newTask = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
            setState(() {
              tasks.add(newTask);
              filePersistence.save(tasks);
            });
          } catch (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Canceled"),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
