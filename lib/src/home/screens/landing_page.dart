import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/screens/restaurant_list.dart';
import 'package:readyplates/src/login/screens/index.dart';
import 'package:readyplates/src/order/screen/order_page.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/profile_page.dart';
import 'package:readyplates/src/home/widgets/bottom_navigation_bar.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  static const id = "/landingPage";
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
          controller.onPageChanged(0);
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
  void initState() {
    if (mounted) {
      setState(() {});
    }
    super.initState();
  }

  void showDialogLocal(BuildContext context) async {
    String userId = await SharedPreferenceHelper().getUserId();
    bool flag = jsonDecode(
            (await http.get(ApiService().customers('checkout/$userId')))
                .body) ??
        false;
    if (flag) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Uh-Oh, You forgot to checkout!",
              style: GoogleFonts.inter(
                color: MyTheme.appbartextColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
            content: Text(
              "Hi, \nYou forgot to checkout from your order.",
              style: GoogleFonts.nunito(
                color: MyTheme.appbartextColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: MyTheme.orangeColor,
                    ),
                  )),
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    controller.onPageChanged(2);
                  },
                  child: Text(
                    "View Orders",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: MyTheme.orangeColor,
                    ),
                  ))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isCheckedOut = false;
    if (!isCheckedOut) {
      showDialogLocal(context);
      isCheckedOut = true;
    }
    return Scaffold(
      body: Obx(() => getBody()),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
