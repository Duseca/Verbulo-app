import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/view/screens/quiz/fill_blanks.dart';
import 'package:verbulo/view/screens/quiz/listen_choose.dart';
import 'package:verbulo/view/screens/quiz/synonym_match.dart';

class QuizController extends GetxController {
  static QuizController get instance => Get.find<QuizController>();
  var currentIndex = 0.obs;
  PageController pageController = PageController();
  final List<dynamic> pages = [ListenChoose(), FillBlanks(), SynonymMatch()];

  void nextPage(int length, VoidCallback onEnd) {
    if (currentIndex.value < length - 1) {
      currentIndex.value++;
    } else {
      onEnd(); // call the passed function
    }
  }
}
