import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';
import 'package:todo_app/core/ui/app_typography.dart';

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
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: AppTypography.urbanist16W500(color: AppColors.slatePurple),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: AppColors.paleWhite,
        hintText: 'Search...',
        hintStyle: AppTypography.urbanist16W500(color: AppColors.mutedAzure),
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
          borderSide:  BorderSide(
            width: 1.5,
            color: AppColors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  BorderSide(
            width: 1.5,
            color: AppColors.blue.withOpacity(.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:const BorderSide(
            width: 1.5,
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
