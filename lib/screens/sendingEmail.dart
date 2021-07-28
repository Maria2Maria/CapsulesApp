import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'dart:math';

String randomCode(){
  //I think it is better than a number between 0 and 10000, to don't deal with numbers having 1 or 2 digits
  int a= Random().nextInt(10);
  int b= Random().nextInt(10);
  int c= Random().nextInt(10);
  int d= Random().nextInt(10);

  String code="$a$b$c$d";
  return code;
}
void SendEmail(String code, String email)async{
  //here you need to creat a special email juste for the app
  String emailsending = ""; // an email to send emails from it
  String password = ""; //the password ot that email

  final smtpServer = gmail(emailsending, password);
  // Creating the Gmail server

  // Create our email message.
  final message = Message()
    ..from = Address(emailsending)
    ..recipients.add(email) //recipent email
  //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
  //..bccRecipients.add(Address('bccAddress@example.com')) //bcc Recipents emails
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}' //subject of the email
    ..text = "Your verification code is $code"; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString()); //print if the email is sent
  } on MailerException catch (e) {
    print('Message not sent. \n'+ e.toString()); //print if the email is not sent
    // e.toString(); will show why the email is not sending
  }
}