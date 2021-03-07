import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/models/VocabModel.dart';
import 'package:KanjiMaru/pages/HomePage/DecksTab.dart';
import 'package:KanjiMaru/pages/HomePage/OverviewTab.dart';
import 'package:KanjiMaru/pages/HomePage/GamesTab.dart';
import 'package:KanjiMaru/pages/HomePage/StatisticsTab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Widget home(BuildContext context) {
    User user = Provider.of<User>(context);
    Vocab vocab = Provider.of<Vocab>(context);

    double textSizeNav = 12.0;
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16, bottom: 8),
      child: Column(
        children: [
          // Dashboard Text / Cup / Settings / Profile Picture
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

          // Greeting Text
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

          // TabBar
          TabBar(
            indicatorPadding: EdgeInsets.only(top: 0),
            labelPadding: EdgeInsets.symmetric(horizontal: 2),
            indicatorColor: Color(0xFFEE892C),
            labelStyle: TextStyle(fontSize: textSizeNav),
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Decks'),
              Tab(text: 'Games'),
              Tab(text: 'Statistics'),
            ],
          ),

          // Tab Bar Items
          Expanded(
            child: TabBarView(children: [
              OverviewTab(user: user),
              DecksTab(),
              games(context),
              StatisticsTab(),
            ]),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: false,
        body: home(context),
      ),
    );
  }
}
