import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/view/widgets/custom_rich_text.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class DiscountedPriceText extends StatelessWidget {
  final String currency;
  final String price;
  final String? oldPrice;
  final Color? priceColor, currencycolor;
  final Color? oldPriceColor;
  final double? priceSize, currencysize;
  final double? oldPriceSize;
  final TextDecoration? oldPriceDecoration;

  const DiscountedPriceText({
    super.key,
    this.currency = 'AED',
    required this.price,
    this.oldPrice,
    this.priceColor,
    this.oldPriceColor,
    this.priceSize = 20,
    this.oldPriceSize = 12,
    this.oldPriceDecoration = TextDecoration.lineThrough,
    this.currencysize,
    this.currencycolor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PriceText(
          info: currency,
          title: price,
          size2: priceSize!,
          size1: currencysize ?? 14,
          color2: currencycolor ?? kSecondaryBlue,
          color: priceColor ?? kSecondaryBlue,
        ),
        if (oldPrice != null) // Show old price only if it's provided
          MyText(
            text: oldPrice!,
            color: oldPriceColor ?? kGreyColor,
            decoration: oldPriceDecoration ?? TextDecoration.lineThrough,
            size: oldPriceSize!,
            paddingLeft: 3,
          ),
      ],
    );
  }
}
