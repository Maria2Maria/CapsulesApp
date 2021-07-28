import 'package:capsules_app/screens/BreakScreen.dart';
import 'package:capsules_app/screens/ChronometerScreen.dart';
import 'package:capsules_app/screens/ReportScreen.dart';
import 'package:capsules_app/screens/Test.dart';
import 'package:capsules_app/screens/foreground_test.dart';
import 'package:capsules_app/screens/start_screen.dart';
import 'package:capsules_app/screens/typingOldPassword.dart';
import 'package:capsules_app/screens/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: OldPassword(),
      home: StartScreen(),
      //home: Chronometer(1,true),
      //home: Test(),
      //home: Welcome(),
      // home: Report(),

       //home:MyApp2(),
      )
    );
  }
}