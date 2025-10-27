// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:verbulo/constants/app_colors.dart';
// import 'package:verbulo/constants/app_fonts.dart';
// import 'my_text_widget.dart';

// // ignore: must_be_immutable

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.ontap,
    this.hint,
    this.isDense,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 24.0,
    this.maxLines,
    this.isFilled = true,
    this.filledColor,
    this.focusedFilledColor,
    this.fhintColor,
    this.hintColor,
    this.bordercolor,
    this.isright,
    this.padends,
    this.radius = 12,
    this.haveLabel = true,
    this.labelSize,
    this.prefixIcon,
    this.suffixtext,
    this.suffixIcon,
    this.suffixTap,
    this.keyboardType,
    this.showFlag,
    this.labelColor,
    this.labelWeight,
    this.validator,
    this.textColor,
    this.isreadonly,
    this.isoptional = false,
    this.fbordercolor,
    this.focusedLabelColor,
    this.floatingLabelBehavior,
    this.labelpads,
    this.hasBottomRadius,
    this.hasTopRadius,
    this.vpads,
    this.epads,
    this.useCountryCodePicker = false,
    this.useOutlinedBorder =
        true, // true for outlined border, false for underline
  }) : super(key: key);

  String? label, hint, suffixtext;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure,
      isoptional,
      haveLabel,
      isFilled,
      isreadonly,
      hasTopRadius, // Flag to control the top radius
      hasBottomRadius,
      isDense,
      isright,
      useCountryCodePicker,
      showFlag,
      useOutlinedBorder; // Added this flag for choosing border style
  double? marginBottom;
  int? maxLines;
  double? labelSize, radius, padends, labelpads, vpads, epads;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Color? filledColor,
      focusedFilledColor,
      focusedLabelColor,
      hintColor,
      bordercolor,
      fbordercolor,
      fhintColor,
      textColor,
      labelColor;
  FontWeight? labelWeight;
  TextInputType? keyboardType;
  VoidCallback? suffixTap, ontap;
  String? Function(String?)? validator;
  FloatingLabelBehavior? floatingLabelBehavior;

  @override
  _MyTextField2State createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField> {
  late FocusNode _focusNode;
  final ValueNotifier<bool> _focusNotifier = ValueNotifier<bool>(false);
  bool isFocused = false;

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
    _focusNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    isFocused = _focusNode.hasFocus;
    _focusNotifier.value = _focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [MoveEffect()],
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.marginBottom!),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _focusNotifier.value = true;
            });
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      //  height: 50,
                      decoration: BoxDecoration(
                        color: kQuaternaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                          topLeft: widget.hasTopRadius == true
                              ? Radius.circular(widget.radius ?? 15.0)
                              : Radius.zero,
                          topRight: widget.hasTopRadius == true
                              ? Radius.circular(widget.radius ?? 15.0)
                              : Radius.zero,
                          bottomLeft: widget.hasBottomRadius == true
                              ? Radius.circular(widget.radius ?? 15.0)
                              : Radius.zero,
                          bottomRight: widget.hasBottomRadius == true
                              ? Radius.circular(widget.radius ?? 15.0)
                              : Radius.zero,
                        ),
                        border: Border.all(
                          color: isFocused ? kSecondaryColor : kGreyColor1,
                        ), // Change border color based on focus
                      ),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: widget.label ?? "Label",
                            paddingLeft: 16,
                          ),
                          ValueListenableBuilder(
                            valueListenable: _focusNotifier,
                            builder: (_, isFocused, child) {
                              return TextFormField(
                                cursorColor: kBlack2Color,
                                keyboardType: widget.keyboardType,
                                maxLines: widget.maxLines ?? 1,
                                onTapOutside: (v) {
                                  _focusNode.unfocus();
                                },
                                onTap:
                                    widget.ontap ??
                                    () {
                                      setState(() {
                                        _focusNotifier.value = true;
                                      });
                                    },

                                controller: widget.controller,
                                onChanged: widget.onChanged,

                                textInputAction: TextInputAction.next,
                                obscureText: widget.isObSecure!,
                                obscuringCharacter: '*',
                                style: TextStyle(
                                  fontFamily: MANROPE,
                                  fontSize: 15,
                                  color:
                                      widget.textColor ?? getTertiary(context),
                                  fontWeight: FontWeight.w400,
                                ),
                                validator: widget.validator,
                                textAlign: widget.isright == true
                                    ? TextAlign.right
                                    : TextAlign.left,
                                focusNode: _focusNode,
                                readOnly: widget.isreadonly ?? false,
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  isDense: widget.isDense ?? true,
                                  prefixIconConstraints:
                                      BoxConstraints.tightFor(),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                      left: 8,
                                    ),
                                    child: widget.useCountryCodePicker == true
                                        ? Row(
                                            textDirection: TextDirection.ltr,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CommonImageView(
                                                imagePath: Assets.imagesLogo,
                                                height: 48,
                                              ),
                                              CountryCodePicker(
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                alignLeft: false,
                                                showFlag: false,
                                                padding: EdgeInsets.all(0),
                                                showDropDownButton: true,
                                                textStyle: TextStyle(
                                                  fontFamily: MANROPE,
                                                  color: kGreyColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : widget.prefixIcon != null
                                        ? widget.prefixIcon
                                        : null,
                                  ),
                                  // label: ValueListenableBuilder(
                                  //   valueListenable: _focusNotifier,

                                  //   builder: (_, isFocused, child) {
                                  //     return Row(
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       children: [
                                  //         Flexible(
                                  //           child: MyText(
                                  //             text: widget.label?.tr ?? '',
                                  //             size: widget.labelSize ?? 16,
                                  //             paddingBottom:
                                  //                 widget.padends ?? 0,
                                  //             paddingLeft:
                                  //                 widget.labelpads ?? 4,
                                  //             textOverflow:
                                  //                 TextOverflow.ellipsis,
                                  //             paddingRight:
                                  //                 widget.labelpads ?? 4,
                                  //             maxLines: 1,
                                  //             weight:
                                  //                 widget.labelWeight ??
                                  //                 FontWeight.w500,
                                  //             color: isFocused
                                  //                 ? widget.focusedLabelColor ??
                                  //                       kBlack2Color
                                  //                 : widget.labelColor ??
                                  //                       kTertiaryColor,
                                  //           ),
                                  //         ),
                                  //         if (widget.isoptional == true)
                                  //           MyText(
                                  //             text: ' (optional)',
                                  //             size: 12,
                                  //             color: ksubtextColor,
                                  //             paddingBottom: 0,
                                  //           ),
                                  //       ],
                                  //     );
                                  //   },
                                  // ),
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.start,
                                  floatingLabelBehavior:
                                      widget.floatingLabelBehavior ??
                                      FloatingLabelBehavior.never,
                                  suffixIconConstraints:
                                      BoxConstraints.tightFor(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: widget.epads ?? 15,
                                    vertical: widget.vpads ?? 0,
                                  ),
                                  hintText: widget.hint?.tr,
                                  suffixStyle: TextStyle(
                                    fontFamily: MANROPE,
                                    fontSize: 14,
                                    color: isFocused
                                        ? widget.fhintColor
                                        : widget.hintColor,
                                  ),
                                  suffixIcon: widget.suffixIcon != null
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10.0,
                                          ),
                                          child: GestureDetector(
                                            onTap: widget.suffixTap,
                                            child: widget.suffixIcon,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10.0,
                                          ),
                                          child: widget.suffixIcon,
                                        ),
                                  suffixText: widget.suffixtext,
                                  hintStyle: TextStyle(
                                    fontFamily: MANROPE,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: isFocused
                                        ? widget.fhintColor ??
                                              getTertiary(context)
                                        : widget.hintColor ??
                                              getTertiary(context),
                                  ),
                                  filled: true,
                                  fillColor: _focusNotifier.value
                                      ? widget.focusedFilledColor ??
                                            ktransparent
                                      : widget.filledColor ?? ktransparent,
                                  enabledBorder:
                                      widget.useOutlinedBorder == true
                                      ? OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                widget.bordercolor ??
                                                ktransparent,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            widget.radius ?? 12,
                                          ),
                                        )
                                      : UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                widget.bordercolor ??
                                                ktransparent,
                                            width: 1,
                                          ),
                                        ),
                                  focusedBorder:
                                      widget.useOutlinedBorder == true
                                      ? OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                widget.fbordercolor ??
                                                ktransparent,
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            widget.radius ?? 10,
                                          ),
                                        )
                                      : UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                widget.bordercolor ??
                                                kGreyColor,
                                            width: 1.5,
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
