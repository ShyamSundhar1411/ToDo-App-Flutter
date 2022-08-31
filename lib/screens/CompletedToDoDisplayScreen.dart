import 'package:flutter/material.dart';
import '../providers/ToDoContainer.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/completedToDoDisplayWidget.dart';

class CompletedToDoDisplayScreen extends StatelessWidget {
  static const routeName = '/completed/todos';
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context);
    final todoData = todoContainer.getCompletedToDos;
    return Scaffold(
        appBar: AppBar(title: Text("Completed ToDos")),
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CompletedToDoDisplayWidget(todoData[index]);
            },
            itemCount: todoData.length,
          ),
        ),
        drawer: AppDrawer());
  }
}
