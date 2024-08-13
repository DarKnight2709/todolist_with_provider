import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_provider/models/todo.dart';
import 'package:todolist_with_provider/provider/todo_model.dart';

class TodoTile extends StatefulWidget {
  Todo todo;

  TodoTile({super.key, required this.todo});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Checkbox(
          onChanged: (value) {
            setState(() {
              widget.todo.isChecked = !widget.todo.isChecked;
            });
          },
          value: widget.todo.isChecked,
        ),
        title: Text(widget.todo.title),
        trailing: IconButton(onPressed: () {

          var list = context.read<TodoModel>();
          list.addToDeletedList(widget.todo.title);


        }, 
        icon: const Icon(Icons.delete)));
  }
}
