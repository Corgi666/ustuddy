import 'package:flutter/material.dart';
import 'package:masterclass/utils/sub_theme_data_mixin.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25.0;
const double _cardBorderRadius = 10.0;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderPadding => _cardBorderRadius;

class ThemeColors {
  static const Color onSurfaceTextColor = Colors.white;
  static const mainGradientLight = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        LightTheme.primaryColorLight,
        LightTheme.primaryLightColorLight
      ]);

  static const mainGradientDark = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [DarkTheme.primaryLightColorDark, DarkTheme.primaryColorDark]);

  static LinearGradient mainGradient(BuildContext context) =>
      UIParametters.isDarkMode() ? mainGradientDark : mainGradientLight;
}

class UIParametters {
  static BorderRadius get cardBorderPadding =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);
  static BorderRadius get borderRadius => BorderRadius.circular(20);
  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}

class LightTheme with SubThemeData {
  static const Color primaryLightColorLight = Color(0xFF3ac3cb);
  static const Color primaryColorLight = Color(0xFFf84187);
  static const Color mainTextTheme = Color.fromARGB(255, 40, 40, 40);
  static const Color cardColor = Color.fromARGB(255, 254, 254, 255);
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(displayColor: mainTextTheme),
        cardColor: cardColor);
  }
}

class DarkTheme with SubThemeData {
  static const Color primaryLightColorDark = Color(0xFF2e3c62);
  static const Color primaryColorDark = Color(0xFF99ace1);
  static const Color mainTextColorDark = Colors.white;
  ThemeData buildDarkTheme() {
    final systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(displayColor: mainTextColorDark),
    );
  }
}

Color customScaffoldColor(BuildContext context) {
  return UIParametters.isDarkMode()
      ? const Color.fromARGB(255, 20, 46, 158)
      : const Color.fromARGB(255, 221, 221, 221);
}
