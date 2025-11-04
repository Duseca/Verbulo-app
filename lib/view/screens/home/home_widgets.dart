import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_accodian.dart';
import 'package:verbulo/view/widgets/custom_wrap.dart';
import 'package:verbulo/view/widgets/icon_text_row.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/my_bullet_point.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/speed_dropdown.dart';
import 'package:verbulo/view/widgets/trans_container.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class Pronounce extends StatelessWidget {
  const Pronounce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: rounded2r(
        getlightBluedarkblue(context),
        getlightBluedarkblue(context),
        25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Menutile(
            hasline: false,
            title: 'Todays World',
            textcolor: kQuaternaryColor,
            trailtext: 'Favorite',
            hasicon: false,
            trailIcon: Assets.imagesStar,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TransparentContainer(
              text: 'Ser-en-dip-i-ty',
              textSize: 22,
              color1: kQuaternaryColor,
              opacity: 0.1,
              textWeight: wbold,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                CommonImageView(imagePath: Assets.imagesPlay, height: 36),
                Spacer(),
                SpeedDropdown(),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Breakdown extends StatelessWidget {
  const Breakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: rounded2r(kSecondaryColor2, kSecondaryColor2, 25),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(text: 'Breakdown', color: kTertiaryColor, size: 16),
          TransparentContainer(
            text: 'Ser-en-dip-i-ty',
            textSize: 22,
            textWeight: wbold,
          ),
          MyText(text: 'Phonetic', color: kTertiaryColor, size: 16),
          TransparentContainer(
            text: 'ˌsɛrənˈdɪpɪti',
            textSize: 22,
            textWeight: wbold,
          ),
          MyText(text: 'Origin', color: kTertiaryColor, size: 16),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 2,
              children: [
                TransparentContainer(text: 'Old English'),
                CommonImageView(imagePath: Assets.imagesNext, height: 10),
                TransparentContainer(text: 'Sanskrit'),
                CommonImageView(imagePath: Assets.imagesNext, height: 10),
                TransparentContainer(text: 'Modern English'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Meaning extends StatelessWidget {
  const Meaning({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAccordion(
      title: 'Meaning',
      children: [
        Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: bluegreydecor(),
              child: Column(
                children: [
                  TwoTextedColumn(
                    color1: getTertiary(context),
                    size2: 18,
                    size1: 14,
                    text1: 'Primary',
                    color2: getTertiary(context),
                    text2:
                        'The occurrence of events by chance in a happy or beneficial way.',
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: bluegreydecor(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TwoTextedColumn(
                    alignment: ColumnAlignment.start,
                    size2: 18,
                    color2: getTertiary(context),
                    color1: getTertiary(context),
                    size1: 14,
                    text1: 'Secondary',
                    text2: 'Luck, fate, or unexpected fortune.',
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: bluegreydecor(),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Part of Speech',
                    color: getTertiary(context),
                    size: 14,
                    weight: wbold,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: rounded2(kSecondaryColor2, kSecondaryColor2),
                    child: MyText(text: 'Noun', color: kSecondaryColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: bluegreydecor(),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Synonyms',
                    size: 14,
                    color: getTertiary(context),
                    weight: wbold,
                  ),
                  CustomWrap(
                    currentIndex: -1,
                    hasIcon: F,
                    items: ['Chance', 'Fluke', 'Blessing'],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UsageExamples extends StatelessWidget {
  const UsageExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAccordion(
      title: 'Usage Examples ',
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(10),
          decoration: bluegreydecor(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyBullet(
                color: getTertiary(context),
                bullet: '1.',
                point: 'Finding that old photo was pure serendipity.',
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconTextRow(
              padends: 20,
              padvertical: 10,
              decoration: rounded2r(kMustard, kMustard, 20),
              text: 'Hear in Sentence',
              textcolor: kSecondaryColor,
              iconpath: Assets.imagesPlay2,
              expanded: false,
              //mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
      ],
    );
  }
}
