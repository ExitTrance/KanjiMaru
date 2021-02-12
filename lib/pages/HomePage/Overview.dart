import 'package:KanjiMaru/models/UserModel.dart';
import 'package:KanjiMaru/models/VocabModel.dart';
import 'package:KanjiMaru/pages/HomePage/study.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  int _currentIndex = 0;

  List bottomNavBarPages = [
    {'page': home, 'title': Text('Home')},
    {'page': study, 'title': Text('Study')},
    {'page': settings, 'title': Text('Settings')},
  ];

  static Widget home(BuildContext context) {
    User user = Provider.of<User>(context);
    Vocab vocab = Provider.of<Vocab>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 45.0, left: 9, right: 9),
      child: Column(
        children: [
          //Dashboard Text / Cup / Settings / Profile Picture
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text('Dashboard'),
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

          //Hello Text
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Row(
              children: [
                Container(
                  child: Text(
                    'こんにちは！',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),

          //Menu Items / Remaining Items Queue
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  //Hack for getting some space underneath a underline.
                  child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.amber,
                      width: 1.0, // Underline thickness
                    ))),
                    child: Text(
                      'Overview',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Statistics',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '300 Items in Queue',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Daily Study Goal Box
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: Color(0xFF262A34),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 18, right: 18, bottom: 9.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Daily Study Goal',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF00C2FF),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Chip(
                                        label: Text(
                                          '${user.stats.reviews}/${user.settings.reviewGoal}',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        backgroundColor: Color(0xFF00C2FF),
                                      ),
                                      Text(
                                        ' Reviews',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9.0),
                                child: CircularPercentIndicator(
                                  radius: 90.0,
                                  lineWidth: 10.0,
                                  percent: ((user.stats.reviews) /
                                          (user.settings.reviewGoal))
                                      .clamp(.0, 1.0),
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.favorite),
                                    ],
                                  ),
                                  progressColor: Color(0xFF00C2FF),
                                  backgroundColor: Colors.black87,
                                  backgroundWidth: 3,
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "You're currently on a 5 day streak.",
                                  style: TextStyle(fontSize: 10),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  color: Color(0xFF00C2FF),
                                  child: Text('Quick Study',
                                      style: TextStyle(fontSize: 10)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Vocab and Kanji Box

          Row(
            children: [
              Expanded(
                child: Card(
                  color: Color(0xFF262A34),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, left: 18.0, right: 18.0, bottom: 9.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Vocab',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF9925EA),
                              ),
                            ),
                          ),
                        ),
                        Text('Keep on grinding away at your vocab!',
                            style: TextStyle(fontSize: 10)),
                        Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Studied',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    '205',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF9925EA),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xFF9925EA),
                            child: Text('Study Vocab',
                                style: TextStyle(fontSize: 10)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Color(0xFF262A34),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, left: 18.0, right: 18.0, bottom: 9.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kanji',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFF222D1),
                              ),
                            ),
                          ),
                        ),
                        Text('Lorem Ipsum Dorum Sepsum!',
                            style: TextStyle(fontSize: 10)),
                        Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Studied',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    '95',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFFF222D1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xFFF222D1),
                            child: Text('Study Kanji',
                                style: TextStyle(fontSize: 10)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Games Box
          Row(
            children: [
              Expanded(
                child: Card(
                  color: Color(0xFF262A34),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, left: 18.0, right: 18.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Games',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFCC0A5B),
                                ),
                              ),
                              Icon(Icons.gamepad),
                            ],
                          ),
                        ),
                        Text(
                          'Enjoy our wide variety of learning games, and compete against other players! Guaranteed to get you hooked!',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 10),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xFFCC0A5B),
                            child: Text('Go to Games',
                                style: TextStyle(fontSize: 10)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
    return Scaffold(
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
    );
  }
}
