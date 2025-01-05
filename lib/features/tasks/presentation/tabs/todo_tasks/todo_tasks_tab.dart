import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';

class TodoTasksTab extends StatelessWidget {
  const TodoTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 10),
          Text(
            'You\'ve got 7 tasks to do.',
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.slateBlue,
            ),
          ),
          SizedBox(height: 32),
          Container(
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
                        side: BorderSide(
                          color: AppColors.mutedAzure,
                          width: 2,
                        ),
                        activeColor: AppColors.blue,
                        value: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You\'ve got 7 tasks to do.',
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.slatePurple,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'You\'ve got 7 tasks to do.',
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.slateBlue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
