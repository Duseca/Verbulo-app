import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class TransparentContainer extends StatelessWidget {
  final Color? color1; // First color (nullable)
  final Color? color2; // Second color (nullable)
  final double? opacity; // Opacity (nullable)
  final String? text; // Nullable text
  final double? textSize, padends, padvertical; // Nullable text size
  final Color? textColor; // Nullable text color
  final FontWeight? textWeight; // Nullable text weight

  const TransparentContainer({
    super.key,
    this.color1,
    this.color2,
    this.opacity,
    this.text,
    this.textSize,
    this.textColor,
    this.textWeight,
    this.padends,
    this.padvertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padends ?? 10,
        vertical: padvertical ?? 10,
      ),
      decoration: BoxDecoration(
        color: (color1 ?? kSecondaryColor).withOpacity(opacity ?? 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color2 ?? Colors.transparent),
      ),
      child: text != null
          ? MyText(
              text: text!,
              size: textSize ?? 12, // Default size if null
              weight: textWeight ?? wsemibold, // Default weight if null
              color: textColor ?? kQuaternaryColor, // Default color if null
            )
          : null,
    );
  }
}
