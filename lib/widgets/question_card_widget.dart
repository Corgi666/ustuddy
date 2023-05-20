import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masterclass/controller/question_paper/get_question_controller.dart';
import 'package:masterclass/model/answer_model.dart';
import 'package:get/get.dart';
// import 'package:masterclass/utils/app_icons.dart';
import 'package:masterclass/utils/custorm_text_style.dart';
import 'package:masterclass/utils/theme_configs.dart';
import 'package:masterclass/widgets/reuseable_widget.dart';

Widget questionCardWidet(BuildContext context, QuestionPaper model,
    List imgName, int index, QuestionController controller) {
  const double _padding = 10.0;
  return GestureDetector(
    onTap: () {
      controller.navigateToQuestions(paper: model);
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: UIParametters.borderRadius, color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColoredBox(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: SizedBox(
                      height: Get.width * 0.15,
                      width: Get.width * 0.15,
                      child: FadeInImage(
                        placeholder:
                            AssetImage("assets/images/app_splash_logo.png"),
                        image: AssetImage(
                            "assets/storage_files/${imgName[index]}.png"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.title, style: cartTitle(context)),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 15),
                          child: Text(
                            model.description,
                            style: TextStyle(
                                color: UIParametters.isDarkMode()
                                    ? DarkTheme.mainTextColorDark
                                    : LightTheme.mainTextTheme,
                                fontSize: 15),
                          ),
                        ),
                        Row(
                          children: [
                            appIconText('${model.questionCount} quizzes',
                                Icons.help_outline_sharp),
                            SizedBox(width: 15),
                            appIconText('${model.timeInMinits()}', Icons.timer)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                right: -10,
                bottom: -10,
                child: GestureDetector(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(10))),
                      child: SvgPicture.asset(
                        'assets/icons/trophyoutline.svg',
                        color: Colors.white,
                      )),
                ))
          ],
        ),
      ),
    ),
  );
}
