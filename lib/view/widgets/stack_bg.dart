import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:verbulo/const/app_colors.dart';

class StackBg extends StatelessWidget {
  final Widget? body;
  const StackBg({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: body,
          width: Get.width,
          height: Get.height,
          color: getPrimaryColor(context),
        ),
        Positioned(
          left: -53,
          top: -43,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor2.withOpacity(0.24),
                  blurRadius: 40,
                ),
              ],
            ),
            height: 300,
            width: 300,
          ),
        ),
        Positioned(
          right: -53,
          bottom: -43,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(0.2),
                  blurRadius: 40,
                ),
              ],
            ),
            height: 300,
            width: 300,
          ),
        ),
      ],
    );
  }
}
