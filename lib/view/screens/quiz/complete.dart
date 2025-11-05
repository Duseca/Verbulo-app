import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_rich_text.dart';
import 'package:verbulo/view/widgets/moving_icon.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class Complete extends StatelessWidget {
  const Complete({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              MovingIcon(path: Assets.imagesCelebrate, height: 226),
              MyText(
                text: 'Well done!',
                textAlign: TextAlign.center,
                paddingTop: 10,
                paddingBottom: 20,
                size: 18,
                weight: wextralight,
              ),
              Center(
                child: PriceText(
                  info: 'You completed today’s quiz for ',
                  title: ' "Eloquent"',
                  size1: 20,
                  size2: 20,
                  color: getTertiary(context),
                  color2: getTertiary(context),
                  align: TextAlign.center,
                  weght2: wextralight,
                ),
              ),
              SizedBox(height: 20),
              TwoTextedColumn(
                text1: 'Score',
                text2: '3/3 Perfect!',
                size1: 14,
                weight1: wregular,
                weight2: wblack,
                alignment: ColumnAlignment.center,
                size2: 18,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                spacing: 30,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    spacing: 8,
                    children: [
                      Animate(
                        effects: [ShakeEffect(duration: 3000.ms)],
                        child: CommonImageView(
                          imagePath: Assets.imagesFire2,
                          height: 50,
                        ),
                      ),
                      MyText(text: 'Streak +1', size: 16, weight: wblack),
                    ],
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      Animate(
                        effects: [ShakeEffect(duration: 3000.ms)],
                        child: CommonImageView(
                          imagePath: Assets.imagesStar5,
                          height: 50,
                        ),
                      ),
                      MyText(text: 'XP +20', size: 16, weight: wblack),
                    ],
                  ),
                ],
              ),

              MyButton.filled(
                buttonText: 'Done',
                onTap: () {
                  Get.to(() => BottomNavBar());
                },
                mTop: 50,
                mhoriz: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
