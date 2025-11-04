import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/icon_text_row.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/trans_container.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(haveBackButton: F, title: 'Quiz', titlesize: 24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    MyText(
                      text: 'Today’s Quiz',
                      size: 16,
                      weight: wbold,
                      paddingBottom: 16,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.all(12),
                          decoration: rounded2(
                            getlightBluedarkblue(context),
                            ktransparent,
                          ),
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconTextRow(
                                    expanded: false,
                                    text: '122 Users Participated',
                                    iconpath: Assets.imagesPerson2,
                                    textsize: 12,
                                    textcolor: Colors.white,
                                  ),
                                ],
                              ),
                              MyText(
                                text: 'Daily Quiz',
                                size: 18,
                                color: Colors.white,
                                weight: wbold,
                              ),
                              MyText(
                                text: 'Word : Eloquent',
                                size: 16,
                                color: Colors.white,
                                weight: wmedium,
                              ),
                              IconTextRow(
                                flipX: true,
                                expanded: false,
                                text: 'Begin Quiz',
                                padends: 7,
                                padvertical: 10,
                                weight: wmedium,
                                spacing: 10,
                                iconpath: Assets.imagesRight,
                                textsize: 12,
                                iconsize: 12,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                textcolor: kSecondaryColor,
                                decoration: rounded2r(kMustard, kMustard, 8),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CommonImageView(
                            imagePath: Assets.imagesBall,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text: 'Previous Quizzes',
                      size: 16,
                      weight: wbold,
                      paddingTop: 20,
                      paddingBottom: 16,
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Quizcard(isweeklyquiz: index == 2 || index == 6),
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

class Quizcard extends StatelessWidget {
  const Quizcard({super.key, this.isweeklyquiz});
  final bool? isweeklyquiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12),
      decoration: rounded2r(
        isweeklyquiz ?? F ? kSecondaryColor2 : getlightBluedarkblue(context),
        ktransparent,
        20,
      ),

      child: Column(
        children: [
          Menutile(
            flipicon: T,
            padends: 0,
            leadtextsize: 18,
            space: 10,
            hasline: false,
            title: isweeklyquiz ?? F ? 'Weekly Quiz' : 'Daily Quiz',
            iconcolor: isweeklyquiz ?? F ? kSecondaryColor : null,
            textcolor: isweeklyquiz ?? F ? kSecondaryColor : Colors.white,
            trailtext: '12-Aug-2025',
            hasicon: false,

            trailIcon: Assets.imagesCalender,
          ),
          Row(
            children: [
              Expanded(
                child: MyText(
                  text: 'Word : Benevolent',
                  size: 16,
                  color: isweeklyquiz ?? F ? kSecondaryColor : null,
                  weight: wmedium,
                ),
              ),
              TransparentContainer(
                opacity: 1,
                color1: kGreenColor,

                text: 'Score 4/5',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
