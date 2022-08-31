import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/createNewToDoWidget.dart';
import '../widgets/app_drawer.dart';
import '../widgets/todoDisplayWidget.dart';
import '../providers/ToDoContainer.dart';

enum FilterOptions {
  Important,
  All,
}

class TodoDisplayScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  State<TodoDisplayScreen> createState() => _TodoDisplayScreenState();
}

class _TodoDisplayScreenState extends State<TodoDisplayScreen> {
  var _showOnlyImportant = false;

  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<ToDoContainerProvider>(context);
    final todoData = (_showOnlyImportant)
        ? todoContainer.getImportantToDos
        : todoContainer.getToDos;
    void _getDataFromModel(String title, bool isImportant) {
      todoContainer.addItem(title, isImportant);
    }

    void _startModelForNewTodo(BuildContext ctx) {
      showModalBottomSheet(
          context: ctx,
          builder: (_) {
            return GestureDetector(
              onTap: () {},
              child: NewToDo(_getDataFromModel),
              behavior: HitTestBehavior.opaque,
            );
          });
    }

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
      drawer: AppDrawer(),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ToDoDisplayWidget(todoData[index]);
          },
          itemCount: todoData.length,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startModelForNewTodo(context),
      ),
    );
  }
}
