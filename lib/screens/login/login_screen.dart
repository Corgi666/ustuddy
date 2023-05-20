// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masterclass/controller/auth_controller.dart';
import 'package:masterclass/utils/theme_configs.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: ThemeColors.mainGradient(context)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_splash_logo.png",
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                  "This is study app. You can use as your want. You have the full access to all the materials in this course",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  controller.signInWithGoole();
                  // _googleSignIn.signIn();
                },
                child: Container(
                  width: double.maxFinite,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 10,
                          bottom: 0,
                          child: SvgPicture.asset("assets/icons/google.svg")),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
