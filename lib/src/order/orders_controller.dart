// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/order/orders_api_services.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class OrderController extends GetxController {
  final Orderservices services = Orderservices();
  final SharedPreferenceHelper sfHelper = Get.find();
  RxList<CartModel> cartItems = <CartModel>[].obs;
  RxList<CartApiModel> cartApiItems = <CartApiModel>[].obs;
  RxList<OrderModelApi> orderItems = <OrderModelApi>[].obs;

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
      List<CartApiModel> listOfApi = await services.getCart(id);
      List<CartModel> models = listOfApi
          .map((e) => CartModel(
              user: id,
              foodItem: e.foodItem.id.obs,
              foodName: e.foodItem.name,
              foodQuantity: e.foodQuantity.obs,
              foodImage: e.foodImage,
              foodPrice: e.foodPrice.obs,
              restaurant: e.restaurant))
          .toList();
      cartItems.value = models;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void increment(int id, int resId) async {
    getCartItem(id, resId).foodQuantity++;
    await cart(getCartItem(id, resId));
  }

  void decrement(int id, int resId, [bool isRemoval = false]) async {
    if (!isRemoval) {
      if (getCartItem(id, resId).foodQuantity.value > 1) {
        getCartItem(id, resId).foodQuantity--;
        await cart(getCartItem(id, resId));
      } else {
        CartModel item = getCartItem(id, resId);
        item.foodQuantity = 0.obs;
        cartItems.remove(item);
        await cart(item);
      }
    } else {
      CartModel item = getCartItem(id, resId);
      item.foodQuantity = 0.obs;
      cartItems.remove(item);
      await cart(item);
    }
  }

  CartModel getCartItem(int id, int resId) {
    return cartItems.firstWhere((element) => element.foodItem.value == id);
  }

  Future<void> cart(CartModel cartModel) async {
    try {
      String id = await sfHelper.getUserId();
      cartModel.user = id;
      await services.addToCartApi(cartModel);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> order(RestaurantModel restaurantModel) async {
    try {
      String id = await sfHelper.getUserId();
      OrderModel orderModel = OrderModel(
          user: int.parse(id),
          restaurant: restaurantModel.id,
          orderitems: cartItems
              .map((element) => OrderFoodItem(
                  id: element.foodItem.value,
                  count: element.foodQuantity.value,
                  price: element.foodPrice.value))
              .toList(),
          noOfPeople: numberOfPeople.value,
          noOfTable: numberOfTable.value,
          tax: 50,
          totalprice: 50,
          date: "date",
          time: "time");
      await services.orderapi(orderModel);
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
