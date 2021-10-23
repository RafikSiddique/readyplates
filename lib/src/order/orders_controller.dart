// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:readyplates/src/order/orders_api_services.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class Order extends GetxController {
  final Orderservices services = Orderservices();
  final SharedPreferenceHelper sfHelper = Get.find();
  late String user;
  late String food_item;
  late String count;

  Future<void> cart() async {
    try {
      await services.cart(user, food_item, count);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
