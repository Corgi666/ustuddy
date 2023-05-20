import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masterclass/utils/theme_configs.dart';

class ThemeController extends GetxController {
  late ThemeData _datkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    // TODO: implement onInit
    initializedThemeData();
    super.onInit();
  }

  initializedThemeData() {
    _datkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _datkTheme;
  ThemeData get lightTheme => _lightTheme;
}
