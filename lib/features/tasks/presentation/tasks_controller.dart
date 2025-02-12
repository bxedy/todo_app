import 'package:flutter/foundation.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/domain/usecases/tasks_usecase.dart';

class TasksController extends ChangeNotifier {
  final TasksUsecase _tasksUsecase;

  TasksController(this._tasksUsecase);

  List<TaskEntity> tasks = <TaskEntity>[];
  int selectedTabIndex = 0;

  Future<void> loadTasks({bool? isDone, String? query}) async {
    tasks = await _tasksUsecase.getTasks(isDone: isDone, query: query);
    notifyListeners();
  }

  Future<void> createTask(String title, String description) async {
    await _tasksUsecase.createTask(title, description);
    notifyListeners();
  }

  Future<void> updateTaskToDone(TaskEntity task) async {
    await _tasksUsecase.updateTaskToDone(task.copyWith(isDone: true));
    notifyListeners();
  }

  Future<void> deleteTask(String id) async {
    await _tasksUsecase.deleteTask(id);
    notifyListeners();
  }

  Future<void> deleteAllDoneTasks() async {
    await _tasksUsecase.deleteAllDoneTasks();
  }

  void _setTasksToEmpty() async {
    tasks = [];
  }

  void updateTab(int index) {
    if (index == selectedTabIndex) return;
    
    _setTasksToEmpty();
    selectedTabIndex = index;
    notifyListeners();
  }
}
