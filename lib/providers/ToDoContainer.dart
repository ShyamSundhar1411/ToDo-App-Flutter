import 'package:flutter/material.dart';
import '../data/data.dart';
import './TodoProvider.dart';

class ToDoContainerProvider with ChangeNotifier {
  List<ToDo> _todoitems = DUMMY_DATA;
  List<ToDo> _completedtodoitems = [];
  List<ToDo> get getToDos {
    return _todoitems;
  }

  List<ToDo> get getImportantToDos {
    return _todoitems.where((element) => element.isImportant == true).toList();
  }

  List<ToDo> get getCompletedToDos {
    return _completedtodoitems.toList();
  }

  void deleteToDo(String id) {
    _todoitems.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addItem(String title, bool isImportant) {
    final newTodo = ToDo(
        id: DateTime.now().toString(),
        title: title,
        isImportant: isImportant,
        creationDate: DateTime.now());
    _todoitems.add(newTodo);
    notifyListeners();
  }

  int get completedToDos {
    return _todoitems.where((element) => element.isCompleted == true).length;
  }

  int get totalToDos {
    return _todoitems.length;
  }

  ToDo getToDoById(String id) {
    return _todoitems.firstWhere((element) => element.id == id);
  }

  void toggleIsCompleted(String id) {
    ToDo todo = _todoitems.firstWhere((element) => element.id == id);
    todo.isCompleted = !(todo.isCompleted);
    _todoitems.removeWhere((element) => element.id == id);
    _completedtodoitems.add(todo);
    notifyListeners();
  }
}
