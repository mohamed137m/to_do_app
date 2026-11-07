import 'package:flutter/material.dart';

import 'screens/add_task_screen.dart';
import 'screens/task_list_screen.dart';

void main() {
  runApp(const ToDoApp());
}

/// Builds the Material 3 theme used by the To-Do List application.
ThemeData buildToDoTheme(Brightness brightness) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: brightness,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}

/// Root widget for the To-Do List mobile UI.
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: buildToDoTheme(Brightness.light),
      darkTheme: buildToDoTheme(Brightness.dark),
      home: const TaskListScreen(),
      routes: {'/add-task': (_) => const AddTaskScreen()},
    );
  }
}
