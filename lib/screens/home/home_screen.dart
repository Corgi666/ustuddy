// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:masterclass/controller/question_paper/get_question_controller.dart';
import 'package:masterclass/controller/zoom_drawer_controller.dart';
import 'package:masterclass/screens/home/menu_screen.dart';
import 'package:masterclass/utils/app_icons.dart';
import 'package:masterclass/utils/custorm_text_style.dart';
import 'package:masterclass/utils/theme_configs.dart';
// import 'package:masterclass/widgets/content_area.dart';
import 'package:masterclass/widgets/question_card_widget.dart';
// import 'package:masterclass/utils/dependencies.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imgName = ["physics", "chemistry", "maths", "biology"];
    QuestionController controller = Get.find();

    return Container(
      decoration: BoxDecoration(
          // color: Colors.white,
          gradient: UIParametters.isDarkMode()
              ? ThemeColors.mainGradientDark
              : ThemeColors.mainGradientLight),
      child: Scaffold(
          backgroundColor: Colors.blueGrey,
          body: GetBuilder<MyZoomDrawerController>(builder: (_) {
            return ZoomDrawer(
              showShadow: false, angle: 0.0, style: DrawerStyle.defaultStyle,
              borderRadius: 60.0,
              controller: _.zoomDrawerController, slideWidth: Get.width * 0.7,
              menuScreen: MenuScreen(),
              mainScreen: Container(
                  color: Colors.blueGrey,
                  child: bodyWidget(
                      context, controller, imgName)), // * BODY WIDGET)
            );
          })),
    );
  }
}

Widget bodyWidget(
    BuildContext context, QuestionController controller, List<String> imgName) {
  MyZoomDrawerController zoomCon = Get.find();
  return SafeArea(
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 40, right: 20, bottom: 20, top: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => zoomCon.togleDrawer(),
                child: Icon(
                  AppIcons.menuLeft,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SvgPicture.asset(
                  'assets/icons/peace.svg',
                  height: 20,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Hello Friend",
                  style: detialText.copyWith(color: Colors.white),
                )
              ]),
              SizedBox(height: 10),
              Text(
                "What do you want To Learn Today ?",
                style: TextStyle(fontSize: 27),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            decoration: BoxDecoration(
                color: customScaffoldColor(context),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ListView.separated(
                padding: UIParametters.mobileScreenPadding,
                itemBuilder: (BuildContext context, int index) {
                  return questionCardWidet(context, controller.allPaper[index],
                      imgName, index, controller);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: 4),
          ),
        ),
      ],
    ),
  );
}
