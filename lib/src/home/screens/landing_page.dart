import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/order/screen/Orderpage.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/profile_page.dart';
import 'package:readyplates/src/home/widgets/bottom_navigation_bar.dart';
import 'package:readyplates/src/login/screens/Tell_a_friend.dart';
import 'package:readyplates/src/login/screens/mappage.dart';

class LandingPage extends StatelessWidget {
  static const id = "/landingPage";
  LandingPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  Widget getBody() {
    switch (controller.currentIndex.value) {
      case 0:
        return ShopScreen();
      case 1:
        return MapPage(
          isHome: true,
        );
      case 2:
        return OrderPage();
      case 3:
        return Tellafriend();
      case 4:
        return ProfilePage();
      default:
        return ShopScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => getBody()),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
