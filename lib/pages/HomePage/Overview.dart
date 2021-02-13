import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
                      'こんにちは！',
                      style: TextStyle(fontSize: 20),
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
        TabBar(
          isScrollable: true,
          indicatorColor: Color(0xFFEE892C),
          labelStyle: TextStyle(fontSize: textSizeNav),
          tabs: [
            Tab(text: 'Overview', icon: Icon(Icons.favorite, size: 12)),
            Tab(text: 'Decks', icon: Icon(Icons.favorite, size: 12)),
            Tab(text: 'Calendar', icon: Icon(Icons.favorite, size: 12)),
            Tab(text: 'Statistics', icon: Icon(Icons.favorite, size: 12)),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '300 Items in Queue',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        //Daily Study Goal Box
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
                      top: 9.0, left: 18, right: 18, bottom: 4.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    backgroundColor: Color(0xFF00C2FF),
                                  ),
                                  Text(
                                    ' Reviews',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CircularPercentIndicator(
                            radius: 80.0,
                            lineWidth: 6.0,
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
                      top: 9.0, left: 18.0, right: 18.0, bottom: 4.0),
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
                      top: 9.0, left: 18.0, right: 18.0, bottom: 4.0),
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
                      top: 9.0, left: 18.0, right: 18.0, bottom: 4.0),
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
    );
  }
}
