import 'package:flutter/material.dart';
import '../providers/TodoProvider.dart';

List<ToDo> DUMMY_DATA = [
  ToDo(
      id: '2022-08-12',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Walk a dog",
      isImportant: false),
  ToDo(
      id: '2022-08-122',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 1",
      isImportant: true),
  ToDo(
      id: '2022-08-1223',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 2",
      isImportant: false),
  ToDo(
      id: '2022-08-12321',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 3",
      isImportant: true),
  ToDo(
      id: '2022-08-1231',
      creationDate: DateTime.parse("2022-08-12"),
      title: "Test 4",
      isImportant: true),
];
