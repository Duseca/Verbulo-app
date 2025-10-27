import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class SimpleDropDown extends StatefulWidget {
  const SimpleDropDown({
    Key? key,
    required this.label,
    required this.hint,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.marginBottom = 16.0,
    this.labelSize = 14.0,
    this.hintSize = 14.0,
    this.labelColor,
    this.hintColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 12.0,
    this.isOptional = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  }) : super(key: key);
  final String label;
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final double marginBottom;
  final double labelSize;
  final double hintSize;
  final Color? labelColor;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final bool isOptional;
  final EdgeInsets padding;

  @override
  _SimpleDropDownState createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<SimpleDropDown> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  bool get _shouldFloatLabel {
    return _isFocused || widget.selectedValue != null;
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [MoveEffect()],
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.marginBottom),
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? kQuaternaryColor,
            border: Border.all(
              color: _isFocused
                  ? kSecondaryBlue
                  : widget.borderColor ?? kGreyColor,
              width: _isFocused ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Floating Label
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 12,
                top: _shouldFloatLabel ? -8 : 18,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: _shouldFloatLabel
                        ? widget.backgroundColor ?? kQuaternaryColor
                        : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        text: widget.label,
                        size: _shouldFloatLabel ? 12 : widget.labelSize,
                        weight: FontWeight.w500,
                        color: _isFocused
                            ? kSecondaryBlue
                            : widget.labelColor ?? kBlack2Color,
                      ),
                      if (widget.isOptional)
                        MyText(
                          text: ' (optional)',
                          size: _shouldFloatLabel ? 10 : 12,
                          color: ksubtextColor,
                        ),
                    ],
                  ),
                ),
              ),

              // Dropdown
              Padding(
                padding: EdgeInsets.only(top: _shouldFloatLabel ? 0 : 0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Container(),
                    items: widget.items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: MyText(
                          text: item,
                          size: 12,
                          color: kGreyColor2,
                          weight: FontWeight.w400,
                        ),
                      );
                    }).toList(),
                    value: widget.selectedValue,
                    onChanged: widget.onChanged,
                    onMenuStateChange: (isOpen) {
                      setState(() {
                        _isFocused = isOpen;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 56,
                      padding: widget.padding,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius,
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: kGreyColor,
                        size: 24,
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 300,
                      elevation: 8,
                      offset: Offset(0, -5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kQuaternaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 48,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
