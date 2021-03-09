import 'package:KanjiMaru/providers/authProviders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingPage extends ConsumerWidget {
  LandingPage(this.parentContext);

  final bool loggedIn = false;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    Stream<User> loggedIn = watch(authState.stream);

    return StreamBuilder<User>(
      stream: loggedIn,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          print(user);
          if (user != null) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(context, 'home');
            });
          } else {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(context, 'login');
            });
          }

          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
