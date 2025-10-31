import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/view/widgets/my_button.dart';

class Gender extends StatelessWidget {
  /// List of options to display. Defaults to gender options.
  final List<String> options;

  /// Optional callback for when an option is selected.
  final void Function(String selectedValue)? onSelected;

  const Gender({
    super.key,
    this.options = const ['Male', 'Female', 'Prefer not to say'],
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final RxInt selectedIndex = (-1).obs;

    return Column(
      children: [
        ListView.builder(
          itemCount: options.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Obx(() {
            bool isSelected = selectedIndex.value == index;

            return MyButton.filled(
              height: 43,
              buttonText: options[index],
              mBottom: 10,
              onTap: () {
                selectedIndex.value = index;
                onSelected?.call(options[index]);
              },
              fontColor: isSelected ? kQuaternaryColor : kSecondaryColor,
              backgroundColor: isSelected ? kMustard : kQuaternaryColor,
              outlineColor: isSelected ? kMustard : getbtnColor(context),
            );
          }),
        ),
        MyButton.filled(
          buttonText: 'Next',
          onTap: () {
            landingController.pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
