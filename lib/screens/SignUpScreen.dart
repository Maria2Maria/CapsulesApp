import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //don't need it, just to work easier
      appBar: AppBar(
        title: Text("Sign Up screen"),
      ),
    );
  }
}
