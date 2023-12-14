import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import "onboarding/onboarding_first.dart";
import "onboarding/onboarding_second.dart";

class IntroPage extends StatelessWidget {
  final controller = PageController(
    initialPage: 1,
  );
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: controller,
          children: [
            Onboarding1(),
            Onboarding2(),
            // Onboarding3(),
          ],
        ),
        Align(
          alignment: const AlignmentDirectional(0, .95),
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            axisDirection: Axis.horizontal,
            onDotClicked: (i) async {
              await controller.animateToPage(
                i,
                duration: const Duration(milliseconds: 500), 
                curve: Curves.ease
              );
            },
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 20,
              activeDotColor: Colors.indigoAccent.shade400,
            ),
          ),
        ),
        // )
      ],
    );
  }
}
