import 'package:flutter/material.dart';
import 'package:verbulo/const/global_instances.dart';
import 'package:verbulo/generated/assets.dart';
import 'package:verbulo/view/widgets/moving_icon.dart';
import 'package:verbulo/view/widgets/my_button.dart';
import 'package:verbulo/view/widgets/two_text_column.dart';

class LearningPath extends StatelessWidget {
  const LearningPath({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> options = [
      {
        'title': "Why It's Great",
        'subtitle':
            'At this stage, your vocabulary grows fastest! Build your confidence for school, essays, and conversations by learning words that make your thoughts shine.',
      },
      {
        'title': "What You'll Learn",
        'subtitle':
            'Focus Areas:\n• Advanced vocabulary and phrases used in essays and debates\n• Common idioms and real-life expressions\n• Academic and test prep terms (SAT, ACT, IELTS level)\n• Daily usage tips to make your communication sound natural',
      },
      {
        'title': "How You'll Learn",
        'subtitle':
            'Interactive and Smart Learning Flow:\n• Morning: Word of the Day + example from a teen-relevant context (e.g., sports, social media, school life)\n• Noon: Quiz Time (multiple choice, fill-in-the-blank, or matching)\n• Evening: Reflection + short recap to reinforce memory',
      },
      {
        'title': 'What to Expect',
        'subtitle':
            "Your Journey Includes:\n• 7-Day Streak Tracker\n• Personalized difficulty scaling\n• Pronunciation challenges with real voice samples\n• Weekly review tests to lock in what you've learned",
      },
    ];

    return Column(
      children: [
        MovingIcon(path: Assets.imagesPath, height: 257),
        ListView.builder(
          itemCount: options.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => TwoTextedColumn(
            padVertical: 10,
            space: 5,
            size1: 16,
            size2: 14,
            text1: options[index]['title'] ?? '',
            text2: options[index]['subtitle'] ?? "",
          ),
        ),
        MyButton.filled(
          buttonText: 'Next',
          onTap: () {
            landingController.pageController.nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
          mBottom: 30,
        ),
      ],
    );
  }
}
