import 'package:flutter/material.dart';
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

  final List<Widget> tabs = [
    const TodoTasksTab(),
    Container(),
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: _onTabTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Todo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'Create',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: 'Done',
              ),
            ],
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
