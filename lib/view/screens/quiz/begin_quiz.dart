import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/view/screens/quiz/start_quiz_landing.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class BeginQuiz extends StatelessWidget {
  const BeginQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(title: 'Todays Quiz', titlesize: 24),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              spacing: 40,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  textAlign: TextAlign.center,
                  text: 'Are you ready to test your knowledge?',
                  weight: wmedium,
                  size: 26,
                ),
                MyText(
                  textAlign: TextAlign.center,
                  text: '4 Questions | Est. Time: 2 min',
                  weight: wblack,
                  size: 16,
                ),
                MyButton.filled(
                  buttonText: 'Start',
                  onTap: () {
                    Get.to(
                      () => StartQuizLanding(),
                      transition: Transition.downToUp,
                      duration: 300.ms,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
