import 'package:flutter/material.dart';
import 'package:masterclass/utils/theme_configs.dart';

TextStyle cartTitle(context) => TextStyle(
    color: UIParametters.isDarkMode()
        ? DarkTheme.primaryColorDark
        : LightTheme.primaryColorLight,
    fontSize: 18,
    fontWeight: FontWeight.bold);

const detialText = TextStyle(fontSize: 12);
