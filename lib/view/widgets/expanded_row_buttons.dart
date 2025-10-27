import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/view/widgets/custom_animated_row.dart';
import 'package:verbulo/view/widgets/my_button.dart';

class ExpandedRowButtons extends StatelessWidget {
  final String? btn1Text; // Text for the first button
  final String? btn2Text; // Text for the second button
  final Color? btn1BackgroundColor;
  final Color? btn2BackgroundColor;
  final Color? btn1OutlineColor;
  final Color? btn2OutlineColor;
  final Color? btn1FontColor;
  final Color? btn2FontColor;
  final VoidCallback? btn1OnTap;
  final bool? isexpanded1, isexpanded2;
  final VoidCallback? btn2OnTap;
  final double? height1, height2;

  const ExpandedRowButtons({
    super.key,
    this.btn1Text = 'Remove',
    this.btn2Text = 'Update',
    this.btn1BackgroundColor = ktransparent,
    this.btn2BackgroundColor,
    this.btn1OutlineColor = kSecondaryBlue,
    this.btn2OutlineColor,
    this.btn1FontColor = kSecondaryBlue,
    this.btn2FontColor,
    this.btn1OnTap,
    this.btn2OnTap,
    this.height1 = 56,
    this.height2 = 56,
    this.isexpanded1 = false,
    this.isexpanded2 = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedRow(
      spacing: 15,
      children: [
        Expanded(
          child: MyButton.icon(
            padends: 10,
            onTap: btn1OnTap ?? () {}, // Default empty action if not provided
            buttonText: btn1Text ?? 'Remove',
            backgroundColor: btn1BackgroundColor ?? ktransparent,
            outlineColor: btn1OutlineColor ?? kSecondaryBlue,
            isRightIcon: false,
            fontSize: 13,
            //   isexpanded: isexpanded1,
            height: height1 ?? 45,
            fontColor: btn1FontColor ?? kSecondaryBlue,
          ),
        ),
        Expanded(
          child: MyButton.icon(
            padends: 0,

            onTap: btn2OnTap ?? () {}, // Default empty action if not provided
            buttonText: btn2Text ?? 'Update',
            backgroundColor: btn2BackgroundColor ?? kSecondaryBlue,
            outlineColor: btn2OutlineColor ?? kSecondaryBlue,
            isRightIcon: false,
            height: height2 ?? 45,
            //     isexpanded: isexpanded2,
            fontSize: 13,
            fontColor: btn2FontColor ?? kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
