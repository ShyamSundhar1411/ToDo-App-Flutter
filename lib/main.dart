import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/TodoDisplayScreen.dart';
import './providers/TodoProvider.dart';
import './providers/ToDoContainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ToDoContainerProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Todo App",
        theme: ThemeData(
            primaryColor: Colors.blueAccent, primarySwatch: Colors.deepOrange),
        home: TodoDisplayScreen(),
        initialRoute: '/',
      ),
    );
  }
}
