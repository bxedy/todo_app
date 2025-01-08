import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/tasks/data/repository/local/tasks_local_repository.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';

const mockTask = TaskEntity(
  id: '1',
  title: 'Test Task',
  description: 'Task Description',
  isDone: false,
);

class MockDatabase extends Mock implements Database {}

class MockTasksLocalRepository extends Mock implements TasksLocalRepository {}
