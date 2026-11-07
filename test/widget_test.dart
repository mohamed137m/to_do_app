import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_do_app/main.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import 'package:to_do_app/screens/task_list_screen.dart';
import 'package:to_do_app/widgets/task_tile.dart';

void main() {
  testWidgets(
    'Main screen renders title, task list area, and Add Task button',
    (WidgetTester tester) async {
      await tester.pumpWidget(const ToDoApp());

      // Verify screen title and section header.
      expect(find.text('To-Do List'), findsOneWidget);
      expect(find.text('My Tasks'), findsOneWidget);

      // Verify list area renders sample tasks.
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(TaskTile), findsWidgets);
      expect(find.text('Review project design wireframes'), findsOneWidget);

      // Verify "Add Task" button is visible.
      expect(find.widgetWithText(FilledButton, 'Add Task'), findsOneWidget);
    },
  );

  testWidgets(
    'Tapping Add Task navigates to AddTaskScreen with input and Save',
    (WidgetTester tester) async {
      await tester.pumpWidget(const ToDoApp());

      // Tap the "Add Task" button on the main screen.
      await tester.tap(find.text('Add Task'));
      await tester.pumpAndSettle();

      // Verify AddTaskScreen is displayed with a text input field and Save button.
      expect(find.byType(AddTaskScreen), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.widgetWithText(FilledButton, 'Save'), findsOneWidget);

      // Enter sample text to confirm input field works visually, then tap Save.
      await tester.enterText(find.byType(TextField), 'Pick up dry cleaning');
      expect(find.text('Pick up dry cleaning'), findsOneWidget);

      await tester.tap(find.widgetWithText(FilledButton, 'Save'));
      await tester.pumpAndSettle();

      // Returns cleanly to the main screen without mutating the static list.
      expect(find.byType(TaskListScreen), findsOneWidget);
    },
  );

  testWidgets(
    'Screens render without overflow at 2x text scale and meet a11y guidelines',
    (WidgetTester tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      try {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(2.0)),
            child: const ToDoApp(),
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));

        await tester.tap(find.text('Add Task'));
        await tester.pumpAndSettle();

        expect(find.byType(AddTaskScreen), findsOneWidget);
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      } finally {
        handle.dispose();
      }
    },
  );
}
