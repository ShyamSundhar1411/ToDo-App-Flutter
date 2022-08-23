import 'package:flutter/material.dart';

class ToDo with ChangeNotifier {
  final String id;
  final String title;
  bool isCompleted = false;
  bool isImportant;
  final DateTime creationDate;
  ToDo(
      {required this.id,
      required this.title,
      isCompleted = false,
      required this.isImportant,
      required this.creationDate
    });
  
  
}
