import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.isActive,
    required this.onTap,
    this.unSelectedColor,
    this.selectedColor,
    this.size,
    this.circleIcon,
    this.iconColor,
    this.radius,
    this.borderColor,
    this.bordercolor2,
    this.circleIconsize,
    this.iscircle,
  }) : super(key: key);
  final bool isActive;
  final VoidCallback onTap;
  Color? unSelectedColor, selectedColor, iconColor, borderColor, bordercolor2;
  bool? iscircle;
  final double? size, radius, circleIconsize;
  final IconData? circleIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 230),
        curve: Curves.easeInOut,
        height: size ?? 14,
        width: size ?? 14,
        decoration: BoxDecoration(
          color: isActive
              ? selectedColor ?? kSecondaryBlue
              : unSelectedColor ?? kQuaternaryColor,
          border: Border.all(
            width: 1.0,
            color: isActive
                ? bordercolor2 ?? ktransparent
                : borderColor ?? kGreyColor1,
          ),
          borderRadius: BorderRadius.circular(
            iscircle == true ? 50 : radius ?? 3,
          ),
        ),
        child: !isActive
            ? Icon(circleIcon, size: 10, color: ktransparent)
            : Icon(
                iscircle == true ? circleIcon ?? Icons.circle : Icons.check,
                size: circleIconsize ?? 12,
                color: isActive == true
                    ? iconColor ?? kQuaternaryColor
                    : kQuaternaryColor,
              ),
      ),
    );
  }
}
