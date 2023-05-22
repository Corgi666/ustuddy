import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masterclass/controller/question_paper/get_question_controller.dart';
// import 'package:masterclass/controller/question_paper/get_question_controller.dart';
import 'package:masterclass/screens/question/background_decoration.dart';

import '../../controller/question_paper/question_controller.dart';
// import 'package:masterclass/model/answer_model.dart';

class QuestionScreen extends GetView<QuestionPaperController> {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paper = Get.arguments;
    QuestionController questionController = Get.find();
    controller.loadData(paper);
    // print(paper.id);
    return Scaffold(
      body: BackgroundScreen(
          child: GestureDetector(
        onTap: () => questionController.loadData(paper),
        child: Text(paper.id),
      )),
    );
  }
}
