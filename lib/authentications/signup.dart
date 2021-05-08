import 'package:flutter/material.dart';
import 'package:qnswer/authentications/login.dart';
import 'package:qnswer/authentications/service.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();

  void sign_up() async {
    print("Sign up");
    if(_password.text == _cpassword.text){
      bool r = await signing_up(_email.text, _password.text);
      if(r){
        Navigator.pushReplacementNamed(context, '/login');
      }else{
        print("Sign up error");
      }
    }else{
      print("Password doesn't changed");
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
            Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: _cpassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Confirm Password",
                hintText: "Password"
              ),
            ),
            ),
            ElevatedButton(
                child: Text("Sign up"),
                onPressed: () {sign_up();},
                style: ElevatedButton.styleFrom(
                    primary: Colors.tealAccent,
                ),
            ),
            Container(
              child: TextButton(
                child: Text("Log in"),
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            )
        ]
      ),
    ));
  }
}