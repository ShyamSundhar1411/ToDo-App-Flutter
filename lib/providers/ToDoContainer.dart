import 'package:flutter/material.dart';
import '../data/data.dart';
import './TodoProvider.dart';

class ToDoContainerProvider with ChangeNotifier {
  List<ToDo> _todoitems = DUMMY_DATA;
  List<ToDo> get getToDos {
    return _todoitems;
  }

  void deleteToDo(String id) {
    _todoitems.removeWhere((element)=>element.id==id);
    notifyListeners();
  }
  int get completedToDos{
    return _todoitems.where((element) => element.isCompleted == true).length;
  }

  int get totalToDos {
    return _todoitems.length;
  }
}
