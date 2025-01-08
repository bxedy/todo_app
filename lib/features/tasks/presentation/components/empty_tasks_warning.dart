import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_assets.dart';
import 'package:todo_app/core/ui/app_colors.dart';

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
          style: GoogleFonts.urbanist(
            color: AppColors.slateBlue,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        if (onButtonTap != null) ...[
          const SizedBox(height: 28),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onButtonTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.blue,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Create task',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
