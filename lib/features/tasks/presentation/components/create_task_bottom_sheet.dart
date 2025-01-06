import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/features/tasks/presentation/tasks_controller.dart';

class CreateTaskBottomSheet extends StatefulWidget {
  const CreateTaskBottomSheet(this.tasksController, {super.key});
  final TasksController tasksController;

  static void show(BuildContext context, TasksController tasksController) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CreateTaskBottomSheet(tasksController),
    );
  }

  @override
  CreateTaskBottomSheetState createState() => CreateTaskBottomSheetState();
}

class CreateTaskBottomSheetState extends State<CreateTaskBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _createTask() {
    widget.tasksController
        .createTask(titleController.text, descriptionController.text);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'What\'s on your mind?',
              hintStyle: GoogleFonts.urbanist(
                color: AppColors.mutedAzure,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
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
          const SizedBox(height: 10),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Add a note...',
              hintStyle: GoogleFonts.urbanist(
                color: AppColors.mutedAzure,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              prefixIcon: const Icon(
                Icons.edit,
                color: AppColors.mutedAzure,
                size: 24,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        titleController.text.isNotEmpty ? _createTask : null,
                    child: Text(
                      'Create',
                      style: GoogleFonts.urbanist(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }),
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
