// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._(); //construstor
  static const fontFam = 'AppIcons';
  static SvgPicture trophyOutLine =
      SvgPicture.asset('assets/icons/trophyoutline.svg');
  static const IconData menuLeft = IconData(0xe805, fontFamily: fontFam);
}
