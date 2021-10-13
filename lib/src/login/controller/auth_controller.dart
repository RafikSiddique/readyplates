import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/pages/imagepage.dart';
import 'package:readyplates/pages/mappage.dart';
// import 'package:readyplates/pages/shop_screen.dart';
import 'package:readyplates/src/login/screens/loginpage.dart';
// import 'package:readyplates/src/login/screens/signuppage.dart';
import 'package:readyplates/src/login/services/auth_service.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class AuthController extends GetxController {
  final AuthenticationServices services = AuthenticationServices();
  final SharedPreferenceHelper sfHelper = Get.find();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final fNamController = TextEditingController();
  final lNameController = TextEditingController();
  final mobController = TextEditingController();
  final password2Controller = TextEditingController();
  final dobController = TextEditingController();
  RxString dob = "".obs;

  String? id;
  Future<void> login() async {
    try {
      id = await services.login(
          usernameController.text, passwordController.text);
      sfHelper.setUserId(id!);
      Get.toNamed(ImagePage.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
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
      Get.toNamed(LoginPage.id);
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
}
