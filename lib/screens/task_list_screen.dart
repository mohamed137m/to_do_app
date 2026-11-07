import 'package:flutter/material.dart';

import '../widgets/task_tile.dart';
import 'add_task_screen.dart';

/// Main screen displaying the title, static task list area, and "Add Task" button.
class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  static const List<TaskItemData> _sampleTasks = [
    TaskItemData(
      title: 'Review project design wireframes',
      subtitle: 'Today • 10:00 AM',
    ),
    TaskItemData(
      title: 'Buy groceries for the week',
      subtitle: 'Today • 5:30 PM',
    ),
    TaskItemData(
      title: 'Schedule dentist appointment',
      subtitle: 'Tomorrow • Morning',
    ),
    TaskItemData(
      title: 'Read 20 pages of current book',
      subtitle: 'Evening routine',
      isCompleted: true,
    ),
    TaskItemData(
      title: 'Send weekly status update',
      subtitle: 'Completed yesterday',
      isCompleted: true,
    ),
  ];

  void _openAddTaskScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => const AddTaskScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: const Text('To-Do List'), centerTitle: false),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'My Tasks',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '${_sampleTasks.length} tasks',
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: _sampleTasks.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return TaskTile(task: _sampleTasks[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  top: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: FilledButton.icon(
                onPressed: () => _openAddTaskScreen(context),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add Task'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
