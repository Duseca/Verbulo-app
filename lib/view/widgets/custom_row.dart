import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_animated_row.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.left,
    this.padends,
    required this.right,
    this.colorLeft,
    this.colorRight,
    this.sizeleft,
    this.sizeright,
    this.hasRight = true,
    this.rightIcon,
    this.weightleft,
    this.padvertical,
    this.weightright,
    this.onrighttap,
    this.decoration,
  });
  final String left, right;
  final Color? colorLeft, colorRight;
  final double? sizeleft, sizeright, padends, padvertical;
  final FontWeight? weightleft, weightright;
  final bool? hasRight;
  final Widget? rightIcon;
  final VoidCallback? onrighttap;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: padvertical ?? 20,
        horizontal: padends ?? 20,
      ),
      child: AnimatedRow(
        children: [
          Expanded(
            child: MyText(
              text: left,
              size: sizeleft ?? 16,
              color: colorLeft ?? kTertiaryColor,
              weight: weightleft ?? FontWeight.w700,
            ),
          ),
          hasRight == false
              ? Bounce(
                  onTap: onrighttap ?? () {},
                  child:
                      rightIcon ??
                      CommonImageView(
                        //  imagePath: Assets.imagesOnboard1,
                        height: 20,
                      ),
                )
              : MyText(
                  text: right,
                  onTap: onrighttap ?? () {},
                  color: colorRight ?? kSecondaryBlue,
                  size: sizeright ?? 12,
                  decoration: decoration ?? TextDecoration.underline,
                  weight: weightright ?? FontWeight.w400,
                ),
        ],
      ),
    );
  }
}
