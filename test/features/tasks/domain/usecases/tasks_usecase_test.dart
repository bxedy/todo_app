import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:todo_app/features/tasks/domain/usecases/tasks_usecase.dart';

import '../../mocks.dart';

void main() {
  late MockTasksLocalRepository mockRepository;
  late TasksUsecaseImpl usecase;

  setUp(() {
    mockRepository = MockTasksLocalRepository();
    usecase = TasksUsecaseImpl(mockRepository);
  });

  group('TasksUsecase', () {
    test('updateTaskToDone should call createOrUpdateTask', () async {
      when(() => mockRepository.createOrUpdateTask(mockTask))
          .thenAnswer((_) async => {});

      await usecase.updateTaskToDone(mockTask);

      verify(() => mockRepository.createOrUpdateTask(mockTask)).called(1);
    });

    test('deleteTask should call deleteTask on the repository', () async {
      when(() => mockRepository.deleteTask(any())).thenAnswer((_) async => {});

      await usecase.deleteTask('1');

      verify(() => mockRepository.deleteTask('1')).called(1);
    });

    test('deleteAllDoneTasks should call deleteAllDoneTasks on the repository',
        () async {
      when(() => mockRepository.deleteAllDoneTasks())
          .thenAnswer((_) async => {});

      await usecase.deleteAllDoneTasks();

      verify(() => mockRepository.deleteAllDoneTasks()).called(1);
    });

    test('getTasks should call searchTasksByTitle when query is provided',
        () async {
      final tasks = [mockTask];
      when(() => mockRepository.searchTasksByTitle(any()))
          .thenAnswer((_) async => tasks);

      final result = await usecase.getTasks(query: 'Test', isDone: null);

      expect(result, tasks);
      verify(() => mockRepository.searchTasksByTitle('Test')).called(1);
    });

    test('getTasks should call getTasksDone when isDone is true', () async {
      final tasks = [mockTask];
      when(() => mockRepository.getTasksDone()).thenAnswer((_) async => tasks);

      final result = await usecase.getTasks(isDone: true, query: null);

      expect(result, tasks);
      verify(() => mockRepository.getTasksDone()).called(1);
    });

    test('getTasks should call getTodoTasks when isDone is false', () async {
      final tasks = [mockTask];
      when(() => mockRepository.getTodoTasks()).thenAnswer((_) async => tasks);

      final result = await usecase.getTasks(isDone: false, query: null);

      expect(result, tasks);
      verify(() => mockRepository.getTodoTasks()).called(1);
    });
  });
}
