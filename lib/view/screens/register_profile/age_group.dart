import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class AgeGroup extends StatelessWidget {
  const AgeGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final RxInt selectedIndex = (-1).obs;
    final List<Map<String, String>> options = [
      {
        'title': 'Children (7-12)',
        'subtitle':
            'Build strong language foundations with fun visuals and easy examples.',
      },
      {
        'title': 'Teens (13-18)',
        'subtitle':
            'Learn smarter vocabulary for school, essays, and daily use.',
      },
      {
        'title': 'Adults (19-60)',
        'subtitle': 'Strengthen communication for work, learning, and growth.',
      },
      {
        'title': 'Seniors (60+)',
        'subtitle': 'Keep your mind active with meaningful and clear words.',
      },
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.only(bottom: 10),
                duration: 300.ms,
                decoration: rounded2(
                  isSelected ? kMustard : kQuaternaryColor,
                  isSelected ? kMustard : getbtnColor(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: item['title'] ?? '',
                      weight: wsemibold,
                      color: isSelected ? kQuaternaryColor : kSecondaryColor,
                    ),
                    MyText(
                      text: item['subtitle'] ?? '',
                      color: isSelected ? kQuaternaryColor : kSecondaryColor,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        MyButton.filled(
          buttonText: 'Next',
          onTap: () {
            landingController.pageController.nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
