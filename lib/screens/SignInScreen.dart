import 'package:capsules_app/screens/ChronometerScreen.dart';
import 'package:capsules_app/screens/SignUpScreen.dart';
import 'package:capsules_app/model/person.dart';
import 'package:capsules_app/screens/VerifyEmailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_and_words_used.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey= GlobalKey<FormState>();
  Person P;
  bool isConnected=false;
  String email="";
  String password="";
  String emailfromdata="";
  String passwordfromdata="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //design
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(96)),
                  width: ScreenUtil().setWidth(109.04),
                  height: ScreenUtil().setHeight(86),
                  child: SvgPicture.asset("assets/SVG/logo_big.svg", fit: BoxFit.fill),
                ),
                Container(
                    margin: EdgeInsets.only(top:ScreenUtil().setHeight(88.03)),
                    child: Text("Sign In", style: TextStyle(color:darkBlue,fontSize: 32.sp, fontWeight: FontWeight.bold),)),

                //Text fields
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(62)),
                  width: ScreenUtil().setWidth(312),
                  height: ScreenUtil().setHeight(57),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      boxShape:NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(13.sp),),
                      ),
                      depth: -2,
                      shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                      shadowLightColorEmboss: Colors.white,
                      color: Colors.white,
                    ),
                    child:TextFormField(
                      key: ValueKey('email'),
                      cursorColor: darkBlue,
                      validator: (val){
                        if(val.isEmpty || !val.contains('@')){
                          return "Please enter a valid email address";
                        }else if(email!=emailfromdata){
                          return "Don't have an account with this email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontWeight: FontWeight.bold,),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.sp),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: hintColor,fontSize: 16.sp),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        email = value.trim();
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(24)),
                  width: ScreenUtil().setWidth(312),
                  height: ScreenUtil().setHeight(57),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      boxShape:NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(13.sp),),
                      ),
                      depth: -2,
                      shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                      shadowLightColorEmboss: Colors.white,
                      color: Colors.white,
                    ),
                    child:TextFormField(
                      key: ValueKey('password'),
                      validator: (val){
                        if(val.isEmpty || password!=passwordfromdata){
                          return "Please enter a correct password";
                        }
                        return null;
                      },
                      cursorColor: darkBlue,
                      obscureText: true,
                      style: TextStyle(fontWeight: FontWeight.bold,),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.sp),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: hintColor,fontSize: 16.sp),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSaved: (value) {
                        password = value.trim();
                      },
                    ),
                  ),
                ),

                //forget password in red
                SizedBox(
                  height:ScreenUtil().setHeight(6),
                ),
                Container(
                  margin: EdgeInsets.only(left:ScreenUtil().setHeight(226)),
                  child: InkWell(
                    child: Text("Forgot password?", style: TextStyle(color: red, fontSize: 14.sp),),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder:(_){
                            return VerifyEmail();
                          } ));
                    },
                  ),
                ),
                SizedBox(
                  height:ScreenUtil().setHeight(191),
                ),

                //confirm
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    width: ScreenUtil().setWidth(312),
                    height: ScreenUtil().setHeight(57),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.sp),
                      ),
                      primary: darkBlue,
                    ) ,
                    child: Text("Sign In",style: TextStyle(color: lightBlue,fontSize: 20.sp),),
                    onPressed: (){
                      setState(() {
                        isConnected=true;
                      });
                      final isValid=_formKey.currentState.validate();
                      FocusScope.of(context).unfocus();
                      //We also need to check that the email exists int the database
                      if(isValid){
                        _formKey.currentState.save();
                      //navigator add it here not after, just to test the app
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder:(_){
                            return Chronometer(1,true);
                          } ));
                    },
                  ),
                ),

                //sing un in red
                SizedBox(
                  height:ScreenUtil().setHeight(6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",style: TextStyle(fontSize: 14.sp),),
                    InkWell(
                      child: Text("Sign up", style: TextStyle(color:red,fontSize: 14.sp),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder:(_){
                              return SignUp();
                            } ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
