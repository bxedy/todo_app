import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskBottomSheet extends StatelessWidget {
  const CreateTaskBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const CreateTaskBottomSheet(),
    );
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
            decoration: InputDecoration(
              hintText: 'What\'s on your mind?',
              hintStyle: GoogleFonts.urbanist(
                color: AppColors.mutedAzure,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              prefixIcon: SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  side: const BorderSide(
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
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
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
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Create',
              style: GoogleFonts.urbanist(
                color: AppColors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
