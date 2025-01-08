import 'package:todo_app/features/tasks/data/repository/local/tasks_local_repository.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:uuid/uuid.dart';

abstract class TasksUsecase {
  Future<int> createTask(String title, String description);
  Future<int> updateTaskToDone(TaskEntity task);
  Future<int> deleteTask(String id);
  Future<int> deleteAllDoneTasks();
  Future<List<TaskEntity>> getTasks({required bool isDone, String? query});
}

class TasksUsecaseImpl implements TasksUsecase {
  final TasksLocalRepository _repository;

  TasksUsecaseImpl(this._repository);

  @override
  Future<int> deleteTask(String id) {
    return _repository.deleteTask(id);
  }

  @override
  Future<List<TaskEntity>> getTasks({bool? isDone, String? query}) async {
    if (query?.isNotEmpty == true) {
      return _repository.searchTasksByTitle(query!);
    }
    
    return isDone == true
        ? _repository.getTasksDone()
        : _repository.getTodoTasks();
  }

  @override
  Future<int> createTask(String title, String description) {
    return _repository.createOrUpdateTask(
      TaskEntity(
        id: const Uuid().v4(),
        title: title,
        description: description,
        isDone: false,
      ),
    );
  }

  @override
  Future<int> updateTaskToDone(TaskEntity task) {
    return _repository.createOrUpdateTask(task);
  }

  @override
  Future<int> deleteAllDoneTasks() {
    return _repository.deleteAllDoneTasks();
  }
}
