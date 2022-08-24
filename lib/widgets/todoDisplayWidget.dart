import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ToDoContainer.dart';
import '../providers/TodoProvider.dart';

class ToDoDisplayWidget extends StatelessWidget {
  final ToDo todo;
  final String id;
  ToDoDisplayWidget(this.todo,this.id);
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context,listen: false);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 35,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          print("Done");
        } else {
          todoContainer.deleteToDo(todo.id);
          print("Deleted");
          print(todoContainer.getToDos);
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ListTile(
            leading: CircleAvatar(
                radius: 30,
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: FittedBox(child: Text("${todo.title[0]}")))),
            title: Text("${todo.title}"),
            subtitle: Text("${todo.creationDate}")),
      ),
    );
  }
}
