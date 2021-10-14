import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/pages/imagepage.dart';

import 'package:readyplates/pages/mappage.dart';

import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/src/login/screens/about_location_page.dart';
import 'package:readyplates/src/login/screens/chekout_done_page.dart';
import 'package:readyplates/src/login/screens/order_page.dart';

import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

import 'src/login/screens/login_otp_screen.dart';
import 'src/login/screens/loginpage.dart';
import 'src/login/screens/otppage.dart';
import 'src/login/screens/signuppage.dart';

void main() {
  Get.put(SharedPreferenceHelper());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/orderPage",
      routes: {
        OnbordingPage.id: (context) => OnbordingPage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ShopScreen.id: (context) => ShopScreen(),
        MapPage.id: (context) => MapPage(),
        ImagePage.id: (context) => ImagePage(),
        "/loginotp": (context) => LoginotpScreen(),
        "/otp": (context) => OtpPage(),
        "/aboutlocation": (context) => Aboutlocation(),
        "/chekoutdone": (context) => Chekoutdone(),
         "/orderPage": (context) => OrderPage(),

      },
    );
  }
}
