import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/view/widgets/custom_bottom_sheet.dart';
import 'package:verbulo/view/widgets/custom_wrap.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class SortBottom extends StatelessWidget {
  const SortBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      children: [
        MyText(text: 'Sort by', size: 24, weight: wmedium, paddingBottom: 20),
        CustomWrap(
          textSize: 14,
          spacing: 10,
          currentIndex: 0,
          outlineColor: getTertiary(context),
          bgColor: ktransparent,
          selectedBgColor: getbtnColor(context),

          textcolor: getTertiary(context),
          selectedtextcolor: getPrimaryColor(context),
          items: [
            'Alphabetical (A → Z)',
            'Alphabetical (Z → A)',
            'Order Learned (Newest → Oldest)',
            'Order Learned (Oldest → Newest)',
            'Difficulty Easy → Hard',
            'Difficulty Hard → Easy',
          ],
          hasIcon: F,
        ),
        MyText(
          text: 'Part of Speech',
          size: 16,
          weight: wmedium,
          paddingBottom: 20,
          paddingTop: 30,
        ),
        CustomWrap(
          textSize: 14,
          spacing: 10,
          currentIndex: 0,
          outlineColor: getTertiary(context),
          bgColor: const Color.fromRGBO(0, 0, 0, 0),
          selectedBgColor: getbtnColor(context),

          textcolor: getTertiary(context),
          selectedtextcolor: getPrimaryColor(context),
          items: ['Noun', 'Adjective', 'Verb'],
          hasIcon: F,
        ),
        MyText(
          text: 'Category / Topic Tags',
          size: 16,
          weight: wmedium,
          paddingBottom: 20,
          paddingTop: 30,
        ),
        CustomWrap(
          textSize: 14,
          spacing: 10,
          currentIndex: 0,
          outlineColor: getTertiary(context),
          bgColor: ktransparent,
          selectedBgColor: getbtnColor(context),

          textcolor: getTertiary(context),
          selectedtextcolor: getPrimaryColor(context),
          items: ['Business', 'Science', 'Food', 'Emotion', 'Literature'],
          hasIcon: F,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
