import 'package:flutter/material.dart';
import 'package:readyplates/pages/imagepage.dart';
import 'package:readyplates/pages/login_otp_screen.dart';
//import 'package:readyplates/pages/empty.dart';
import 'package:readyplates/pages/loginpage.dart';
import 'package:readyplates/pages/mappage.dart';
//import 'package:readyplates/pages/mappage.dart';
import 'package:readyplates/pages/otppage.dart';

import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/login/signuppage.dart';
import 'package:readyplates/src/static_screens/onbording.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/onbording",
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
