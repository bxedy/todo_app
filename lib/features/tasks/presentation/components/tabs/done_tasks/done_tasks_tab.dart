import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/core/ui/app_typography.dart';
import 'package:todo_app/features/tasks/presentation/components/empty_tasks_warning.dart';
import 'package:todo_app/features/tasks/presentation/components/task_card.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

class DoneTasksTab extends StatefulWidget {
  const DoneTasksTab(this.tasksController, {super.key});

  final TasksController tasksController;

  @override
  State<DoneTasksTab> createState() => _DoneTasksTabState();
}

class _DoneTasksTabState extends State<DoneTasksTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.tasksController.loadTasks(isDone: true);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.tasksController,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Completed Tasks',
                      style: AppTypography.urbanist20Bold(),
                    ),
                    Visibility(
                      visible: widget.tasksController.tasks.isNotEmpty,
                      child: InkWell(
                        onTap: () async {
                          await widget.tasksController.deleteAllDoneTasks();
                          widget.tasksController.loadTasks(isDone: true);
                        },
                        child: Text(
                          'Delete all',
                          style: AppTypography.urbanist18Bold(
                              color: AppColors.fireRed),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Expanded(
                  flex: 10,
                  child: widget.tasksController.tasks.isEmpty
                      ? const Center(
                          child: EmptyTasksWarning(),
                        )
                      : ListView.separated(
                          itemCount: widget.tasksController.tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final task = widget.tasksController.tasks[index];
                            return TaskCard(
                              task: task,
                              onDeleteTap: () async {
                                await widget.tasksController
                                    .deleteTask(task.id);
                                widget.tasksController.loadTasks(isDone: true);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 16);
                          },
                        ),
                )
              ],
            ),
          );
        });
  }
}
