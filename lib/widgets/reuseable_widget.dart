import 'package:flutter/material.dart';
import 'package:masterclass/utils/custorm_text_style.dart';
import 'package:masterclass/utils/theme_configs.dart';

Widget iconsButtonReuseable(IconData icon, VoidCallback onpress) {
  return InkWell(
    onTap: onpress,
    child: Icon(icon, size: 40),
  );
}

Widget appIconText(String text, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        color: UIParametters.isDarkMode()
            ? DarkTheme.primaryColorDark
            : LightTheme.primaryColorLight,
      ),
      const SizedBox(width: 4),
      Text(text,
          style: detialText.copyWith(
            color: UIParametters.isDarkMode()
                ? DarkTheme.primaryColorDark
                : LightTheme.primaryColorLight,
          ))
    ],
  );
}
