import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_field.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(title: 'Change Password', titlesize: 24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    MyTextField(
                      label: 'Enter Old Password',
                      hint: 'Enter Password',
                      hasBottomRadius: true,
                      hasTopRadius: true,
                      suffixIcon: Image.asset(
                        color: getTertiary(context),
                        Assets.imagesSee,
                        height: 12,
                      ),
                    ),
                    MyTextField(
                      marginBottom: 5,
                      label: 'Enter New Password',
                      hint: 'Enter Password',
                      hasTopRadius: true,
                      suffixIcon: Image.asset(
                        color: getTertiary(context),
                        Assets.imagesSee,
                        height: 12,
                      ),
                    ),
                    MyTextField(
                      hasBottomRadius: T,
                      marginBottom: 5,
                      label: 'Confirm New Password',
                      hint: 'Enter Password',
                      suffixIcon: Image.asset(
                        color: getTertiary(context),
                        Assets.imagesSee,
                        height: 12,
                      ),
                    ),
                    MyButton.filled(buttonText: 'Save', onTap: () {}, mTop: 50),
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
