import 'package:capsules_app/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //don't need it, just to work easier
      appBar: AppBar(
        title: Text("Sign In screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("go to sign up"),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder:(_){
                  return SignUp();
                } ));
          },
        ),
      ),
    );
  }
}
