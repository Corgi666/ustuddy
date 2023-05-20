import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:masterclass/firebase_ref/references.dart';

import '../../model/answer_model.dart';

class QuestionPaperController extends GetxController {
  late QuestionPaper questionPaperModel;
  @override
  void onReady() {
    // TODO: implement onReady
    final _questionPaper = Get.arguments as QuestionPaper;
    print(_questionPaper.title);
    loadData(_questionPaper);
    super.onReady();
  }

  void loadData(QuestionPaper questionPaper) async {
    questionPaperModel = questionPaper;
    try {
      final questionQuery = await questionPaperRF
          .doc(questionPaper.id)
          .collection("questions")
          .get();
      //  final questionPaperCollection =
      //       snapshot.docs.map((doc) => QuestionPaper.fromJson(doc.data())).toList();
      final question = questionQuery.docs
          .map((e) => QuestionPaper.fromJson(e.data()))
          .toList();
      print(question.length);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
