import 'package:flutter/material.dart';
import 'package:todolist_with_provider/models/todo.dart';

class TodoModel extends ChangeNotifier{
  final List<String> _list = ["tran duy quyen", "tran duy hoang", "tran duy hien", "tran thi tien"];
  final List<String> _deletedList = [];
  



  List<Todo> get items => _list.map((String title) => Todo(title: title) ).toList();
  List<Todo> get deletedItems => _deletedList.map((String title) => Todo(title: title) ).toList();


  void add(String title){
    _list.add(title);
    notifyListeners();
  }

  void remove(String title){
    _list.remove(title);
    notifyListeners();
  }

  void addToDeletedList(String title){
    remove(title);
    _deletedList.add(title);
    notifyListeners();
  }

  void removeFromDeletedList(String title){
    _deletedList.remove(title);
    add(title);
    notifyListeners();
  }

}