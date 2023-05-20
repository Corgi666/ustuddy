import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterclass/utils/theme_configs.dart';

mixin SubThemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyLarge: TextStyle(
          // color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: ThemeColors.onSurfaceTextColor, size: 16);
  }
}
