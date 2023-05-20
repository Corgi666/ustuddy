import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }

  void togleDrawer() {
    zoomDrawerController.toggle?.call();
    print("Zoom");
    update();
  }

  void signOut() {}

  void signIn() {}

  void website() {}

  void email() {
    final Uri emailLauchUri =
        Uri(scheme: 'Anuchit', path: 'anuchit.k1996@gmail.com');
    _launch(emailLauchUri.toString());
  }

  _launch(String url) async {
    if (!await _launch(url)) {
      throw 'could not lauch $url';
    }
  }
}
