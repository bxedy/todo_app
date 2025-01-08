import 'package:flutter/material.dart';
import 'package:todo_app/features/tasks/presentation/components/empty_tasks_warning.dart';
import 'package:todo_app/features/tasks/presentation/components/search_field.dart';
import 'package:todo_app/features/tasks/presentation/components/task_card.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

class SearchTasksTab extends StatefulWidget {
  const SearchTasksTab(this.tasksController, {super.key});

  final TasksController tasksController;

  @override
  State<SearchTasksTab> createState() => _SearchTasksTabState();
}

class _SearchTasksTabState extends State<SearchTasksTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.tasksController.loadTasks(query: '');
    });

    super.initState();
  }

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.tasksController,
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 32),
              CustomSearchField(
                controller: textController,
                onChanged: (value) {
                  widget.tasksController.loadTasks(isDone: true, query: value);
                },
              ),
              const SizedBox(height: 16),
              if (widget.tasksController.tasks.isEmpty)
                const Expanded(flex: 10, child: EmptyTasksWarning())
              else
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.tasksController.tasks.length,
                    itemBuilder: (__, index) {
                      return TaskCard(
                          task: widget.tasksController.tasks[index]);
                    },
                    separatorBuilder: (__, _) {
                      return const SizedBox(height: 16);
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
