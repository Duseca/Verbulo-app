import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/screens/launch/onboarding.dart';
import 'package:verbulo/view/widgets/moving_icon.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds then navigate
    Timer(const Duration(seconds: 3), () {
      Get.to(() => Onboarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackBg(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: MovingIcon(path: Assets.imagesLogo, height: 115)),
          ],
        ),
      ),
    );
  }
}
