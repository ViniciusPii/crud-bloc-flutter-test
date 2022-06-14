import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppExtension {
  AppExtension._();

  //Colors
  static const Color primary = AppColors.crimson;
  static const Color primaryDark = AppColors.crimson800;
  static const Color primaryLight = AppColors.crimson200;
  static const Color secondary = AppColors.blue800;
  static const Color background = AppColors.white;

  //Text Color
  static const Color textColor = AppColors.neutral800;
  static const Color textLightColor = AppColors.neutral600;

  //Font
  static String? fontFamily = GoogleFonts.montserrat().fontFamily;
}
