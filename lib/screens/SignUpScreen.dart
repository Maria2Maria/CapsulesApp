import 'package:capsules_app/screens/ChronometerScreen.dart';
import 'package:capsules_app/screens/SignInScreen.dart';
import 'package:capsules_app/screens/colors_and_words_used.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey= GlobalKey<FormState>();
  String username="";
  String email="";
  String password1="";
  String password2="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //design
                Container(margin: EdgeInsets.only(top:ScreenUtil().setHeight(96)),
                 width: ScreenUtil().setWidth(109.04),
                 height: ScreenUtil().setHeight(86),
                  child: SvgPicture.asset("assets/SVG/logo_big.svg", fit: BoxFit.fill),
                ),
                Container(
                    margin: EdgeInsets.only(top:ScreenUtil().setHeight(82.03)),
                    child: Text("Sign Up", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold,color: darkBlue),)),
                //Text fields
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(58)),
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
                      key: ValueKey('username'),
                      validator: (val){
                        if(val.isEmpty || val.length<4){
                          return "Please enter at least 4 characters";
                        }
                        return null;
                      },
                      cursorColor: darkBlue,
                      style: TextStyle(fontWeight: FontWeight.bold,),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.sp),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(color: hintColor,fontSize: 16.sp),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSaved: (value) {
                        username = value.trim();
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
                      key: ValueKey('email'),
                      cursorColor: darkBlue,
                      validator: (val){
                        if(val.isEmpty || !val.contains('@')){
                          return "Please enter a valid email address";
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
                      onSaved: (value) {
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
                        if(val.isEmpty || val.length<7){
                          return "Please enter at least 7 characters";
                        }
                        return null;
                      },
                      cursorColor: darkBlue,
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
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      ),
                      onChanged: (value) {
                        password1 = value.trim();
                      } ,
                      obscureText: true,
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
                        if(val.isEmpty || val!=password1){
                          return "Please enter the same password";
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
                        hintText: "Retype password",
                        hintStyle: TextStyle(color: hintColor,fontSize: 16.sp),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      ),

                      onSaved: (value) {
                        password2 = value.trim();
                      },
                    ),

                  ),
                ),

                SizedBox(
                  height:ScreenUtil().setHeight(58),
                ),
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
                    child: Text("Sign Up",style: TextStyle(color: lightBlue,fontSize: 20.sp),),
                    onPressed: (){
                      final isValid=_formKey.currentState.validate();
                      FocusScope.of(context).unfocus();
                      if(isValid){
                        _formKey.currentState.save();
                        print("$username");
                        print("$email");
                        print("$password1");
                        //to do with data
                        //check if the email doesn't exist, if it exist we send an error message
                        //An account already exists for this email
                        //create a new person with the variable above
                        //add the new user to the database
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) {
                              return Chronometer(1,true);
                            }));
                      }
                    },
                  ),
                ),
                SizedBox(
                  height:ScreenUtil().setHeight(6),
                ),
                //Sign in red
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",style: TextStyle(fontSize: 14.sp),),
                    InkWell(
                      child: Text("Sign In", style: TextStyle(color: red,fontSize: 14.sp),),
                      onTap: (){
                        //change isconnected to true
                        Navigator.of(context).push(MaterialPageRoute(
                            builder:(_){
                              return SignIn();
                            } ));
                      },
                    ),
                  ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
