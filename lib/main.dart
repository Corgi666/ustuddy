import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masterclass/controller/theme_controller.dart';
import 'package:masterclass/firebase_options.dart';
import 'package:get/get.dart';
import 'package:masterclass/test.dart';

import 'package:masterclass/utils/dependencies.dart' as dep;
import 'package:masterclass/utils/routes.dart';
// import 'package:masterclass/utils/theme_configs.dart';

Future<void> main(List<String> args) async {
  dep.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RouteHelper.routes,
      theme: Get.find<ThemeController>().lightTheme,
      themeMode: ThemeMode.light,
      // title: 'Master Class',
      // home: const TestScreen(),
    );
  }
}
