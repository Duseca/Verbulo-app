import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class NotificationPref extends StatelessWidget {
  const NotificationPref({super.key});

  @override
  Widget build(BuildContext context) {
    final RxInt selectedIndex = (-1).obs;
    final List options = [
      'Morning word of the day',
      'Noon practice quiz',
      'Evening Reflection',
    ];
    return Column(
      children: [
        ListView.builder(
          itemCount: options.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Obx(() {
            bool isSelected = selectedIndex.value == index;
            final item = options[index];
            return Bounce(
              onTap: () {
                selectedIndex.value = index;
              },
              child: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                margin: EdgeInsets.only(bottom: 10),
                duration: 300.ms,
                decoration: rounded2(kQuaternaryColor, getbtnColor(context)),
                child: Row(
                  spacing: 10,
                  children: [
                    AnimatedContainer(
                      duration: 300.ms,
                      height: 20,
                      width: 20,
                      decoration: circle(
                        isSelected
                            ? kSecondaryColor
                            : ThemeUtils.isDarkMode(context)
                            ? kMustard
                            : kQuaternaryColor,
                        kSecondaryColor,
                      ),
                    ),

                    Expanded(
                      child: MyText(text: item, color: kSecondaryColor),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        MyText(text: 'Toggle any off if you’d like', paddingBottom: 30),
        MyButton.filled(
          buttonText: 'Finish',
          onTap: () {
            Get.to(() => BottomNavBar());
          },
        ),
      ],
    );
  }
}
