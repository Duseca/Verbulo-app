import 'package:flutter/material.dart';
import 'package:verbulo/view/screens/home/home_widgets.dart';
import 'package:verbulo/view/widgets/simple_app_bar.dart';
import 'package:verbulo/view/widgets/stack_bg.dart';

class WordDetails extends StatelessWidget {
  const WordDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          StackBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //  SizedBox(height: 40),
              simpleAppBar(title: 'Library', titlesize: 24),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 20),
                    Pronounce(),
                    SizedBox(height: 10),
                    Breakdown(),
                    SizedBox(height: 10),
                    Meaning(),
                    SizedBox(height: 10),
                    UsageExamples(),
                    Container(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
