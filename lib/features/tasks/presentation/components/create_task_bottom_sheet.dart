import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/core/ui/app_typography.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

class CreateTaskBottomSheet extends StatefulWidget {
  const CreateTaskBottomSheet(
    this.tasksController, {
    required this.onTaskCreated,
    super.key,
  });
  final TasksController tasksController;
  final Function onTaskCreated;

  static Future<void> show(
    BuildContext context,
    TasksController tasksController, {
    required Function onTaskCreated,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CreateTaskBottomSheet(
        tasksController,
        onTaskCreated: onTaskCreated,
      ),
    );
  }

  @override
  CreateTaskBottomSheetState createState() => CreateTaskBottomSheetState();
}

class CreateTaskBottomSheetState extends State<CreateTaskBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> createTask() async {
    await widget.tasksController
        .createTask(titleController.text, descriptionController.text);

    widget.onTaskCreated();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
                hintStyle:
                    AppTypography.urbanist16W500(color: AppColors.mutedAzure),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.mutedAzure,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: TextField(
              controller: descriptionController,
              maxLines: 100,
              minLines: 1,
              decoration: InputDecoration(
                hintText: 'Add a note...',
                hintStyle:
                    AppTypography.urbanist16W500(color: AppColors.mutedAzure),
                prefixIcon: const Icon(
                  Icons.edit,
                  color: AppColors.mutedAzure,
                  size: 24,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: titleController,
            builder: (context, __, _) {
              return AnimatedOpacity(
                opacity: titleController.text.isNotEmpty ? 1 : .2,
                duration: const Duration(milliseconds: 300),
                child: TextButton(
                  onPressed:
                      titleController.text.isNotEmpty ? createTask : null,
                  child: Text(
                    'Create',
                    style: AppTypography.urbanist16W700(color: AppColors.blue),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
