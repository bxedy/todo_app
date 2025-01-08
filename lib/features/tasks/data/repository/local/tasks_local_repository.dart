import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';

class TasksLocalRepository {
  final Database _database;

  TasksLocalRepository(this._database);

  Future<void> createOrUpdateTask(TaskEntity task) async {
    await _database.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTask(String id) async {
    await _database.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<TaskEntity>> getTasks() async {
    final maps = await _database.query('tasks');
    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<List<TaskEntity>> getTasksDone() async {
    final maps = await _database.query('tasks', where: 'isDone = ?', whereArgs: [1]);
    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<List<TaskEntity>> getTodoTasks() async {
    final maps = await _database.query('tasks', where: 'isDone = ?', whereArgs: [0]);
    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<List<TaskEntity>> searchTasksByTitle(String searchText) async {
    final maps = await _database.query(
      'tasks',
      where: searchText.isNotEmpty ? 'title LIKE ?' : null,
      whereArgs: searchText.isNotEmpty ? ['%$searchText%'] : null,
    );
    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<void> deleteAllDoneTasks() async {
    await _database.delete(
      'tasks',
      where: 'isDone = ?',
      whereArgs: [1],
    );
  }
}
