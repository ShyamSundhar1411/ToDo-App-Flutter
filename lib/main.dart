import 'package:flutter/material.dart';
import './screens/TodoDisplayScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      theme: ThemeData(
          primaryColor: Colors.blueAccent, primarySwatch: Colors.deepOrange),
      home: TodoDisplayScreen(),
    );
  }
}
