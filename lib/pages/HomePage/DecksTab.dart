import 'package:flutter/material.dart';

class DecksTab extends StatelessWidget {
  const DecksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(child: Text('Hi.')),
        Expanded(child: Text('Hi.')),
        Expanded(child: Text('Hi.')),
      ],),
    );
  }
}

