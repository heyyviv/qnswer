

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qnswer/authentications/service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void check() async {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      Navigator.pushNamed(context, '/signup');
    }
  });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Qnswer"),
          backgroundColor: Colors.tealAccent,
          centerTitle: true,
          actions: [
            ElevatedButton(
              child: Text("Log Out"),
              onPressed: (){ logging_out(); Navigator.pushReplacementNamed(context, '/signup'); },
            )
          ],
        ),
      body: SafeArea(child: Text("Home"),),
    ));
  }
}