import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/my_bullet_point.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    var currentIndex = 0.obs;

    // 🔹 Define the plans and their features
    final List<Map<String, dynamic>> plans = [
      {
        'title': 'Freemium Plan',
        'features': [
          '1 word per day',
          'Basic definition',
          'Standard notifications',
          'Last 7 days of word history',
          'Basic statistics',
        ],
      },
      {
        'title': 'Premium Plan',
        'features': [
          'Advanced statistics and insights',
          'Spaced repetition review system',
          'Ad-free experience',
          'PDF flashcard downloads',
          'Priority support',
        ],
      },
      {
        'title': 'Pro Plan',
        'features': [
          'Full word history access',
          'Multiple words per day (up to 3)',
          'Advanced statistics and insights',
          'Spaced repetition review system',
          'Premium word packs (Medical, Legal, Technical, etc.)',
          'Custom notification scheduling',
          'Offline mode',
          'Streak freezes (3 per month)',
          'Ad-free experience',
          'PDF flashcard downloads',
          'Priority support',
        ],
      },
    ];

    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(title: 'Subscription', titlesize: 24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: plans.length,
                  onPageChanged: (index) => currentIndex.value = index,
                  itemBuilder: (context, index) {
                    final plan = plans[index];
                    return Column(
                      children: [
                        Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: index == 0
                                      ? ThemeUtils.isDarkMode(context)
                                            ? const Color(0xff405161)
                                            : kQuaternaryColor
                                      : kSecondaryColor2,
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(
                                    width: 3,
                                    color: index == 0
                                        ? ThemeUtils.isDarkMode(context)
                                              ? kQuaternaryColor
                                              : kSecondaryColor
                                        : kMustard,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      paddingBottom: 10,
                                      text: plan['title'],
                                      size: 16,
                                      weight: wblack,
                                    ),
                                    ...List.generate(
                                      plan['features'].length,
                                      (i) => MyBullet(
                                        point: plan['features'][i],
                                        size: 14,
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
                  },
                ),
              ),

              // 🔹 Page Indicator (optional)
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(plans.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 12,
                      ),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        border: Border.all(color: getbtnColor(context)),
                        shape: BoxShape.circle,
                        color: currentIndex.value == index
                            ? getbtnColor(context)
                            : ktransparent,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30),
              Obx(
                () => currentIndex.value == 0
                    ? MyButton.filled(
                        buttonText: 'Free',
                        borderwidth: 3,
                        mhoriz: 20,
                        mBottom: 60,

                        onTap: () {},
                        backgroundColor: ThemeUtils.isDarkMode(context)
                            ? kQuaternaryColor
                            : kSecondaryBlue,
                        outlineColor: kSecondaryColor,
                      )
                    : Column(
                        children: [
                          MyButton.filled(
                            buttonText: currentIndex.value == 2
                                ? ' Annual \$49.99  (save 17%)'
                                : ' Annual \$29.99  (save 17%)',
                            borderwidth: 3,
                            mBottom: 10,
                            mhoriz: 20,

                            onTap: () {},
                            backgroundColor: kMustard,
                            outlineColor: kSecondaryColor2,
                          ),
                          MyButton.filled(
                            mBottom: 30,
                            mhoriz: 20,
                            buttonText: currentIndex.value == 1
                                ? 'Monthly \$2.99'
                                : "Monthly \$4.99",
                            onTap: () {},
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
