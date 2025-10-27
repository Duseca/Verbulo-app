import 'dart:ui';

import 'package:bounce/bounce.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.ontap,
    this.title,
    this.subtitle,
    this.btncolor,
    this.btncolor2,
    this.btntext,
    this.fontcolor1,
    this.fontcolor2,
    this.isrow = true,
    this.iscol = F,
    this.path,
    this.btntext2,
    this.ontap2,
    this.title2,
  });
  final String? title, title2, subtitle, btntext, btntext2, path;
  final Color? btncolor, btncolor2, fontcolor1, fontcolor2;
  final bool? isrow, iscol;
  final VoidCallback? ontap, ontap2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 0.0, sigmaX: 0),
                child: Container(
                  color: Colors.black.withOpacity(
                    0.02,
                  ), // Add opacity to background
                ),
              ),
            ),
            // Your content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 70,
                          horizontal: 20,
                        ),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryColor,
                          border: Border.all(color: ktransparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: title2 ?? 'Delete Account',
                              weight: wbold,
                              size: 18,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            CommonImageView(
                              imagePath: path ?? Assets.imagesLogo,
                              width: Get.width,
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                            MyText(
                              text:
                                  title ??
                                  'Are you sure you want to delete your account?',
                              paddingTop: 20,
                              textAlign: TextAlign.center,
                              paddingBottom: 10,
                              fontFamily: MANROPE,
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                            MyText(
                              text: subtitle ?? '',
                              textAlign: TextAlign.center,
                              paddingBottom: 20,
                              color: ksubtextColor,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyButton.filled(
                                    //   gradient: transparentgrad(),
                                    onTap:
                                        ontap ??
                                        () {
                                          //   Get.to(() => Login());
                                        },
                                    buttonText: btntext ?? 'Cancel',

                                    backgroundColor: btncolor ?? ktransparent,
                                    outlineColor: kGreyColor2,

                                    fontColor: fontcolor1 ?? kGreyColor2,

                                    //  fontColor: kPrimaryColor,
                                  ),
                                ),
                                if (isrow == true) SizedBox(width: 10),
                                if (isrow == true)
                                  Expanded(
                                    child: MyButton.filled(
                                      onTap:
                                          ontap2 ??
                                          () {
                                            //   Get.to(() => Login());
                                          },
                                      buttonText: btntext2 ?? 'Delete',

                                      backgroundColor: btncolor2 ?? kRedColor,
                                      fontColor: fontcolor2 ?? kQuaternaryColor,
                                      //  fontColor: kPrimaryColor,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 0),
                            if (iscol == true)
                              MyButton.filled(
                                onTap:
                                    ontap2 ??
                                    () {
                                      Get.back();
                                    },
                                buttonText: 'Not now',

                                backgroundColor: btncolor2 ?? kSecondaryBlue,
                                fontColor: fontcolor2 ?? kPrimaryColor,
                                //  fontColor: kPrimaryColor,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogLayout extends StatelessWidget {
  const DialogLayout({
    super.key,
    this.padends,
    this.mhoriz,
    this.children,
    this.title,
    this.leftpad,
  });
  final String? title;
  final double? padends, mhoriz, leftpad;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                child: Container(
                  color: ktransparent, // Add opacity to background
                ),
              ),
            ),
            // Your content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padends ?? 16,
                          vertical: 30,
                        ),
                        margin: EdgeInsets.fromLTRB(
                          mhoriz ?? 20,
                          5,
                          mhoriz ?? 20,
                          30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kQuaternaryColor,
                          border: Border.all(color: ktransparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: children ?? [],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: leftpad ?? 16,
                        left: leftpad ?? 16,
                        child: simpleAppBar(
                          centerTitle: true,
                          title: title,
                          bgColor: ktransparent,
                          height: 30,
                          haveBackButton: false,
                          actions: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: CommonImageView(
                                imagePath: Assets.imagesLogo,
                                height: 24,
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
