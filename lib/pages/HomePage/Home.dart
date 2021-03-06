import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/models/VocabModel.dart';
import 'package:KanjiMaru/pages/HomePage/Overview.dart';
import 'package:KanjiMaru/pages/HomePage/study.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List bottomNavBarPages = [
    {'page': home, 'title': Text('Home')},
    {'page': study, 'title': Text('Study')},
    {'page': settings, 'title': Text('Settings')},
  ];

  static Widget home(BuildContext context) {
    User user = Provider.of<User>(context);
    Vocab vocab = Provider.of<Vocab>(context);

    double textSizeNav = 12.0;
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16, bottom: 8),
      child: Overview(textSizeNav: textSizeNav, user: user),
    );
  }

  static Widget settings(BuildContext context) {
    return Container(
      child: Center(child: Text('')),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff0d1124),
              const Color(0xff181921),
            ]),
      ),
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: <Widget>[
            home(context),
            study(context),
            settings(context),
          ],
        ),
      ),
    );
  }
}
