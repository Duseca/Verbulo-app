import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xffffffff),
  fontFamily: MANROPE,
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: kQuaternaryColor),
  splashColor: kQuaternaryColor.withOpacity(0.10),
  highlightColor: kQuaternaryColor.withOpacity(0.10),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kSecondaryColor,
    primary: kPrimaryColor,
    tertiary: Colors.black,

    onSecondary: Color(0xff4D4D4D),
    onTertiary: kGrey1Color,
    onPrimaryFixed: Color(0xffDEDEDE),
    onPrimary: Colors.black,
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: kQuaternaryColor),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: kSecondaryColor,
  brightness: Brightness.dark,
  fontFamily: MANROPE,
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Color(0xff0b0b0b)),
  useMaterial3: false,
  splashColor: Color(0xff000000),
  highlightColor: Color(0xff0b0b0b).withOpacity(0.10),
  colorScheme: ColorScheme.dark().copyWith(
    primary: Color(0xff0b0b0b),
    tertiary: Colors.white,
    secondary: Color(0xffF8F9FA),
    onTertiary: Colors.white,
    onPrimary: Color(0xff262626), // Used for text/icons on top of primary color
    onSecondary: Color(0xffAAAAAA),
    onPrimaryFixed: Color(0xff313131),
    // You might want to add additional dark theme configurations, such as:

    // Used for text/icons on top of secondary color
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: kBlack2Color),
);
