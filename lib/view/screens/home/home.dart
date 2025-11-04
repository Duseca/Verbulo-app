import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/view/screens/home/home_widgets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_dialog.dart';
import 'package:verbulo/view/widgets/icon_text_row.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          StackBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  spacing: 10,
                  children: [
                    CommonImageView(
                      url: dummyImage,
                      radius: 200,
                      height: 46,
                      width: 46,
                    ),
                    Expanded(child: MyText(text: 'Hi Zara', size: 24)),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: rounded2r(
                        ktransparent,
                        getTertiary(context),
                        100,
                      ),
                      child: IconTextRow(
                        expanded: false,
                        textcolor: getTertiary(context),
                        iconpath: Assets.imagesFire,
                        text: '7',
                        textsize: 16,
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          CalendarDialog(
                            // rangeSelection: false,
                            // initialFocusedDay: null,
                            // onRangeSelected: (date, end, focusedDay) async {
                            //   // if (date != null)
                            //   //   controller.dateC.text = DateFormat(
                            //   //     "dd-MM-yyyy",
                            //   //   ).format(date);
                            //   // else
                            //   //   controller.dateC.clear();
                            //   // await Future.delayed(Duration(milliseconds: 100));
                            //   // Get.back();
                            // },
                          ),
                        );
                      },
                      child: Image.asset(
                        Assets.imagesCalender,
                        height: 24,
                        color: getTertiary(context),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 20),
                    Pronounce(),
                    SizedBox(height: 10),
                    Breakdown(),
                    SizedBox(height: 10),
                    Meaning(),
                    SizedBox(height: 10),
                    UsageExamples(),
                    Container(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
