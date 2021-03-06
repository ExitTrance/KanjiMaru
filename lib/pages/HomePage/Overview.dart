import 'package:KanjiMaru/pages/HomePage/Overview_Components/OverviewCard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:KanjiMaru/models/UserModel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
                      'こんにちは！',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
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

        //Menu Items / Remaining Items Queue
        /* TabBar(
          indicatorPadding: EdgeInsets.only(top: 0),
          labelPadding: EdgeInsets.symmetric(horizontal: 2),
          indicatorColor: Color(0xFFEE892C),
          labelStyle: TextStyle(fontSize: textSizeNav),
          tabs: [
            Tab(text: 'Overview', icon: Icon(Icons.favorite, size: 12)),
            Tab(text: 'Decks', icon: Icon(Icons.favorite, size: 12)),
            Tab(text: 'Calendar', icon: Icon(Icons.favorite, size: 12)),
            Tab(text: 'Statistics', icon: Icon(Icons.favorite, size: 12)),
          ],
        ), */

        Row(
          children: [
            Chip(label: Text('Home')),
            Chip(label: Text('Statistics')),
          ],
        ),
        //Daily Study Goal Box
        OverviewCard(
          titleText: 'Daily Study Goal',
          subText: 'You are currently on a 5 day streak!',
          buttonText: 'Quick Study',
          buttonAxisAlignment: MainAxisAlignment.end,
          buttonFunction: () {},
          midContent: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 6.0,
                    percent: 0.2.clamp(.0, 1.0),
                    center: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 6.0,
                      percent: 0.5.clamp(.0, 1.0),
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite),
                        ],
                      ),
                      progressColor: Color(0xFF9925EA),
                      backgroundColor: Color(0xFF363B49),
                      backgroundWidth: 3,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    progressColor: Color(0xFF2DD752),
                    backgroundColor: Color(0xFF363B49),
                    backgroundWidth: 3,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 42.0),
                child: Column(
                  children: [
                    Text(
                      ' Reviews',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      ' Reviews',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Vocab and Kanji Box
        Expanded(
          child: Row(
            children: [
              OverviewCard(
                cardTheme: Color(0xFF2DD752),
                titleText: 'Learn',
                subText: 'Learn new Items',
                midContent: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'Studied',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          '${user.stats.vocabLearned}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF9925EA),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                buttonText: 'Go Learn',
                buttonAxisAlignment: MainAxisAlignment.center,
                buttonFunction: () {},
              ),
              OverviewCard(
                cardTheme: Color(0xFF9925EA),
                titleText: 'Review',
                subText: 'Review old Items',
                midContent: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'Studied',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          '${user.stats.kanjiLearned}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFF222D1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                buttonText: 'Go Review',
                buttonAxisAlignment: MainAxisAlignment.center,
                buttonFunction: () {},
              ),
            ],
          ),
        ),

        //Games Box
        OverviewCard(
          flex: 0,
          cardTheme: Color(0xFFCC0A5B),
          titleText: 'Games',
          subText: '',
          midContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite,
                size: 50,
              ),
              Expanded(
                child: Text(
                  'Enjoy our wide variety of learning games, and compete against other players! Guaranteed to get you hooked!',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
          buttonText: 'Go to Games',
          buttonAxisAlignment: MainAxisAlignment.end,
          buttonFunction: () {},
        ),
      ],
    );
  }
}
