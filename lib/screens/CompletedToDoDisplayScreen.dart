import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/app_drawer.dart';

class CompletedToDoDisplayScreen extends StatelessWidget {
  static const routeName = '/completed/todos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Completed ToDos")),
      body:Container(child: Center(child:Text("Test")),
      ),
      drawer: AppDrawer()

    );
  }
}
