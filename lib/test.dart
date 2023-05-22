// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masterclass/controller/auth_controller.dart';
import 'package:masterclass/controller/question_paper/get_question_controller.dart';
import 'package:get/get.dart';

import 'controller/question_paper/question_controller.dart';
import 'model/answer_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final questionpaper = <QuestionPaper>[].obs;

    Future<void> getFireStore() async {
      final CollectionReference<Map<String, dynamic>> collection =
          FirebaseFirestore.instance
              .collection('questionPaper')
              .doc('ppr001')
              .collection('questions');
      final snapshot = await collection.get();
      final getData =
          snapshot.docs.map((doc) => Question.formSnapshot(doc)).toList();

      // Uncomment the following lines if questionpaper is defined elsewhere
      // final questionPaperCollection = snapshot.docs
      //     .map((doc) => QuestionPaper.fromJson(doc.data()))
      //     .toList();
      // questionpaper.value = questionPaperCollection;
      // print(questionpaper);

      print(getData);
    }

    initState() {
      getFireStore();

      super.initState();
    }

    QuestionPaperController controller = Get.find<QuestionPaperController>();
    // AuthController authController = Get.find<AuthController>();

    // print(controller.questionpaper[0].id);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: TextButton(
            onPressed: () {
              // getFireStore();
            },
            child: Text('PRESS')),
      )),
    );
  }
}
