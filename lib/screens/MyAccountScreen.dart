import 'package:capsules_app/screens/ChangePasswordScreen.dart';
import 'package:capsules_app/screens/ChronometerScreen.dart';
import 'package:capsules_app/screens/SettingsScreen.dart';
import 'package:capsules_app/screens/typingOldPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ReportScreen.dart';
import 'SignInScreen.dart';
import 'colors_and_words_used.dart';
class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: ScreenUtil().setHeight(179),
            child: SvgPicture.asset("assets/SVG/recblue.svg",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(51), ScreenUtil().setHeight(61), 0, 0),
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
                Navigator.of(context).pop();
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
          //bottom bar
          Container(
            //alignment: AlignmentDirectional.bottomStart,
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
                IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return Settings();
                      }));
                    }),
                IconButton(icon: Icon(Icons.description),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return Report();
                      }));
                }),
                IconButton(
                    icon: Icon(Icons.person, color: lightBlue,),
                    onPressed: (){}
                    ),

              ],
            ),
          ),
          Container(
            color: red,
            width: ScreenUtil().setWidth(178),
            height: ScreenUtil().setHeight(26),
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(118), ScreenUtil().setHeight(258), 0, 0),
            child: Text("Your Information"),
          ),

          //barres
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(53), ScreenUtil().setHeight(332), 0, 0),
                width: ScreenUtil().setWidth(310),
                height: ScreenUtil().setHeight(64),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.sp),
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
                //child: Text("name"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(53), ScreenUtil().setHeight(48), 0, 0),
                width: ScreenUtil().setWidth(310),
                height: ScreenUtil().setHeight(64),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.sp),
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
                //child: Text("name"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(53), ScreenUtil().setHeight(48), 0, 0),
                width: ScreenUtil().setWidth(310),
                height: ScreenUtil().setHeight(64),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.sp),
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
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder:(_){
                            return OldPassword();
                          } ));
                    },
                    child: Text("Change your password")),
              ),
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(116),
            height: ScreenUtil().setHeight(24.5),
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(52), ScreenUtil().setHeight(718), 0, 0),
            child: GestureDetector(
              child: SvgPicture.asset("assets/SVG/logout.svg",
                fit: BoxFit.fill,
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder:(_){
                      return SignIn();
                    } ));
                //isconnected=false;
              },
            ),
          ),
        ],
      ),
    );
  }
}
