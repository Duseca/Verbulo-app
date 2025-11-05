import 'package:flutter/material.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class FillBlanks extends StatelessWidget {
  const FillBlanks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: CommonImageView(
            imagePath: Assets.imagesPencil,
            height: 71,
            width: 71,
          ),
        ),
        MyText(
          text: 'Fill in the Blank',
          size: 16,
          paddingBottom: 50,
          textAlign: TextAlign.center,
        ),
        MyText(
          text: 'She gave a very ________ speech that moved the audience.',
          size: 16,
          textAlign: TextAlign.center,
          paddingBottom: 20,
        ),
        MyButton.filled(
          buttonText: 'Next',
          onTap: () {
            quizController.pageController.nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
