import 'package:flutter/material.dart';
import 'package:scheduler/pages/Calendar.dart';
import 'package:scheduler/pages/Lesson_Selector.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Lesson_Deselector.dart';

class LessonMenu extends StatefulWidget {
  VoidCallback refreshPage;
  LessonMenu({super.key, required this.refreshPage});

  @override
  State<LessonMenu> createState() => _LessonMenuState();
}

class _LessonMenuState extends State<LessonMenu> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        PageView(
          controller: controller,
          children: [
            LessonSelector(refreshPage: widget.refreshPage),
            LessonDeselector(refreshPage: widget.refreshPage),
          ],
        ),
        Align(
          alignment: AlignmentDirectional(0, .95),
          child: SmoothPageIndicator(
            controller: controller,
            count: 2,
            axisDirection: Axis.horizontal,
            onDotClicked: (i) async {
              await controller.animateToPage(
                i,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            effect: ExpandingDotsEffect(
              dotHeight: 15,
              dotWidth: 15,
              activeDotColor: Colors.indigoAccent.shade400,
            ),
          ),
        )
      ],
    );
  }
}
