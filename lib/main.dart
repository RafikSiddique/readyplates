import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/screens/profile_page.dart';
import 'package:readyplates/src/login/screens/imagepage.dart';

import 'package:readyplates/src/login/screens/mappage.dart';

import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/src/login/screens/Order_option.dart';
import 'package:readyplates/src/login/screens/Shop_page.dart';
import 'package:readyplates/src/login/screens/Tell_a_friend.dart';
import 'package:readyplates/src/login/screens/about_location_page.dart';
import 'package:readyplates/src/login/screens/burgersupportpage.dart';
import 'package:readyplates/src/login/screens/chekout_done_page.dart';

import 'package:readyplates/src/login/screens/order_cancel_page.dart';
import 'package:readyplates/src/login/screens/order_page.dart';
import 'package:readyplates/src/login/screens/payment_page.dart';
import 'package:readyplates/src/login/screens/qrcodecomplete.dart';

import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'src/login/screens/loginpage.dart';
import 'src/login/screens/otppage.dart';
import 'src/login/screens/signuppage.dart';

void main() {
  Get.put(SharedPreferenceHelper());
  Get.put(AuthController());
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: InitializeApp(),
      // initialRoute: "/orderPage",
      routes: {
        OnbordingPage.id: (context) => OnbordingPage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ShopScreen.id: (context) => ShopScreen(),
        MapPage.id: (context) => MapPage(
              isHome: false,
            ),
        ImagePage.id: (context) => ImagePage(),
        "/otp": (context) => OtpPage(),
        "/aboutlocation": (context) => Aboutlocation(),
        "/chekoutdone": (context) => Chekoutdone(),
        "/orderPage": (context) => OrderPage(),
        "/shopPage": (context) => ShopPage(),
        "/burgersupportingPage": (context) => BurgersupportingPage(),
        "/QrCode": (context) => QrCode(),
        "/OrderCancelledPage": (context) => OrderCancelledPage(),
        "/PaymentPage": (context) => PaymentPage(),
        "/OrderOption": (context) => OrderOption(),
        "/tellafriend": (context) => Tellafriend(),
        "/profile": (context) => ProfilePage(),
        LandingPage.id: (context) => LandingPage(),
      },
    );
  }
}

class InitializeApp extends StatefulWidget {
  const InitializeApp({Key? key}) : super(key: key);

  @override
  State<InitializeApp> createState() => _InitializeAppState();
}

class _InitializeAppState extends State<InitializeApp>
    with AfterLayoutMixin<InitializeApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    try {
      SharedPreferenceHelper sfHelper = SharedPreferenceHelper();
      bool isLoggedIn = await sfHelper.getLoggedIn();
      if (!isLoggedIn) {
        Get.offAllNamed(OnbordingPage.id);
      } else {
        Get.offAllNamed(LandingPage.id);
      }
    } catch (e) {
      Get.offAllNamed(OnbordingPage.id);
    }
  }
}
