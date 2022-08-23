import 'package:flutter/material.dart';
import '../providers/TodoProvider.dart';

List<ToDo> DUMMY_DATA = [
  ToDo(
      id: '1',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Walk a dog",
      isImportant: false),
  ToDo(
      id: '2',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 1",
      isImportant: true),
  ToDo(
      id: '3',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 2",
      isImportant: false),
  ToDo(
      id: '4',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 3",
      isImportant: true),
  ToDo(
      id: '5',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 4",
      isImportant: true),
];
