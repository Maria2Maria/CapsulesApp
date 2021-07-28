import 'package:capsules_app/screens/colors_and_words_used.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
         children: [
           Column(
             children: [
               Container(
                 margin: EdgeInsets.fromLTRB(
                     40,200, 0, 0),
                 width: 300,
                 height: 50,
                 decoration: BoxDecoration(
                   color: Colors.lightBlue,
                   borderRadius: BorderRadius.all(
                     Radius.circular(24.5),
                   ),
                 ),
                 child: TabBar(
                   indicator: BoxDecoration(
                       color: darkBlue,
                       borderRadius: BorderRadius.circular(24.5)
                   ),
                   tabs: [
                     Tab(text: "Day",),
                     Tab(text: "Week",),
                     Tab(text: "Month",),
                   ],
                 ),
               ),
               SizedBox(
                 height: 300,
                 child: TabBarView(
                   children: [
                     Container(child: Text("day"),),
                     Container(child: Text("week"),),
                     Container(child: Text("month"),),
                   ],
                 ),
               ),
             ],
           ),
         ],
        ),
      ),
    );
  }
}
