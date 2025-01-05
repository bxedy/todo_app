import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/ui/app_assets.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/features/tasks/presentation/tabs/done_tasks/done_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/tabs/search_tasks/search_tasks_tab.dart';
import 'package:todo_app/features/tasks/presentation/tabs/todo_tasks/todo_tasks_tab.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  final List<Widget?> tabs = [
    const TodoTasksTab(),
    null,
    const SearchTasksTab(),
    const DoneTasksTab(),
  ];

  void _onTabTapped(int index) {
    if (index == 1) {
      _showCreateBottomSheet();
    } else {
      currentIndexNotifier.value = index;
    }
  }

  void _showCreateBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Task Name'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndexNotifier,
      builder: (context, currentIndex, child) {
        return Scaffold(
          body: tabs[currentIndex],
          appBar: AppBar(
            leadingWidth: 200,
            leading: Row(
              children: [
                const SizedBox(width: 26),
                AppAssets.logo.svgPictureFromPath(size: 28),
              ],
            ),
            actions: [
              const Text('John'),
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
            decoration:  BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 2,
                  color: Colors.grey.withOpacity(.1),
                ),
              ),
            ),
            height: 100,
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: currentIndex,
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.mutedAzure,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              onTap: _onTabTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppAssets.todo.svgPictureFromPath(
                      color: currentIndex == 0
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
                      color: currentIndex == 2
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
                      color: currentIndex == 3
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
    currentIndexNotifier.dispose();
    super.dispose();
  }
}
