import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_drop_down.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_field.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(title: 'Profile', titlesize: 24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: CommonImageView(
                            url: dummyImage3,
                            height: 111,
                            width: 111,
                            radius: 300,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 70,

                          child: Container(
                            padding: EdgeInsets.all(4),
                            height: 26,
                            width: 26,
                            decoration: circle(
                              getbtnColor(context),
                              getbtnColor(context),
                            ),
                            child: Image.asset(
                              Assets.imagesCamera,
                              color: getPrimaryColor(context),
                              height: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    MyTextField(
                      hasTopRadius: T,
                      marginBottom: 5,
                      label: 'Name',
                      hint: 'Enter Name',
                    ),
                    MyTextField(
                      marginBottom: 5,
                      label: 'Email',
                      hint: 'Enter Email',
                    ),
                    SimpleDropDown(
                      label: 'Gender',
                      hint: 'Gender',
                      onChanged: (v) {},
                      items: ['Gender', 'Male', 'Female', 'Others'],
                    ),
                    SizedBox(height: 5),
                    SimpleDropDown(
                      label: 'Language Proficiency',
                      hint: 'Intermediate',
                      hasBottomRadius: true,
                      onChanged: (v) {},
                      borderRadius: 8,
                      items: ['Intermediate'],
                    ),
                    MyButton.filled(buttonText: 'Save', onTap: () {}, mTop: 20),
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
