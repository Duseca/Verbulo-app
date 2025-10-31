import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';

import 'package:pinput/pinput.dart';

class MyPinCode extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final Color? color;

  const MyPinCode({
    super.key,
    required this.onChanged,
    required this.onCompleted,
    this.color,
  });

  @override
  State<MyPinCode> createState() => _MyPinCodeState();
}

class _MyPinCodeState extends State<MyPinCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 58,
      height: 72,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(0),
      textStyle: TextStyle(
        fontSize: 34,
        color: widget.color ?? getTertiary(context),
        fontWeight: FontWeight.w500,
        fontFamily: MANROPE,
      ),
      decoration: BoxDecoration(
        color: ktransparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: getsubtextcolor(context).withOpacity(0.3), width: 1),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: ktransparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: getTertiary(context), width: 1),
      ),
    );

    return Pinput(
      length: 4,
      autofillHints: ['---', '---', '---', '---'],
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: getTertiary(context), width: 1),
        ),
      ),
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
