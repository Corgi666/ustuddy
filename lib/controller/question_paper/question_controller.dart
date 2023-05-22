import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:masterclass/firebase_ref/references.dart';

import '../../model/answer_model.dart';

class QuestionPaperController extends GetxController {
  late QuestionPaper questionPaperModel;
  final allpaper = [].obs;
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
    print(questionPaper.id);
    try {
      final CollectionReference<Map<String, dynamic>> collection =
          FirebaseFirestore.instance
              .collection('questionPaper')
              .doc(questionPaper.id.toString())
              .collection('questions');

      // final QuerySnapshot<Map<String, dynamic>> questionQuery =
      //     await questionPaperRF
      //         .doc(questionPaper.id)
      //         .collection("questions")
      //         .get();

      final snapshot = await collection.get();

      //  final questionPaperCollection =
      //       snapshot.docs.map((doc) => QuestionPaper.fromJson(doc.data())).toList();
      // print(questionQuery);

      final question =
          snapshot.docs.map((e) => Question.formSnapshot(e)).toList();
      questionPaper.questions = question;
      print('QuestionQuery is ${question[0].correctAnswer}');

      for (Question _question in questionPaper.questions) {
        final QuerySnapshot<Map<String, dynamic>> answerQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(_question.id)
                .collection("answers")
                .get();
        final answer = answerQuery.docs
            .map((answer) => Answer.formSnapshot(answer))
            .toList();
        print(answer[0].identifier);
      }
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
}
