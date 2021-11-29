// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/login/screens/Tell_a_friend.dart';
import 'package:readyplates/src/order/orders_api_services.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class OrderController extends GetxController {
  final Orderservices services = Orderservices();
  final SharedPreferenceHelper sfHelper = Get.find();
  RxList<CartModel> cartItems = <CartModel>[].obs;
  RxList<CartApiModel> cartApiItems = <CartApiModel>[].obs;
  RxList<OrderModelApi> active = <OrderModelApi>[].obs;
  RxList<OrderModelApi> inProgress = <OrderModelApi>[].obs;
  RxList<OrderModelApi> ended = <OrderModelApi>[].obs;

  RxList<OrderEditModel> orderEdit = <OrderEditModel>[].obs;
  RxInt numberOfPeople = 1.obs;
  RxInt numberOfTable = 1.obs;

  RxDouble total = 0.0.obs;

  late List<FocusNode> otpFields;

  late List<TextEditingController> otpText;

  double calclateTotal([bool isEdit = false]) {
    total.value = 0;
    if (isEdit) {
      for (var item in orderEdit) {
        total.value += item.foodPrice.value;
      }
    } else {
      for (var item in cartItems) {
        total.value += item.foodPrice.value;
      }
    }
    return total.value;
  }

  RxString otp = "".obs;

  var rating1 = 0.0;
  var rating2 = 0.0;
  var rating3 = 0.0;
  var rating4 = 0.0;
  late TextEditingController feedback;
  File? imgs;

  void onInit() {
    getCart();
    getorder();
    otpFields = List.generate(4, (index) => FocusNode());
    otpText = List.generate(4, (index) => TextEditingController());
    feedback = TextEditingController();
    super.onInit();
  }

  Future<RestaurantModel> getSingleRestaurant(int id) async {
    try {
      RestaurantModel restaurantModel = await services.getRes(id);
      return restaurantModel;
    } catch (e) {
      throw "";
    }
  }

  void clearController() {
    feedback.clear();
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

  double roundUptoDigits(double number, [int digits = 2]) {
    double mod = pow(10.0, digits) as double;
    return ((number * mod).round().toDouble() / mod);
  }

  void increment(int id, int resId) async {
    CartModel cartModel = getCartItem(id);
    getCartItem(id).foodPrice.value += roundUptoDigits(
        cartModel.foodPrice.value / cartModel.foodQuantity.value);
    getCartItem(id).foodQuantity++;
    calclateTotal();
    cart(getCartItem(id));
  }

  void decrementEdit(int id, [bool isRemoval = false]) {
    if (!isRemoval) {
      if (geteditItem(id).foodQuantity.value > 1) {
        OrderEditModel cartModel = geteditItem(id);
        geteditItem(id).foodPrice.value -= roundUptoDigits(
            cartModel.foodPrice.value / cartModel.foodQuantity.value);
        geteditItem(id).foodQuantity--;
      } else {
        OrderEditModel item = geteditItem(id);
        orderEdit.remove(item);
      }
    } else {
      OrderEditModel item = geteditItem(id);
      orderEdit.remove(item);
    }
    calclateTotal(true);
  }

  void incrementEdit(int id) {
    OrderEditModel cartModel = geteditItem(id);
    geteditItem(id).foodPrice.value += roundUptoDigits(
        cartModel.foodPrice.value / cartModel.foodQuantity.value);
    geteditItem(id).foodQuantity++;
    calclateTotal(true);
  }

  void decrement(int id, int resId, [bool isRemoval = false]) async {
    if (!isRemoval) {
      if (getCartItem(id).foodQuantity.value > 1) {
        CartModel cartModel = getCartItem(id);
        getCartItem(id).foodPrice.value -= roundUptoDigits(
            cartModel.foodPrice.value / cartModel.foodQuantity.value);
        getCartItem(id).foodQuantity--;
        calclateTotal();

        await cart(getCartItem(id));
      } else {
        CartModel item = getCartItem(id);
        item.foodQuantity = 0.obs;
        cartItems.remove(item);
        calclateTotal();

        await cart(item);
      }
    } else {
      CartModel item = getCartItem(id);
      item.foodQuantity = 0.obs;
      cartItems.remove(item);
      calclateTotal();

      await cart(item);
    }
  }

  CartModel getCartItem(int id) {
    return cartItems.firstWhere((element) => element.foodItem.value == id);
  }

  OrderEditModel geteditItem(int id) {
    return orderEdit.firstWhere((element) => element.foodItem.value == id);
  }

  Future<void> cart(CartModel cartModel) async {
    try {
      String id = await sfHelper.getUserId();
      cartModel.user = id;
      await services.addToCartApi(cartModel);
      calclateTotal();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> removeAllFromRes(int resId) async {
    try {
      String id = await sfHelper.getUserId();
      List<CartModel> cartL =
          cartItems.where((p0) => p0.restaurant != resId).toList();
      cartL.forEach((e) {
        CartModel element = getCartItem(e.foodItem.value);
        element.user = id;
        element.foodQuantity = 0.obs;
        cart(element);
      });
      cartItems.clear();
      calclateTotal();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> order(RestaurantModel restaurantModel) async {
    try {
      String id = await sfHelper.getUserId();
      OrderModel orderModel = OrderModel(
          user: int.parse(id),
          orderState: OrderState.placed,
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
          date:
              DateFormat(DateFormat.YEAR_MONTH_DAY).format(selectedDate.value),
          time:
              DateFormat(DateFormat.HOUR24_MINUTE).format(selectedDate.value));
      OrderModelApi orderModelApi = await services.orderapi(orderModel);
      print(orderModelApi);
      await getorder();
      cartApiItems.clear();
      cartItems.forEach((e) {
        CartModel element = getCartItem(e.foodItem.value);
        element.foodQuantity.value = 0;
        element.user = id;
        cart(element);
      });
      cartItems.clear();
      calclateTotal();

      Get.to(() => Chekoutdone(
            orderModelApi: orderModelApi,
          ));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //get
  Future<void> getorder() async {
    try {
      String id = await sfHelper.getUserId();
      final orderList = await services.getorder(id);
      active.value = orderList
          .where((element) => element.status == OrderState.placed)
          .toList();
      active.sort((a, b) => b.id.compareTo(a.id));

      inProgress.value = orderList
          .where((element) => element.status == OrderState.inProgress)
          .toList();
      inProgress.sort((a, b) => b.id.compareTo(a.id));

      ended.value =
          orderList.where((element) => element.status.index > 1).toList();
      ended.sort((a, b) => b.id.compareTo(a.id));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateStatus(int id, int status) async {
    try {
      await services.updateStatus(id, status);
      await getorder();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> feedbacks(String resId, String orderid) async {
    try {
      String userid = await sfHelper.getUserId();
      await services.feedbackapi(
        resId,
        userid,
        orderid,
        rating1.toString(),
        rating2.toString(),
        rating3.toString(),
        rating4.toString(),
        feedback.text,
        imgs,
      );
      rating1 = 0;
      rating2 = 0;
      rating3 = 0;
      rating4 = 0;
      feedback.clear();
      imgs = null;
      Get.offAllNamed(Tellafriend.id);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //
  Future<void> editOrders(
    String orderid,
  ) async {
    try {
      await services.editOrder(orderid, ordermodel);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

//
  Rx<DateTime> globletime = DateTime.now().obs;

  // Future<void> tableList(
  //   int resId,
  // ) async {
  //   globletime.addListener(GetStream(
  //     onListen: () {
  //       print(globletime.value);
  //     },
  //   ));

  //   DateTime end = globletime.value;

  //   try {
  //     String id = await sfHelper.getUserId();
  //     await services.tableconfig(
  //         id,
  //         TableModel(
  //             restaurant: resId,
  //             capacity: numberOfPeople.value,
  //             orderdate: DateFormat(DateFormat.YEAR_MONTH_DAY)
  //                 .format(selectedDate.value),
  //             starttime: DateFormat(DateFormat.HOUR24_MINUTE_SECOND)
  //                 .format(globletime.value),
  //             endtime: DateFormat(DateFormat.HOUR24_MINUTE_SECOND)
  //                 .format(end.add(Duration(minutes: 45)))));
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }
}
