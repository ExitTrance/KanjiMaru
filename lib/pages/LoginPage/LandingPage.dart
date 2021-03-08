import 'package:KanjiMaru/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  LandingPage(this.parentContext);

  final bool loggedIn = false;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: parentContext.read<Auth>().authStateChanges,
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
