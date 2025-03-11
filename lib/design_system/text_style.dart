import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_f/design_system/colors.dart';

class AppTextStyle {
  static TextStyle productTitle = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );
  static TextStyle price = GoogleFonts.montserrat(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );
}
