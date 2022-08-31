import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ToDoContainer.dart';
import '../providers/TodoProvider.dart';

class CompletedToDoDisplayWidget extends StatelessWidget {
  final ToDo todo;
  CompletedToDoDisplayWidget(this.todo);
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListTile(
          leading: CircleAvatar(
              radius: 30,
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: FittedBox(child: Text("${todo.title[0]}")))),
          title: Text("${todo.title}"),
          subtitle: Text("${todo.creationDate}")),
    );
  }
}
