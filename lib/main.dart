import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/screens/profile_page.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/order/screen/Order_cancel_page.dart';
import 'package:readyplates/src/order/screen/Order_option.dart';
import 'package:readyplates/src/order/screen/Orderpage.dart';
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
import 'package:readyplates/src/order/screen/booking_details.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'src/login/screens/loginpage.dart';
import 'src/login/screens/signuppage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SharedPreferenceHelper());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          popupMenuTheme: PopupMenuThemeData(
            enableFeedback: true,
          ),
          dividerColor: MyTheme.orderbordercolor),
      debugShowCheckedModeBanner: false,
      home: InitializeApp(),
      routes: {
        OnbordingPage.id: (context) => OnbordingPage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ShopScreen.id: (context) => ShopScreen(),
        MapPage.id: (context) => MapPage(
              isHome: false,
            ),
        ImagePage.id: (context) => ImagePage(),
        Aboutlocation.id: (context) => Aboutlocation(),
        Chekoutdone.id: (context) => Chekoutdone(),
        OrderPage.id: (context) => OrderPage(),
        ShopPage.id: (context) => ShopPage(),
        BurgersupportingPage.id: (context) => BurgersupportingPage(),
        QrCode.id: (context) => QrCode(),
        OrderCancelledPage.id: (context) => OrderCancelledPage(),
        PaymentPage.id: (context) => PaymentPage(),
        OrderOption.id: (context) => OrderOption(),
        Tellafriend.id: (context) => Tellafriend(),
        ProfilePage.id: (context) => ProfilePage(),
        LandingPage.id: (context) => LandingPage(),
        BookingDetails.id: (c) => BookingDetails(),
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
        Get.put(HomeController());
        Get.put(OrderController());
        Get.offAllNamed(LandingPage.id);
      }
    } catch (e) {
      Get.offAllNamed(OnbordingPage.id);
    }
  }
}
