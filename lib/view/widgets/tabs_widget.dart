import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_fonts.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

import '../../const/app_colors.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({
    super.key,
    required this.currentindex,
    this.ontap,
    required this.items,
    this.isexpanded,
    this.height,
    this.padEnds,
  });

  final int currentindex;
  final void Function(int)? ontap; // Allow ontap to receive the index
  final List<String> items;
  final bool? isexpanded;
  final double? height, padEnds;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

int current = 0;

class _TabsWidgetState extends State<TabsWidget> {
  void _onTap(int index) {
    if (widget.ontap != null) {
      widget.ontap!(index); // Pass index to ontap callback
    } else {
      setState(() {
        current = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the text scale factor
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    // Adjust the heights based on the text scale factor
    double containerHeight = (widget.height ?? 55);
    double animatedContainerHeight = 45;
    if (textScaleFactor > 1) {
      animatedContainerHeight = animatedContainerHeight * textScaleFactor;
      containerHeight = containerHeight * textScaleFactor;
    }
    return widget.isexpanded == false
        ? Container(
            height: widget.height ?? 64,
            margin: EdgeInsets.only(bottom: 0),
            //  decoration: rounded2r(kGrey1Color, ktransparent, 100),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.items.length, (index) {
                      return GestureDetector(
                        onTap: () =>
                            _onTap(index), // Call _onTap with the index
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 4,
                          ),
                          child: AnimatedContainer(
                            //  padding: EdgeInsets.symmetric(vertical: 7),
                            duration: const Duration(milliseconds: 300),
                            height: Get.height,
                            //    width: 30,
                            child: Column(
                              children: [
                                Center(
                                  child: MyText(
                                    text: widget.items[index],
                                    paddingLeft: index == 0 ? 16 : 7,
                                    paddingRight: index == 0 ? 16 : 7,
                                    size: 14,
                                    weight: widget.currentindex == index
                                        ? wsemibold
                                        : wregular,
                                    color: widget.currentindex == index
                                        ? kSecondaryBlue
                                        : kGreyColor,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 15,
                                  decoration: rounded2(
                                    widget.currentindex != index
                                        ? kGreyColor
                                        : kSecondaryBlue,
                                    widget.currentindex != index
                                        ? kGreyColor
                                        : kSecondaryBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          )
        : Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                bottom: 4,
                right: 0,
                child: Container(
                  decoration: rounded2(Color(0xffD9F4F9), Color(0xffD9F4F9)),
                  height: 6,
                ),
              ),
              Container(
                height: widget.height ?? containerHeight,
                margin: EdgeInsets.only(bottom: 0),
                //   decoration: rounded2r(kGrey1Color, kGrey1Color, 100),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(widget.items.length, (index) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  _onTap(index), // Call _onTap with the index
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      //  horizontal: 2,
                                      //   vertical: 4,
                                    ),
                                    child: AnimatedContainer(
                                      //  padding: EdgeInsets.symmetric(vertical: 7),
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      height: animatedContainerHeight,
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //     width: 0.6,
                                      //     color: widget.currentindex == index
                                      //         ? ktransparent
                                      //         : kTertiaryColor.withOpacity(0.8),
                                      //   ),
                                      // ),
                                      child: Center(
                                        child: MyText(
                                          text: widget.items[index],
                                          // paddingLeft: 16,
                                          //  paddingTop: 10,
                                          // paddingRight: 16,
                                          paddingBottom:
                                              widget.currentindex == index
                                              ? 0
                                              : 5,
                                          size: 12,
                                          weight: widget.currentindex == index
                                              ? FontWeight.w700
                                              : FontWeight.w300,
                                          color: widget.currentindex == index
                                              ? kSecondary2
                                              : kGreyColor2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  widget.currentindex == index
                                      ? Container(
                                          decoration: rounded2(
                                            Color(0xff3AADC1),
                                            Color(0xff3AADC1),
                                          ),
                                          height: 6,
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

class MyTabbar extends StatelessWidget {
  const MyTabbar({
    super.key,
    required this.items,
    this.controller,
    this.bgcolor,
    this.tabcolor,
    this.outlinecolor,
    this.labelcolor,
    this.unselectedLabelcolor,
    this.indicatorcolor,
    this.indicatorPads,
    this.padEnds,
    this.ontap,
  });
  final void Function(int)? ontap;
  final List<String> items;
  final TabController? controller;
  final double? indicatorPads, padEnds;
  final Color? bgcolor,
      tabcolor,
      outlinecolor,
      labelcolor,
      unselectedLabelcolor,
      indicatorcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,

      // decoration: rounded2r(
      //   bgcolor ?? kGrey1Color,
      //   bgcolor ?? kGrey1Color,
      //   100,
      // ),
      child: TabBar(
        automaticIndicatorColorAdjustment: false,
        labelColor: labelcolor ?? kPrimaryColor,
        isScrollable: true,
        unselectedLabelColor: unselectedLabelcolor ?? kQuaternaryColor,
        controller: controller,
        onTap: ontap,
        overlayColor: WidgetStatePropertyAll(ktransparent),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: MANROPE,
          color: labelcolor ?? kPrimaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: MANROPE,
          color: kTextColor4,
        ),
        //isScrollable: true,
        tabAlignment: TabAlignment.start,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        indicatorPadding: EdgeInsets.symmetric(horizontal: indicatorPads ?? 0),
        labelPadding: EdgeInsets.symmetric(horizontal: padEnds ?? 10),
        // controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,

        // indicator: rounded2r(
        //   tabcolor ?? kTertiaryColor,
        //   outlinecolor ?? kTertiaryColor,
        //   100,
        // ),
        dividerColor: ktransparent,

        indicatorColor: indicatorcolor ?? kQuaternaryColor,
        //      labelPadding: EdgeInsets.symmetric(horizontal: 3),
        tabs: List.generate(
          items.length,
          (index) => Tab(iconMargin: EdgeInsets.all(0), text: items[index].tr),
        ),
      ),
    );
  }
}
