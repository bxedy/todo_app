import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/tasks/data/repository/local/tasks_local_repository.dart';
import 'package:todo_app/features/tasks/domain/usecases/tasks_usecase.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

final getIt = GetIt.instance;

void setupDependencies() async {
  final database = await _initDatabase();

  // Repositories
  getIt.registerLazySingleton<TasksLocalRepository>(
      () => TasksLocalRepository(database));

  // Usecases
  getIt.registerLazySingleton<TasksUsecase>(() => TasksUsecaseImpl(getIt()));

  // Controllers
  getIt.registerFactory<TasksController>(() => TasksController(getIt()));
}

Future<Database> _initDatabase() async {
  return openDatabase(
    'tasks_database.db',
    version: 2,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE tasks (id TEXT PRIMARY KEY, title TEXT, description TEXT, isDone INTEGER DEFAULT 0)',
      );
    },
  );
}
