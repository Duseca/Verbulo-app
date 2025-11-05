import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/view/screens/quiz/complete.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class SynonymMatch extends StatelessWidget {
  const SynonymMatch({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Persuasive', 'Proud', 'Quiet'];
    final RxInt selectedIndex = (-1).obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          text: 'Synonym Match',
          textAlign: TextAlign.center,
          paddingTop: 30,
          paddingBottom: 20,
        ),
        MyText(
          text: 'Match "Eloquent" with the closest word in meaning',
          textAlign: TextAlign.center,
          paddingBottom: 30,
          size: 16,
        ),
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Obx(() {
            bool isSelected = selectedIndex.value == index;

            return MyButton.filled(
              height: 43,
              buttonText: items[index],
              mBottom: 10,
              onTap: () {
                selectedIndex.value = index;
                // onSelected?.call(options[index]);
              },
              fontColor: isSelected ? kQuaternaryColor : kSecondaryColor,
              backgroundColor: isSelected ? kMustard : kQuaternaryColor,
              outlineColor: isSelected ? kMustard : getbtnColor(context),
            );
          }),
        ),
        MyButton.filled(
          buttonText: 'Submit',
          onTap: () {
            Get.to(() => Complete());
          },
          mTop: 50,
        ),
      ],
    );
  }
}
