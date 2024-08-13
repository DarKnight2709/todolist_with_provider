import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_provider/models/todo.dart';
import 'package:todolist_with_provider/provider/todo_model.dart';

class Deletedtodotile extends StatefulWidget {
  Todo todo;

  Deletedtodotile({super.key, required this.todo});

  @override
  State<Deletedtodotile> createState() => _DeletedtodotileState();
}

class _DeletedtodotileState extends State<Deletedtodotile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Checkbox(
          onChanged: (value) {
           
          },
          value: false,
        ),
        title: Text(widget.todo.title),
        trailing: IconButton(onPressed: () {
          
          var list = context.read<TodoModel>();
          list.removeFromDeletedList(widget.todo.title);


        }, 
        icon: const Icon(Icons.restore)));
  }
}
