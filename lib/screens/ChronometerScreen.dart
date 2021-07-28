import 'dart:async';

import 'package:capsules_app/screens/MyAccountScreen.dart';
import 'package:capsules_app/screens/ReportScreen.dart';
import 'package:capsules_app/screens/SettingsScreen.dart';
import 'package:capsules_app/screens/colors_and_words_used.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vibration/vibration.dart';

class Chronometer extends StatefulWidget {
  int caps;
  bool countdown;
  Chronometer(this.caps,this.countdown);
  @override
  _ChronometerState createState() => _ChronometerState(caps,countdown);
}

class _ChronometerState extends State<Chronometer> {
  _ChronometerState(this.caps,this.countdown);
  String saved = "00:00";
  var watch = Stopwatch();
  final dur = const Duration(seconds: 1);
  int capsdone=0;
  int caps;
  bool countdown;
  String time;
  bool pause=false;
  bool initialState=true;
  bool capfinished=false;
  void starttimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (watch.isRunning) {
      starttimer();
    }
    setState(() {
      time =countdown?(24-watch.elapsed.inMinutes % 25).toString().padLeft(2, "0") +
          ":" +
          (59-watch.elapsed.inSeconds % 60).toString().padLeft(2, "0"):
      (watch.elapsed.inMinutes % 25).toString().padLeft(2, "0") +
          ":" +
          (watch.elapsed.inSeconds % 60).toString().padLeft(2, "0");

        if (time == '00:00' && countdown) {
          Vibration.vibrate(duration: 1000);
          stopChrono();
          capsdone++;
          capfinished=true;
        }
      else{
        if (time == '25:00') {
          Vibration.vibrate(duration: 1000);
          stopChrono();
          capsdone++;
          capfinished=true;
          showDialog(
              //barrierColor: Color(0xFFE5E5E5).withOpacity(0.3),
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.sp),
              ),

              content: Text('Do you want to stop this sitt'),
              actions: [
                Container(
                width: ScreenUtil().setWidth(93),
                height: ScreenUtil().setHeight(30),
                decoration: BoxDecoration(
                  color: darkBlue,
                borderRadius: BorderRadius.all(
                Radius.circular(10.sp),
                ),
                ),
                  child: InkWell(onTap: (){
                    Navigator.of(context).pop();
                  }, child: Center(child: Text("No continue",style:TextStyle(color: lightBlue)))
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(47),
                  height: ScreenUtil().setHeight(30),
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.sp),
                    ),
                  ),
                 child: InkWell(onTap: (){
                    Navigator.of(context).pop();
                  }, child: Center(child: Text("Yes",style:TextStyle(color: darkBlue)))
                 ),
                ),


              ],
            );
          });
        }
      }
    });
  }

  void startChrono() {
      watch.start();
      starttimer();
  }

  void stopChrono() {
      watch.stop();
  }

  void resetChrono() {
    setState(() {
      watch.reset();
      time = countdown ?"25:00":"00:00";
    });

  }

  void RunStop() {
    setState(() {
      if (watch.isRunning) {
        watch.stop();
      } else {
        watch.start();
        starttimer();
      }
    });
  }

  void savetime(){
    setState(() {
      if(watch.isRunning){
        saved=time;}
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = countdown ?"25:00":"00:00";
    initialState=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
        //bottom bar
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
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: Icon(Icons.settings),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder:(_){
                          return Settings();
                        } ));
                  }),
              IconButton(
                  icon: Icon(Icons.description),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder:(_){
                          return Report();
                        } ));
                  }),
              IconButton(
                  icon: Icon(Icons.person),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder:(_){
                          return MyAccount();
                        } ));
                  }),

            ],
          ),
        ),

        //design
        Container(
          margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(37), ScreenUtil().setHeight(764), 0,0),
          width: ScreenUtil().setWidth(13),
          height: ScreenUtil().setHeight(68),
          child: SvgPicture.asset("assets/SVG/ruler.svg",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), ScreenUtil().setHeight(786), 0,0),
          width: ScreenUtil().setWidth(53.18),
          height: ScreenUtil().setHeight(46),
          child: SvgPicture.asset("assets/SVG/ai.svg",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(269), ScreenUtil().setHeight(761), 0,0),
          width: ScreenUtil().setWidth(59.76),
          height: ScreenUtil().setHeight(74.59),
          child: SvgPicture.asset("assets/SVG/pencil.svg",
            fit: BoxFit.fill,
          ),
        ),

        //motivation words
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(139), 0,0),
              child: Text("Motivation words",style: TextStyle(
                color: darkBlue,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),

        //the watch
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0,ScreenUtil().setHeight(263.81), 0,0),
              child: CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                percent:0.4,// to make it variable
                animation: true,
                animateFromLastPercent: true,
                radius: ScreenUtil().setHeight(260),
                lineWidth: 15.sp,
                progressColor: darkBlue,
                backgroundColor: lightBlue,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$time",
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(23.47),
                          height: ScreenUtil().setHeight(23.55),
                          child: SvgPicture.asset(
                            "assets/SVG/capsule.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5),),
                        Container(
                          width: ScreenUtil().setWidth(37),
                          height: ScreenUtil().setWidth(37),
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child:Center(child: Text("$caps")),
                        ),
                      ],),
                  ],
                ),
              ),
            ),
          ],
        ),
        //musique
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(96), ScreenUtil().setHeight(596), 0,0),
                width: ScreenUtil().setWidth(44),
                height: ScreenUtil().setHeight(44),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: lightBlue,width: 2),
                ),
                //custom the icon in the design and give an adaptive size to it
                child: Center(
                  child: Container(
                    width: ScreenUtil().setWidth(15.99),
                    height: ScreenUtil().setHeight(17.99),
                    child: SvgPicture.asset("assets/SVG/musique_note.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              onTap: (){print("musique started");},
            ),
            Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(135), ScreenUtil().setHeight(596), 0,0),
              width: ScreenUtil().setWidth(44),
              height: ScreenUtil().setHeight(44),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: lightBlue,width: 2),
              ),
              child: Center(child: Text("$capsdone",style: TextStyle(color:darkBlue,),)),
            ),
          ],
        ),
        //Run pause stop buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            initialState? GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(657), 0,0),
                  width: ScreenUtil().setWidth(71),
                  height: ScreenUtil().setHeight(70),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBlue,
                  ),
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(24),
                      height: ScreenUtil().setHeight(27),
                      child: SvgPicture.asset("assets/SVG/play.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  setState(() {
                    initialState=false;
                    pause=true;
                  });
                  startChrono();
                  print("start");
                }
            ) :
            pause? GestureDetector(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(657), 0,0),
                  width: ScreenUtil().setWidth(71),
                  height: ScreenUtil().setHeight(70),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:darkBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(8.33),
                        height: ScreenUtil().setHeight(20),
                        child: SvgPicture.asset("assets/SVG/pause.svg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(8.33),
                        height: ScreenUtil().setHeight(20),
                        child: SvgPicture.asset("assets/SVG/pause.svg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                  ,
                ),
                onTap: (){
                  setState(() {
                    pause=false;
                  });
                  stopChrono();
                }
            ):
            Row(
              children: [
                GestureDetector(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(657), 0,0),
                      width: ScreenUtil().setWidth(71),
                      height: ScreenUtil().setHeight(70),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightBlue,
                      ),

                      child: Center(
                        child: Container(
                          width: ScreenUtil().setWidth(24),
                          height: ScreenUtil().setHeight(27),
                          child: SvgPicture.asset("assets/SVG/play.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        initialState=false;
                        pause=true;
                        startChrono();
                      });

                      print("start");
                    }
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(120), ScreenUtil().setHeight(657), 0,0),
                    width: ScreenUtil().setWidth(62),
                    height: ScreenUtil().setWidth(62),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.sp),
                      ),
                      color: darkBlue,
                    ),
                    child: Center(
                      child: Container(
                        width: ScreenUtil().setWidth(21),
                        height: ScreenUtil().setWidth(21),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.sp),
                          ),
                          color: lightBlue,
                        ),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            boxShape:NeumorphicBoxShape.roundRect(BorderRadius.all(
                              Radius.circular(5.sp),
                            ),
                            ),
                            depth: -5,
                            shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                            shadowLightColorEmboss: lightBlue,
                            color: lightBlue,

                          ),
                          //child: ,
                        ),
                      ),
                    ),
                  ),
                  onTap: (){print("chrono stopped");
                  setState(() {
                    initialState=true;
                    resetChrono();
                  });
                  },
                ),
              ],
            ),
          ],),

      ],
    ),
    );
  }
}
