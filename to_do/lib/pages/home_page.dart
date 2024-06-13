import 'package:flutter/material.dart';
import 'package:to_do/pages/dialog_box.dart';
import 'package:to_do/util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox ();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text('TO DO'),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return Todo(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index));
          }),
    );
  }
}
