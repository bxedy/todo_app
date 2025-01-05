import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_assets.dart';
import 'package:todo_app/core/ui/app_colors.dart';

class EmptyTasksWarning extends StatelessWidget {
  const EmptyTasksWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppAssets.emptyStateIllustration.svgPictureFromPath(height: 82, width: 80),
        const SizedBox(height: 24),
        Text(
          'No result found.',
          style: GoogleFonts.urbanist(
            color: AppColors.slateBlue,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
