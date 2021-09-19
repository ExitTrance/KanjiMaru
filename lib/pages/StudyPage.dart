import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class StudyPage extends StatefulWidget {
  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  FlipCardController flipper = FlipCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10/100'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 40.0,
          right: 40.0,
        ),
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 4,
              child: FlipCard(
                controller: flipper,
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                  color: Theme.of(context).cardColor,
                  child: Center(
                      child: Text(
                    '丸い',
                    style: TextStyle(
                        fontSize: 25, color: Theme.of(context).accentColor),
                  )),
                ),
                back: Container(
                  color: Theme.of(context).cardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Center(
                          child: Text(
                        'Round',
                        style: TextStyle(
                            fontSize: 25, color: Theme.of(context).accentColor),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () => {flipper.toggleCard()},
                            child: Text(
                              'Bad',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () => {flipper.toggleCard()},
                            child: Text(
                              'Good',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
