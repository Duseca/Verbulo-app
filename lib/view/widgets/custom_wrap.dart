import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class CustomWrap extends StatelessWidget {
  const CustomWrap({
    super.key,
    required this.currentIndex,
    this.onTap,
    required this.items,
    this.hasIcon = true,
    this.hasStar = true,
    this.outlineColor,
    this.bgColor,
    this.selectedBgColor,
    this.icons,
    this.iconSize,
    this.textSize,
    this.textcolor,
    this.selectedtextcolor,
    this.spacing,
  });

  final int currentIndex;
  final void Function(int)? onTap;
  final List<String> items;
  final bool? hasIcon, hasStar;
  final Color? outlineColor, textcolor, selectedtextcolor;
  final Color? bgColor; // for unselected background
  final Color? selectedBgColor; // for selected background
  final List<String>? icons; // list of icons for each item
  final double? iconSize; // new: custom icon size
  final double? textSize, spacing; // new: custom text size

  @override
  Widget build(BuildContext context) {
    RxInt current = 0.obs;

    void _onTap(int index) {
      if (onTap != null) {
        onTap!(index);
      } else {
        current.value = index;
      }
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        spacing: spacing ?? 6,
        runSpacing: spacing ?? 6,
        children: List.generate(items.length, (index) {
          final bool isSelected = currentIndex == index;

          return GestureDetector(
            onTap: () => _onTap(index),
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
              duration: const Duration(milliseconds: 300),
              decoration: rounded2r(
                isSelected
                    ? (selectedBgColor ?? dgreylgrey(context))
                    : (bgColor ?? kSecondaryColor2),
                isSelected
                    ? (outlineColor ?? dgreylgrey(context))
                    : (outlineColor ?? kSecondaryColor2),
                7,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (hasIcon == true)
                    if ((icons != null && icons!.length > index))
                      CommonImageView(
                        imagePath: icons![index],
                        height: iconSize ?? 15,
                        width: iconSize ?? 15,
                      )
                    else if (hasStar == true && index != 0)
                      CommonImageView(
                        imagePath: Assets.imagesStar,
                        height: iconSize ?? 15,
                        width: iconSize ?? 15,
                      ),
                  MyText(
                    text: items[index],
                    paddingLeft: 3,
                    paddingRight: 3,
                    size: textSize ?? 12,
                    weight: isSelected ? wregular : wsemibold,
                    color: isSelected
                        ? selectedtextcolor ?? kSecondaryColor
                        : textcolor ?? kSecondaryColor,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
