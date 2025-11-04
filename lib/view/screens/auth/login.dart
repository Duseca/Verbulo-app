import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/instance_manager.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/screens/auth/signup.dart';
import 'package:verbulo/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_check_box.dart';
import 'package:verbulo/view/widgets/custom_rich_text.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_field.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/or_divider.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          backgroundColor: ktransparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 60),
                    Center(
                      child: CommonImageView(
                        imagePath: Assets.imagesLogo,
                        height: 115,
                      ),
                    ),
                    SizedBox(height: 30),
                    TwoTextedColumn(
                      text1: 'Login',
                      text2: 'Login to your account',
                    ),
                    SizedBox(height: 30),
                    MyTextField(
                      hasTopRadius: T,
                      marginBottom: 5,
                      label: 'EMAIL ADDRESS',
                      hint: 'Enter Email',
                    ),
                    MyTextField(
                      marginBottom: 5,
                      label: 'PASSWORD',
                      hasBottomRadius: T,
                      hint: 'Enter Password',
                      suffixIcon: Image.asset(
                        color: getTertiary(context),
                        Assets.imagesSee,
                        height: 12,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      spacing: 10,
                      children: [
                        CustomCheckBox(isActive: false, onTap: () {}),
                        MyText(text: 'Remember me'),
                        Spacer(), MyText(text: 'Forget Password?'),

                        //  Spacer(),
                      ],
                    ),
                    MyButton.filled(
                      onTap: () {
                        Get.to(() => BottomNavBar());
                      },
                      buttonText: 'Sign In',
                      mTop: 40,
                      mBottom: 40,
                    ),
                    OrDivider(),
                    SizedBox(height: 30),
                    Row(
                      spacing: 40,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            decoration: rounded2(ktransparent, kGreyColor),
                            child: Center(
                              child: CommonImageView(
                                imagePath: Assets.imagesGooglr,
                                height: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            decoration: rounded2(ktransparent, kGreyColor),
                            child: Center(
                              child: Image.asset(
                                Assets.imagesApple,
                                height: 30,
                                color: getTertiary(context),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            decoration: rounded2(ktransparent, kGreyColor),
                            child: Center(
                              child: CommonImageView(
                                imagePath: Assets.imagesFacebook,
                                height: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              CustomRichText(
                info: "Don't have an account?",
                title: ' Sign Up',
                ontaptext: () => Get.to(() => SignUp()),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
