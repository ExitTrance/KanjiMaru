import 'package:KanjiMaru/pages/HomePage/Home.dart';
import 'package:KanjiMaru/pages/LoginPage/LoginPage.dart';
import 'package:KanjiMaru/providers/authProviders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    Stream<User?> loggedIn = watch(authState.stream);

    return StreamBuilder<User?>(
      stream: loggedIn,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user != null) {
            return Home();
          }
          return LoginPage();
        } else {
          return Container();
        }
      },
    );
  }
}
