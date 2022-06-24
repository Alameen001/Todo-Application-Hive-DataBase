import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/Todo.dart';

class AddTodo extends StatelessWidget {
   AddTodo({ Key? key }) : super(key: key);

  TextEditingController titlecontroller =TextEditingController();
  Box todobox =Hive.box<Todo>("todo");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: titlecontroller,
              decoration: InputDecoration(
                labelText: "title",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              child: ElevatedButton(onPressed: (){
                if(titlecontroller.text != ' '){
                  Todo newtodo = Todo(
                    title: titlecontroller.text, isCompleated:false,);
                    todobox.add(newtodo);
                   Navigator.pop(context);
                }
              }, child: Text("Add ToDo,",style: TextStyle(fontSize: 20),)),
            )
          ], 
        ),
      ),

    );
  }
}