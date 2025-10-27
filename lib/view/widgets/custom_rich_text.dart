import 'package:verbulo/const/app_sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';

// ignore: must_be_immutable
class CustomRichText extends StatelessWidget {
  final String info;
  final String title;
  TextStyle? firstTextStyle;
  TextStyle? secondTextStyle;
  final void Function()? ontaptext;
  final TextAlign? textAlign;
  CustomRichText({
    super.key,
    required this.info,
    required this.title,
    this.firstTextStyle,
    this.secondTextStyle,
    this.ontaptext,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        text: '$info ',
        style:
            firstTextStyle ??
            theme.textTheme.bodyLarge?.copyWith(
              fontSize: 12,
              fontFamily: MANROPE,
              fontWeight: FontWeight.w400,
              color: getTertiary(context),
            ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = ontaptext ?? () {},
            text: ' $title',
            style:
                secondTextStyle ??
                theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: getTertiary(context),
                  fontFamily: MANROPE,
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}

class PriceText extends StatelessWidget {
  final String info;
  final String title;
  final TextStyle firstTextStyle;
  final TextStyle secondTextStyle;

  // Constructor with default values for size1, size2, and color
  PriceText({
    required this.info,
    required this.title,
    double? size1,
    double? size2,
    Color? color,
    color2,
    FontWeight? fontWeight,
    weght2,
  }) : firstTextStyle = TextStyle(
         fontFamily: MANROPE,
         fontWeight: weght2 ?? wregular,
         fontSize: size1 ?? 10, // Default to 10 if size1 is not provided
         color:
             color ??
             kTertiaryColor, // Default to kSecondaryBlue if color is not provided
       ),
       secondTextStyle = TextStyle(
         fontFamily: MANROPE,
         fontSize: size2 ?? 12, // Default to 12 if size2 is not provided
         fontWeight:
             fontWeight ??
             FontWeight.w700, // Default to w700 if no fontWeight is provided
         color:
             color2 ??
             kSecondaryColor, // Default to kSecondaryBlue if color is not provided
       );

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: info, style: firstTextStyle),
          TextSpan(text: title, style: secondTextStyle),
        ],
      ),
    );
  }
}
