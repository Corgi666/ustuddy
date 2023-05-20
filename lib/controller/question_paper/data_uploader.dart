import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:masterclass/firebase_ref/loading_status.dart';
import 'package:masterclass/firebase_ref/references.dart';
import 'package:masterclass/model/question_model.dart';

class DataUploader extends GetxController {
  final String text = 'Start';
  final List<QuestionPaperModel> _questionPapers = [];
  List get questionPaper => _questionPapers;
  var loadingStatus = LoadingStatus.loading;
  // var get LoadingStatus => _loadingStatus;
  @override
  void onReady() {
    // TODO: implement onReady
    uploadData();
    super.onReady();
  }

  void uploadData() async {
    loadingStatus = LoadingStatus.loading; //loadingStatus is obs

    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
/*
    final List<String> papersInAssets = [
      "assets/DB/papers/bialogy.json",
      "assets/DB/papers/chemistry.json",
      "assets/DB/papers/maths.json",
      "assets/DB/papers/physics.json",
    ];
  */

    for (var paper in papersInAssets) {
      String stringPaperConent = await rootBundle.loadString(paper);
      _questionPapers
          .add(QuestionPaperModel.fromJson(jsonDecode(stringPaperConent)));
    }
    // print('Items number${_questionPapers[0].description}');
    var batch = fireStore.batch();
    for (var paper in _questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "question_count":  paper.questions.length
      });

      for (var question in paper.questions) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: question.id);
        final currectAnswer = question.correctAnswer.toString();
        String fixAnswer = currectAnswer.replaceFirst("CorrectAnswer.", "");
        batch.set(questionPath,
            {"question": question.question, "currect_answer": fixAnswer});

        // print(fixAnswer);
        for (var answer in question.answers) {
          print(answer.identifier);
          var identifier = answer.identifier.toString();
          identifier = identifier.replaceFirst("CorrectAnswer.", "");

          batch.set(questionPath.collection("answers").doc(identifier),
              {"identifier": identifier, "answer": answer.answer});
        }
      }
    }

    await batch.commit();
    loadingStatus = LoadingStatus.completed;
    update();
  }
}
