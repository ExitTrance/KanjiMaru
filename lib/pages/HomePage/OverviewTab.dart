import 'package:KanjiMaru/pages/HomePage/Overview_Components/GoalCard.dart';
import 'package:KanjiMaru/pages/HomePage/Overview_Components/QueueCard.dart';
import 'package:flutter/material.dart';
import 'package:KanjiMaru/models/UserModel.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({
    @required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Daily Study Goal Card
        GoalCard(
          cardTheme: Color(0xFF00C2FF),
          titleText: 'Daily Study Goal',
          currentStreak: 5,
          lessonsRemaining: 50,
          reviewsRemaining: 10,
          buttonText: 'Quick Study',
          buttonFunction: () {},
          svgPath: 'assets/icons/goal-svgrepo-com.svg',
          svgSize: 50.0,
          progressRadiusOuter: 80.0,
          progressRadiusInner: 60.0,
          lessonColor: Color(0xFF2DD752),
          reviewColor: Color(0xFF9925EA),
        ),

        // Learn Card
        QueueCard(
          cardTheme: Color(0xFF2DD752),
          titleText: 'Learn',
          contentText: 'Learn new words from your lists.',
          inQueue: 10001,
          buttonText: 'Go Learn',
          svgPath: 'assets/icons/learn.svg',
          buttonFunction: () {},
        ),

        // Review Card
        QueueCard(
          cardTheme: Color(0xFF9925EA),
          titleText: 'Review',
          contentText: 'Review all the vocab you learned so far.',
          inQueue: 900,
          buttonText: 'Go Review',
          svgPath: 'assets/icons/review.svg',
          buttonFunction: () {},
        ),
      ],
    );
  }
}
