import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/login/auth_service.dart';
import 'package:readyplates/src/login/screens/ChangePassword2.dart';
import 'package:readyplates/src/login/screens/imagepage.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthenticationServices services = AuthenticationServices();
  final SharedPreferenceHelper sfHelper = Get.find();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController fNamController;
  late TextEditingController lNameController;
  late TextEditingController mobController;
  late TextEditingController password2Controller;
  late TextEditingController dobController;
  late TextEditingController feedback;

  late FocusNode userNameFocus;

  late List<FocusNode> otpFields;

  late List<TextEditingController> otpText;

  RxString otp = "".obs;

  RxBool isNumber = false.obs;

  void onLooseFocus() {
    if (usernameController.text.isEmpty ||
        usernameController.text.contains(RegExp('[a-zA-Z]+'))) {
      isNumber.value = false;
      print(isNumber.value);
    } else {
      isNumber.value = true;
      print(isNumber.value);
    }
  }

  Future<bool> getLoggedIn() async {
    return await sfHelper.getLoggedIn();
  }

  Future<void> setAddress(double lat, double long, String add) async {
    await sfHelper.setLat(lat);
    await sfHelper.setLon(long);
    await sfHelper.setAddress(add);
  }

  @override
  void onInit() {
    sfHelper.getLoggedIn();
    userNameFocus = FocusNode();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    fNamController = TextEditingController();
    lNameController = TextEditingController();
    mobController = TextEditingController();
    password2Controller = TextEditingController();
    dobController = TextEditingController();
    feedback = TextEditingController();
    otpFields = List.generate(4, (index) => FocusNode());
    otpText = List.generate(4, (index) => TextEditingController());
    usernameController.addListener(onLooseFocus);
    userNameFocus.addListener(onLooseFocus);
    super.onInit();
  }

  RxString dob = "".obs;

  RxString address = "".obs;

  Future<bool> getPermission() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnabled) {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        return getPermission();
      } else {
        return true;
      }
    } else {
      await Geolocator.openLocationSettings();
      return getPermission();
    }
  }

  String? id;
  Future<void> login(bool changedPassword, {bool implicit = false}) async {
    try {
      id = await services.login(
          usernameController.text, passwordController.text);
      await sfHelper.setUserId(id!);
      if (!changedPassword) {
        if (implicit) {
          Get.toNamed(ImagePage.id);
        } else {
          Get.put(OrderController());
          bool permitted = await getPermission();
          if (permitted) {
            Position position = await Geolocator.getCurrentPosition();
            LatLng latLng = LatLng(position.latitude, position.longitude);
            Get.to(() => MapPage(
                  isHome: false,
                  latLng: latLng,
                ));
   
          }

          lNameController.clear();
          fNamController.clear();
          password2Controller.clear();
          passwordController.clear();
          usernameController.clear();
          sfHelper.setLoggedIn(true);
        }
      } else {
        passwordController.clear();
        Get.toNamed(ChangePasswordPage1.id);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> changePassword() async {
    try {
      await services.changePassword(
        usernameController.text,
        passwordController.text,
      );
      Get.offAllNamed(LandingPage.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void gotoHome() {
    sfHelper.setLoggedIn(true);
    final c = Get.find<HomeController>();
    c.getAddress();
    c.getRestaurants();

    Get.put(OrderController());
    lNameController.clear();
    fNamController.clear();
    password2Controller.clear();
    passwordController.clear();
    usernameController.clear();
    c.currentIndex.value = 0;
    c.onPageChange(c.currentIndex.value);
    Get.offAllNamed(LandingPage.id);
  }

  Future<void> register() async {
    try {
      await services.register(
          email: usernameController.text,
          password: passwordController.text,
          password2: password2Controller.text,
          fName: fNamController.text,
          lName: lNameController.text,
          gender: gender.value,
          dob: dobController.text,
          mobNum: mobController.text);
      await login(false, implicit: true);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> uploadImage(File file) async {
    try {
      bool success = await services.uploadImage(file);
      if (success) {
        bool permitted = await getPermission();
        if (permitted) {
          Position position = await Geolocator.getCurrentPosition();
          LatLng latLng = LatLng(position.latitude, position.longitude);
          Get.to(() => MapPage(
                isHome: false,
                latLng: latLng,
              ));
        } else {
          LatLng latLng = LatLng(20.708391858928152, -156.32455678019107);

          Get.to(() => MapPage(
                isHome: false,
                latLng: latLng,
              ));
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  RxString gender = 'Male'.obs;
  final items = ['Male', 'Female'];

  void logout() async {
    (await SharedPreferences.getInstance()).clear();
    Get.find<OrderController>().clearController();
    Get.offAllNamed(OnbordingPage.id);
    final c = Get.find<HomeController>();
    c.clear();
  }
}
