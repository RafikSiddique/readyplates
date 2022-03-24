import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/login/auth_service.dart';
import 'package:readyplates/src/login/screens/ChangePassword2.dart';
import 'package:readyplates/src/login/screens/index.dart';
import 'package:readyplates/src/login/screens/otp_verify_page.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/static_screens/onbording.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/fcm_service.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:readyplates/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String uid = '';
bool isForgotPass = false;

class AuthController extends GetxController {
  final AuthenticationServices services = AuthenticationServices();
  final SharedPreferenceHelper sfHelper = Get.find();
  final ApiService s = ApiService();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController fNamController;
  late TextEditingController lNameController;
  late TextEditingController mobController;
  late TextEditingController password2Controller;
  late TextEditingController dobController;
  late TextEditingController feedback;

  late FocusNode userNameFocus;

  LatLng hawaiiLatLng = LatLng(21.35424135772487, -157.88902572538217);

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

  late List<TextEditingController> otpNumber;
  String otpNum = '';
  late List<FocusNode> otpField;

  RxString otpVerification = "".obs;

  String otpVerified = "OTP Verified";
  String incorrect = "Incorrect OTP";

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
    otpField = List.generate(6, (index) => FocusNode());
    otpNumber = List.generate(6, (index) => TextEditingController());
    usernameController.addListener(onLooseFocus);
    userNameFocus.addListener(onLooseFocus);
    super.onInit();
  }

  RxString dob = "".obs;

  RxString address = "".obs;

  RxBool isLoading = false.obs;

  Future<bool> getPermission() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnabled) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (Platform.isAndroid) {
        if (permission == LocationPermission.denied) {
          GeolocatorPlatform.instance.requestPermission();
          return getPermission();
        } else if (permission == LocationPermission.deniedForever) {
          await Geolocator.openAppSettings();
          return getPermission();
        } else {
          return true;
        }
      } else {
        return true;
      }
    } else {
      await Geolocator.openLocationSettings();
      return getPermission();
    }
  }

  String? id;

  Future<void> setCardDetails({Widget? nextPage}) async {
    try {
      //TODO: call card save API
      bool permitted = await getPermission();
      if (permitted) {
        if (Platform.isAndroid) {
          Position position = await Geolocator.getCurrentPosition();
          LatLng latLng = LatLng(position.latitude, position.longitude);
          Routes.push(
              page: MapPage(
            isHome: false,
            latLng: latLng,
            isLoggedIn: true,
          ));
        } else {
          Routes.push(
              page: MapPage(
            isHome: false,
            latLng: hawaiiLatLng,
            isLoggedIn: true,
          ));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(bool changedPassword,
      {required bool issignup, Widget? nextPage}) async {
    if (await s.isConnected()) {
      try {
        isLoading.value = true;
        id = await services.login(
            usernameController.text.toLowerCase(), passwordController.text);
        await sfHelper.setUserId(id!);
        if (!changedPassword) {
          Get.put(OrderController());
          Get.put(HomeController());
          FirebaseMessagingService();
          if (issignup) {
            Routes.pushReplacement(CreditCardDetailsPage(
              nextPage: nextPage,
            ));
          } else {
            bool permitted = await getPermission();
            if (permitted) {
              if (Platform.isAndroid) {
                Position position = await Geolocator.getCurrentPosition();
                LatLng latLng = LatLng(position.latitude, position.longitude);
                Routes.push(
                    page: MapPage(
                  isHome: false,
                  latLng: latLng,
                  isLoggedIn: true,
                  nextPage: nextPage,
                ));
              } else {
                Routes.push(
                    page: MapPage(
                  isHome: false,
                  isLoggedIn: true,
                  nextPage: nextPage,
                  latLng: hawaiiLatLng,
                ));
              }
            }
          }
          lNameController.clear();
          // fNamController.clear();
          password2Controller.clear();
          passwordController.clear();
          usernameController.clear();
          sfHelper.setLoggedIn(true);
          // }
        } else {
          passwordController.clear();
          Get.toNamed(ChangePasswordPage1.id);
        }
        isLoading.value = false;
      } catch (e) {
        Map resp = json.decode(e.toString());
        String s = resp['ERROR'];
        isLoading.value = false;
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: s.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        } else {
          //There seems to be a server/internet connectivity issue. Please check the same
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> changePassword() async {
    if (await s.isConnected()) {
      try {
        await services.changePassword(
          usernameController.text.toLowerCase(),
          passwordController.text,
        );
        if (isForgotPass == false) {
          Get.put(HomeController());
          Routes.pushAndRemoveUntil(page: LandingPage());
          usernameController.clear();
          passwordController.clear();
          password2Controller.clear();
        } else {
          usernameController.clear();
          passwordController.clear();
          password2Controller.clear();
          for (var i = 0; i < otpNumber.length; i++) {
            otpNumber[i].clear();
          }
          otpVerification = "".obs;
          otpNum = '';
          Routes.push(page: LoginPage());
        }
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        } else {
          //There seems to be a server/internet connectivity issue. Please check the same
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  Future<void> forgotPassword() async {
    if (await s.isConnected()) {
      try {
        await services.forgotPassword(
          usernameController.text.toLowerCase(),
        );
        Get.toNamed(VerifyOtpPage.id);
      } catch (e) {
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString().replaceAll('"', ''),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          //There seems to be a server/internet connectivity issue. Please check the same
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  void gotoHome(double lat, double lon, String address,
      {required bool isLoggedIn, Widget? nextPage}) async {
    await sfHelper.setLoggedIn(isLoggedIn);
    final c = Get.find<HomeController>();

    Get.put(OrderController());
    lNameController.clear();
    // fNamController.clear();
    password2Controller.clear();
    passwordController.clear();
    usernameController.clear();
    c.currentIndex.value = 0;
    FirebaseMessagingService().getToken();
    String s = await c.getAddress();

    print("Initial Address");
    FirebaseMessagingService().getToken();
    print(s);
    if (s == "") {
      print("Address Was empty");
      await setAddress(lat, lon, address);
      await c.getAddress();
      c.address.value = address;
      c.lat.value = lat;
      c.lon.value = lon;
      print("Fetched Address");

      print(c.address);
      c.getRestaurants();
      if (nextPage != null) {
        Routes.pushAndRemoveUntil(page: nextPage);
      } else {
        Routes.pushAndRemoveUntil(page: LandingPage());
      }
    } else {
      print("Address Was not empty");

      c.address.value = address;
      c.lat.value = lat;
      c.lon.value = lon;
      print(c.address);
      c.getRestaurants();
      if (nextPage != null) {
        Routes.pushAndRemoveUntil(page: nextPage);
      } else {
        Routes.pushAndRemoveUntil(page: LandingPage());
      }
    }
  }

  Future<void> register({Widget? nextPage}) async {
    if (await s.isConnected()) {
      try {
        await services.register(
            email: usernameController.text.toLowerCase(),
            password: passwordController.text,
            password2: password2Controller.text,
            fName: fNamController.text,
            lName: lNameController.text,
            gender: gender.value,
            dob: dobController.text,
            mobNum: mobController.text);
        await login(false, issignup: true, nextPage: nextPage);
      } catch (e) {
        Map resp = json.decode(e.toString());
        String s = resp['email'][0];
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: s.toString(),
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
          // Get.snackbar("Error", e.toString());
        } else {
          //There seems to be a server/internet connectivity issue. Please check the same
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message:
                "There seems to be a server/internet connectivity issue. Please check the same",
            icon: FaIcon(
              FontAwesomeIcons.timesCircle,
              color: MyTheme.redColor,
            ),
          ));
        }
      }
    } else {
      Get.showSnackbar(MySnackBar.myLoadingSnackBar(
        title: 'Error',
        message:
            "There seems to be a internet connectivity issue. Please check your connection",
        icon: FaIcon(
          FontAwesomeIcons.timesCircle,
          color: MyTheme.redColor,
        ),
      ));
    }
  }

  String? value;
  RxString gender = ''.obs;
  final List<String> items = ['Male', 'Female'];

  void logout() async {
    (await SharedPreferences.getInstance()).clear();
    Get.find<OrderController>().clearController();
    Routes.pushAndRemoveUntil(page: OnbordingPage());
    // uid = '';
    dobController.clear();
    mobController.clear();
    final c = Get.find<HomeController>();
    c.clear();
  }
}
