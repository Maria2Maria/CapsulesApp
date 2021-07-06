import 'package:capsules_app/screens/SignInScreen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //don't need it, just to work easier
      appBar: AppBar(
        title: Text("Start screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("go to sign in"),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder:(_){
                  return SignIn();
                } ));
          },
        ),
      ),
    );
  }
}
