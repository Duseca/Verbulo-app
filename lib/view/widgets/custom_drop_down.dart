import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/const/app_colors.dart';

class SimpleDropDown extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final double borderRadius;
  final Color? backgroundColor;
  final bool? hasTopRadius, // Flag to control the top radius
      hasBottomRadius;
  final Color? borderColor;

  const SimpleDropDown({
    Key? key,
    required this.label,
    required this.hint,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.borderRadius = 0,
    this.backgroundColor,
    this.borderColor,
    this.hasTopRadius,
    this.hasBottomRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFFAFAFA).withOpacity(0.2),
        borderRadius: BorderRadius.only(
          topLeft: hasTopRadius == true
              ? Radius.circular(borderRadius ?? 15.0)
              : Radius.zero,
          topRight: hasTopRadius == true
              ? Radius.circular(borderRadius ?? 15.0)
              : Radius.zero,
          bottomLeft: hasBottomRadius == true
              ? Radius.circular(borderRadius ?? 15.0)
              : Radius.zero,
          bottomRight: hasBottomRadius == true
              ? Radius.circular(borderRadius ?? 15.0)
              : Radius.zero,
        ),
        border: Border.all(color: borderColor ?? const Color(0xFFE0E0E0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: MyText(text: hint, size: 15, weight: FontWeight.w400),
            value: selectedValue,
            onChanged: onChanged,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: MyText(
                  text: item,
                  size: 12,
                  weight: FontWeight.w500,
                  color: getPrimaryColor(context),
                ),
              );
            }).toList(),
            customButton: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(text: label, size: 13, weight: FontWeight.w400),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: selectedValue ?? hint,
                      size: 12,
                      weight: FontWeight.w400,
                      color: selectedValue == null
                          ? Colors.grey[500]
                          : getTertiary(context),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: getTertiary(context),
                    ),
                  ],
                ),
              ],
            ),
            dropdownStyleData: DropdownStyleData(
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: backgroundColor ?? getTertiary(context),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: getPrimaryColor(context),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 46,
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ),
    );
  }
}
