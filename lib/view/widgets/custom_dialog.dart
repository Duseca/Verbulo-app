import 'dart:ui';

import 'package:bounce/bounce.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class CalendarDialog extends StatefulWidget {
  final DateTime? initialRangeStart;
  final DateTime? initialRangeEnd;
  final DateTime? initialFocusedDay;
  bool? rangeSelection;
  final Function(DateTime?, DateTime?, DateTime?)? onRangeSelected;
  CalendarDialog({
    super.key,
    this.initialRangeStart,
    this.initialRangeEnd,
    this.initialFocusedDay,
    this.onRangeSelected,
    this.rangeSelection = true,
  });
  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  @override
  void initState() {
    super.initState();
    _selectedDay = widget.initialFocusedDay ?? DateTime.now();
    _focusedDay = widget.initialFocusedDay ?? DateTime.now();
    _rangeStart = widget.initialRangeStart;
    _rangeEnd = widget.initialRangeEnd;
  }

  void _onLeftChevronPressed() {
    setState(() {
      _focusedDay = DateTime(_focusedDay!.year, _focusedDay!.month - 1, 1);
    });
  }

  void _onRightChevronPressed() {
    setState(() {
      _focusedDay = DateTime(_focusedDay!.year, _focusedDay!.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> missedDates = [
      DateTime(2025, DateTime.now().month, 8),
      DateTime(2025, 11, 7),
      DateTime(2025, 11, 15),
    ];
    return GestureDetector(
      onTap: () => Get.back(),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: getPrimaryColor(context),
                boxShadow: [
                  BoxShadow(
                    color: kQuaternaryColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    weekendDays: [7],
                    daysOfWeekHeight: 45,
                    rangeSelectionMode: widget.rangeSelection == true
                        ? RangeSelectionMode.toggledOn
                        : RangeSelectionMode.toggledOff,
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    onRangeSelected: (start, end, focusedDay) {
                      setState(() {
                        _rangeStart = start;
                        _rangeEnd = end;
                        _focusedDay = focusedDay;
                      });
                      widget.onRangeSelected?.call(start, end, focusedDay);
                    },
                    // firstDay: DateTime.utc(2010, 10, 16),
                    currentDay: DateTime.now(),

                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2040, 3, 14),
                    focusedDay: _focusedDay!,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                      widget.onRangeSelected?.call(
                        selectedDay,
                        null,
                        focusedDay,
                      );
                    },
                    calendarBuilders: CalendarBuilders(
                      withinRangeBuilder: (context, date, focusedDay) {
                        final isMissed = missedDates.any(
                          (d) => isSameDay(d, date),
                        );

                        if (isMissed) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: const EdgeInsets.all(0),
                            decoration: const BoxDecoration(
                              color: Colors.red, // 🔴 Red for missed
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${date.day}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }

                        // normal day styling (if not missed)
                        return Center(
                          child: Text(
                            '${date.day}',
                            style: TextStyle(
                              color: getTertiary(context),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: MANROPE,
                            ),
                          ),
                        );
                      },

                      headerTitleBuilder: (context, date) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('MMMM').format(date),
                              style: TextStyle(
                                color: kQuaternaryColor,
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                fontFamily: MANROPE,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: _onLeftChevronPressed,
                                  icon: Image.asset(
                                    Assets.imagesPre,
                                    height: 24,
                                  ),
                                ),
                                IconButton(
                                  onPressed: _onRightChevronPressed,
                                  icon: Image.asset(
                                    Assets.imagesNext2,
                                    height: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: const HeaderStyle(
                      titleCentered: false,
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                    ),
                    calendarStyle: CalendarStyle(
                      cellPadding: EdgeInsets.all(0),
                      cellMargin: EdgeInsets.all(0),
                      tablePadding: EdgeInsets.all(0),
                      rangeHighlightColor: kSecondaryColor2,
                      rangeStartDecoration: const BoxDecoration(
                        color: kMustard,
                        shape: BoxShape.circle,
                      ),
                      rangeEndDecoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kMustard,
                      ),

                      selectedDecoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kMustard,
                      ),
                      selectedTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kTertiaryColor,
                        fontFamily: MANROPE,
                      ),
                      withinRangeTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kTertiaryColor,
                        fontFamily: MANROPE,
                      ),
                      defaultTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: getTertiary(context),
                        fontFamily: MANROPE,
                      ),

                      todayDecoration: const BoxDecoration(
                        color: kMustard,
                        shape: BoxShape.circle,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      dowTextFormatter: (date, locale) {
                        List<String> weekDaysAbbreviations = [
                          'M',
                          'T',
                          'W',
                          'T',
                          'F',
                          'S',
                          'S',
                        ];
                        return weekDaysAbbreviations[date.weekday - 1];
                      },
                      weekdayStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: MANROPE,
                        color: kQuaternaryColor,
                      ),

                      weekendStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: MANROPE,
                        color: kQuaternaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.ontap,
    this.title,
    this.subtitle,
    this.btncolor,
    this.btncolor2,
    this.btntext,
    this.fontcolor1,
    this.fontcolor2,
    this.isrow = true,
    this.iscol = F,
    this.path,
    this.btntext2,
    this.ontap2,
    this.title2,
  });
  final String? title, title2, subtitle, btntext, btntext2, path;
  final Color? btncolor, btncolor2, fontcolor1, fontcolor2;
  final bool? isrow, iscol;
  final VoidCallback? ontap, ontap2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 0.0, sigmaX: 0),
                child: Container(
                  color: Colors.black.withOpacity(
                    0.02,
                  ), // Add opacity to background
                ),
              ),
            ),
            // Your content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 70,
                          horizontal: 20,
                        ),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimaryColor,
                          border: Border.all(color: ktransparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: title2 ?? 'Delete Account',
                              weight: wbold,
                              size: 18,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            CommonImageView(
                              imagePath: path ?? Assets.imagesLogo,
                              width: Get.width,
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                            MyText(
                              text:
                                  title ??
                                  'Are you sure you want to delete your account?',
                              paddingTop: 20,
                              textAlign: TextAlign.center,
                              paddingBottom: 10,
                              fontFamily: MANROPE,
                              size: 18,
                              weight: FontWeight.w600,
                            ),
                            MyText(
                              text: subtitle ?? '',
                              textAlign: TextAlign.center,
                              paddingBottom: 20,
                              color: ksubtextColor,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyButton.filled(
                                    //   gradient: transparentgrad(),
                                    onTap:
                                        ontap ??
                                        () {
                                          //   Get.to(() => Login());
                                        },
                                    buttonText: btntext ?? 'Cancel',

                                    backgroundColor: btncolor ?? ktransparent,
                                    outlineColor: kGreyColor2,

                                    fontColor: fontcolor1 ?? kGreyColor2,

                                    //  fontColor: kPrimaryColor,
                                  ),
                                ),
                                if (isrow == true) SizedBox(width: 10),
                                if (isrow == true)
                                  Expanded(
                                    child: MyButton.filled(
                                      onTap:
                                          ontap2 ??
                                          () {
                                            //   Get.to(() => Login());
                                          },
                                      buttonText: btntext2 ?? 'Delete',

                                      backgroundColor: btncolor2 ?? kRedColor,
                                      fontColor: fontcolor2 ?? kQuaternaryColor,
                                      //  fontColor: kPrimaryColor,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 0),
                            if (iscol == true)
                              MyButton.filled(
                                onTap:
                                    ontap2 ??
                                    () {
                                      Get.back();
                                    },
                                buttonText: 'Not now',

                                backgroundColor: btncolor2 ?? kSecondaryBlue,
                                fontColor: fontcolor2 ?? kPrimaryColor,
                                //  fontColor: kPrimaryColor,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogLayout extends StatelessWidget {
  const DialogLayout({
    super.key,
    this.padends,
    this.mhoriz,
    this.children,
    this.title,
    this.leftpad,
  });
  final String? title;
  final double? padends, mhoriz, leftpad;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                child: Container(
                  color: ktransparent, // Add opacity to background
                ),
              ),
            ),
            // Your content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: padends ?? 16,
                          vertical: 30,
                        ),
                        margin: EdgeInsets.fromLTRB(
                          mhoriz ?? 20,
                          5,
                          mhoriz ?? 20,
                          30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: getPrimaryColor(context),
                          border: Border.all(color: ktransparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: children ?? [],
                        ),
                      ),
                      // Positioned(
                      //   top: 10,
                      //   right: leftpad ?? 16,
                      //   left: leftpad ?? 16,
                      //   child: simpleAppBar(
                      //     centerTitle: true,
                      //     title: title,
                      //     bgColor: ktransparent,
                      //     height: 30,
                      //     haveBackButton: false,
                      //     actions: [
                      //       GestureDetector(
                      //         onTap: () {
                      //           Get.back();
                      //         },
                      //         child: CommonImageView(
                      //           imagePath: Assets.imagesLogo,
                      //           height: 24,
                      //         ),
                      //       ),
                      //       SizedBox(width: 20),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
