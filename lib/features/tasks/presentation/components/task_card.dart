import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/core/ui/app_typography.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/presentation/components/custom_check_box.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  final void Function(bool?)? onChanged;
  final Function()? onDeleteTap;

  const TaskCard({
    super.key,
    required this.task,
    this.onChanged,
    this.onDeleteTap,
  });

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
            CustomCheckbox(
              value: task.isDone,
              onChanged: onChanged,
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
                    style: AppTypography.urbanist16W600(
                      color: task.isDone
                          ? AppColors.slateBlue
                          : AppColors.slatePurple,
                    ),
                  ),
                  if (task.description.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      task.description,
                      style: AppTypography.urbanist14W500(
                          color: AppColors.slateBlue),
                    ),
                  ]
                ],
              ),
            ),
            if (onDeleteTap != null)
              InkWell(
                onTap: onDeleteTap,
                child: const Icon(
                  Icons.delete,
                  color: AppColors.fireRed,
                ),
              )
          ],
        ),
      ),
    );
  }
}
