import 'package:KanjiMaru/pages/ErrorPage.dart';
import 'package:KanjiMaru/services/character_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({this.characterCallback});
  final Function characterCallback;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future characters;

  @override
  void initState() {
    characters = _getCharacters();
    super.initState();
  }

  _getCharacters() async {
    return await loadCharacterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([characters]),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return ErrorPage();
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            //Callback Function
            widget.characterCallback(snapshot.data[0]);
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(context, 'landing');
            });
            return Container();
          }
        },
      ),
    );
  }
}
