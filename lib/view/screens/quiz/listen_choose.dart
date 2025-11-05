import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class ListenChoose extends StatelessWidget {
  const ListenChoose({super.key});

  @override
  Widget build(BuildContext context) {
    final RxInt selectedIndex = (-1).obs;
    return Column(
      children: [
        CommonImageView(
          imagePath: ThemeUtils.isDarkMode(context)
              ? Assets.imagesHeadphonedark
              : Assets.imagesHeadphonelight,
          height: 86,
        ),
        MyText(
          text: 'Listen & Choose',
          paddingBottom: 20,
          size: 16,
          textAlign: TextAlign.center,
          weight: wmedium,
        ),
        MyButton.icon(
          buttonText: 'Play Sound',
          mBottom: 20,
          onTap: () {},
          imagePath: Assets.imagesSound,
          isRightIcon: true,
        ),
        MyText(
          text:
              'Which of the following best matches the pronunciation you heard?',
          size: 16,
          textAlign: TextAlign.center,
        ),
        ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Obx(() {
            bool isSelected = selectedIndex.value == index;

            return MyButton.filled(
              height: 43,
              buttonText: 'El-o-kwent',
              mBottom: 10,
              onTap: () {
                selectedIndex.value = index;
                // onSelected?.call(options[index]);
              },
              fontColor: isSelected ? kQuaternaryColor : kSecondaryColor,
              backgroundColor: isSelected ? kMustard : kQuaternaryColor,
              outlineColor: isSelected ? kMustard : getbtnColor(context),
            );
          }),
        ),
        MyButton.filled(
          buttonText: 'Next',
          onTap: () {
            quizController.pageController.nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
          mTop: 10,
        ),
      ],
    );
  }
}
