import 'package:flutter/material.dart';
import 'package:qnswer/authentications/service.dart';
import 'package:qnswer/authentications/signup.dart';
import 'package:qnswer/screens/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void log_in() async {
    bool r = await logging_in(_email.text, _password.text);
    if(r){
      print("logged");
      Navigator.pushReplacementNamed(context, '/');
    }else{
      print("login error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :Scaffold(
      appBar: AppBar(
        title: Text("Qnswer"),
        backgroundColor: Colors.tealAccent,
        elevation: 2.0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "someone@email.com"
              ),
            ),
            ),
            Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Password"
              ),
            ),
            ),
           ElevatedButton(
                child: Text("Log in"),
                onPressed: () {log_in();},
                style: ElevatedButton.styleFrom(
                    primary: Colors.tealAccent,
                ),
            ),
            Container(
                child: TextButton(
                child: Text("Sign up"),
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/signup');
                },
              ),
            ),
        ]
      ),
    ),
    );
}
}