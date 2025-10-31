import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/view/screens/register_profile/age_group.dart';
import 'package:verbulo/view/screens/register_profile/gender.dart';
import 'package:verbulo/view/screens/register_profile/learning_path.dart';
import 'package:verbulo/view/screens/register_profile/notification_pref.dart';
import 'package:verbulo/view/screens/register_profile/tell_name.dart';

class LandingController extends GetxController {
  static LandingController get instance => Get.find<LandingController>();
  var currentIndex = 0.obs;
  PageController pageController = PageController();
  final List<dynamic> pages = [
    {
      'title': 'Tell us a bit about you.',
      'subtitle': 'Tell us your name',
      'child': TellName(),
    },
    {
      'title': 'Tell us a bit about you.',
      'subtitle': 'What’s your gender?',
      'child': Gender(),
    },
    {
      'title': 'Select Your Age Group',
      'subtitle': 'How would you rate your English proficiency?',
      'child': AgeGroup(),
    },
    {
      'title': 'You’ve chosen the Teens Learning Path!',
      'subtitle':
          'Here’s what you’ll explore and how Verbulo helps you level up your vocabulary game.',
      'child': LearningPath(),
    },
    {
      'title': 'Learning Goal',
      'subtitle': 'Why are you learning English pronunciation',
      'child': Gender(
        options: [
          'For work / business communication',
          'For studies',
          'For travel',
          'For personal growth / fluency',
          'Other',
        ],
      ),
    },
    {
      'title': 'Notification Preferences',
      'subtitle': 'Stay on track with smart notifications',
      'child': NotificationPref(),
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
