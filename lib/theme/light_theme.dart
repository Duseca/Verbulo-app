import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ktransparent,
  fontFamily: MANROPE,
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: kQuaternaryColor),
  splashColor: Color(0xffE5E5EA),
  highlightColor: kQuaternaryColor.withOpacity(0.10),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kSecondaryColor,
    primary: kPrimaryColor,
    tertiary: Colors.black,

    onSecondary: Color(0xff4D4D4D),
    onTertiary: kSecondaryColor,
    onPrimaryFixed: Color(0xffDEDEDE),
    onPrimary: Colors.white,
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: kQuaternaryColor),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: ktransparent,
  brightness: Brightness.dark,
  fontFamily: MANROPE,
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Color(0xff0b0b0b)),
  useMaterial3: false,
  splashColor: Colors.white.withOpacity(0.1),
  highlightColor: Color(0xff0b0b0b).withOpacity(0.10),
  colorScheme: ColorScheme.dark().copyWith(
    primary: kSecondaryColor,
    tertiary: Colors.white,
    secondary: Color(0xffF8F9FA),
    onTertiary: Color(0xff405161),
    onPrimary: Color(0xff405161), // Used for text/icons on top of primary color
    onSecondary: Color(0xffAAAAAA),
    onPrimaryFixed: Color(0xff313131),
    // You might want to add additional dark theme configurations, such as:

    // Used for text/icons on top of secondary color
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: kBlack2Color),
);
