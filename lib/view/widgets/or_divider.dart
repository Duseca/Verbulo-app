import 'package:verbulo/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(child: Divider(color: kGreyColor)),
          MyText(
            text: ' OR ',
            color: kGreyColor2,
            paddingLeft: 20,
            paddingRight: 20,
          ),
          Expanded(child: Divider(color: kGreyColor)),
        ],
      ),
    );
  }
}
