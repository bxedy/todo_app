import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: GoogleFonts.urbanist(
        color: AppColors.slatePurple,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: AppColors.paleWhite,
        hintText: 'Search...',
        hintStyle: GoogleFonts.urbanist(
          color: AppColors.mutedAzure,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.blue,
        ),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: AppColors.mutedAzure,
                  size: 16,
                ),
                onPressed: () {
                  controller.clear();
                  onChanged('');
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.blue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.blue.withOpacity(.5),
            width: 2,
          ),
        ),
      ),
    );
  }
}
