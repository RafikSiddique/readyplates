import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/screens/restaurant_list.dart';
import 'package:readyplates/src/order/screen/order_page.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/profile_page.dart';
import 'package:readyplates/src/home/widgets/bottom_navigation_bar.dart';
import 'package:readyplates/src/login/screens/Tell_a_friend.dart';
import 'package:readyplates/src/login/screens/mappage.dart';

class LandingPage extends StatelessWidget {
  static const id = "/landingPage";
  LandingPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  Future<void> getPosition() async {
    Position position = (await Geolocator.getCurrentPosition());
    controller.lat.value = position.latitude;
    controller.lon.value = position.longitude;
  }

  Widget getBody() {
    switch (controller.currentIndex.value) {
      case 0:
        return ShopScreen();
      case 1:
        return Obx(() {
          if (controller.lat.value == 0 && controller.lon.value == 0) {
            getPosition();
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return MapPage(
              isHome: true,
              latLng: LatLng(controller.lat.value, controller.lon.value),
            );
          }
        });

      case 2:
        return OrderPage(() {
          controller.onPageChange(0);
        });
      case 3:
        return Tellafriend(
          isHome: true,
        );
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
