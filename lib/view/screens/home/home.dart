import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_wrap.dart';
import 'package:verbulo/view/widgets/icon_text_row.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/my_bullet_point.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/speed_dropdown.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/trans_container.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          StackBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  spacing: 10,
                  children: [
                    CommonImageView(
                      url: dummyImage,
                      radius: 200,
                      height: 46,
                      width: 46,
                    ),
                    Expanded(child: MyText(text: 'Hi Zara', size: 24)),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: rounded2r(
                        ktransparent,
                        getTertiary(context),
                        100,
                      ),
                      child: IconTextRow(
                        expanded: false,
                        textcolor: getTertiary(context),
                        iconpath: Assets.imagesFire,
                        text: '7',
                        textsize: 16,
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Image.asset(
                      Assets.imagesCalender,
                      height: 24,
                      color: getTertiary(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 20),
                    Container(
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

                          TransparentContainer(
                            text: 'Ser-en-dip-i-ty',
                            textSize: 22,
                            color1: kQuaternaryColor,
                            opacity: 0.1,
                            textWeight: wbold,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Row(
                              children: [
                                CommonImageView(
                                  imagePath: Assets.imagesPlay,
                                  height: 36,
                                ),
                                Spacer(),
                                SpeedDropdown(),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: rounded2r(
                        kSecondaryColor2,
                        kSecondaryColor2,
                        25,
                      ),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Breakdown',
                            color: kTertiaryColor,
                            size: 16,
                          ),
                          TransparentContainer(
                            text: 'Ser-en-dip-i-ty',
                            textSize: 22,
                            textWeight: wbold,
                          ),
                          MyText(
                            text: 'Phonetic',
                            color: kTertiaryColor,
                            size: 16,
                          ),
                          TransparentContainer(
                            text: 'ˌsɛrənˈdɪpɪti',
                            textSize: 22,
                            textWeight: wbold,
                          ),
                          MyText(
                            text: 'Origin',
                            color: kTertiaryColor,
                            size: 16,
                          ),
                          Row(
                            spacing: 2,
                            children: [
                              TransparentContainer(text: 'Old English'),
                              CommonImageView(
                                imagePath: Assets.imagesNext,
                                height: 10,
                              ),
                              Expanded(
                                child: TransparentContainer(text: 'Sanskrit'),
                              ),
                              CommonImageView(
                                imagePath: Assets.imagesNext,
                                height: 10,
                              ),
                              TransparentContainer(text: 'Modern English'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: rounded2(
                        ThemeUtils.isDarkMode(context)
                            ? Color(0xff405161)
                            : kQuaternaryColor,
                        ThemeUtils.isDarkMode(context)
                            ? Color(405161)
                            : kGreyColor1,
                      ),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(text: 'Meaning'),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: bluegreydecor(),
                            child: Column(
                              children: [
                                TwoTextedColumn(
                                  size2: 18,
                                  size1: 14,
                                  text1: 'Primary',
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
                                  size: 14,
                                  weight: wbold,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: rounded2(
                                    kSecondaryColor2,
                                    kSecondaryColor2,
                                  ),
                                  child: MyText(
                                    text: 'Noun',
                                    color: kSecondaryColor,
                                  ),
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
                                  weight: wbold,
                                ),
                                CustomWrap(
                                  currentindex: -1,
                                  hasicon: F,
                                  items: ['Chance', 'Fluke', 'Blessing'],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: rounded2(
                        ThemeUtils.isDarkMode(context)
                            ? Color(0xff405161)
                            : kQuaternaryColor,
                        ThemeUtils.isDarkMode(context)
                            ? Color(405161)
                            : kGreyColor1,
                      ),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(text: 'Usage Examples'),

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: bluegreydecor(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyBullet(
                                  bullet: '1.',
                                  point:
                                      'Finding that old photo was pure serendipity.',
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
                                  size: 14,
                                  weight: wbold,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: rounded2(
                                    kSecondaryColor2,
                                    kSecondaryColor2,
                                  ),
                                  child: MyText(
                                    text: 'Noun',
                                    color: kSecondaryColor,
                                  ),
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
                                  weight: wbold,
                                ),
                                CustomWrap(
                                  currentindex: -1,
                                  hasicon: F,
                                  items: ['Chance', 'Fluke', 'Blessing'],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
