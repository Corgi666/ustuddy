// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:masterclass/controller/auth_controller.dart';
import 'package:masterclass/controller/question_paper/get_question_controller.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    initState() {
      super.initState();
    }

    QuestionController controller = Get.find<QuestionController>();
    AuthController authController = Get.find<AuthController>();
    print(controller.questionpaper.length);
    // print(controller.questionpaper[0].id);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: TextButton(
            onPressed: () {
              authController.signInWithGoole();
            },
            child: Text('PRESS')),
      )),
    );
  }
}
