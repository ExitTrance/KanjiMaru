import 'package:flutter/material.dart';

Widget study(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color(0xff0d1124),
            const Color(0xff181921),
          ]),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /* Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Study',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ), */
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StudyListTile(text: 'Learn', icon: Icons.add_to_queue),
            StudyListTile(text: 'Review', icon: Icons.school),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StudyListTile(text: 'Library', icon: Icons.library_books),
            StudyListTile(text: 'Statistics', icon: Icons.show_chart),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StudyListTile(text: 'Chatbot', icon: Icons.chat),
            StudyListTile(text: 'Games', icon: Icons.games),
          ],
        ),
      ],
    ),
  );
}

class StudyListTile extends StatelessWidget {
  StudyListTile({@required this.text, @required this.icon});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PhysicalModel(
          elevation: 5,
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          child: Card(
            color: Colors.transparent,
            margin: EdgeInsets.zero,
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    size: 70,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                ListTile(
                  title: Center(child: Text(text)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
