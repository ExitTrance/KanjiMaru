import 'dart:math';

import 'package:KanjiMaru/pages/HomePage/OverviewComponents/GoalCard.dart';
import 'package:KanjiMaru/pages/HomePage/OverviewComponents/QueueCard.dart';
import 'package:KanjiMaru/providers/dbProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue settings = watch(userSettings);
    AsyncValue statistics = watch(userStatistics);

    int streak = statistics.data?.value.currentStreak ?? 0;

    int lessonGoal = settings.data?.value.lessonDailyGoal ?? 0;
    int reviewGoal = settings.data?.value.reviewDailyGoal ?? 0;

    int lessonsDone = statistics.data?.value.lessonsDoneToday ?? 0;
    int reviewsDone = statistics.data?.value.reviewsDoneToday ?? 0;

    return Column(
      children: [
        //Daily Study Goal Card
        GoalCard(
          cardTheme: Color(0xFF00C2FF),
          titleText: 'Daily Study Goal',
          currentStreak: streak,
          lessonsRemaining: max(lessonGoal - lessonsDone, 0),
          reviewsRemaining: max(reviewGoal - reviewsDone, 0),
          buttonText: 'Quick Study',
          buttonFunction: () {
            Navigator.pushNamed(context, 'study');
          },
          svgPath: 'assets/icons/goal-svgrepo-com.svg',
          svgSize: 50.0,
          radiusOuter: 90.0,
          radiusInner: 60.0,
          progressOuter: reviewsDone / reviewGoal,
          progressInner: lessonsDone / lessonGoal,
          lessonColor: Color(0xFF2DD752),
          reviewColor: Color(0xFF9925EA),
        ),

        // Review Card
        QueueCard(
          cardTheme: Color(0xFF9925EA),
          titleText: 'Review',
          contentText: 'Review items which are due',
          inQueue: 0,
          buttonText: 'Go Review',
          svgPath: 'assets/icons/review.svg',
          buttonFunction: () {},
        ),

        // Learn Card
        QueueCard(
          cardTheme: Color(0xFF2DD752),
          titleText: 'Learn',
          contentText: 'Learn new items from your decks',
          inQueue: 10001,
          contentOnly: true,
          buttonText: 'Go Learn',
          svgPath: 'assets/icons/learn.svg',
          buttonFunction: () {},
        ),
      ],
    );
  }
}
