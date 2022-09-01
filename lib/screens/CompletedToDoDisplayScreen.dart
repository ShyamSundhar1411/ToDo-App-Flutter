import 'package:flutter/material.dart';
import '../providers/ToDoContainer.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/completedToDoDisplayWidget.dart';

enum FilterOptions { Important, All, Clear }

class CompletedToDoDisplayScreen extends StatefulWidget {
  static const routeName = '/completed/todos';

  @override
  State<CompletedToDoDisplayScreen> createState() =>
      _CompletedToDoDisplayScreenState();
}

class _CompletedToDoDisplayScreenState
    extends State<CompletedToDoDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context);
    final todoData = todoContainer.getCompletedToDos;
    return Scaffold(
        appBar: AppBar(title: Text("Completed ToDos"), actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Clear) {
                    todoContainer.clearCompletedContainer();
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text("Clear"), value: FilterOptions.Clear),
                  ])
        ]),
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
