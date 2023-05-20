// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masterclass/controller/zoom_drawer_controller.dart';
// import 'package:masterclass/utils/theme_configs.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // decoration: BoxDecoration(gradient: ThemeColors.mainGradient(context)),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: Colors.white))),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                  top: 10,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => controller.togleDrawer(),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 29,
                    ),
                  )),
              Positioned(child: Container())
            ],
          ))),
    );
  }
}
