import 'package:flutter/material.dart';

class DecksTab extends StatelessWidget {
  const DecksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                    subtitle: Text('Active'),
                    isThreeLine: true,
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                  ),
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Genki-1'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2, child: Center(child: Text('Action Button goes here.'))),
        ],
      ),
    );
  }
}
