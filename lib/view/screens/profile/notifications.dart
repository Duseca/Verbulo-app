import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/custom_switch.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(title: 'Notifications', titlesize: 24),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Menutile(
                            hasline: false,
                            leadtextsize: 16,
                            gap: 20,
                            ontap: () {},
                            trailIcon: null,
                            space: 8,
                            iconsize: 40,
                            trailing: CustomSwitch2(
                              // isActive: true,
                              onChanged: (v) {},
                              initialValue: true,
                            ),
                            //  path: item.iconPath,
                            title: 'Push notifications',
                            hasicon: false,
                            textcolor: getTertiary(context),
                            decoration: rounded2(
                              getquaternary(context),
                              ThemeUtils.isDarkMode(context)
                                  ? ktransparent
                                  : kGrey2Color,
                            ),
                          ),
                        );
                      },
                    ),
                    Row(children: [
                        
                      ],
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
