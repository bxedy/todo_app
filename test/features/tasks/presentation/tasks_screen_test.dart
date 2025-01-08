import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/done_tasks/done_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/todo_tasks/todo_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';
import 'package:todo_app/features/tasks/presentation/tasks_screen.dart';

import '../mocks.dart';

class MockTasksController extends Mock implements TasksController {}

void main() {
  late MockTasksController mockTasksController;

  setUp(() {
    mockTasksController = MockTasksController();
    when(() => mockTasksController.selectedTabIndex).thenReturn(0);
    when(() => mockTasksController.tasks).thenReturn([mockTask]);
  });

  group('TasksScreen', () {
    testWidgets('should display the TodoTasksTab initially', (tester) async {
      when(() => mockTasksController.loadTasks(isDone: false))
          .thenAnswer((_) async => {});

      await tester.pumpWidget(
        MaterialApp(
          home: TasksScreen(tasksController: mockTasksController),
        ),
      );

      expect(find.byType(TodoTasksTab), findsOneWidget);
    });

    testWidgets('should display the DoneTasksTab when tapped', (tester) async {
      when(() => mockTasksController.selectedTabIndex).thenReturn(3);
      when(() => mockTasksController.loadTasks(isDone: true))
          .thenAnswer((_) async => {});

      await tester.pumpWidget(
        MaterialApp(
          home: TasksScreen(tasksController: mockTasksController),
        ),
      );

      expect(find.byType(DoneTasksTab), findsOneWidget);
    });
  });
}
