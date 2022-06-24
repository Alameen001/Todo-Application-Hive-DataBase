


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/Todo.dart';
import 'package:todo_app/add_Todo.dart';
import 'package:todo_app/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory =await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  // genarator adaptor//
  Hive.registerAdapter(TodoAdapter());
//open a new box with todo type //
  await Hive.openBox<Todo>('todo');
  await Hive.openBox('Friend');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List  ',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:Homescreen()
    );
  }
}
