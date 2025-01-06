import 'package:flutter/material.dart';
import 'package:todo_app/core/ui/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: value == true,
      child: InkWell(
        onTap: onChanged != null ? () => onChanged!(!value) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: value ? AppColors.mutedAzure : Colors.transparent,
            border: Border.all(color: AppColors.mutedAzure, width: 2),
            borderRadius: BorderRadius.circular(7),
          ),
          width: 24,
          height: 24,
          child: value
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                )
              : null,
        ),
      ),
    );
  }
}
