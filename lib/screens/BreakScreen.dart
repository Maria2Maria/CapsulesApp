import 'package:capsules_app/screens/colors_and_words_used.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Break extends StatefulWidget {
  @override
  _BreakState createState() => _BreakState();
}

class _BreakState extends State<Break> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //alignment: AlignmentDirectional.bottomStart,
            margin: EdgeInsets.only(top:ScreenUtil().setHeight(832)),
            height: ScreenUtil().setHeight(65),
            width: ScreenUtil().setWidth(414),
            decoration: BoxDecoration(
              color: Colors.red,
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
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(45), ScreenUtil().setHeight(741), 0,0),
            width: ScreenUtil().setWidth(60.67),
            height: ScreenUtil().setHeight(91),
            child: SvgPicture.asset("assets/SVG/pens.svg",
              fit: BoxFit.fill,
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(139), 0,0),
                child: Text("Motivation words",style: TextStyle(
                  color: darkBlue,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Container(
                //color: Colors.deepOrange,
                //margin: EdgeInsets.fromLTRB(0,ScreenUtil().setHeight(84.81), 0,0),
                //width: ScreenUtil().setWidth(23.47),
                //height: ScreenUtil().setHeight(23.55),
                child: SvgPicture.asset("assets/SVG/capsule.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
