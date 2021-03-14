import 'package:flutter/material.dart';

class StudyPage extends StatefulWidget {
  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  bool flipped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10/100'),
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* FlipCard(
              onFlip: () {
                setState(() {
                  flipped = !flipped;
                });
              },
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                height: 400,
                width: 250,
                color: Theme.of(context).primaryColor,
                child: Center(
                    child: Text(
                  '丸い',
                  style: TextStyle(
                      fontSize: 25, color: Theme.of(context).accentColor),
                )),
              ),
              back: Container(
                height: 400,
                width: 250,
                color: Theme.of(context).primaryColor,
                child: Center(
                    child: Text(
                  'Round',
                  style: TextStyle(
                      fontSize: 25, color: Theme.of(context).accentColor),
                )),
              ),
            ), */
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: !flipped
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Bad',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Meh',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            'Good',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
