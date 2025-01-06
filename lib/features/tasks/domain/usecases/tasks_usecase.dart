import 'package:todo_app/features/tasks/data/repository/local/tasks_repository.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';

abstract class TasksUsecase {
  Future<int> createOrUpdateTask(Task task);
  Future<int> deleteTask(String id);
  Future<List<Task>> getTasks();
}

class TasksUsecaseImpl implements TasksUsecase {
  final TasksRepository _repository;

  TasksUsecaseImpl(this._repository);

  @override
  Future<int> createOrUpdateTask(Task task) {
    return _repository.createOrUpdateTask(task);
  }

  @override
  Future<int> deleteTask(String id) {
    return _repository.deleteTask(id);
  }

  @override
  Future<List<Task>> getTasks() {
    return _repository.getTasks();
  }
}
