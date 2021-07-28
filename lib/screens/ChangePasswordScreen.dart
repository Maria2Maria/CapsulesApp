import 'package:capsules_app/screens/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colors_and_words_used.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          //margin: EdgeInsets.only(top: ScreenUtil().setHeight(164)),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  //design
                  Text(
                    "Change Password",
                    style: TextStyle(
                        color: darkBlue,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:ScreenUtil().setHeight(45)),
                    width: ScreenUtil().setWidth(116.5),
                    height: ScreenUtil().setHeight(133.14),
                    child: SvgPicture.asset("assets/SVG/lock.svg",
                        fit: BoxFit.fill),
                  ),

                  //Text fields
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(47.86)),
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
                          //don't forget to custom your icons at the end
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
                          if (val.isEmpty || val != password1) {
                            return "Please enter the same password";
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
                          hintText: "Retype New password",
                          hintStyle:
                          TextStyle(color: hintColor, fontSize: 16.sp),
                          filled: true,
                          fillColor: Colors.white,
                          //don't forget to custom your icons at the end
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        ),
                        onSaved: (value) {
                          password2 = value.trim();
                        },
                        obscureText: true,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: ScreenUtil().setHeight(163),
                  ),
                  //Confirm
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
                        //add the password to the database or modify it in the database
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          //I don't know where should i go after changing the password, chronometer or signIn
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
    )
    );
  }
}
