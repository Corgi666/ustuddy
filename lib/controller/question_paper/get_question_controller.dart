import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:masterclass/controller/auth_controller.dart';
import 'package:masterclass/firebase_ref/references.dart';
// import 'package:masterclass/model/question_model.dart';

import '../../model/answer_model.dart';

class QuestionController extends GetxController {
  final questionpaper = <QuestionPaper>[].obs;
  final allPaper = <QuestionPaper>[].obs;
  late QuestionPaper questionPaperModel;
  @override
  void onReady() {
    // TODO: implement onReady
    loadQuestionPaperCollection();
    getAllPaper();
    super.onReady();
  }

  Future<void> loadQuestionPaperCollection() async {
    final collection = FirebaseFirestore.instance.collection('questionPaper');
    final snapshot = await collection.get();
    final questionPaperCollection =
        snapshot.docs.map((doc) => QuestionPaper.fromJson(doc.data())).toList();
    questionpaper.value = questionPaperCollection;
    print(questionpaper);
    loadData(questionpaper[0]);
  }

  Future<void> getAllPaper() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaper.fromJson(paper.data()))
          .toList();

      allPaper.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void loadData(QuestionPaper questionPaper) async {
    questionPaperModel = questionPaper;
    print(questionPaper.id);
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await FirebaseFirestore.instance
              .collection('questionPaper')
              .doc(questionPaper.id)
              .collection('questions')
              .get();

      //  final questionPaperCollection =
      //       snapshot.docs.map((doc) => QuestionPaper.fromJson(doc.data())).toList();
      // print(questionQuery);
      final question =
          questionQuery.docs.map((e) => Question.formSnapshot(e)).toList();
      questionPaper.questions = question;
      print('QuestionQuery is ${questionQuery}');

      // for (Question _question in questionPaper.questions) {
      //   final QuerySnapshot<Map<String, dynamic>> answerQuery =
      //       await questionPaperRF
      //           .doc(questionPaper.id)
      //           .collection("questions")
      //           .doc(_question.id)
      //           .collection("answers")
      //           .get();
      //   final answer = answerQuery.docs
      //       .map((answer) => Answer.formSnapshot(answer))
      //       .toList();
      // }
      // print(question[0].correctAnswer);

      // allpaper.value.addAll(question);
      // if (allpaper.isNotEmpty) {
      //   print('object');
      // }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void navigateToQuestions({required QuestionPaper paper}) {
    Get.toNamed('/questionscreen', arguments: paper);
    loadData(paper);
  }
}



  // void navigateToQuestions(
  //     {required QuestionPaper paper, bool tryAgain = false}) {
  //   AuthController _authController = Get.find();

  //   if (_authController.isLoggin()) {
  //     if (tryAgain) {
  //       Get.back();
  //     } else {
  //       //Get.toNamed
  //     }
  //   } else {
  //     print('${paper.title}');
  //     _authController.showLoginAlertDialogue();
  //   }
  // }


