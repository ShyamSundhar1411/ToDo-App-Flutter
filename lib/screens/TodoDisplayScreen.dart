import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Center(child:Text(todoData[index].title));
          },
          itemCount: todoData.length,
        ),
      ),
    );
  }
}
