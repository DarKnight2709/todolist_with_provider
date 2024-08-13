import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_provider/pages/deleted_todo.dart';
import 'package:todolist_with_provider/provider/todo_model.dart';
import 'package:todolist_with_provider/utils/todotile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var todoList = context.watch<TodoModel>().items;
    return Scaffold(
      appBar: appBar(),
      drawer:  Drawer(
        child: Container(
          color: Colors.blue[100],
          child: ListView(
            children:  [
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Deleted todo"),
                onTap:(){
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeletedTodo())
                  );
                }
              )
            ],
          )
        )
      ),
      body: ListView.builder( 
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(todo: todoList[index]);
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return  Dialog();
                });
          },
          child: const Icon(Icons.add)),
    );
  }

  AppBar appBar() {
    return AppBar(
      
      title: const Text("TODO", style: TextStyle(color: Colors.white)),
      centerTitle: true,
      
      backgroundColor: Colors.blue,
    );
  }
}

class Dialog extends StatelessWidget {
  final _controller = TextEditingController();

   Dialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      
      
      
      title: const Text("Add"),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
             TextField(
              controller: _controller,
     
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                hintText: "Title"
              ),
            ),
            Center(
              child: Row(
                children: [
                  TextButton(
                    onPressed: (){
                      var list = context.read<TodoModel>();
                      list.add(_controller.text);
                      _controller.clear();
                      Navigator.pop(context);
                      
    
                    },
                    child: const Text("Add"),
                  
                  ),
                  TextButton(
                    onPressed: (){
                      _controller.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  )
                ],
              )
            )
          ],
        ),
      ),
      
      
      
    );
  }
}
