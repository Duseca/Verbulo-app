import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/theme/theme_provider.dart';

BoxDecoration circle(Color color, Color? borderColor, {double width = 1}) {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: color,
    border: Border.all(color: borderColor ?? Colors.transparent, width: width),
  );
}

BoxDecoration rounded(Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: color,
    boxShadow: [
      BoxShadow(
        color: getTertiary(Get.context!).withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(2, 2), // Shadow position
      ),
    ],
  );
}

BoxDecoration roundedsr({Color? color, double? radius, Color? color2}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius ?? 10),
    color: color ?? kPrimaryColor,
    border: Border.all(color: color2 ?? Color(0xffeeeeee)),
    boxShadow: [
      BoxShadow(
        color: kBlack2Color.withOpacity(0.08),
        blurRadius: 34,
        offset: Offset(0, 4), // Shadow position
      ),
    ],
  );
}

BoxDecoration bluegreydecor() {
  return rounded2(
    ThemeUtils.isDarkMode(Get.context!) ? kSecondaryColor : Color(0xffF2F2F7),
    ThemeUtils.isDarkMode(Get.context!) ? kSecondaryColor : Color(0xffF2F2F7),
  );
}

class KTertiaryColor {}

BoxDecoration rounded2(Color color, Color? borderColor, {double width = 1}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: color,
    border: Border.all(color: borderColor ?? Colors.transparent, width: width),
  );
}

BoxDecoration graddecor() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    gradient: bggradOpacity(),
  );
}

BoxDecoration rounded2r(Color color, Color? borderColor, double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
    border: Border.all(color: borderColor ?? Colors.transparent),
  );
}

BoxDecoration roundedr(Color color, double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  );
}
