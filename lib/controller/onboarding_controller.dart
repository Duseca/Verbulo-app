import 'dart:ui';

import 'package:get/get.dart';
import 'package:verbulo/generated/assets.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": Assets.imagesLesson1,
      "title": "One word daily",
      "description":
          "Learn a new word daily with the help of verbulo,. Learning made easy and fun.",
    },
    {
      "image": Assets.imagesLesson2,
      "title": "Easy to do exercises while you continue with your day",
      "description":
          "Learn a new word daily with the help of verbulo,. Learning made easy and fun.",
    },
    {
      "image": Assets.imagesLesson3,
      "title": "Amaze people with your pronunciation and fluency",
      "description":
          "Learn a new word daily with the help of verbulo,. Learning made easy and fun.",
    },
  ];
  void nextPage(int length, VoidCallback onEnd) {
    if (currentIndex.value < length - 1) {
      currentIndex.value++;
    } else {
      onEnd(); // call the passed function
    }
  }
}
