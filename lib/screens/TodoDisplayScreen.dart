import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/todoDisplayWidget.dart';
import '../providers/ToDoContainer.dart';

enum FilterOptions {
  Important,
  All,
}

class TodoDisplayScreen extends StatefulWidget {
  @override
  State<TodoDisplayScreen> createState() => _TodoDisplayScreenState();
}

class _TodoDisplayScreenState extends State<TodoDisplayScreen> {
  var _showOnlyImportant = false;
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context);
    final todoData = (_showOnlyImportant)?todoContainer.getImportantToDos:todoContainer.getToDos;
    return Scaffold(
      appBar: AppBar(title: Text("My Todo"), actions: [
        PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Important) {
                  _showOnlyImportant = true;
                } else {
                  _showOnlyImportant = false;
                }
              });
            },
            itemBuilder: (_) => [
                  PopupMenuItem(
                      child: Text("Important"), value: FilterOptions.Important),
                  PopupMenuItem(
                      child: Text("Show All"), value: FilterOptions.All),
                ])
      ]),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ToDoDisplayWidget(todoData[index]);
          },
          itemCount: todoData.length,
        ),
      ),
    );
  }
}
