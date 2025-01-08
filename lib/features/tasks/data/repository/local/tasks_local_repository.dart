import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';

class TasksLocalRepository {
  Database? _database;

  Future<Database> get _db async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      'tasks_database.db',
      version: 2,
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE tasks (id TEXT PRIMARY KEY, title TEXT, description TEXT, isDone INTEGER DEFAULT 0)',
        );
      },
    );
  }

  Future<int> createOrUpdateTask(TaskEntity task) async {
    final db = await _db;

    return await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteTask(String id) async {
    final db = await _db;

    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<TaskEntity>> getTasks() async {
    final db = await _db;

    final maps = await db.query('tasks');

    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<List<TaskEntity>> getTasksDone() async {
    final db = await _db;

    final maps = await db.query('tasks', where: 'isDone = ?', whereArgs: [1]);

    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<List<TaskEntity>> getTodoTasks() async {
    final db = await _db;

    final maps = await db.query('tasks', where: 'isDone = ?', whereArgs: [0]);

    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<List<TaskEntity>> searchTasksByTitle(String searchText) async {
    final db = await _db;

    final maps = await db.query(
      'tasks',
      where: 'title LIKE ?',
      whereArgs: ['%$searchText%'],
    );

    return maps.map((map) => TaskEntity.fromMap(map)).toList();
  }

  Future<int> deleteAllDoneTasks() async {
    final db = await _db;

    return await db.delete(
      'tasks',
      where: 'isDone = ?',
      whereArgs: [1],
    );
  }
}
