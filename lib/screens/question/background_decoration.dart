import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:masterclass/controller/question_paper/get_question_controller.dart';
import 'package:masterclass/controller/question_paper/question_controller.dart';
import 'package:masterclass/utils/theme_configs.dart';

class BackgroundScreen extends GetView<QuestionPaperController> {
  final Widget child;
  final bool showGradient;
  const BackgroundScreen(
      {super.key, required this.child, this.showGradient = false});

  @override
  Widget build(BuildContext context) {
    // controller.loadData();
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                color: showGradient ? null : Theme.of(context).primaryColor,
                gradient:
                    showGradient ? ThemeColors.mainGradient(context) : null),
            child: CustomPaint(
              painter: BackgroundPatiner(),
            ),
          ),
        ),
        Positioned(
            child: Center(
          child: child,
        ))
      ],
    );
  }
}

class BackgroundPatiner extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();

    final path1 = Path();
    path1.moveTo(size.width, 0);
    path1.lineTo(size.width * 0.8, 0);
    path1.lineTo(size.width * 0.2, size.height);
    path1.lineTo(size.width, size.height);
    path1.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
