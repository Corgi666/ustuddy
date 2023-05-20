import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:masterclass/controller/auth_controller.dart';
import 'package:masterclass/firebase_ref/references.dart';
// import 'package:masterclass/model/question_model.dart';

import '../../model/answer_model.dart';

class QuestionController extends GetxController {
  final questionpaper = <QuestionPaper>[].obs;
  final allPaper = <QuestionPaper>[].obs;
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
    print(questionpaper.length);
  }

  Future<void> getAllPaper() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaper.fromJson(paper.data()))
          .toList();
      // print(paperList[0].description);
      allPaper.assignAll(paperList);
      // allPaper.value = paperList
      // print(allPaper[0].description);

      // for(var paper in paperList){

      // }
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions({required QuestionPaper paper}) {
    Get.toNamed('/questionscreen', arguments: paper);
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


