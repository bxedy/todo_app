import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_assets.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/features/tasks/presentation/components/create_task_bottom_sheet.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/done_tasks/done_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/search_tasks/search_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/components/tabs/todo_tasks/todo_tasks_tab.dart';
import 'package:google_fonts/google_fonts.dart';
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
      CreateTaskBottomSheet.show(context, widget.tasksController);
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
                AppAssets.logo.svgPictureFromPath(size: 28),
              ],
            ),
            actions: [
              Text(
                'John',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
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
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 2,
                  color: AppColors.paleWhite,
                ),
              ),
            ),
            height: 100,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              currentIndex: widget.tasksController.selectedTabIndex,
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.mutedAzure,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              onTap: _onTabTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppAssets.todo.svgPictureFromPath(
                      color: widget.tasksController.selectedTabIndex == 0
                          ? AppColors.blue
                          : AppColors.mutedAzure,
                    ),
                  ),
                  label: 'Todo',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppAssets.plus.svgPictureFromPath(
                      color: AppColors.mutedAzure,
                    ),
                  ),
                  label: 'Create',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppAssets.search.svgPictureFromPath(
                      color: widget.tasksController.selectedTabIndex == 2
                          ? AppColors.blue
                          : AppColors.mutedAzure,
                    ),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppAssets.checked.svgPictureFromPath(
                      color: widget.tasksController.selectedTabIndex == 3
                          ? AppColors.blue
                          : AppColors.mutedAzure,
                    ),
                  ),
                  label: 'Done',
                ),
              ],
            ),
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
