import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/screens/register_profile/landing.dart';
import 'package:verbulo/view/screens/register_profile/tell_name.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/moving_icon.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class CompleteVerify extends StatelessWidget {
  const CompleteVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 20),
                  CommonImageView(imagePath: Assets.imagesBack, height: 40),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 30),
                    TwoTextedColumn(
                      text1: 'Verification Complete',
                      text2: 'Your email has been verified.',
                    ),

                    SizedBox(height: 30),
                    MovingIcon(path: Assets.imagesComplete, height: 250),
                    MyButton.filled(
                      buttonText: 'Continue',
                      onTap: () {Get.to(()=>Landing());},
                      mTop: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
