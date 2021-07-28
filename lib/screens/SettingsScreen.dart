import 'package:capsules_app/screens/ChronometerScreen.dart';
import 'package:capsules_app/screens/MyAccountScreen.dart';
import 'package:capsules_app/screens/ReportScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_and_words_used.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool countdown=true;
  int caps=1;
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
          //arrow back button
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
                Navigator.of(context).pop();
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  //Icons.add,
                  color: darkBlue,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setHeight(144),ScreenUtil().setHeight(127),0,0),
            child: Text("Timer Setting", style: TextStyle(fontSize: 30.sp, color: darkBlue,fontWeight: FontWeight.bold),),
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
                    icon: Icon(Icons.settings,color: lightBlue,),
                    onPressed: (){
                    }),
                IconButton(icon: Icon(Icons.description,),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return Report();
                      }));
                    }),
                IconButton(
                    icon: Icon(Icons.person),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return MyAccount();
                      }));
                    }),

              ],
            ),
          ),

          // capsules number
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(342),ScreenUtil().setHeight(246),0,0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(caps<4)
                        caps++;
                    });
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(22),
                    height: ScreenUtil().setWidth(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.all(
                        Radius.circular(5.sp),
                      ),
                      border: Border.all(color: lightBlue),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF88C4E5).withOpacity(0.67),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(child: Text("+", style: TextStyle(color: lightBlue,fontSize: 14.sp),)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(10)),
                  width: ScreenUtil().setWidth(22),
                  height: ScreenUtil().setWidth(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.all(
                      Radius.circular(5.sp),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF88C4E5).withOpacity(0.67),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(child: Text("$caps", style: TextStyle(color: lightBlue,fontSize: 14.sp),)),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(caps>1)
                      caps--;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top:ScreenUtil().setHeight(10)),
                    width: ScreenUtil().setWidth(22),
                    height: ScreenUtil().setWidth(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.all(
                        Radius.circular(5.sp),
                      ),
                      border: Border.all(color: lightBlue),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF88C4E5).withOpacity(0.67),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(child: Text("--", style: TextStyle(color: lightBlue,fontSize: 14.sp),)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(51),ScreenUtil().setHeight(277),0,0),
            child: Text("Capsules count", style: TextStyle( fontSize:20.sp ),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(53),ScreenUtil().setHeight(309),0,0),
            child: Text("Your Break",style: TextStyle( fontSize:14.sp ),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(133),ScreenUtil().setHeight(310),0,0),
            child: Text("05:00", style: TextStyle(color: lightBlue,fontSize:14.sp ),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(51),ScreenUtil().setHeight(411),0,0),
            child: Text("Timer Mode"),
          ),

          // count down
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(71),ScreenUtil().setHeight(474),0,0),
            child: Text("count down"),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(71),ScreenUtil().setHeight(507),0,0),
            width: ScreenUtil().setWidth(292),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("25:00"),
                ),
                Container(
                  margin: EdgeInsets.only(left:ScreenUtil().setWidth(40)),
                  width: ScreenUtil().setWidth(32),
                  height: ScreenUtil().setHeight(25),
                  child: SvgPicture.asset("assets/SVG/thick_arrow.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:ScreenUtil().setWidth(40)),
                  child: Text("00:00"),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      countdown=true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left:ScreenUtil().setWidth(55)),
                    width: ScreenUtil().setWidth(22),
                    height: ScreenUtil().setWidth(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.all(
                        Radius.circular(5.sp),
                      ),
                      border: Border.all(color: lightBlue),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF88C4E5).withOpacity(0.67),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: countdown ?
                        Center(
                          child: Container(
                            width: ScreenUtil().setWidth(10),
                            height: ScreenUtil().setWidth(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.sp),
                              ),
                              color: lightBlue,
                            ),
                    ),
                        ):Container(),
                  ),
                ),

              ],
            ),
          ),


          //count up

          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(71),ScreenUtil().setHeight(570),0,0),
            child: Text("count Up"),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(71),ScreenUtil().setHeight(603),0,0),
            width: ScreenUtil().setWidth(292),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("00:00"),
                ),
                Container(
                  width: ScreenUtil().setWidth(32),
                  height: ScreenUtil().setHeight(25),
                  child: SvgPicture.asset("assets/SVG/thick_arrow.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: Text("25:00"),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      countdown=false;
                    });
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(22),
                    height: ScreenUtil().setWidth(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.all(
                        Radius.circular(5.sp),
                      ),
                      border: Border.all(color: lightBlue),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF88C4E5).withOpacity(0.67),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: countdown ? Container():Center(
                      child: Container(
                        width: ScreenUtil().setWidth(10),
                        height: ScreenUtil().setWidth(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2.sp),
                          ),
                          color: lightBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(51),ScreenUtil().setHeight(719),0,0),
            child: ConstrainedBox(
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
                child: Text("Confirm",style: TextStyle(color: lightBlue,fontSize: 20.sp),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder:(_){
                        return Chronometer(caps,countdown);
                      } ));

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
