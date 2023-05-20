import 'package:get/get.dart';
import 'package:masterclass/screens/login/login_screen.dart';
import 'package:masterclass/screens/question/question_screen.dart';
import 'package:masterclass/screens/splash/splash_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction_screen.dart';

class RouteHelper {
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(
        name: "/introduction",
        page: () => const IntroductionScreen(),
        transition: Transition.rightToLeft),
    GetPage(
      name: "/homescreen",
      page: () => const HomeScreen(),
    ),
    GetPage(name: "/loginscreen", page: () => const LoginScreen()),
    GetPage(name: "/questionscreen", page: () => const QuestionScreen())
  ];
}
