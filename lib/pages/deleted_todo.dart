import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_provider/provider/todo_model.dart';
import 'package:todolist_with_provider/utils/deletedtodotile.dart';

class DeletedTodo extends StatelessWidget {
  const DeletedTodo({super.key});

  @override
  Widget build(BuildContext context) {
    var deletedList = context.watch<TodoModel>().deletedItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text("Deleted Todo"),
      ),
      body: ListView.builder( 
          itemCount: deletedList.length,
          itemBuilder: (context, index) {
            return Deletedtodotile(todo: deletedList[index]);
          }),


    );
  }
}