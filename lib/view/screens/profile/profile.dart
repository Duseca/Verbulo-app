import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/screens/profile/settings.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/trans_container.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';
import 'package:verbulo/view/widgets/weekly_progress_chart.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final ispremium = true;
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(
            haveBackButton: false,
            title: 'Profile',
            titlesize: 24,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Settings());
                    },
                    child: Image.asset(
                      Assets.imagesSettings,
                      color: getTertiary(context),
                      height: 27,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        CommonImageView(
                          url: dummyImage,
                          height: 62,
                          width: 62,
                          radius: 200,
                        ),
                        Expanded(
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                spacing: 5,
                                children: [
                                  MyText(
                                    text: 'Zara',
                                    size: 16,
                                    weight: wsemibold,
                                  ),
                                  TransparentContainer(
                                    padvertical: 5,
                                    color1: kSecondaryColor,
                                    opacity: 1,
                                    text: 'Level12',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MyButton.icon(
                                    height: 34,

                                    buttonText: '2922 XP',
                                    onTap: () {},
                                    fontColor: kQuaternaryColor,
                                    backgroundColor: kMustard,

                                    imagePath: Assets.imagesStar6,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: rounded2(
                              getquaternary(context),
                              ThemeUtils.isDarkMode(context)
                                  ? ktransparent
                                  : kGrey2Color,
                            ),
                            child: TwoTextedColumn(
                              padVertical: 10,
                              size1: 16,
                              size2: 12,
                              textAlign: TextAlign.center,
                              alignment: ColumnAlignment.center,
                              color1: kMustard,
                              text1: '60 Days',
                              text2: 'Streak',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: rounded2(
                              getquaternary(context),
                              getTertiary(context),
                            ),
                            child: TwoTextedColumn(
                              padVertical: 10,
                              size1: 16,
                              size2: 12,
                              textAlign: TextAlign.center,
                              alignment: ColumnAlignment.center,
                              color1: kMustard,
                              text1: '68',
                              text2: 'Words Learned',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: rounded2(
                              getquaternary(context),
                              ThemeUtils.isDarkMode(context)
                                  ? ktransparent
                                  : kGrey2Color,
                            ),
                            child: TwoTextedColumn(
                              padVertical: 10,
                              size1: 16,
                              size2: 12,
                              textAlign: TextAlign.center,
                              alignment: ColumnAlignment.center,
                              color1: kMustard,
                              text1: '88%',
                              text2: 'Quizzes',
                            ),
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text: 'Subscription',
                      paddingTop: 20,
                      size: 16,
                      paddingBottom: 10,
                      weight: wbold,
                    ),
                    ispremium == true
                        ? Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: kQuaternaryColor.withOpacity(0.5),
                              ),
                              color: kMustard,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonImageView(
                                  height: 24,
                                  imagePath: Assets.imagesShimmer,
                                ),
                                MyText(
                                  text: 'Premium Plan',
                                  size: 16,
                                  color: kSecondaryColor,
                                  weight: wbold,
                                ),
                                CommonImageView(
                                  height: 24,
                                  imagePath: Assets.imagesShimmer2,
                                ),
                              ],
                            ),
                          )
                        : MyButton.filled(
                            buttonText: 'Free Plan',
                            onTap: () {},
                            borderRadius: 12,
                            fontColor: getTertiary(context),
                            backgroundColor: getquaternary(context),
                            outlineColor: getTertiary(context),
                          ),

                    MyText(
                      text: 'Experience',
                      size: 16,
                      weight: wbold,
                      paddingBottom: 20,
                      paddingTop: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: rounded2(
                        getquaternary(context),
                        ThemeUtils.isDarkMode(context)
                            ? ktransparent
                            : kGrey2Color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(text: 'XP'),
                          Expanded(
                            child: Column(
                              spacing: 12,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 176,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      LinearPercentIndicator(
                                        padding: EdgeInsets.all(0),

                                        lineHeight: 18,
                                        percent: 0.9,
                                        progressColor: kMustard,
                                        barRadius: Radius.circular(12),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: -5,
                                        child: CommonImageView(
                                          imagePath: Assets.imagesStar7,
                                          height: 27,
                                        ),
                                      ),
                                      Positioned(
                                        left: 30,
                                        child: MyText(
                                          text: '2988 XP',
                                          color: kSecondaryColor,
                                          weight: wsemibold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MyText(text: '78 XP Needed to level Up'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      text: 'Experience',
                      size: 16,
                      weight: wbold,
                      paddingBottom: 20,
                      paddingTop: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: rounded2(
                        getquaternary(context),
                        ThemeUtils.isDarkMode(context)
                            ? ktransparent
                            : kGrey2Color,
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          LinearPercentIndicator(
                            leading: SizedBox(
                              width: 100,
                              child: MyText(text: 'Business'),
                            ),
                            trailing: MyText(
                              text: '72%',
                              paddingLeft: 20,
                              weight: wbold,
                            ),
                            padding: EdgeInsets.all(0),

                            lineHeight: 18,
                            percent: 0.9,
                            progressColor: kMustard,
                            barRadius: Radius.circular(12),
                          ),
                          LinearPercentIndicator(
                            leading: SizedBox(
                              width: 100,
                              child: MyText(text: 'Travel'),
                            ),
                            trailing: MyText(
                              text: '50%',
                              paddingLeft: 20,
                              weight: wbold,
                            ),
                            padding: EdgeInsets.all(0),

                            lineHeight: 18,
                            percent: 0.9,
                            progressColor: kSecondaryColor2,
                            barRadius: Radius.circular(12),
                          ),
                          LinearPercentIndicator(
                            leading: SizedBox(
                              width: 100,
                              child: MyText(text: 'Emotions'),
                            ),
                            trailing: MyText(
                              text: '50%',
                              paddingLeft: 20,
                              weight: wbold,
                            ),
                            padding: EdgeInsets.all(0),

                            lineHeight: 18,
                            percent: 0.9,
                            progressColor: kSecondaryColor2,
                            barRadius: Radius.circular(12),
                          ),
                          LinearPercentIndicator(
                            leading: SizedBox(
                              width: 100,
                              child: MyText(text: 'Academics'),
                            ),
                            trailing: MyText(
                              text: '50%',
                              paddingLeft: 20,
                              weight: wbold,
                            ),
                            padding: EdgeInsets.all(0),

                            lineHeight: 18,
                            percent: 0.9,
                            progressColor: kSecondaryColor,
                            barRadius: Radius.circular(12),
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      text: 'Weekly Quiz',
                      size: 16,
                      weight: wbold,
                      paddingBottom: 20,
                      paddingTop: 20,
                    ),
                    Container(
                      decoration: rounded2(
                        getquaternary(context),
                        ThemeUtils.isDarkMode(context)
                            ? ktransparent
                            : kGrey2Color,
                      ),
                      child: SizedBox(
                        height: 250,
                        child: GradientStackedBarChart(hasLabels: true),
                      ),
                    ),
                    SizedBox(height: 100),
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
