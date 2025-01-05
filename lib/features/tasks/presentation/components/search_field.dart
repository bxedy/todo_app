import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        setState(() {});
      },
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
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: AppColors.mutedAzure,
                  size: 16,
                ),
                onPressed: () {
                  _controller.clear();
                  setState(() {});
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
