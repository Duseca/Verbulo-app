// import 'package:flutter/material.dart';
// import 'package:verbulo/const/app_colors.dart';
// import 'package:verbulo/generated/assets.dart';
// import 'package:verbulo/view/widgets/common_image_view_widget.dart';
// import 'package:verbulo/view/widgets/custom_animated_row.dart';
// import 'package:verbulo/view/widgets/my_text_widget.dart';

// class StarRating extends StatelessWidget {
//   final double rating;
//   final int starCount;
//   final double size, padEnds;
//   final Color? color;
//   final bool? expanded;
//   final String? fillStar, star;
//   StarRating({
//     required this.rating,
//     this.starCount = 5,
//     this.size = 30.0,
//     this.padEnds = 0,
//     this.color,
//     this.fillStar,
//     this.star,
//     this.expanded = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     int fullStars = rating.floor();
//     double remainingRating = rating - fullStars;

//     return expanded == false
//         ? Row(
//             mainAxisSize: MainAxisSize.min,
//             children: List.generate(starCount, (index) {
//               if (index < fullStars) {
//                 // Full star
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: padEnds),
//                   child: Image.asset(
//                     fillStar ?? Assets.imagesStar,
//                     height: size,
//                     color: color ?? null,
//                   ),
//                 );
//               } else if (index == fullStars && remainingRating > 0) {
//                 // Partial star
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: padEnds),
//                   child: Image.asset(
//                     fillStar ?? Assets.imagesUnselectstar,
//                     height: size,
//                     color: color ?? null,
//                   ),
//                 );
//               } else {
//                 // Empty star
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: padEnds),
//                   child: Image.asset(
//                     star ?? Assets.imagesUnselectstar,
//                     height: size,
//                     color: color ?? kGreyColor,
//                   ),
//                 );
//               }
//             }),
//           )
//         : Row(
//             mainAxisSize: MainAxisSize.min,
//             children: List.generate(starCount, (index) {
//               if (index < fullStars) {
//                 // Full star
//                 return Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: padEnds),
//                     child: Image.asset(
//                       fillStar ?? Assets.imagesStar,
//                       height: size,
//                       color: color ?? null,
//                     ),
//                   ),
//                 );
//               } else if (index == fullStars && remainingRating > 0) {
//                 // Partial star
//                 return Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: padEnds),
//                     child: Image.asset(
//                       fillStar ?? Assets.imagesStar,
//                       height: size,
//                       color: color ?? null,
//                     ),
//                   ),
//                 );
//               } else {
//                 // Empty star
//                 return Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: padEnds),
//                     child: Image.asset(
//                       star ?? Assets.imagesUnselectstar,
//                       height: size,
//                       color: color ?? kGreyColor,
//                     ),
//                   ),
//                 );
//               }
//             }),
//           );
//   }
// }

// class RatingText extends StatelessWidget {
//   const RatingText({super.key, this.hasviews = true});
//   final bool? hasviews;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedRow(
//       children: [
//         CommonImageView(imagePath: Assets.imagesStasr3, height: 16),
//         MyText(text: ' 5.0', size: 12),
//         if (hasviews == true)
//           MyText(text: "(911)", color: kGreyColor, size: 12),
//       ],
//     );
//   }
// }
