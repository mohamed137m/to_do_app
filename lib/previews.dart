import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'main.dart';
import 'screens/add_task_screen.dart';
import 'screens/task_list_screen.dart';

Widget previewAppWrapper(Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: buildToDoTheme(Brightness.light),
    darkTheme: buildToDoTheme(Brightness.dark),
    home: child,
  );
}

@Preview(
  name: 'Main Screen - Task List',
  group: 'Screens',
  size: Size(390, 844),
  wrapper: previewAppWrapper,
)
Widget taskListScreenPreview() => const TaskListScreen();

@Preview(
  name: 'Add Task Screen',
  group: 'Screens',
  size: Size(390, 844),
  wrapper: previewAppWrapper,
)
Widget addTaskScreenPreview() => const AddTaskScreen();

