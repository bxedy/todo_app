import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/usecases/tasks_usecase.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

class MockTasksUsecase extends Mock implements TasksUsecase {}

void main() {
  late MockTasksUsecase mockTasksUsecase;
  late TasksController tasksController;

  setUp(() {
    mockTasksUsecase = MockTasksUsecase();
    tasksController = TasksController(mockTasksUsecase);
  });

  group('TasksController', () {
    test('should load tasks correctly', () async {
      final tasks = [
        const TaskEntity(
            id: '1',
            title: 'Task 1',
            description: 'Description 1',
            isDone: false),
        const TaskEntity(
            id: '2',
            title: 'Task 2',
            description: 'Description 2',
            isDone: true),
      ];
      when(() => mockTasksUsecase.getTasks(isDone: null, query: null))
          .thenAnswer((_) async => tasks);

      await tasksController.loadTasks();

      expect(tasksController.tasks, tasks);
      verify(() => mockTasksUsecase.getTasks(isDone: null, query: null))
          .called(1);
    });

    test('should delete task correctly', () async {
      const taskId = '1';
      when(() => mockTasksUsecase.deleteTask(taskId))
          .thenAnswer((_) async => {});

      await tasksController.deleteTask(taskId);

      verify(() => mockTasksUsecase.deleteTask(taskId)).called(1);
    });

    test('should delete all done tasks correctly', () async {
      when(() => mockTasksUsecase.deleteAllDoneTasks())
          .thenAnswer((_) async => {});

      await tasksController.deleteAllDoneTasks();

      verify(() => mockTasksUsecase.deleteAllDoneTasks()).called(1);
    });

    test('should update tab correctly and reset tasks', () async {
      tasksController.tasks = [
        const TaskEntity(
            id: '1',
            title: 'Task 1',
            description: 'Description 1',
            isDone: false),
      ];
      expect(tasksController.selectedTabIndex, 0);

      tasksController.updateTab(1);

      expect(tasksController.selectedTabIndex, 1);
      expect(tasksController.tasks.isEmpty, true);
    });

    test('should not update tab if the same tab is selected', () async {
      tasksController.selectedTabIndex = 0;
      tasksController.tasks = [
        const TaskEntity(
            id: '1',
            title: 'Task 1',
            description: 'Description 1',
            isDone: false),
      ];

      tasksController.updateTab(0);

      expect(tasksController.selectedTabIndex, 0);
      expect(tasksController.tasks.isNotEmpty, true);
    });
  });
}
