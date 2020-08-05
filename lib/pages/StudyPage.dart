import 'package:flutter/material.dart';

class StudyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10/100'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('hi'),
            Text('hi'),
            Card(),
          ],
        ),
      ),
    );
  }
}
