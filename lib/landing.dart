import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class landing extends StatefulWidget {
  const landing({Key? key}) : super(key: key);

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return home();
          } else {
            return fireauth();
          }
        },
      ),
    );
  }
}