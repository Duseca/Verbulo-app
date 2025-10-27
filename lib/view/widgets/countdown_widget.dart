// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:verbulo/const/app_fonts.dart';
// import 'package:verbulo/view/widgets/my_text_widget.dart';

// class CountdownScreen extends StatelessWidget {
//   CountdownScreen({Key? key, this.hasdecor, this.fontColor}) : super(key: key);
//   final bool? hasdecor;
//   final Color? fontColor;
//   final CountdownController controller = Get.put(CountdownController());

//   Widget buildTimeBox(String value) {
//     return AnimatedSwitcher(
//       duration: Duration(milliseconds: 500),
//       transitionBuilder: (Widget child, Animation<double> animation) {
//         return ScaleTransition(scale: animation, child: child);
//       },
//       child: hasdecor == false
//           ? Text(
//               value,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontFamily: MANROPE,
//                 fontWeight: FontWeight.bold,
//                 color: fontColor ?? Colors.black,
//               ),
//             )
//           : Container(
//               key: ValueKey<String>(value),
//               padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontFamily: MANROPE,
//                   fontWeight: FontWeight.bold,
//                   color: fontColor ?? Colors.black,
//                 ),
//               ),
//             ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Obx(
//         () => Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             buildTimeBox(controller.hours.value.toString().padLeft(2, '0')),
//             MyText(
//               text: hasdecor == false ? ':' : ' : ',

//               size: 16,
//               weight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             buildTimeBox(controller.minutes.value.toString().padLeft(2, '0')),
//             MyText(
//               text: hasdecor == false ? ':' : ' : ',

//               size: 16,
//               weight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             buildTimeBox(controller.seconds.value.toString().padLeft(2, '0')),
//           ],
//         ),
//       ),
//     );
//   }
// }
