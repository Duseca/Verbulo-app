import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class CustomAccordion extends StatefulWidget {
  const CustomAccordion({Key? key, this.children, this.title, this.subtitle})
    : super(key: key);
  final List<Widget>? children;
  final String? title, subtitle;
  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: getTertiary(context), // <-- set your text color here
          displayColor: Colors.white,
        ),
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Animate(
        effects: [
          MoveEffect(
            begin: Offset(100, 0),
            duration: Duration(milliseconds: 300),
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: ThemeUtils.isDarkMode(context)
                ? Color(0xff405161)
                : kQuaternaryColor,
            borderRadius: BorderRadius.circular(17),
            border: Border(
              top: BorderSide(
                color: ThemeUtils.isDarkMode(context)
                    ? Color(405161)
                    : kGreyColor1,
              ),
            ),
          ),
          child: ExpansionTile(
            collapsedTextColor: kPrimaryColor,
            collapsedIconColor: kGrey5Color,

            tilePadding: EdgeInsets.symmetric(vertical: 6),
            minTileHeight: 20,
            childrenPadding: EdgeInsets.all(12),
            iconColor: kBlack2Color,
            textColor: getTertiary(context),
            //      showTrailingIcon: false,
            //collapsedBackgroundColor: Color(0xff1b1b1b),
            title: MyText(
              paddingLeft: 16,
              text: widget.title ?? "How can I join a group chat?",
              size: 14,
              color: getTertiary(context),
              weight: _isOpen ? FontWeight.w500 : FontWeight.w400,
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CommonImageView(
                imagePath: _isOpen ? Assets.imagesUp : Assets.imagesDown,
                height: 22,
                width: 22,
              ),
            ),
            //backgroundColor: kGrey1Color.withOpacity(0.5),
            children:
                widget.children ??
                <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: MyText(
                            text:
                                widget.subtitle ??
                                "To join a group chat, you can get an invitation from the group chat owner or scan the group's QR",
                            size: 12,
                            weight: FontWeight.w500,
                            color: kGreyColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isOpen = expanded;
              });
            },
          ),
        ),
      ),
    );
  }
}
