import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/screens/profile/settings.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        title: 'Help Center',
        iconPath: Assets.imagesHelp,
        route: '/profile',
        onTap: () {
          //    Get.to(() => Account());
        },
      ),
      MenuItem(
        title: 'Contact Support',
        iconPath: Assets.imagesHead,
        route: '/notifications',
        onTap: () {
          // Get.to(() => Notifications());
        },
      ),
      MenuItem(
        title: 'Terms &  Privacy',
        iconPath: Assets.imagesTerms,
        route: '/change-password',
        onTap: () {
          //   Get.to(() => ChangePass());
        },
      ),
    ];
    return Stack(
      children: [
        StackBg(),
        Scaffold(
          appBar: simpleAppBar(title: 'Support', titlesize: 24),
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
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Menutile(
                            hasline: false,
                            leadtextsize: 16,
                            gap: 20,
                            ontap: item.onTap,
                            trailIcon: null,
                            space: 8,
                            iconsize: 40,
                            trailing: const SizedBox(),
                            path: item.iconPath,
                            title: item.title,
                            textcolor: getTertiary(context),
                            leadingcolor: getbtnColor(context),
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
