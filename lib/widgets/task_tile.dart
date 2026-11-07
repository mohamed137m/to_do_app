import 'package:flutter/material.dart';

/// Static visual model representing a placeholder task item in the UI.
class TaskItemData {
  const TaskItemData({
    required this.title,
    this.subtitle,
    this.isCompleted = false,
  });

  final String title;
  final String? subtitle;
  final bool isCompleted;
}

/// A purely visual list item card displaying a single task.
class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final TaskItemData task;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MergeSemantics(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: task.isCompleted
            ? colorScheme.surfaceContainerLow
            : colorScheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: task.isCompleted
                ? colorScheme.outlineVariant.withValues(alpha: 0.5)
                : colorScheme.outlineVariant,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Semantics(
                checked: task.isCompleted,
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Icon(
                      task.isCompleted
                          ? Icons.check_circle_rounded
                          : Icons.radio_button_unchecked_rounded,
                      color: task.isCompleted
                          ? colorScheme.primary
                          : colorScheme.outline,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.title,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: task.isCompleted
                            ? colorScheme.onSurfaceVariant
                            : colorScheme.onSurface,
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        decorationColor: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (task.subtitle case final subtitle?) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
