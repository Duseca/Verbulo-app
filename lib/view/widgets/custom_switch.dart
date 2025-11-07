import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_styling.dart';

class CustomSwitch extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final Color? inactiveTrackColor;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? trackOutlineColor;
  final double? trackOutlineWidth;
  final Color? thumbColor;
  final double? scale;
  final EdgeInsetsGeometry? padding;

  const CustomSwitch({
    super.key,
    this.value,
    this.onChanged,
    this.inactiveTrackColor,
    this.activeColor,
    this.activeTrackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbColor,
    this.scale,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale ?? 0.5,
      child: Switch(
        value: value ?? false,
        onChanged: onChanged,
        inactiveTrackColor: inactiveTrackColor,
        activeColor: activeColor,
        activeTrackColor: activeTrackColor,
        trackOutlineColor: trackOutlineColor != null
            ? WidgetStatePropertyAll(trackOutlineColor ?? kTertiaryColor)
            : null,
        trackOutlineWidth: trackOutlineWidth != null
            ? WidgetStatePropertyAll(trackOutlineWidth ?? 3)
            : null,
        thumbColor: thumbColor != null
            ? WidgetStatePropertyAll(thumbColor ?? kTertiaryColor)
            : null,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        thumbIcon: MaterialStateProperty.all(Icon(null)),
      ),
    );
  }
}

class CustomSwitch2 extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  const CustomSwitch2({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });
  @override
  State<CustomSwitch2> createState() => _CustomSwitch2State();
}

class _CustomSwitch2State extends State<CustomSwitch2> {
  late bool isOn;
  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void toggleSwitch() {
    setState(() => isOn = !isOn);
    widget.onChanged(isOn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: SizedBox(
        width: 45,
        height: 42, // taller to allow thumb to overhang
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Track (thinner than thumb)
            AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
              duration: Duration(milliseconds: 200),
              width: 45,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyColor1),
                color: isOn ? kSecondaryColor : getTertiary(context),
                // border: Border.all(color:isOn?ktransparent:getSecondaryColor(context)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // Thumb
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(2),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isOn ? Colors.white : kGreyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isOn ? kGreyColor1 : dgreylgrey(context),
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
