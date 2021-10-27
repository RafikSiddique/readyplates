// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/order/orders_api_services.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class OrderController extends GetxController {
  final Orderservices services = Orderservices();
  final SharedPreferenceHelper sfHelper = Get.find();
  RxList<CartModel> cartItems = <CartModel>[].obs;

  RxList<OrderModel> orderItems = <OrderModel>[].obs;

  RxInt numberOfPeople = 1.obs;
  RxInt numberOfTable = 1.obs;

  void onInit() {
    getCart();
    getorder();
    super.onInit();
  }

  List<String> months() => [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

  final List<String> weekDays = [
    "Monday",
    "Tuesday",
    "Wednessday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> getCart() async {
    try {
      String id = await sfHelper.getUserId();
      cartItems.value = await services.getCart(id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void increment(int id) async {
    getCartItem(id).quantity++;
    await cart(getCartItem(id));
  }

  void decrement(int id) async {
    if (getCartItem(id).quantity.value > 1) {
      getCartItem(id).quantity--;
      await cart(getCartItem(id));
    } else
      cartItems.remove(getCartItem(id));
    await cart(getCartItem(id));
  }

  CartModel getCartItem(int id) {
    return cartItems.firstWhere((element) => element.id.value == id);
  }

  Future<void> cart(CartModel cartModel) async {
    try {
      String id = await sfHelper.getUserId();
      await services.addToCartApi(
          id, cartModel.id.string, cartModel.quantity.string);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //post
  Future<void> order() async {
    try {
      String id = await sfHelper.getUserId();
      OrderModel ordermodels = OrderModel(
        user: id,
        restaurant: 'restaurant',
        menu: 'menu',
        name: 'name',
        price: 20,
        quantity: 1,
        noOfTable: 1,
        noOfPeople: 2,
        time: 10.00,
        tax: 10.00,
      );

      await services.orderapi(ordermodels);
      Get.toNamed(Chekoutdone.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //get
  Future<void> getorder() async {
    try {
      String id = await sfHelper.getUserId();
      orderItems.value = await services.getorder(id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
