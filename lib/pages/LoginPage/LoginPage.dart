import 'package:KanjiMaru/pages/LoginPage/LoginComponents/SignInButton.dart';
import 'package:KanjiMaru/pages/LoginPage/LoginComponents/SocialSignInButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:KanjiMaru/services/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  /* Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
            assetName: 'assets/images/LoginPage/google-logo.png',
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
            assetName: 'assets/images/LoginPage/facebook-logo.png',
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.teal,
            onPressed: () {
              context.read<Auth>().signIn(
                    email: 'test@gmail.com',
                    password: '123456789',
                  );
            },
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Guest',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: () {
              context.read<Auth>().signOut();
            },
          ),
        ],
      ),
    );
  }
}
