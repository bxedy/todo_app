import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/data/repository/local/tasks_local_repository.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  late MockDatabase mockDatabase;
  late TasksLocalRepository tasksLocalRepository;

  setUp(() {
    mockDatabase = MockDatabase();
    tasksLocalRepository = TasksLocalRepository(mockDatabase);
  });

  group('TasksLocalRepository', () {
    test('should create or update task', () async {
      const task = TaskEntity(
          id: '1',
          title: 'Test Task',
          description: 'Test Description',
          isDone: false);
      when(() => mockDatabase.insert(any(), any(),
              conflictAlgorithm: any(named: 'conflictAlgorithm')))
          .thenAnswer((_) async => 1);

      await tasksLocalRepository.createOrUpdateTask(task);

      verify(() => mockDatabase.insert('tasks', task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace)).called(1);
    });

    test('should delete task', () async {
      const taskId = '1';
      when(() => mockDatabase.delete(any(),
          where: any(named: 'where'),
          whereArgs: any(named: 'whereArgs'))).thenAnswer((_) async => 1);

      await tasksLocalRepository.deleteTask(taskId);

      verify(() => mockDatabase
          .delete('tasks', where: 'id = ?', whereArgs: [taskId])).called(1);
    });

    test('should return list of tasks', () async {
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
      when(() => mockDatabase.query(any()))
          .thenAnswer((_) async => tasks.map((task) => task.toMap()).toList());

      final result = await tasksLocalRepository.getTasks();

      expect(result, tasks);
      verify(() => mockDatabase.query('tasks')).called(1);
    });
  });
}
