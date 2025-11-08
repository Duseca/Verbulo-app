import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class DataStats extends StatelessWidget {
  const DataStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(title: 'Data & Stats', titlesize: 24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    for (int i = 0; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Menutile(
                          hasline: false,
                          leadtextsize: 16,
                          gap: 20,
                          ontap: () {},
                          trailIcon: null,
                          path: i == 1
                              ? Assets.imagesChathistory
                              : Assets.imagesTime,
                          space: 8,
                          leadingcolor: getbtnColor(context),
                          iconsize: 40,
                          trailing: SizedBox(),
                          //  path: item.iconPath,
                          title: 'Reset Progress',

                          textcolor: getTertiary(context),
                          decoration: rounded2(
                            getquaternary(context),
                            ThemeUtils.isDarkMode(context)
                                ? ktransparent
                                : kGrey2Color,
                          ),
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
  }
}
