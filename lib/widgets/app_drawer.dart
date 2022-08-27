import 'package:flutter/material.dart';
import '../screens/TodoDisplayScreen.dart';
import '../screens/CompletedToDoDisplayScreen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello Friend !"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pending_actions),
            title: Text("Pending ToDos"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TodoDisplayScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.check),
            title: Text("Completed ToDos"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CompletedToDoDisplayScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}