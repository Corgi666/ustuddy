import 'package:flutter/material.dart';
import 'package:masterclass/utils/theme_configs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(gradient: ThemeColors.mainGradient(context)),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/app_splash_logo.png",
            ),
          ),
        ),
      ),
    );
  }
}
