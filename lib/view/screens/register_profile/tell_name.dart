import 'package:flutter/material.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_field.dart';

class TellName extends StatelessWidget {
  const TellName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          label: 'Name',
          hasBottomRadius: T,
          hasTopRadius: T,
          hint: 'Enter Name',
          marginBottom: 40,
        ),
        MyButton.filled(
          buttonText: 'Next',
          onTap: () {
            landingController.pageController.nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
