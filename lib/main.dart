

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qnswer/authentications/login.dart';
import 'package:qnswer/authentications/signup.dart';
import 'package:qnswer/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context)=> Home(),
      '/signup': (context) => SignUp(),
      '/login': (context) => Login(),
    }
  ));
  
}



