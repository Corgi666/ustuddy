import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final questionPaperRF = fireStore.collection('questionPaper');

final userRf = fireStore.collection("users");
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) {
  return questionPaperRF.doc(paperId).collection("questions").doc(questionId);
}
