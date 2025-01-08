import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_assets.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/core/ui/app_typography.dart';

class EmptyTasksWarning extends StatelessWidget {
  final Function()? onButtonTap;

  const EmptyTasksWarning({
    super.key,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppAssets.emptyStateIllustration
            .toSvgPictureWidget(height: 82, width: 80),
        const SizedBox(height: 24),
        Text(
          onButtonTap != null ? 'You have no task listed.' : 'No result found.',
          style: AppTypography.urbanist16W500(color: AppColors.slateBlue),
        ),
        if (onButtonTap != null) ...[
          const SizedBox(height: 28),
          _CreateTaskButton(onButtonTap: onButtonTap),
        ]
      ],
    );
  }
}

class _CreateTaskButton extends StatelessWidget {
  const _CreateTaskButton({required this.onButtonTap});

  final Function()? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onButtonTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: AppColors.blue,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'Create task',
                style: AppTypography.urbanist18W600(color: AppColors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
