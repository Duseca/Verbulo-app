import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/screens/auth/complete_verify.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_rich_text.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_pin_code.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

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
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 30),
                    TwoTextedColumn(
                      text1: 'Verification',
                      text2: 'Enter the code sent to your email address',
                    ),

                    SizedBox(height: 100),
                    MyPinCode(onChanged: (v) {}, onCompleted: (v) {}),
                    MyButton.filled(
                      buttonText: 'Verify',
                      onTap: () {
                        Get.to(() => CompleteVerify());
                      },
                      mTop: 30,
                      mBottom: 20,
                    ),
                    CustomRichText(
                      info: 'Didn’t receive code? ',
                      title: 'Send again',
                      ontaptext: () {
                        //  Get.to(()=>Login());
                      },
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
