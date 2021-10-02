//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:readyplates/pages/imagepage.dart';
import 'package:readyplates/pages/login_otp_screen.dart';
//import 'package:readyplates/pages/empty.dart';
import 'package:readyplates/pages/loginpage.dart';
import 'package:readyplates/pages/mappage.dart';
//import 'package:readyplates/pages/mappage.dart';
import 'package:readyplates/pages/onbording.dart';
import 'package:readyplates/pages/otppage.dart';
import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/pages/signuppage.dart';
//import 'package:readyplates/pages/post_serviceapi.dart';
//import 'package:readyplates/pages/signuppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primaryColor:
          // primarySwatch: Colors.blue,
          ),
      debugShowCheckedModeBanner: false,
      // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

      initialRoute: "/loginotp",
      routes: {
        "/onbording": (context) => OnbordingPage(),
        "/loginpage": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/shop": (context) => ShopScreen(),
        "/map": (context) => MapPage(),
        "/image": (context) => ImagePage(),
        "/loginotp": (context) => LoginotpScreen(),
         "/otp": (context) => OtpPage(),
      },
    );
  }
}
