import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_provider/pages/home.dart';
import 'package:todolist_with_provider/provider/todo_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => TodoModel(),
      child: const MaterialApp(
        
        debugShowCheckedModeBanner: false,
        home: MyHomePage()
      ),
    );
  }
}


