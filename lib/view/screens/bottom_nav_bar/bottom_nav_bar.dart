import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/screens/home/home.dart';
import 'package:verbulo/view/screens/library/library.dart';
import 'package:verbulo/view/screens/quiz/quiz.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Map<String, dynamic>> items;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    updateItems();
  }

  void updateItems() {
    items = [
      {'image': Assets.imagesHome, 'label': 'Home'},
      {'image': Assets.imagesBook, 'label': 'Library'},
      {'image': Assets.imagesQuiz, 'label': 'Quiz'},
      {'image': Assets.imagesReward, 'label': 'Ranking'},
      {'image': Assets.imagesPerson, 'label': 'Profile'},
    ];
  }

  final List<Widget> screens = [
    Home(),
    Library(),
    Quiz(),
    Scaffold(),
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: kGreyColor1),
          color: ThemeUtils.isDarkMode(context)
              ? Color(0xff405161)
              : Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: GNav(
          rippleColor: getTertiary(context).withOpacity(0.2),
          hoverColor: getTertiary(context).withOpacity(0.2),
          gap: 0,
          tabMargin: EdgeInsets.all(0),

          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 010, vertical: 8),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: kSecondaryColor,
          color: Colors.black,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: List.generate(items.length, (index) {
            return GButton(
              gap: 5,

              margin: EdgeInsets.all(0),
              icon: Icons.home,
              text: items[index]['label'],
              textColor: currentIndex == index
                  ? kQuaternaryColor
                  : ThemeUtils.isDarkMode(context)
                  ? kQuaternaryColor
                  : kSecondaryColor,
              leading: Image.asset(
                items[index]['image'],
                color: currentIndex == index
                    ? kQuaternaryColor
                    : ThemeUtils.isDarkMode(context)
                    ? kQuaternaryColor
                    : kSecondaryColor,
                width: 24,
              ),
            );
          }),
        ),
      ),
    );
  }
}
