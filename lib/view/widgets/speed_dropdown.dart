import 'package:flutter/material.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';

class SpeedDropdown extends StatefulWidget {
  const SpeedDropdown({super.key});

  @override
  _SpeedDropdownState createState() => _SpeedDropdownState();
}

class _SpeedDropdownState extends State<SpeedDropdown> {
  String selectedSpeed = 'Normal'; // Default option

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: ktransparent,
      shadowColor: ktransparent,
      splashRadius: 0,
      surfaceTintColor: ktransparent,
      position: PopupMenuPosition.under,
      padding: EdgeInsets.zero, // No padding around the button
      menuPadding: EdgeInsets.zero, // No padding inside the menu
      onSelected: (String value) {
        setState(() {
          selectedSpeed = value; // Update the selected speed
        });
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            mouseCursor: MouseCursor.defer,
            onTap: () {},
            enabled: false,
            value: 'Slow',
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10), // Remove inner padding
              decoration: BoxDecoration(
                color: Colors.orange, // Container background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align options left
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSpeed = 'Slow'; // Update state
                      });
                    },
                    child: MyText(
                      size: 12,
                      color: kSecondaryColor,
                      text: 'Slow',
                    ),
                  ),
                  Divider(color: kSecondaryColor), // Divider between options
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSpeed = 'Normal'; // Update state
                      });
                    },
                    child: MyText(
                      size: 12,
                      color: kSecondaryColor,
                      text: 'Normal',
                    ),
                  ),
                  Divider(color: kSecondaryColor),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSpeed = 'Fast'; // Update state
                      });
                    },
                    child: MyText(
                      size: 12,
                      color: kSecondaryColor,
                      text: 'Fast',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: kMustard, // Button color
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            MyText(text: 'Speed :', size: 12, color: kSecondaryColor),
            MyText(
              text: ' $selectedSpeed', // Display the selected speed
              color: kSecondaryColor,
              weight: wsemibold,
              size: 12,
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: kSecondaryColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
