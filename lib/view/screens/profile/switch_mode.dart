import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:verbulo/view/widgets/custom_switch.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Switchmode extends StatelessWidget {
  const Switchmode({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(
            title: 'Switch Mode',
            titlesize: 24,
            titleColor: ThemeUtils.isDarkMode(context)
                ? kQuaternaryColor
                : kTertiaryColor,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) {
                        return Menutile(
                          hasline: false,
                          leadtextsize: 16,
                          gap: 20,
                          ontap: () {},
                          trailIcon: null,
                          space: 8,
                          iconsize: 40,
                          trailing: CustomSwitch2(
                            // isActive: true,
                            onChanged: (v) {
                              themeProvider.toggleTheme();
                            },
                            initialValue: true,
                          ),
                          //  path: item.iconPath,
                          title: ThemeUtils.isDarkMode(context)
                              ? 'Dark Mode'
                              : 'Light Mode',
                          hasicon: false,
                          textcolor: getTertiary(context),
                          decoration: rounded2(
                            getquaternary(context),
                            ThemeUtils.isDarkMode(context)
                                ? ktransparent
                                : kGrey2Color,
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
              MyButton.filled(
                mhoriz: 20,
                buttonText: 'Save',
                onTap: () {
                  Get.offAll(() => BottomNavBar());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
