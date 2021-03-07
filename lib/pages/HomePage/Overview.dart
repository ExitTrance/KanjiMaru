import 'package:KanjiMaru/pages/HomePage/Overview_Components/GoalCard.dart';
import 'package:KanjiMaru/pages/HomePage/Overview_Components/QueueCard.dart';
import 'package:flutter/material.dart';
import 'package:KanjiMaru/models/UserModel.dart';

class Overview extends StatelessWidget {
  const Overview({
    Key key,
    @required this.textSizeNav,
    @required this.user,
  }) : super(key: key);

  final double textSizeNav;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Dashboard Text / Cup / Settings / Profile Picture
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.favorite),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.favorite),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
            child: Text(
              'おはよう！',
              style: TextStyle(fontSize: 24),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),

        // Top Menu
        TabBar(
          indicatorPadding: EdgeInsets.only(top: 0),
          labelPadding: EdgeInsets.symmetric(horizontal: 2),
          indicatorColor: Color(0xFFEE892C),
          labelStyle: TextStyle(fontSize: textSizeNav),
          tabs: [
            Tab(text: 'Overview'),
            Tab(text: 'Decks'),
            Tab(text: 'Calendar'),
            Tab(text: 'Statistics'),
          ],
        ),

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
