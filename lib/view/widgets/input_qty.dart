import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_fonts.dart';
import 'package:verbulo/const/app_styling.dart';

class InputQuantity extends StatelessWidget {
  const InputQuantity({
    super.key,
    required this.qty,
    required this.onQtyChanged,
  });
  final Function(num) onQtyChanged;
  final RxInt qty;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        decoration: rounded2(ktransparent, kGreyColorLight),
        child: Obx(
          () => InputQty(
            qtyFormProps: QtyFormProps(
              style: TextStyle(
                fontFamily: MANROPE,
                fontWeight: FontWeight.w600,
                color: kBlack2Color,
                fontSize: 11,
              ),
            ),
            onQtyChanged: (q) {
              return onQtyChanged(q);
            },
            initVal: qty.value == -1 ? 0 : qty.value,
            minVal: 0,
            maxVal: 100,
            decoration: QtyDecorationProps(
              minusBtn: Container(
                height: 28,
                width: 28,
                color: kGreyColorLight,
                child: Icon(Icons.remove, size: 18, color: kGreyColor),
              ),
              plusBtn: Container(
                height: 28,
                width: 28,
                color: kSecondaryBlue,
                child: Icon(Icons.add, size: 18, color: kSecondaryBlue),
              ),
              isBordered: false,
              btnColor: kSecondaryBlue,
              width: 12,
            ),
          ),
        ),
      ),
    );
  }
}
