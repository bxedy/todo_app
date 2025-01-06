import 'package:flutter/foundation.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/usecases/tasks_usecase.dart';
import 'package:uuid/uuid.dart';

class TasksController extends ChangeNotifier {
  final TasksUsecase _tasksUsecase;

  TasksController(this._tasksUsecase);

  List<Task> tasks = <Task>[];
  bool isLoading = false;
  int selectedTabIndex = 0;

  Future<void> loadTasks() async {
    isLoading = true;
    notifyListeners();

    tasks = await _tasksUsecase.getTasks();
    notifyListeners();
  }

  Future<void> createTask(String title, String description) async {
    await _tasksUsecase.createOrUpdateTask(
      Task(
        id: const Uuid().v4(),
        title: title,
        description: description,
        isDone: false,
      ),
    );
    await loadTasks();
    notifyListeners();
  }

  Future<void> toggleIsDone(Task task) async {
    await _tasksUsecase.createOrUpdateTask(task.copyWith(isDone: !task.isDone));
    await loadTasks();
    notifyListeners();
  }

  Future<void> deleteTask(String id) async {
    await _tasksUsecase.deleteTask(id);
    await loadTasks();
  }

  void updateTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }
}
