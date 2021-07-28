import 'package:capsules_app/screens/EmailCodeScreen.dart';
import 'package:capsules_app/screens/colors_and_words_used.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:capsules_app/screens/sendingEmail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _formKey= GlobalKey<FormState>();
  String Email;
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //arrow back button
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(51), ScreenUtil().setHeight(61), 0, 0),
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
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(164)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //design
                      Container(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Text(
                        "Verify your Email",
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                      Container(
                      margin: EdgeInsets.only(top:ScreenUtil().setHeight(67)),
                      width: ScreenUtil().setWidth(116.5),
                      height: ScreenUtil().setHeight(133.14),
                      child:
                          SvgPicture.asset("assets/SVG/lock.svg", fit: BoxFit.fill),
                    ),

                      //text field
                      Container(
                      margin: EdgeInsets.only(top:ScreenUtil().setHeight(24)),
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
                          key: ValueKey('email'),
                          cursorColor: darkBlue,
                          validator: (val) {
                            if (val.isEmpty || !val.contains('@')) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.sp),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: hintColor,fontSize: 16.sp),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.email_outlined,color: darkBlue,),
                          ),
                          onSaved: (value) {
                            Email = value.trim();
                          },
                        ),
                      ),
                    ),

                      SizedBox(
                        height: ScreenUtil().setHeight(203),),
                      //confirm
                      ButtonTheme(
                      minWidth: ScreenUtil().setWidth(312),
                      height: ScreenUtil().setHeight(57),
                      child: RaisedButton(
                        color: darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.sp),
                        ),
                        child: Text(
                          "Send Code",
                          style: TextStyle(color: lightBlue,fontSize: 20.sp),
                        ),
                        onPressed: () {
                          final isValid=_formKey.currentState.validate();
                          FocusScope.of(context).unfocus();
                          if(isValid){
                            _formKey.currentState.save();
                          //add Navigator. here
                          }
                          code = randomCode();
                          //SendEmail(code,Email);
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                            return EmailCode(code, Email);
                          }));
                        },
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
