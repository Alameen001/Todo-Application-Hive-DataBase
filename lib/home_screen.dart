import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/Todo.dart';
import 'package:todo_app/add_Todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
// Box friendBox = Hive.box("Friend");
// String? name;

  Box todoBox = Hive.box<Todo>('todo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive ToDo"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: todoBox.listenable(),
          builder: (context, Box box, widget) {
            if (box.isEmpty) {
              return Center(
                child: Text('No Todo available'),
              );
            } else {
              return ListView.builder(

                //----tips----///
                reverse: true,
                shrinkWrap: true,
                ///
                itemCount: box.length,
                itemBuilder: (context, index) {
                  Todo todo = box.getAt(index);
                  return ListTile(
                    leading: Checkbox(
                      value: todo.isCompleated,
                      onChanged: (value) {
                        Todo newtodo =
                            Todo(title: todo.title, isCompleated: value!);
                        box.putAt(index, newtodo);
                      },
                    ),
                    title: Text(todo.title),
                    trailing: IconButton(
                        onPressed: () {
                          box.deleteAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Todo Deleted succesfully!")));
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return AddTodo();
              },
            ));
          }),
    );
  }
}
