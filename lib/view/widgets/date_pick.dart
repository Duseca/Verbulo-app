import 'package:bottom_picker/bottom_picker.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

void picktime(BuildContext context, String? title) {
  BottomPicker.time(
    buttonPadding: 0,
    height: Get.height * 0.5,
    titlePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    backgroundColor: kPrimaryColor,
    displayCloseIcon: false,
    displaySubmitButton: true,
    //dateOrder: DatePickerDateOrder.dmy,
    dismissable: true,
    // title: 'Select Date',
    pickerTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: MANROPE,
      color: kBlack2Color,
    ),

    onSubmit: (date) {
      print(date);
    },

    buttonContent: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kSecondaryBlue,
        ),
        child: Center(
          child: MyText(text: 'Done', color: kQuaternaryColor, size: 16),
        ),
      ),
    ),
    buttonWidth: Get.width * 0.9,
    buttonStyle: BoxDecoration(),
    pickerTitle: MyText(
      text: title ?? 'Start Time',
      size: 20,
      weight: wbold,
      paddingTop: 20,
    ),
    initialTime: Time.now(),
  ).show(context);
}

void pickdate(BuildContext context, String? title) {
  BottomPicker.date(
    buttonPadding: 0,
    height: Get.height * 0.5,
    titlePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    backgroundColor: kPrimaryColor,
    displayCloseIcon: false,
    displaySubmitButton: true,
    dateOrder: DatePickerDateOrder.dmy,
    dismissable: true,
    // title: 'Select Date',
    pickerTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: MANROPE,
      color: kBlack2Color,
    ),

    onSubmit: (date) {
      print(date);
    },

    buttonContent: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kSecondaryBlue,
        ),
        child: Center(
          child: MyText(text: 'Done', color: kQuaternaryColor, size: 16),
        ),
      ),
    ),
    buttonWidth: Get.width * 0.9,
    buttonStyle: BoxDecoration(),
    pickerTitle: MyText(
      text: title ?? 'Start Time',
      size: 20,
      weight: wbold,
      paddingTop: 20,
    ),
  ).show(context);
}
