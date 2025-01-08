import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/ui/app_colors.dart';

class AppTypography {
  static urbanist20Bold({Color? color}) {
    return GoogleFonts.urbanist(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.slatePurple,
    );
  }

  static urbanist18Bold({Color? color}) {
    return GoogleFonts.urbanist(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static urbanist16W500({Color? color}) {
    return GoogleFonts.urbanist(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: color,
    );
  }

  static urbanist16W600({Color? color}) {
    return GoogleFonts.urbanist(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: color,
    );
  }

  static urbanist16W700({Color? color}) {
    return GoogleFonts.urbanist(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: color,
    );
  }

  static urbanist18W600({Color? color}) {
    return GoogleFonts.urbanist(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: color,
    );
  }

  static urbanist14W600({Color? color}) {
    return GoogleFonts.urbanist(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: color,
    );
  }

  static urbanist14W500({Color? color}) {
    return GoogleFonts.urbanist(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: color,
    );
  }
}
