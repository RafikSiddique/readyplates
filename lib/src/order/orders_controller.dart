// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/models/table_model.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/login/screens/Tell_a_friend.dart';
import 'package:readyplates/src/order/orders_api_services.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';
import 'package:readyplates/widgets/snackbar.dart';

class OrderController extends GetxController {
  final Orderservices services = Orderservices();
  final SharedPreferenceHelper sfHelper = Get.find();
  final ApiService s = ApiService();
  RxList<CartModel> cartItems = <CartModel>[].obs;
  RxList<CartApiModel> cartApiItems = <CartApiModel>[].obs;
  RxList<OrderModelApi> active = <OrderModelApi>[].obs;
  RxList<OrderModelApi> inProgress = <OrderModelApi>[].obs;
  RxList<OrderModelApi> Served = <OrderModelApi>[].obs;
  RxList<OrderModelApi> ended = <OrderModelApi>[].obs;

  RxList<OrderEditModel> orderEdit = <OrderEditModel>[].obs;
  late TextEditingController tipAmountController;
  RxInt numberOfPeople = 1.obs;

  RxDouble total = 0.0.obs;
  List<String> categories = ["Starter", "Main Course", "Desserts", "Sides"];
  RxString isDesserts = ''.obs;

  int orderId = -1;

  late List<FocusNode> otpFields;

  late List<TextEditingController> otpText;

  double calclateTotal([bool isEdit = false]) {
    total.value = 0;
    if (isEdit) {
      for (var item in orderEdit) {
        if (item.foodQuantity.value != 0) {
          total.value += item.foodPrice.value;
        }
      }
    } else {
      for (var item in cartItems) {
        total.value += item.foodPrice.value;
      }
    }
    return total.value;
  }

  Future<int> getAvailableTables(String id, int tableId) async {
    if (await s.isConnected()) {
      try {
        List<TableModel> tables = await services.getAvailableTable(id);
        int tableNo = tables.indexWhere((element) => element.id == tableId);
        return tableNo + 1;
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
        return -1;
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
      return -1;
    }
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
    tipAmountController = TextEditingController();
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
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getUserId();
        List<CartApiModel> listOfApi = await services.getCart(id);
        List<CartModel> models = listOfApi
            .where((element) => element.foodQuantity != 0)
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
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
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
        int v = orderEdit.indexOf(item);
        orderEdit[v].foodQuantity.value = 0;
        orderEdit[v].foodPrice.value = 0;
        calclateTotal(true);
      }
    } else {
      OrderEditModel item = geteditItem(id);
      int v = orderEdit.indexOf(item);
      orderEdit[v].foodQuantity.value = 0;
      orderEdit[v].foodPrice.value = 0;
      calclateTotal(true);
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
      item.foodPrice = 0.0.obs;
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
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getUserId();
        cartModel.user = id;

        await services.addToCartApi(cartModel);
        calclateTotal();
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

  Future<void> removeAllFromRes(int resId) async {
    if (await s.isConnected()) {
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
        if (e.runtimeType != SocketException) {
          Get.showSnackbar(MySnackBar.myLoadingSnackBar(
            title: 'Error',
            message: e.toString(),
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

  Future<void> order(RestaurantModel restaurantModel) async {
    if (await s.isConnected()) {
      try {
        String id = await sfHelper.getUserId();
        OrderModel orderModel = OrderModel(
            user: int.parse(id),
            payment: "",
            feedbackstat: "",
            orderState: OrderState.placed,
            restaurant: restaurantModel.id,
            orderitems: cartItems
                .map((element) => OrderFoodItem(
                    id: element.foodItem.value,
                    count: element.foodQuantity.value,
                    price: element.foodPrice.value))
                .toList(),
            noOfPeople: numberOfPeople.value,
            table: null,
            tax: 50,
            totalprice: calclateTotal(),
            date: DateFormat(DateFormat.YEAR_MONTH_DAY)
                .format(selectedDate.value),
            time: DateFormat(DateFormat.HOUR24_MINUTE)
                .format(selectedDate.value));
        OrderModelApi orderModelApi = await services.orderapi(orderModel);
        print(orderModelApi);
        cartApiItems.clear();
        cartItems.forEach((e) async {
          CartModel element = getCartItem(e.foodItem.value);
          element.foodQuantity.value = 0;
          element.user = id;
          await cart(element);
        });
        cartItems.clear();
        calclateTotal();
        await getorder();
        Get.offAllNamed(LandingPage.id);
        Get.find<HomeController>().currentIndex.value = 2;
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

  //get
  Future<void> getorder() async {
    if (await s.isConnected()) {
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

        Served.value = orderList
            .where((element) => element.status == OrderState.Served)
            .toList();
        Served.sort((a, b) => b.id.compareTo(a.id));

        ended.value =
            orderList.where((element) => element.status.index > 2).toList();
        ended.sort((a, b) => b.id.compareTo(a.id));
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

  Future<void> updateStatus(int id, OrderState status) async {
    if (await s.isConnected()) {
      try {
        await services.updateStatus(id, status.index);
        await getorder();
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

  Future<void> updateTip(int id, String tip) async {
    if (await s.isConnected()) {
      try {
        await services.updatetip(id, tip);
        await getorder();
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

/*   Future<int> getOrderCount(int restaurant, DateTime date) async {
    try {
      int data = await services.orderCount(restaurant, date.toString());
      return data;
    } catch (e) {
      return 0;
    }
  } */

  Future<bool> getAutoOrder(String resid) async {
    if (await s.isConnected()) {
      try {
        bool data = await services.getAutoOrder(resid.toString());
        return data;
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

        return true;
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
      return true;
    }
  }

  Future<void> updateFeedback(String id, int feedback) async {
    if (await s.isConnected()) {
      try {
        await services.updateFeedback(id, feedback);
        await getorder();
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

  Future<void> updatePayment(int id, int status) async {
    if (await s.isConnected()) {
      try {
        await services.updatePayment(id, status);

        await getorder();
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

  Future<void> feedbacks(String resId, String orderid) async {
    if (await s.isConnected()) {
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
        await updateFeedback(orderid, 1);
        rating1 = 0;
        rating2 = 0;
        rating3 = 0;
        rating4 = 0;
        feedback.clear();
        imgs = null;
        Get.offAllNamed(Tellafriend.id);
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

  //
  Future<void> editOrders() async {
    if (await s.isConnected()) {
      try {
        orderEdit.forEach((element) async {
          if (element.id == -1) {
            await services.putOrder(element);
          } else {
            await services.patchOrder(element);
          }
        });
        await getorder();
        Get.offAllNamed(LandingPage.id);
        Get.find<HomeController>().currentIndex.value = 2;
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

//
  Rx<DateTime> globletime = DateTime.now().obs;
}
