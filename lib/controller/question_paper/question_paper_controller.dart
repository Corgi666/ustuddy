// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:masterclass/firebase_ref/references.dart';
// import 'package:masterclass/model/question_model.dart';
// import 'package:masterclass/services/firebase_store_service.dart';

// class QuestionPaperController extends GetxController {
  // final allPaperImages = <String>[].obs;
  // final allPapers = <QuestionPaperModel>[].obs;
  // @override
  // void onReady() {
  //   getAllPaper();
  //   // TODO: implement onReady
  //   super.onReady();
  // }

  // getAllPaper() async {
  //   List<String> imgName = ["biology", "chemistry", "maths", "physics"];
  // try {
  //   for (var img in imgName) {
  // QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
  // final paperList = data.docs
  //     .map((paper) => QuestionPaperModel.fromSnapshot(paper))
  //     .toList();
  // allPapers.assignAll(paperList);

  // for (var paper in paperList) {
  //   // final imgUrl =
  //   //     await Get.find<FirebaseStoreService>().getImage(paper.title);
  //   // paper.imageUrl = imgUrl!;
  // }
  // allPapers.assignAll(paperList);
  //   }
  // } catch (e) {
  //   print(e);
  // }
  // }
// }
