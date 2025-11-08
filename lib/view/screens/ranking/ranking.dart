import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/trans_container.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              simpleAppBar(
                title: 'Ranking',
                titlesize: 24,
                haveBackButton: false,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonImageView(
                          imagePath: Assets.imagesPink,
                          height: 68,
                        ),
                        CommonImageView(
                          imagePath: Assets.imagesGold,
                          height: 86,
                        ),
                        CommonImageView(
                          imagePath: Assets.imagesBlue,
                          height: 68,
                        ),
                      ],
                    ),

                    MyText(
                      text: 'Gold Ranking',
                      size: 24,
                      textAlign: TextAlign.center,
                    ),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: rounded2r(
                          (index == 0)
                              ? kSecondaryColor2
                              : getquaternary(context),
                          ThemeUtils.isDarkMode(context)
                              ? ktransparent
                              : kGrey2Color,
                          20,
                        ),

                        child: Row(
                          spacing: 8,
                          children: [
                            if (index <= 2)
                              CommonImageView(
                                imagePath: index == 1
                                    ? Assets.imagesSecond
                                    : index == 2
                                    ? Assets.imagesThird
                                    : Assets.imagesFirst,
                                height: 34,
                              ),
                            if (index > 2)
                              SizedBox(
                                width: 34,
                                child: MyText(
                                  textAlign: TextAlign.center,
                                  text: '${index + 1}',
                                  size: 26,
                                  weight: wblack,
                                  fontFamily: GoogleFonts.barlow(
                                    fontWeight: wheavy,
                                  ).fontFamily,
                                ),
                              ),
                            CommonImageView(
                              url: dummyImage,
                              radius: 200,
                              height: 43,
                              width: 44,
                            ),
                            Expanded(
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: 'Zara',
                                    color: index == 0 ? kSecondaryBlue : null,
                                  ),
                                  TransparentContainer(
                                    opacity: 1,
                                    textSize: 12,
                                    color1: getbtnColor(context),
                                    text: '68 Days Streak',
                                    textColor: getPrimaryColor(context),
                                  ),
                                ],
                              ),
                            ),
                            MyText(text: '2962 XP', weight: wbold),
                          ],
                        ),
                      ),
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
