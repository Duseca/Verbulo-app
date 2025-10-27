import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/controller/onboarding_controller.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/screens/auth/login.dart';
import 'package:verbulo/view/widgets/moving_icon.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});
  final controller = Get.put(OnboardingController());
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final current = controller.currentIndex.value;
      final data = controller.onboardingData[current];
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Set to your desired color
          statusBarIconBrightness:
              Brightness.light, // Light icons for dark background
        ),
      );

      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyButton.filled(
          mhoriz: 20,
          mBottom: 60,
          //  fontColor: kQuaternaryColor,
          fontWeight: wregular,

          buttonText: current == controller.onboardingData.length - 1
              ? "Begin"
              : "Continue",
          onTap: () {
            controller.nextPage(
              controller.onboardingData.length,
              () => Get.to(() => Login()),
            );
            pageController.nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
        // backgroundColor: Color(data['bgColor']),
        body: StackBg(
          body: PageView.builder(
            controller: pageController,
            itemCount: controller.onboardingData.length,
            onPageChanged: (index) => controller.currentIndex.value = index,
            itemBuilder: (context, index) {
              final item = controller.onboardingData[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: MovingIcon(path: item["image"], height: 304),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: controller.onboardingData[current]['title'],
                        size: 26,

                        paddingLeft: 20,
                        paddingRight: 20,
                        weight: wbold,
                        //    textAlign: TextAlign.center,
                      ),
                      // SizedBox(height: 16),
                      MyText(
                        text: controller.onboardingData[current]["description"],
                        size: 16,
                        paddingLeft: 20,
                        paddingRight: 20,
                        // textAlign: TextAlign.center,
                        // color: Colors.black87,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  //   Expanded(child: Container()),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
