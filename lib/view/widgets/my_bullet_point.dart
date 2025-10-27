import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class MyBullet extends StatelessWidget {
  MyBullet({super.key, required this.point, this.size, this.color});
  String point;
  Color? color;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: '•',
            color: color ?? kGreyColor2,
            //paddingLeft: 25,
            paddingRight: 5,
          ),
          Expanded(
            child: MyText(
              text: point,
              color: color ?? kBlack3Color,
              size: size ?? 12,
            ),
          ),
          //  SizedBox(width: 10),
        ],
      ),
    );
  }
}
