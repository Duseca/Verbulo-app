import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verbulo/const/app_colors.dart';
import 'package:verbulo/const/app_sizes.dart';
import 'package:verbulo/const/app_styling.dart';
import 'package:verbulo/const/constants.dart';
import 'package:verbulo/controller/library_controller.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/theme/theme_provider.dart';
import 'package:verbulo/view/screens/library/sort_bottom.dart';
import 'package:verbulo/view/screens/library/word_details.dart';
import 'package:verbulo/view/widgets/common_image_view_widget.dart';
import 'package:verbulo/view/widgets/custom_wrap.dart';
import 'package:verbulo/view/widgets/icon_text_row.dart';
import 'package:verbulo/view/widgets/my_text_field.dart';
import 'package:verbulo/view/widgets/my_text_widget.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(
      init: LibraryController(),
      builder: (controller) {
        return Stack(
          children: [
            StackBg(),
            Scaffold(
              appBar: simpleAppBar(
                toolbarheight: 70,
                title: 'Library',
                haveBackButton: false,
                titlesize: 24,
                bgColor: Colors.transparent,
              ),
              body: Stack(
                children: [
                  CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: controller.scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextField2(
                                suffixIcon: Image.asset(
                                  Assets.imagesSearch,
                                  color: getTertiary(context),
                                  height: 24,
                                ),
                                hint: 'Search',
                              ),
                              MyText(
                                text: 'By Categories',
                                paddingBottom: 10,
                                size: 16,
                                weight: wmedium,
                              ),
                              CustomWrap(
                                textcolor: getTertiary(context),
                                textSize: 16,
                                iconSize: 24,
                                bgColor: getquaternary(context),
                                outlineColor: kGrey2Color,
                                items: ['Favorites', 'Emotions', 'Food'],
                                icons: [
                                  Assets.imagesStar2,
                                  Assets.imagesEmotions,
                                  Assets.imagesFood,
                                ],
                                currentIndex: -1,
                              ),
                              const SizedBox(height: 10),
                              const SectionHeader(),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 40,
                          bottom: 20,
                        ),
                        sliver: WordListSliver(controller: controller),
                      ),
                    ],
                  ),
                  AlphabetScroller(controller: controller),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  const SectionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(text: 'All Words', size: 16, weight: wbold),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(SortBottom(), isScrollControlled: true);
          },
          child: IconTextRow(
            expanded: false,
            iconpath: Assets.imagesSort,
            text: 'Sort by',
            iconcolor: getTertiary(context),
            textcolor: getTertiary(context),
            decoration: rounded2r(ktransparent, kGrey2Color, 100),
            padends: 10,
            textsize: 14,
            iconsize: 22,
            padvertical: 5,
          ),
        ),
      ],
    );
  }
}

// Word List Sliver Widget
class WordListSliver extends StatelessWidget {
  final LibraryController controller;

  const WordListSliver({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = _getItemAtIndex(index);
        if (item['type'] == 'header') {
          return LetterHeader(
            key: controller.letterKeys[item['letter']],
            letter: item['letter'],
          );
        } else {
          return WordCard(word: item['word']);
        }
      }, childCount: _getTotalItemCount()),
    );
  }

  int _getTotalItemCount() {
    return wordData.entries.fold(
      0,
      (sum, entry) => sum + 1 + entry.value.length,
    );
  }

  Map<String, dynamic> _getItemAtIndex(int index) {
    int currentIndex = 0;
    for (var entry in wordData.entries) {
      if (currentIndex == index) {
        return {'type': 'header', 'letter': entry.key};
      }
      currentIndex++;

      for (var word in entry.value) {
        if (currentIndex == index) {
          return {'type': 'word', 'word': word};
        }
        currentIndex++;
      }
    }
    return {};
  }
}

// Letter Header Widget
class LetterHeader extends StatelessWidget {
  final String letter;

  const LetterHeader({Key? key, required this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyText(text: letter, size: 0, weight: FontWeight.bold);
  }
}

// Word Card Widget
class WordCard extends StatelessWidget {
  final Map<String, dynamic> word;

  const WordCard({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        Get.to(() => WordDetails());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: rounded2(
          getquaternary(context),
          ThemeUtils.isDarkMode(context) ? ktransparent : kGrey2Color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: word['name'], size: 16, weight: FontWeight.w500),
                Image.asset(
                  word['favorite'] ? Assets.imagesStar3 : Assets.imagesStar4,
                  color: getbtnColor(context),
                  height: 20,
                  width: 20,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: rounded2(getgrey5white(context), ktransparent),
              child: MyText(text: word['definition'], size: 13),
            ),
            const SizedBox(height: 8),
            CustomWrap(currentIndex: -1, items: word['tags'], hasIcon: false),
          ],
        ),
      ),
    );
  }
}

// Alphabet Scroller Widget
class AlphabetScroller extends StatelessWidget {
  final LibraryController controller;

  const AlphabetScroller({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 4,
      top: 0,
      bottom: 0,
      child: GetBuilder<LibraryController>(
        builder: (_) => Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(26, (index) {
                final letter = String.fromCharCode(65 + index);
                final hasData = wordData.containsKey(letter);
                final isSelected = controller.selectedLetter == letter;

                return AlphabetItem(
                  letter: letter,
                  hasData: hasData,
                  isSelected: isSelected,
                  onTap: () {
                    if (hasData) {
                      controller.scrollToLetter(letter);
                    }
                  },
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class AlphabetItem extends StatelessWidget {
  final String letter;
  final bool hasData;
  final bool isSelected;
  final VoidCallback onTap;

  const AlphabetItem({
    Key? key,
    required this.letter,
    required this.hasData,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasData ? onTap : null,
      child: Container(
        width: 16,
        height: 16,
        decoration: isSelected
            ? circle(getTertiary(context), getTertiary(context))
            : BoxDecoration(),
        alignment: Alignment.center,
        child: MyText(
          text: letter,
          size: 10,
          weight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: hasData
              ? (isSelected
                    ? getPrimaryColor(context)
                    : getTertiary(context).withOpacity(0.5))
              : Colors.grey.shade400,
        ),
      ),
    );
  }
}
