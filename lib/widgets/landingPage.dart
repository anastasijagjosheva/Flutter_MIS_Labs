import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab_193049/widgets/signInPage.dart';

import '/main.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = null;
          if (user == null) {
            return SignInPage();
          }
          return MyHomePage(title: 'Courses List',);
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}