import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/features/tasks/presentation/tasks_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
      ),
      home: const TasksScreen(),
    );
  }
}
