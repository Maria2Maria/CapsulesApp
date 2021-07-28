import 'package:capsules_app/screens/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:capsules_app/screens/MyAccountScreen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_and_words_used.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    String password1="";
    String password2="";
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Container(
              height: ScreenUtil().setHeight(179),
              child: SvgPicture.asset("assets/SVG/recblue.svg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setHeight(51), ScreenUtil().setHeight(61), 0, 0),
            width: ScreenUtil().setWidth(42),
            height: ScreenUtil().setHeight(42),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sp),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return MyAccount();
                }));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Icon(
                Icons.arrow_back,
                //Icons.add,
                color: darkBlue,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(144),ScreenUtil().setHeight(127),0,0),
            child: Text("Account", style: TextStyle(fontSize: 30.sp, color: darkBlue,fontWeight: FontWeight.bold),),
          ),
          Container(
            margin: EdgeInsets.only(top:ScreenUtil().setHeight(832)),
            height: ScreenUtil().setHeight(65),
            width: ScreenUtil().setWidth(414),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.sp),
                topRight: Radius.circular(22.sp),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: Icon(Icons.settings), onPressed: (){}),
                IconButton(icon: Icon(Icons.description), onPressed: (){}),
                IconButton(icon: Icon(Icons.person), onPressed: (){}),

              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:ScreenUtil().setHeight(54)),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 20.sp,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:ScreenUtil().setHeight(17)),
                      width: ScreenUtil().setWidth(116.5),
                      height: ScreenUtil().setHeight(133.14),
                      child: SvgPicture.asset("assets/SVG/lock.svg",
                          fit: BoxFit.fill),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(38.86)),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(57),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(
                              Radius.circular(13.sp),
                            ),
                          ),
                          depth: -2,
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                          shadowLightColorEmboss: Colors.white,
                          color: Colors.white,
                        ),

                        child: TextFormField(
                          key: ValueKey('password'),
                          validator: (val) {
                            if (val.isEmpty || val.length < 7) {
                              return "Please enter at least 7 characters";
                            }
                            return null;
                          },
                          cursorColor: darkBlue,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.sp),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Type new password",
                            hintStyle:
                            TextStyle(color: hintColor, fontSize: 16.sp),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          ),
                          onChanged: (value) {
                            password1 = value.trim();
                          },
                          obscureText: true,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
                      width: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(57),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(
                              Radius.circular(13.sp),
                            ),
                          ),
                          depth: -2,
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                          shadowLightColorEmboss: Colors.white,
                          color: Colors.white,
                        ),

                        child: TextFormField(
                          key: ValueKey('password'),
                          validator: (val) {
                            if (val.isEmpty || password1!=password2) {
                              return "Please the same password";
                            }
                            return null;
                          },
                          cursorColor: darkBlue,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.sp),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Retype new password",
                            hintStyle:
                            TextStyle(color: hintColor, fontSize: 16.sp),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          ),
                          onChanged: (value) {
                            password2 = value.trim();
                          },
                          obscureText: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(119),
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
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: lightBlue, fontSize: 20.sp),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return SignIn();
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
