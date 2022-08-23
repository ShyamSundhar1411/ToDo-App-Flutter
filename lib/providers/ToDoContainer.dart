import 'package:flutter/material.dart';
import '../data/data.dart';
import './TodoProvider.dart';

class ToDoContainerProvider with ChangeNotifier {
  List<ToDo> _todoitems = DUMMY_DATA;
  List<ToDo> get getToDos {
    return [..._todoitems];
  }
}
