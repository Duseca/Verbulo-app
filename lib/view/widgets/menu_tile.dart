import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/Icon_title_subtitle.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class Menutile extends StatelessWidget {
  const Menutile({
    super.key,
    this.path,
    this.title,
    this.hasicon = true,
    this.ontap,
    this.trailIcon,
    this.hasline = true,
    this.trailing,
    this.textcolor,
    this.trailtext,
    this.iconcolor,
    this.linecolor,
    this.padends,
    this.flipicon,
    this.leadtextsize,
    this.space,
    this.leadingcolor,
    this.decoration,
    this.iconsize,
    this.gap,
  });
  final String? path, title, trailIcon, trailtext;
  final VoidCallback? ontap;
  final BoxDecoration? decoration;
  final bool? hasline, hasicon, flipicon;
  final Widget? trailing;
  final Color? textcolor, leadingcolor, iconcolor, linecolor;
  final double? space, padends, leadtextsize, iconsize, gap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconTitleSubtitle(
          hasicon: hasicon ?? true,
          path: path,
          size1: leadtextsize ?? 14,
          decoration: decoration,
          rowspace: gap,
          iconheight: iconsize ?? 24,
          iconcolor: leadingcolor ?? null,
          color1: textcolor ?? kTertiaryColor,
          title: title,

          weight1: FontWeight.w500,
          ontap: ontap,
          padEnds: padends ?? 20,
          hastsubtitle: false,
          trailing:
              trailing ??
              Row(
                spacing: 6,
                mainAxisSize: MainAxisSize.min,
                children: flipicon == true
                    ? [
                        Image.asset(
                          color: iconcolor ?? null,
                          trailIcon ?? Assets.imagesLogo,
                          height: 20,
                        ),
                        MyText(
                          text: trailtext ?? '',
                          color: textcolor ?? kGreyColor,
                          size: 12,
                        ),
                      ]
                    : [
                        MyText(
                          text: trailtext ?? '',
                          color: textcolor ?? getTertiary(context),
                          size: 12,
                        ),
                        Image.asset(
                          color: iconcolor ?? null,
                          trailIcon ?? Assets.imagesLogo,
                          height: 20,
                        ),
                      ],
              ),
          padVertical: space ?? 20,
        ),
        if (hasline == true)
          Divider(color: linecolor ?? kGreyColorLight, height: 0),
      ],
    );
  }
}
