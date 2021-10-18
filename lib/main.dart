import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/screens/profile_page.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/Order_Screens/Order_cancel_page.dart';
import 'package:readyplates/src/Order_Screens/Order_option.dart';
import 'package:readyplates/src/Order_Screens/Orderpage.dart';
import 'package:readyplates/src/Order_Screens/Payment_page.dart';
import 'package:readyplates/src/Order_Screens/QrCode.dart';
import 'package:readyplates/src/Order_Screens/Shop_page.dart';
import 'package:readyplates/src/Order_Screens/about_location.dart';
import 'package:readyplates/src/Order_Screens/chekout_done.dart';
import 'package:readyplates/src/login/screens/imagepage.dart';

import 'package:readyplates/src/login/screens/mappage.dart';

import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/login/controller/auth_controller.dart';
import 'package:readyplates/src/login/screens/Tell_a_friend.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/routes.dart';
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
      // home: InitializeApp(),
      initialRoute: MyRoutes.orderPage,
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
