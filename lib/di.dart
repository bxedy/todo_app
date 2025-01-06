import 'package:get_it/get_it.dart';
import 'package:todo_app/features/tasks/data/repository/local/tasks_repository.dart';
import 'package:todo_app/features/tasks/domain/usecases/tasks_usecase.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Repositories
  getIt.registerLazySingleton<TasksRepository>(() => TasksRepository());

  // Usecases
  getIt.registerLazySingleton<TasksUsecase>(() => TasksUsecaseImpl(getIt()));

  // Controllers
  getIt.registerFactory<TasksController>(() => TasksController(getIt()));
}
