import 'package:flutter/material.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          body: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 20),
                  CommonImageView(imagePath: Assets.imagesBack, height: 40),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: landingController.pageController,
                  itemCount: landingController.pages.length,
                  onPageChanged: (index) =>
                      landingController.currentIndex.value = index,
                  itemBuilder: (context, index) {
                    final item = landingController.pages[index];
                    return Column(
                      children: [
                        Expanded(
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              SizedBox(height: 30),
                              TwoTextedColumn(
                                text1: item['title'],
                                text2: item['subtitle'],
                              ),
                              SizedBox(
                                height: index == 0
                                    ? 80
                                    : index == 1
                                    ? 80
                                    : 30,
                              ),
                              item['child'],
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
