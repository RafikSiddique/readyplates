import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/login/screens/imagepage.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
// import 'package:readyplates/pages/shop_screen.dart';
// import 'package:readyplates/src/login/screens/signuppage.dart';
import 'package:readyplates/src/login/services/auth_service.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

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

  String? id;
  Future<void> login([bool implicit = false]) async {
    try {
      id = await services.login(
          usernameController.text, passwordController.text);
      await sfHelper.setUserId(id!);
      if (implicit) {
        Get.toNamed(ImagePage.id);
      } else {
        final c = Get.put(HomeController());
        c.currentIndex.value = 0;
        Get.put(OrderController());
        Get.toNamed(MapPage.id);
        lNameController.clear();
        fNamController.clear();
        password2Controller.clear();
        passwordController.clear();
        usernameController.clear();

        sfHelper.setLoggedIn(true);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void gotoHome() {
    sfHelper.setLoggedIn(true);
    final c = Get.put(HomeController());
    c.getAddress();
    lNameController.clear();
    fNamController.clear();
    password2Controller.clear();
    passwordController.clear();
    usernameController.clear();
    c.currentIndex.value = 0;
    Get.put(OrderController());
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
          dob: dob.value,
          mobNum: mobController.text);
      await login(true);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> uploadImage(File file) async {
    try {
      bool success = await services.uploadImage(file);
      if (success) {
        Get.toNamed(MapPage.id);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  RxString gender = 'Male'.obs;
  final items = ['Male', 'Female'];

  void logout() {
    sfHelper.setLon(0);
    sfHelper.setLat(0);
    sfHelper.setAddress("");
    sfHelper.setLoggedIn(false);
    sfHelper.setUserId("");
    Get.find<OrderController>().dispose();
    Get.offAllNamed(OnbordingPage.id);
    Get.find<HomeController>().dispose();
  }
}
