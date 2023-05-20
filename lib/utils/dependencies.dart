import 'package:get/get.dart';
import 'package:masterclass/controller/auth_controller.dart';
import 'package:masterclass/controller/question_paper/data_uploader.dart';
import 'package:masterclass/controller/question_paper/get_question_controller.dart';
import 'package:masterclass/controller/question_paper/question_controller.dart';
// import 'package:masterclass/controller/question_paper/question_paper_controller.dart';
import 'package:masterclass/controller/theme_controller.dart';
import 'package:masterclass/controller/zoom_drawer_controller.dart';
import 'package:masterclass/services/firebase_store_service.dart';

Future<void> init() async {
  // * Splash Page
  Get.put(AuthController(), permanent: true);

  //? Controller
  Get.lazyPut(() => ThemeController());
  Get.lazyPut(() => MyZoomDrawerController());
  Get.lazyPut(() => QuestionController());
  Get.lazyPut(() => QuestionPaperController());
  // Get.lazyPut(() => QuestionPaperController());

  //!Service
  Get.put(QuestionController());
  Get.lazyPut(() => DataUploader());
  Get.lazyPut(() => FirebaseStoreService());
}
