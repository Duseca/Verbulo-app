import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';

import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/main.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_animated_row.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class IconTitleSubtitle extends StatelessWidget {
  const IconTitleSubtitle({
    super.key,
    this.title,
    this.path,
    this.iconRadis,
    this.subtitle,
    this.iconheight,
    this.size1,
    this.gap,
    this.trailing,
    this.size2,
    this.isurl = false,
    this.color1,
    this.hastsubtitle = false,
    this.color2,
    this.subtitle2,
    this.padEnds,
    this.padVertical,
    this.hasicon = true,
    this.hasthirdtext = false,
    this.decoration,
    this.colspace,
    this.crossAxisAlignment,
    this.hastrailing = true,
    this.ontralingTap,
    this.ontap,
    this.rowspace,
    this.iconcolor,
    this.weight1,
    this.weight2,
    this.isradiotile,
    this.radiovalue,
    this.size3,
    this.topPadimg,
    this.customradio,
  });
  final String? title, path, subtitle, subtitle2;
  final double? iconheight,
      size1,
      size2,
      size3,
      gap,
      padEnds,
      iconRadis,
      padVertical,
      colspace,
      rowspace,
      topPadimg;
  final Widget? trailing;
  final bool? isurl,
      hasthirdtext,
      hasicon,
      hastsubtitle,
      hastrailing,
      isradiotile;
  final Color? color1, color2, iconcolor;
  final Decoration? decoration;
  final bool? radiovalue;
  final CrossAxisAlignment? crossAxisAlignment;
  final VoidCallback? ontralingTap, ontap;
  final FontWeight? weight1, weight2;
  final Widget? customradio;
  @override
  Widget build(BuildContext context) {
    return ontap != null
        ? Bounce(
            onTap: ontap,
            child: Container(
              decoration: decoration ?? BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padEnds ?? 0,
                  vertical: padVertical ?? 0,
                ),
                child: AnimatedRow(
                  spacing: rowspace ?? 8,
                  crossAxisAlignment:
                      crossAxisAlignment ?? CrossAxisAlignment.center,
                  children: [
                    if (isradiotile == true)
                      customradio ??
                          AnimatedContainer(
                            height: 20,
                            width: 20,
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: radiovalue == true
                                    ? kSecondary2
                                    : kGreyColorLight,
                              ),
                            ),
                            child: AnimatedContainer(
                              margin: EdgeInsets.all(0),
                              height: 20,
                              width: 20,
                              duration: Duration(milliseconds: 300),
                              decoration: circle(
                                radiovalue == true
                                    ? Color(0xffD9F4F9)
                                    : kGreyColorLight,
                                radiovalue == true
                                    ? kSecondary2
                                    : kGreyColorLight,
                              ),
                            ),
                          ),
                    if (hasicon == true)
                      isurl == true
                          ? Container(
                              decoration: circle(
                                ktransparent,
                                kSecondary2,
                                width: 2,
                              ),
                              child: CommonImageView(
                                height: iconheight ?? 32,
                                width: iconheight ?? 32,
                                radius: iconRadis ?? 200,
                                url: path ?? dummyImage,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: topPadimg ?? 0.0),
                              child: Image.asset(
                                height: iconheight ?? 32,
                                path ?? Assets.imagesLogo,
                                color: iconcolor ?? null,
                              ),
                            ),
                    Expanded(
                      child: Column(
                        spacing: colspace ?? 0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: title ?? 'Credit or debit card',
                            size: size1 ?? 14,
                            weight: weight1 ?? FontWeight.w600,
                            paddingBottom: gap ?? 0,
                            color: color1 ?? kSecondaryBlue,
                          ),
                          if (hastsubtitle == true)
                            MyText(
                              color: color2 ?? null,
                              size: size2 ?? 12,
                              text:
                                  subtitle ?? 'Visa, Mastercard, AMEX and JCB',
                              weight: weight2 ?? FontWeight.w400,
                            ),
                          if (hasthirdtext == true)
                            MyText(
                              color: color2 ?? null,
                              size: size3 ?? 14,
                              text:
                                  subtitle2 ?? 'Visa, Mastercard, AMEX and JCB',
                            ),
                        ],
                      ),
                    ),
                    if (hastrailing == true) trailing ?? SizedBox(),
                  ],
                ),
              ),
            ),
          )
        : Container(
            decoration: decoration ?? BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padEnds ?? 0,
                vertical: padVertical ?? 0,
              ),
              child: AnimatedRow(
                spacing: rowspace ?? 8,
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.center,
                children: [
                  if (isradiotile == true)
                    customradio ??
                        AnimatedContainer(
                          height: 20,
                          width: 20,
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1.5,
                              color: radiovalue == true
                                  ? kSecondaryBlue
                                  : kGreyColorLight,
                            ),
                          ),
                          child: AnimatedContainer(
                            margin: EdgeInsets.all(2),
                            height: 20,
                            width: 20,
                            duration: Duration(milliseconds: 300),
                            decoration: circle(
                              radiovalue == true
                                  ? kSecondaryBlue
                                  : ktransparent,
                              radiovalue == true
                                  ? kSecondaryBlue
                                  : ktransparent,
                            ),
                          ),
                        ),
                  if (hasicon == true)
                    isurl == true
                        ? Container(
                            decoration: circle(
                              ktransparent,
                              kSecondary2,
                              width: 2,
                            ),
                            child: CommonImageView(
                              height: iconheight ?? 32,
                              width: iconheight ?? 32,
                              radius: iconRadis ?? 200,
                              url: path ?? dummyImage,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: topPadimg ?? 0.0),

                            child: Image.asset(
                              height: iconheight ?? 32,
                              path ?? Assets.imagesLogo,
                              color: iconcolor ?? null,
                            ),
                          ),

                  Expanded(
                    child: Column(
                      spacing: colspace ?? 0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: title ?? 'Credit or debit card',
                          size: size1 ?? 14,
                          weight: weight1 ?? FontWeight.w600,
                          paddingBottom: gap ?? 0,
                          color: color1 ?? null,
                        ),
                        if (hastsubtitle == true)
                          MyText(
                            color: color2 ?? null,
                            size: size2 ?? 12,
                            text: subtitle ?? 'Visa, Mastercard, AMEX and JCB',
                            weight: weight2 ?? FontWeight.w400,
                          ),
                        if (hasthirdtext == true)
                          MyText(
                            color: color2 ?? null,
                            size: size3 ?? 14,
                            weight: wmedium,
                            text: subtitle2 ?? 'Visa, Mastercard, AMEX and JCB',
                          ),
                      ],
                    ),
                  ),
                  if (hastrailing == true) trailing ?? SizedBox(),
                ],
              ),
            ),
          );
  }
}
