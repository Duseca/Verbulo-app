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
    required this.currentindex,
    this.ontap,
    required this.items,
    this.hasicon = true,
    this.hasstar = true,
    this.outlinecolor,
  });
  final int currentindex;
  final void Function(int)? ontap; // Allow ontap to receive the index
  final List<String> items;
  final bool? hasicon, hasstar;
  final Color? outlinecolor;
  @override
  Widget build(BuildContext context) {
    RxInt current = 0.obs;
    void _onTap(int index) {
      if (ontap != null) {
        ontap!(index); // Pass index to ontap callback
      } else {
        current.value = index;
      }
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        //   clipBehavior: Clip.none,
        spacing: 6, // Horizontal space between the tags
        runSpacing: 6, // Vertical space between the lines of tags
        children: List.generate(items.length, (index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => _onTap(index), // Call _onTap with the index
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    duration: const Duration(milliseconds: 300),

                    decoration: rounded2r(
                      currentindex != index
                          ? kSecondaryColor2
                          : dgreylgrey(context),
                      currentindex != index
                          ? kSecondaryColor2
                          : outlinecolor ?? dgreylgrey(context),
                      7,
                    ),
                    //    width: 30,
                    child: Center(
                      child: Row(
                        children: [
                          if (hasicon == true)
                            if (index != 0)
                              CommonImageView(
                                imagePath: Assets.imagesStar,
                                height: 15,
                              ),
                          MyText(
                            text: items[index],
                            paddingLeft: 3,
                            paddingRight: 3,
                            size: 12,
                            weight: currentindex != index
                                ? wsemibold
                                : wregular,
                            color: kSecondaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
