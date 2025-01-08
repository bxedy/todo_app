import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_assets.dart';
import 'package:todo_app/core/ui/app_typography.dart';
import 'package:todo_app/features/tasks/presentation/components/create_task_bottom_sheet.dart';
import 'package:todo_app/features/tasks/presentation/components/custom_bottom_navigation_bar.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/done_tasks/done_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/search_tasks/search_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/todo_tasks/todo_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

class TasksScreen extends StatefulWidget {
  final TasksController tasksController;

  const TasksScreen({super.key, required this.tasksController});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late final List<Widget?> tabs;

  void _onTabTapped(int index) {
    if (index == 1) {
      CreateTaskBottomSheet.show(
        context,
        widget.tasksController,
        onTaskCreated: () {
          Navigator.pop(context);
          widget.tasksController.loadTasks(isDone: index == 3);
        },
      );
    } else {
      widget.tasksController.updateTab(index);
    }
  }

  @override
  void initState() {
    tabs = [
      TodoTasksTab(widget.tasksController),
      null,
      SearchTasksTab(widget.tasksController),
      DoneTasksTab(widget.tasksController),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.tasksController,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: tabs[widget.tasksController.selectedTabIndex],
          appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 200,
            leading: Row(
              children: [
                const SizedBox(width: 26),
                AppAssets.logo.toSvgPictureWidget(size: 28),
              ],
            ),
            actions: [
              Text(
                'John',
                style: AppTypography.urbanist18W600(),
              ),
              const SizedBox(width: 14),
              Image.asset(
                AppAssets.avatar,
                height: 42,
                width: 42,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 26),
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedTabIndex: widget.tasksController.selectedTabIndex,
            onTabTapped: _onTabTapped,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    widget.tasksController.dispose();
    super.dispose();
  }
}
