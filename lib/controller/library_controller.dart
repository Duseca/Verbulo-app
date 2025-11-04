// Controller
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/constants.dart';

class LibraryController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final Map<String, GlobalKey> letterKeys = {};
  final Map<String, double> letterOffsets = {}; // new cache
  String? selectedLetter;

  @override
  void onInit() {
    super.onInit();
    _initializeKeys();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateOffsets(); // precompute offsets
      scrollController.addListener(_onScroll);
    });
  }

  void _initializeKeys() {
    for (var letter in wordData.keys) {
      letterKeys[letter] = GlobalKey();
    }
  }

  /// Precomputes pixel offsets for each letter after the first layout
  void _calculateOffsets() {
    double offset = 0.0;

    for (var entry in wordData.entries) {
      // Each letter section has 1 header + N words
      final itemCount = 1 + entry.value.length;
      const itemHeight = 100.0; // Adjust to match your WordCard + header height
      letterOffsets[entry.key] = offset;
      offset += itemHeight * itemCount;
    }
  }

  void scrollToLetter(String letter) {
    selectedLetter = letter;
    update();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final targetOffset = letterOffsets[letter];
      if (targetOffset != null) {
        final safeOffset = targetOffset.clamp(
          scrollController.position.minScrollExtent,
          scrollController.position.maxScrollExtent,
        );

        scrollController.animateTo(
          safeOffset,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        print('Offset not found for $letter');
      }
    });
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    // Detect visible letter
    double scrollPos = scrollController.offset;
    for (var entry in letterOffsets.entries) {
      if (scrollPos >= entry.value) {
        selectedLetter = entry.key;
      }
    }
    update();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
