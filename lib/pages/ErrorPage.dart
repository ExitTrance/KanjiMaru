import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          /* SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.popAndPushNamed(context, 'lmao');
            }); */
          Container(
        child: Center(
          child: MaterialButton(
            child: Text('Error. Press to try again.'),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
          ),
        ),
      ),
    );
  }
}
