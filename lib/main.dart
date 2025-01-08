import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/di.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';
import 'package:todo_app/features/tasks/presentation/tasks_screen.dart';

void main() {
  setupDependencies();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final tasksController = getIt<TasksController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
      ),
      home: TasksScreen(tasksController: tasksController),
    );
  }
}
