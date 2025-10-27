import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/view/widgets/animated_column.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.children,
    this.padends,
    this.height,
  });
  final List<Widget> children;
  final double? padends, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? null,
      padding: EdgeInsets.all(padends ?? 20),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: AnimatedColumn(
        mainAxisSize: MainAxisSize.min,

        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: rounded2(kGreyColorLight, kGreyColorLight),
            height: 4,
            width: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ],
      ),
    );
  }
}
