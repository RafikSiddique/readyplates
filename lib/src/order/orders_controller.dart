// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
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

  RxDouble total = 0.0.obs;

  late List<FocusNode> otpFields;

  late List<TextEditingController> otpText;

  bool anyInprogress() {
    bool prev = orderItems.any((element) {
      return element.status == OrderState.placed;
    });
    return prev;
  }

  double calclateTotal() {
    total.value = 0;
    for (var item in cartItems) {
      total.value += item.foodQuantity.value * item.foodPrice.value;
    }
    return total.value;
  }

  bool anyPrevious() {
    bool prev = orderItems.any((element) {
      return element.status != OrderState.placed &&
          element.status != OrderState.inProgress;
    });
    return prev;
  }

  RxString otp = "".obs;
  late TextEditingController feedback;
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

  void increment(int id, int resId) async {
    getCartItem(id).foodQuantity++;
    await cart(getCartItem(id));
  }

  void decrement(int id, int resId, [bool isRemoval = false]) async {
    if (!isRemoval) {
      if (getCartItem(id).foodQuantity.value > 1) {
        getCartItem(id).foodQuantity--;
        await cart(getCartItem(id));
      } else {
        CartModel item = getCartItem(id);
        item.foodQuantity = 0.obs;
        cartItems.remove(item);
        await cart(item);
      }
    } else {
      CartModel item = getCartItem(id);
      item.foodQuantity = 0.obs;
      cartItems.remove(item);
      await cart(item);
    }
    calclateTotal();
  }

  CartModel getCartItem(int id) {
    return cartItems.firstWhere((element) => element.foodItem.value == id);
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

  Future<void> updateStatus(int id, int status) async {
    try {
      await services.updateStatus(id, status);
      await getorder();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
