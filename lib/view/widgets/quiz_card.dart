import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/expanded_row_buttons.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/trans_container.dart';

class Quizcard extends StatelessWidget {
  const Quizcard({super.key, this.isweeklyquiz});
  final bool? isweeklyquiz;

  @override
  Widget build(BuildContext context) {
    RxBool viewoptions = false.obs; // initialize reactive variable

    return Obx(
      () => Bounce(
        onTap: () {
          viewoptions.value = !viewoptions.value; // toggle visibility
        },
        child: AnimatedContainer(
          duration: 300.ms,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: rounded2r(
            (isweeklyquiz ?? false) ? kSecondaryColor2 : getquaternary(context),
            ThemeUtils.isDarkMode(context) ? ktransparent : kGrey2Color,
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Menutile(
                flipicon: true,
                padends: 0,
                leadtextsize: 18,
                space: 0,
                hasline: false,
                leadingcolor: getTertiary(context),
                title: (isweeklyquiz ?? false) ? 'Weekly Quiz' : 'Daily Quiz',
                iconcolor: (isweeklyquiz ?? false) ? kSecondaryColor : null,
                textcolor: (isweeklyquiz ?? false)
                    ? kSecondaryColor
                    : getTertiary(context),
                trailtext: '12-Aug-2025',
                hasicon: false,
                trailIcon: Assets.imagesCalender,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Word : Benevolent',
                      size: 16,
                      color: (isweeklyquiz ?? false)
                          ? kSecondaryColor
                          : getTertiary(context),
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

              /// 👇 Only show buttons when viewoptions = true
              AnimatedSwitcher(
                duration: 300.ms,
                child: viewoptions.value
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ExpandedRowButtons(
                          btn1Text: 'View Quiz',
                          btn2Text: 'Retake Quiz',
                          btn1BackgroundColor: const Color(0xffF8F9FA),
                          btn2BackgroundColor: ThemeUtils.isDarkMode(context)
                              ? kMustard
                              : kSecondaryBlue,
                          btn2FontColor: ThemeUtils.isDarkMode(context)
                              ? kSecondaryBlue
                              : Colors.white,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
