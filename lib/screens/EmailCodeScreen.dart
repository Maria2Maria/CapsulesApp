import 'package:capsules_app/screens/ChangePasswordScreen.dart';
import 'package:capsules_app/screens/colors_and_words_used.dart';
import 'package:flutter/material.dart';
import 'package:capsules_app/screens/sendingEmail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailCode extends StatefulWidget {
  String code;
  String Email;

  EmailCode(this.code, this.Email);

  @override
  _EmailCodeState createState() => _EmailCodeState(code, Email);
}

class _EmailCodeState extends State<EmailCode> {
  String code;
  String Email;
  String n1="";
  String n2="";
  String n3="";
  String n4="";

  _EmailCodeState(this.code, this.Email);

  @override
  Widget build(BuildContext context) {
    print("$code");
    return Scaffold(
      body: Stack(children: [
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
            child: Icon(
              Icons.arrow_back,
              //Icons.add,
              color: darkBlue,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(164)),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  //design
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: darkBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Type the code",
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(67)),
                    width: ScreenUtil().setWidth(116.5),
                    height: ScreenUtil().setHeight(133.14),
                    child: SvgPicture.asset("assets/SVG/lock.svg",
                        fit: BoxFit.fill),
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(47.86),
                  ),
                  //the 4 squares
                  //they don't have the line inside
                  //change the size of typing text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(67),
                        height: ScreenUtil().setHeight(67),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            //hintText: '___',
                          ),
                          style: TextStyle(fontSize: 30.sp),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            n1 = value.trim();
                          },
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(67),
                        height: ScreenUtil().setHeight(67),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 30.sp),
                          onSaved: (value) {
                            n2 = value.trim();
                          },
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(67),
                        height: ScreenUtil().setHeight(67),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 30.sp),
                          onSaved: (value) {
                            n3 = value.trim();
                          },
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(67),
                        height: ScreenUtil().setHeight(67),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 30.sp),
                          onSaved: (value) {
                            n4 = value.trim();
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: ScreenUtil().setHeight(200),
                  ),

                  //confirm
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
                        "Confirm Code",
                        style: TextStyle(color: lightBlue, fontSize: 20.sp),
                      ),
                      onPressed: () {
                        /*if(code!="$n1$n2$n3$n4"){
                          //show toast code not correct
                        }*/
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return ChangePassword();
                        }));
                      },
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(6),
                  ),
                  InkWell(
                      child: Text(
                        "Recend code!",
                        style: TextStyle(color: red, fontSize: 14.sp),
                      ),
                      onTap: () {
                        code=randomCode();
                        SendEmail(code,Email);
                      }),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
