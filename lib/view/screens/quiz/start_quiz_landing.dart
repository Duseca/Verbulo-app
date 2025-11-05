import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class StartQuizLanding extends StatelessWidget {
  const StartQuizLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          body: Obx(() {
            final current = quizController.currentIndex.value + 1;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                simpleAppBar(title: 'Quiz', titlesize: 24),
                TwoTextedColumn(
                  padEnds: 20,
                  size1: 16,
                  size2: 26,
                  space: 0,
                  weight2: wbold,
                  weight1: wregular,
                  text1: 'Question',
                  text2: '$current/${quizController.pages.length}',
                ),
                Expanded(
                  child: PageView.builder(
                    padEnds: F,
                    physics: BouncingScrollPhysics(),
                    controller: quizController.pageController,
                    itemCount: quizController.pages.length,
                    onPageChanged: (index) =>
                        quizController.currentIndex.value = index,
                    itemBuilder: (context, index) {
                      final item = quizController.pages[index];

                      return Column(
                        children: [
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              children: [
                                //     const SizedBox(height: 30),
                                item,
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
