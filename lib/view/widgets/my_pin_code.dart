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
      width: 72,
      height: 72,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(0),
      textStyle: TextStyle(
        fontSize: 20,
        color: widget.color ?? kSecondaryBlue,
        fontWeight: FontWeight.w700,
        fontFamily: MANROPE,
      ),
      decoration: BoxDecoration(
        color: kQuaternaryColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kSecondary2, width: 1.5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: kQuaternaryColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kSecondaryBlue, width: 1.5),
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
          border: Border.all(color: kSecondaryBlue, width: 1),
        ),
      ),
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
