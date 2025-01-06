import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/features/tasks/presentation/components/empty_tasks_warning.dart';
import 'package:todo_app/features/tasks/presentation/components/task_card.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

class TodoTasksTab extends StatefulWidget {
  const TodoTasksTab(this.tasksController, {super.key});

  final TasksController tasksController;

  @override
  State<TodoTasksTab> createState() => _TodoTasksTabState();
}

class _TodoTasksTabState extends State<TodoTasksTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.tasksController.loadTasks(isDone: false);
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
                RichText(
                  text: TextSpan(
                    text: 'Welcome, ',
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.slatePurple,
                    ),
                    children: [
                      TextSpan(
                        text: 'John',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'You\'ve got ${widget.tasksController.tasks.length} tasks to do.',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.slateBlue,
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  flex: 10,
                  child: widget.tasksController.tasks.isEmpty
                      ? Center(
                          child: EmptyTasksWarning(
                            onButtonTap: () {},
                          ),
                        )
                      : ListView.separated(
                          itemCount: widget.tasksController.tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final task = widget.tasksController.tasks[index];
                            return TaskCard(
                              task: task.copyWith(isDone: true),
                              onChanged: (_) {
                                widget.tasksController.toggleIsDone(task);
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
