import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paleWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  side: const BorderSide(
                    color: AppColors.mutedAzure,
                    width: 2,
                  ),
                  activeColor: AppColors.blue,
                  value: task.isDone,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.slatePurple,
                    ),
                  ),
                  if (task.description.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      task.description,
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.slateBlue,
                      ),
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
