import 'package:flutter/material.dart';

class TodoDisplayScreen extends StatelessWidget {
  const TodoDisplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("My Todo"),
          ),
      body: Container(
        child: Center(
          child:Text("This is test Home Screen")
          ),
      ),
    );
  }
}
