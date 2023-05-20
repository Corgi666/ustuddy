// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:masterclass/widgets/reuseable_widget.dart';
import 'package:get/get.dart';

import '../../utils/theme_configs.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: ThemeColors.mainGradient(context)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () => Get.changeThemeMode(UIParametters.isDarkMode()
                      ? ThemeMode.light
                      : ThemeMode.dark),
                  child: const Icon(Icons.star, size: 80)),
              SizedBox(height: 40),
              Text(
                "This is a study app. you can use it as you want. if you understand how this work, you would be able to scale it.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 35),
              iconsButtonReuseable(
                Icons.arrow_forward,
                () => Get.offAllNamed("/homescreen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
