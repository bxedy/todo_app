import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/core/ui/app_typography.dart';
import 'package:todo_app/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/tasks/presentation/components/custom_check_box.dart';

class TaskCard extends StatefulWidget {
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
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: widget.onDeleteTap != null
          ? DismissDirection.startToEnd
          : DismissDirection.none,
      onDismissed: (direction) {
        if (widget.onDeleteTap != null) {
          widget.onDeleteTap!();
        }
      },
      background: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.paleWhite,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.task.isDone != true
              ? () {
                  isExpanded.value = !isExpanded.value;
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder(
              valueListenable: isExpanded,
              builder: (context, __, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCheckbox(
                      value: widget.task.isDone,
                      onChanged: widget.onChanged,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.task.title,
                                style: AppTypography.urbanist16W600(
                                  color: widget.task.isDone
                                      ? AppColors.slateBlue
                                      : AppColors.slatePurple,
                                ),
                              ),
                            ],
                          ),
                          if (widget.task.description.isNotEmpty) ...[
                            AnimatedCrossFade(
                              firstChild: const SizedBox(),
                              secondChild: Column(
                                children: [
                                  const SizedBox(height: 12),
                                  Text(
                                    widget.task.description,
                                    style: AppTypography.urbanist14W500(
                                        color: AppColors.slateBlue),
                                  ),
                                ],
                              ),
                              crossFadeState: isExpanded.value
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 200),
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (widget.onDeleteTap != null)
                      InkWell(
                        onTap: widget.onDeleteTap,
                        child: const Icon(
                          Icons.delete,
                          color: AppColors.fireRed,
                        ),
                      )
                    else if (widget.task.isDone == false &&
                        widget.task.description.isNotEmpty &&
                        isExpanded.value == false)
                      const Icon(
                        Icons.more_horiz,
                        color: AppColors.mutedAzure,
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
