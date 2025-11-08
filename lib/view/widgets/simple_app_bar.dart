import 'package:verbulo/const/app_sizes.dart';

import 'package:verbulo/view/widgets/Icon_title_subtitle.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

AppBar simpleAppBar({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? titleColor,
  Color? contentColor,
  bool? haveBackButton = true,
  bool? centerTitle,
  hasTitleimage = false,
  double toolbarheight = 76,
  double? titlesize,
  List<Widget>? actions,
  double? height,
  double? leadingwidth,
  PreferredSize? bottom,
}) {
  return AppBar(
    bottom: bottom,

    toolbarHeight: toolbarheight,
    surfaceTintColor: ktransparent,
    foregroundColor: ktransparent,
    backgroundColor: bgColor ?? ktransparent,
    centerTitle: centerTitle ?? F,

    shadowColor: ktransparent,
    leadingWidth: haveBackButton == false ? 0 : 70,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        if (haveBackButton!)
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: GestureDetector(
              onTap: onBackIconTap ?? () => Get.back(),
              child: Image.asset(
                Assets.imagesBack,
                height: height ?? 40,
                color: contentColor ?? null,
              ),
            ),
          ),
      ],
    ),
    title: centerTitle == T
        ? MyText(
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            text: title ?? '',
            size: titlesize ?? 16,
            //    textAlign: centerTitle == true ? TextAlign.center : null,
            weight: FontWeight.w700,
            color: titleColor ?? getTertiary(Get.context!),
          )
        : Row(
            spacing: 10,
            children: [
              if (hasTitleimage == true)
                CommonImageView(
                  url: dummyImage,
                  height: 40,
                  width: 40,
                  radius: 100,
                ),
              Expanded(
                child: MyText(
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  text: title ?? '',
                  size: titlesize ?? 16,
                  //    textAlign: centerTitle == true ? TextAlign.center : null,
                  weight: FontWeight.w700,
                  color: titleColor ?? getTertiary(Get.context!),
                ),
              ),
            ],
          ),
    actions: actions,
  );
}

ClipRRect simpleAppBar2({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  bool? haveBackButton = true,
  List<Widget>? actions,
  double? height,
  PreferredSize? bottom,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),
    child: AppBar(
      bottom: bottom,
      toolbarHeight: 76,
      surfaceTintColor: kPrimaryColor,
      foregroundColor: kPrimaryColor,
      backgroundColor: bgColor ?? kPrimaryColor,
      shadowColor: kPrimaryColor,
      centerTitle: T,
      leadingWidth: haveBackButton == false ? 0 : null,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          if (haveBackButton!)
            GestureDetector(
              onTap: onBackIconTap ?? () => Get.back(),
              child: Image.asset(Assets.imagesLogo, height: height ?? 40),
            ),
        ],
      ),
      title: MyText(
        text: title ?? '',
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
        size: 18,
        weight: FontWeight.w600,
        color: contentColor ?? kTertiaryColor,
      ),
      actions: actions,
    ),
  );
}

AppBar homeAppBar({
  String? title,
  double? height,
  String? notifyPath,
  String? msgPath,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  PreferredSizeWidget? bottom,
  Widget? choiceIcon,
  bool? issearch = false,
  bool? haveBackButton = true,
  List<Widget>? actions,
}) {
  // Get the text scale factor from MediaQuery
  double textScaleFactor = MediaQuery.of(Get.context!).textScaleFactor;

  // Default toolbarHeight, which can be adjusted based on textScaleFactor
  double toolbarHeight = 84; // Scale toolbar height based on text scale factor
  if (textScaleFactor > 1) {
    toolbarHeight = toolbarHeight * textScaleFactor;
  }
  return AppBar(
    toolbarHeight: toolbarHeight, // Dynamically adjusted toolbar height
    foregroundColor: kPrimaryColor,
    surfaceTintColor: kPrimaryColor,
    backgroundColor: bgColor ?? kPrimaryColor,
    centerTitle: false,
    leadingWidth: Get.width,

    leading: Padding(
      padding: const EdgeInsets.only(top: 19.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: IconTitleSubtitle(
              isurl: true,
              ontap: () {
                // Get.to(() => Profile());
              },
              hastsubtitle: true,
              crossAxisAlignment: CrossAxisAlignment.start,
              iconheight: 60,
              title: title ?? 'Hi, Dr.John 👋',
              size1: toolbarHeight == 84 ? 22 : 18,
              size2: 14,
              color1: kTertiaryColor,
              padEnds: 20,
              weight1: wbold,
              trailing: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        //Get.to(() => Messages());
                      },
                      child: CommonImageView(
                        imagePath: msgPath ?? Assets.imagesLogo,
                        height: height ?? 24,
                        width: height ?? 24,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //Get.to(() => Notifications());
                      },
                      child: CommonImageView(
                        imagePath: notifyPath ?? Assets.imagesLogo,
                        height: height ?? 24,
                        width: height ?? 24,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: 'Welcome back ',
            ),
          ),
        ],
      ),
    ),
    actions: actions ?? [choiceIcon ?? SizedBox.shrink(), SizedBox(width: 20)],
    bottom: bottom,
  );
}
