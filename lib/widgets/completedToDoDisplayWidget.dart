import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/ToDoContainer.dart';
import '../providers/TodoProvider.dart';

class CompletedToDoDisplayWidget extends StatelessWidget {
  final ToDo todo;
  CompletedToDoDisplayWidget(this.todo);
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context);
    final String formattedDate =
        DateFormat('dd MMM, yyyy').format(todo.creationDate);
    final String formattedTime =
        DateFormat('hh:mm a').format(todo.creationDate);
    return Dismissible(
      key: ValueKey(todo.id),
      background: Container(
        color: Colors.lightBlue,
        child: Icon(
          Icons.unarchive,
          color: Colors.white,
          size: 35,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      ),
      secondaryBackground: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      ),
      onDismissed: (direction) => {
        if (direction == DismissDirection.endToStart)
          {todoContainer.removeCompletedTodo(todo.id)}
        else
          {todoContainer.toggleReComplete(todo.id)}
      },
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: ListTile(
              leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: FittedBox(child: Text("${todo.title[0]}")))),
              title: Text("${todo.title}",style: TextStyle(color: (todo.isImportant)?Colors.green:Colors.black)),
              subtitle: Text.rich(TextSpan(children: [
                WidgetSpan(child: Icon(Icons.calendar_month_sharp, size: 17)),
                TextSpan(text: "${formattedDate}"),
                WidgetSpan(
                    child: SizedBox(
                  width: 25,
                )),
                WidgetSpan(child: Icon(Icons.alarm, size: 17)),
                TextSpan(text: "${formattedTime}")
              ])))),
    );
  }
}
