import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/todoDisplayWidget.dart';
import '../providers/ToDoContainer.dart';

class TodoDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context);
    final todoData = todoContainer.getToDos;
    return Scaffold(
        appBar: AppBar(
          title: Text("My Todo"),
        ),
        body:Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ToDoDisplayWidget(todoData[index],todoData[index].id);
                },
                itemCount: todoData.length,
              ),
            ),
          
        );
  }
}
