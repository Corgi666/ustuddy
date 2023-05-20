// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masterclass/firebase_ref/references.dart';

import '../widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    // QuestionController controller = Get.find();
    // await controller.loadQuestionPaperCollection();

    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen(
      (User? event) {
        _user.value = event;
      },
    );
    navigateToItroduction();
  }

  Future<void> signInWithGoole() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        Get.offNamed("/homescreen");
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRf.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void navigateToItroduction() {
    Get.offAllNamed("/introduction");
    // Get.to(const TestScreen());
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStatrDialogue(
      onTap: () {
        Get.back();
        navigateToLoginPage();
      },
    ), barrierDismissible: false);
  }

  void navigateToLoginPage() {
    Get.toNamed("/loginscreen");
  }

  bool isLoggin() {
    return _auth.currentUser != null;
  }
}
