import 'package:capsules_app/screens/ChronometerScreen.dart';
import 'package:capsules_app/screens/MyAccountScreen.dart';
import 'package:capsules_app/screens/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_and_words_used.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    //to initialise with the data
    int todaycaps = 0;
    int yesterdaycaps = 0;
    int thisweekcaps = 0;
    int lastweekcaps = 0;
    int thismonthcaps = 0;
    int lastmonthcaps = 0;
    String title1 = "Today";
    String title2 = "Yesterday";
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: ScreenUtil().setHeight(179),
              child: SvgPicture.asset(
                "assets/SVG/recblue.svg",
                fit: BoxFit.fill,
              ),
            ),
            //arrow back
            Container(
              margin: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(51), ScreenUtil().setHeight(61), 0, 0),
              width: ScreenUtil().setWidth(42),
              height: ScreenUtil().setWidth(42),
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
                child: Container(
                  //margin: EdgeInsets.fromLTRB(0,ScreenUtil().setHeight(84.81), 0,0),
                  //width: ScreenUtil().setWidth(40),
                  //height: ScreenUtil().setHeight(14),
                  child: SvgPicture.asset("assets/SVG/arrow_back.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(144), ScreenUtil().setHeight(127), 0, 0),
              child: Text(
                "Report",
                style: TextStyle(
                    fontSize: 30.sp,
                    color: darkBlue,
                    fontWeight: FontWeight.bold),
              ),
            ),

            //bottom bar
            Container(
              //alignment: AlignmentDirectional.bottomStart,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(832)),
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
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Settings();
                        }));
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.description,
                        color: lightBlue,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return MyAccount();
                        }));
                      }),
                ],
              ),
            ),

            //tab Bar
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(220), 0, 0),
                  width: ScreenUtil().setWidth(332),
                  height: ScreenUtil().setHeight(49),
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.5.sp),
                    ),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: darkBlue,
                        borderRadius: BorderRadius.circular(24.5.sp)
                    ),
                    tabs: [
                      Tab(text: "Day",),
                      Tab(text: "Week",),
                      Tab(text: "Month",),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(400),
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(145), 0, 0),
                            height: ScreenUtil().setHeight(62),
                            width: ScreenUtil().setWidth(332),
                            decoration: BoxDecoration(
                              color: darkBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.sp),
                                topRight: Radius.circular(24.sp),
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  "Your capsules",
                                  style: TextStyle(fontSize: 20.sp, color: lightBlue),
                                )),
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), 0, 0, 0),
                            height: ScreenUtil().setHeight(138),
                            width: ScreenUtil().setWidth(332),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24.sp),
                                bottomRight: Radius.circular(24.sp),
                              ),
                              border: Border.all(color: darkBlue),
                            ),
                            child: Table(
                              border: TableBorder.symmetric(
                                inside: BorderSide(
                                  color: darkBlue,
                                ),
                              ),
                              defaultColumnWidth: FixedColumnWidth(166),
                              children: [
                                TableRow(children: [
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Center(child: Text(title1)),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$todaycaps "),
                                        Container(
                                          width: ScreenUtil().setWidth(19),
                                          height: ScreenUtil().setHeight(19),
                                          child: SvgPicture.asset(
                                            "assets/SVG/capsule.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Center(child: Text(title2)),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$yesterdaycaps "),
                                        Container(
                                          width: ScreenUtil().setWidth(19),
                                          height: ScreenUtil().setHeight(19),
                                          child: SvgPicture.asset(
                                            "assets/SVG/capsule.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(145), 0, 0),
                             height: ScreenUtil().setHeight(62),
                            width: ScreenUtil().setWidth(332),
                            decoration: BoxDecoration(
                              color: darkBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.sp),
                                topRight: Radius.circular(24.sp),
                              ),
                              //border: Border.all(color: Colors.blueAccent),
                            ),
                            child: Center(
                                child: Text(
                                  "Your capsules",
                                  style: TextStyle(fontSize: 20.sp, color: lightBlue),
                                )),
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), 0, 0, 0),
                            height: ScreenUtil().setHeight(138),
                            width: ScreenUtil().setWidth(332),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24.sp),
                                bottomRight: Radius.circular(24.sp),
                              ),
                              border: Border.all(color: darkBlue),
                            ),
                            child: Table(
                              border: TableBorder.symmetric(
                                inside: BorderSide(
                                  color: darkBlue,
                                ),
                              ),
                              defaultColumnWidth: FixedColumnWidth(166),
                              children: [
                                TableRow(children: [
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Center(child: Text("This week")),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$thisweekcaps "),
                                        Container(
                                          width: ScreenUtil().setWidth(19),
                                          height: ScreenUtil().setHeight(19),
                                          child: SvgPicture.asset(
                                            "assets/SVG/capsule.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Center(child: Text("Last week")),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$lastweekcaps "),
                                        Container(
                                          width: ScreenUtil().setWidth(19),
                                          height: ScreenUtil().setHeight(19),
                                          child: SvgPicture.asset(
                                            "assets/SVG/capsule.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(145), 0, 0),
                            height: ScreenUtil().setHeight(62),
                            width: ScreenUtil().setWidth(332),
                            decoration: BoxDecoration(
                              color: darkBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.sp),
                                topRight: Radius.circular(24.sp),
                              ),
                              //border: Border.all(color: Colors.blueAccent),
                            ),
                            child: Center(
                                child: Text(
                                  "Your capsules",
                                  style: TextStyle(fontSize: 20.sp, color: lightBlue),
                                )),
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), 0, 0, 0),
                            height: ScreenUtil().setHeight(138),
                            width: ScreenUtil().setWidth(332),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24.sp),
                                bottomRight: Radius.circular(24.sp),
                              ),
                              border: Border.all(color: darkBlue),
                            ),
                            child: Table(
                              border: TableBorder.symmetric(
                                inside: BorderSide(
                                  color: darkBlue,
                                ),
                              ),
                              defaultColumnWidth: FixedColumnWidth(166),
                              children: [
                                TableRow(children: [
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Center(child: Text("This month")),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$thismonthcaps "),
                                        Container(
                                          width: ScreenUtil().setWidth(19),
                                          height: ScreenUtil().setHeight(19),
                                          child: SvgPicture.asset(
                                            "assets/SVG/capsule.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Center(child: Text("Last month")),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(69),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("$lastmonthcaps "),
                                        Container(
                                          width: ScreenUtil().setWidth(19),
                                          height: ScreenUtil().setHeight(19),
                                          child: SvgPicture.asset(
                                            "assets/SVG/capsule.svg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),



            /*Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), ScreenUtil().setHeight(220),0,0),
              width: ScreenUtil().setWidth(332),
              height: ScreenUtil().setHeight(49),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(24.5.sp),
                ),
              ),
              child:Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        tap=1;
                      });
                      print("tap=$tap");
                    },
                    child: Container(
                      //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), ScreenUtil().setHeight(220),0,0),
                      width: ScreenUtil().setWidth(109),
                      height: ScreenUtil().setHeight(49),
                      decoration: BoxDecoration(
                        //color: darkBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.5.sp),
                        ),
                      ),
                      child:(tap==1)? Container(
                        //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), ScreenUtil().setHeight(220),0,0),
                        width: ScreenUtil().setWidth(109),
                        height: ScreenUtil().setHeight(49),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.5.sp),
                          ),
                        ),
                        child: Center(
                          child: Text("Day",style:TextStyle(color: lightBlue)),
                        ),
                      ): Center(
                        child: Text("Day",style:TextStyle(color: darkBlue)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        tap=2;
                      });
                      print("tap=$tap");
                    },
                    child: Container(
                      //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), ScreenUtil().setHeight(220),0,0),
                      width: ScreenUtil().setWidth(109),
                      height: ScreenUtil().setHeight(49),
                      decoration: BoxDecoration(
                        //color: darkBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.5.sp),
                        ),
                      ),
                      child:(tap==2)? Container(
                        margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(109), ScreenUtil().setHeight(220),0,0),
                        width: ScreenUtil().setWidth(109),
                        height: ScreenUtil().setHeight(49),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.5.sp),
                          ),
                        ),
                        child: Center(
                          child: Text("Month",style:TextStyle(color: lightBlue)),
                        ),
                      ): Center(
                        child: Text("Week",style:TextStyle(color: darkBlue)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        tap=3;
                      });
                      print("tap=$tap");
                    },
                    child: Container(
                      //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), ScreenUtil().setHeight(220),0,0),
                      width: ScreenUtil().setWidth(109),
                      height: ScreenUtil().setHeight(49),
                      decoration: BoxDecoration(
                        //color: darkBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24.5.sp),
                        ),
                      ),
                      child:(tap==3)?Container(
                        margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(264), ScreenUtil().setHeight(220),0,0),
                        width: ScreenUtil().setWidth(109),
                        height: ScreenUtil().setHeight(49),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.5.sp),
                          ),
                        ),
                        child: Center(
                          child: Text("Week",style:TextStyle(color: lightBlue)),
                        ),
                      ): Center(
                        child: Text("Month",style:TextStyle(color: darkBlue)),
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
            /* (tap==1)? Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), ScreenUtil().setHeight(220),0,0),
              width: ScreenUtil().setWidth(109),
              height: ScreenUtil().setHeight(49),
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(24.5.sp),
                ),
              ),
              child: Center(
                child: Text("Day",style:TextStyle(color: lightBlue)),
              ),
            ):Container(),
            (tap==2)? Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(153), ScreenUtil().setHeight(220),0,0),
              width: ScreenUtil().setWidth(109),
              height: ScreenUtil().setHeight(49),
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(24.5.sp),
                ),
              ),
              child: Center(
                child: Text("Month",style:TextStyle(color: lightBlue)),
              ),
            ):Container(),
            (tap==3)?Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(264), ScreenUtil().setHeight(220),0,0),
              width: ScreenUtil().setWidth(109),
              height: ScreenUtil().setHeight(49),
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(24.5.sp),
                ),
              ),
              child: Center(
                child: Text("Week",style:TextStyle(color: lightBlue)),
              ),
            ):Container(),*/
            /*Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), ScreenUtil().setHeight(220),0,0),
              width: ScreenUtil().setWidth(109),
              height: ScreenUtil().setHeight(49),
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(24.5.sp),
                ),
              ),
            ),*/

            //the table
           /* SizedBox(
              //height: 300,
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(414), 0, 0),
                        height: ScreenUtil().setHeight(62),
                        width: ScreenUtil().setWidth(332),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.sp),
                            topRight: Radius.circular(24.sp),
                          ),
                          //border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Center(
                            child: Text(
                              "Your capsules",
                              style: TextStyle(fontSize: 20.sp, color: lightBlue),
                            )),
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), 0, 0, 0),
                        height: ScreenUtil().setHeight(138),
                        width: ScreenUtil().setWidth(332),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24.sp),
                            bottomRight: Radius.circular(24.sp),
                          ),
                          border: Border.all(color: darkBlue),
                        ),
                        child: Table(
                          border: TableBorder.symmetric(
                            inside: BorderSide(
                              color: darkBlue,
                            ),
                          ),
                          defaultColumnWidth: FixedColumnWidth(166),
                          children: [
                            TableRow(children: [
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Center(child: Text(title1)),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$cap1 "),
                                    Container(
                                      width: ScreenUtil().setWidth(19),
                                      height: ScreenUtil().setHeight(19),
                                      child: SvgPicture.asset(
                                        "assets/SVG/capsule.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Center(child: Text(title2)),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$cap2 "),
                                    Container(
                                      width: ScreenUtil().setWidth(19),
                                      height: ScreenUtil().setHeight(19),
                                      child: SvgPicture.asset(
                                        "assets/SVG/capsule.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(41), ScreenUtil().setHeight(414), 0, 0),
                        height: ScreenUtil().setHeight(62),
                        width: ScreenUtil().setWidth(332),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.sp),
                            topRight: Radius.circular(24.sp),
                          ),
                          //border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Center(
                            child: Text(
                              "Your capsules",
                              style: TextStyle(fontSize: 20.sp, color: lightBlue),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), 0, 0, 0),
                        height: ScreenUtil().setHeight(138),
                        width: ScreenUtil().setWidth(332),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24.sp),
                            bottomRight: Radius.circular(24.sp),
                          ),
                          border: Border.all(color: darkBlue),
                        ),
                        child: Table(
                          border: TableBorder.symmetric(
                            inside: BorderSide(
                              color: darkBlue,
                            ),
                          ),
                          defaultColumnWidth: FixedColumnWidth(166),
                          children: [
                            TableRow(children: [
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Center(child: Text("This week")),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$cap1 "),
                                    Container(
                                      width: ScreenUtil().setWidth(19),
                                      height: ScreenUtil().setHeight(19),
                                      child: SvgPicture.asset(
                                        "assets/SVG/capsule.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Center(child: Text("Last week")),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$cap2 "),
                                    Container(
                                      width: ScreenUtil().setWidth(19),
                                      height: ScreenUtil().setHeight(19),
                                      child: SvgPicture.asset(
                                        "assets/SVG/capsule.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(41), ScreenUtil().setHeight(414), 0, 0),
                        height: ScreenUtil().setHeight(62),
                        width: ScreenUtil().setWidth(332),
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.sp),
                            topRight: Radius.circular(24.sp),
                          ),
                          //border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Center(
                            child: Text(
                              "Your capsules",
                              style: TextStyle(fontSize: 20.sp, color: lightBlue),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(41), 0, 0, 0),
                        height: ScreenUtil().setHeight(138),
                        width: ScreenUtil().setWidth(332),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24.sp),
                            bottomRight: Radius.circular(24.sp),
                          ),
                          border: Border.all(color: darkBlue),
                        ),
                        child: Table(
                          border: TableBorder.symmetric(
                            inside: BorderSide(
                              color: darkBlue,
                            ),
                          ),
                          defaultColumnWidth: FixedColumnWidth(166),
                          children: [
                            TableRow(children: [
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Center(child: Text("This month")),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$cap1 "),
                                    Container(
                                      width: ScreenUtil().setWidth(19),
                                      height: ScreenUtil().setHeight(19),
                                      child: SvgPicture.asset(
                                        "assets/SVG/capsule.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Center(child: Text("Last month")),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(69),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("$cap2 "),
                                    Container(
                                      width: ScreenUtil().setWidth(19),
                                      height: ScreenUtil().setHeight(19),
                                      child: SvgPicture.asset(
                                        "assets/SVG/capsule.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
