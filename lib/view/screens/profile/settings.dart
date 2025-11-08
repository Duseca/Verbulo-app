import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/screens/profile/account.dart';
import 'package:verbulo/view/screens/profile/change_pass.dart';
import 'package:verbulo/view/screens/profile/data_stats.dart';
import 'package:verbulo/view/screens/profile/notifications.dart';
import 'package:verbulo/view/screens/profile/subscription.dart';
import 'package:verbulo/view/screens/profile/support.dart';
import 'package:verbulo/view/screens/profile/switch_mode.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_dialog.dart';
import 'package:verbulo/view/widgets/menu_tile.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem(
        title: 'Profile',
        iconPath: Assets.imagesPerson3,
        route: '/profile',
        onTap: () {
          Get.to(() => Account());
        },
      ),
      MenuItem(
        title: 'Notifications',
        iconPath: Assets.imagesNotification,
        route: '/notifications',
        onTap: () {
          Get.to(() => Notifications());
        },
      ),
      MenuItem(
        title: 'Change Password',
        iconPath: Assets.imagesChangepass,
        route: '/change-password',
        onTap: () {
          Get.to(() => ChangePass());
        },
      ),
      MenuItem(
        title: 'Subscription & Billing',
        iconPath: Assets.imagesSubscription,
        route: '/billing',
        onTap: () {
          Get.to(() => Subscription());
        },
      ),
      MenuItem(
        title: 'Data & Stats',
        iconPath: Assets.imagesData,
        route: '/stats',
        onTap: () {
          Get.to(() => DataStats());
        },
      ),
      MenuItem(
        title: 'Switch to Light Mode',
        iconPath: Assets.imagesSwitch,
        onTap: () {
          Get.to(() => Switchmode());
          // toggle theme
          // ThemeUtils.toggleTheme(context);
        },
      ),
      MenuItem(
        title: 'Support',
        iconPath: Assets.imagesSupport,
        route: '/support',
        onTap: () {
          Get.to(() => Support());
        },
      ),
      MenuItem(
        title: 'Logout',
        iconPath: Assets.imagesLogout,
        onTap: () {
          Get.dialog(Logout());
        },
      ),
    ];

    return Stack(
      children: [
        StackBg(),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 60),
                    Center(
                      child: CommonImageView(
                        url: dummyImage3,
                        height: 111,
                        width: 111,
                        radius: 300,
                      ),
                    ),
                    Center(
                      child: MyText(
                        text: 'Zara',
                        size: 18,
                        weight: wsemibold,
                        paddingBottom: 12,
                        paddingTop: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton.icon(
                          height: 34,

                          buttonText: '2922 XP',
                          onTap: () {},
                          fontColor: kSecondaryColor,
                          backgroundColor: kMustard,

                          imagePath: Assets.imagesStar6,
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
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

class MenuItem {
  final String title;
  final String iconPath;
  final String? route;
  final VoidCallback? onTap;

  MenuItem({
    required this.title,
    required this.iconPath,
    this.route,
    this.onTap,
  });
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      children: [
        TwoTextedColumn(
          text1: 'Logout',
          text2:
              'Logging out will remove your account data from this phone. Your data on the web platform will be kept safe and available',
          size1: 24,
          size2: 16,
        ),
        MyButton.filled(
          buttonText: 'Cancel',
          fontColor: Colors.white,
          padbottom: 10,
          mTop: 20,
          mBottom: 8,
          onTap: () {},
          backgroundColor: Color(0xffD72638),
        ),
        MyButton.filled(
          buttonText: 'ok',
          fontColor: Colors.white,
          onTap: () {},
          backgroundColor: Color(0xff4CAF70),
        ),
      ],
    );
  }
}
