import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bgGradientStart = Color(0xFF0F0C29);
  static const bgGradientMid = Color(0xFF302B63);
  static const bgGradientEnd = Color(0xFF24243E);

  static const accentPurple = Color(0xFF8B5CF6);
  static const accentPink = Color(0xFFEC4899);
  static const textPrimary = Color(0xFFF8FAFC);
  static const textMuted = Color(0xB3FFFFFF);
  static const cardGlass = Color(0x1AFFFFFF);
  static const cardBorder = Color(0x33FFFFFF);

  static const backgroundGradient = <Color>[
    bgGradientStart,
    bgGradientMid,
    bgGradientEnd,
  ];

  static const accentGradient = <Color>[accentPurple, accentPink];
}

class AppTheme {
  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accentPurple,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.accentPurple,
        secondary: AppColors.accentPink,
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
    );
  }
}
