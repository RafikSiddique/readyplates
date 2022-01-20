import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/food_item_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/edit_button.dart';
import 'package:readyplates/widgets/snackbar.dart';

class FoodItemCard extends GetView<OrderController> {
  final Editing isEditing;
  final FoodItemModel foodItemModel;
  final RestaurantModel restaurantModel;

  const FoodItemCard(
      {Key? key,
      required this.isEditing,
      required this.foodItemModel,
      required this.restaurantModel})
      : super(key: key);
  OrderController get orderController => controller;
  Color color(int i) {
    if (i == 0)
      return Color(0xff7af400);
    else if (i == 1)
      return Color(0xff70e000);
    else if (i == 2)
      return Color(0xff66cc00);
    else if (i == 3)
      return Color(0xff5cb900);
    else if (i == 4)
      return Color(0xff53a500);
    else
      return Color(0xff7af400);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          shadowColor: Color.fromRGBO(188, 202, 224, 0.5),
          margin: EdgeInsets.only(top: 10),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox.square(
                  dimension: size.width * 0.27,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              foodItemModel.image1,
                              fit: BoxFit.cover,
                              height: size.width * 0.22,
                              width: size.width * 0.22,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(Assets.categoryBurger);
                              },
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: (isEditing != Editing.none
                                    ? orderController.orderEdit.any((el) =>
                                        el.foodItem == foodItemModel.id &&
                                        el.restaurant == restaurantModel.id &&
                                        el.foodQuantity.value != 0)
                                    : orderController.cartItems.any((el) =>
                                        el.foodItem.value == foodItemModel.id &&
                                        el.restaurant == restaurantModel.id))
                                ? IncDecButton(
                                    text: isEditing != Editing.none
                                        ? orderController
                                            .geteditItem(foodItemModel.id)
                                            .foodQuantity
                                        : orderController
                                            .getCartItem(foodItemModel.id)
                                            .foodQuantity,
                                    widthFraction: .18,
                                    onIncrement: () {
                                      if (isEditing != Editing.none)
                                        orderController
                                            .incrementEdit(foodItemModel.id);
                                      else
                                        orderController.increment(
                                            foodItemModel.id,
                                            restaurantModel.id);
                                    },
                                    onDecrement: () {
                                      if (isEditing != Editing.none) {
                                        if (isEditing == Editing.confirmed) {
                                          Get.showSnackbar(
                                              MySnackBar.myLoadingSnackBar(
                                            color: MyTheme.verifyButtonColor,
                                            title: 'Warning',
                                            message:
                                                'You cannot decrease any item once the order is confirmed',
                                            icon: Icon(
                                              Icons.warning_amber_rounded,
                                              color: MyTheme.orangelightColor,
                                            ),
                                          ));

                                          // Get.showSnackbar(GetBar(
                                          //   message:
                                          //       "You cannot decrease any item once the order is confirmed",
                                          //   duration: Duration(seconds: 2),
                                          // ));
                                        } else {
                                          orderController
                                              .decrementEdit(foodItemModel.id);
                                        }
                                      } else
                                        orderController.decrement(
                                            foodItemModel.id,
                                            restaurantModel.id);
                                    },
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.15),
                                          offset: Offset(0, 2),
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.030,
                                    child: AddButton(
                                      widthFraction: 0.18,
                                      onTap: () {
                                        if (isEditing == Editing.none) {
                                          if (orderController.cartItems.any(
                                              (element) =>
                                                  element.restaurant !=
                                                  restaurantModel.id)) {
                                            Get.showSnackbar(GetBar(
                                              backgroundColor:
                                                  MyTheme.verifyButtonColor,
                                              titleText: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 6),
                                                child: Text(
                                                  "Info",
                                                  style: GoogleFonts.nunito(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color:
                                                        MyTheme.appbartextColor,
                                                  ),
                                                ),
                                              ),
                                              // title: "Error",
                                              messageText: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 6),
                                                child: Text(
                                                  "Sorry you cannot add items from 2 Restaurants, remove all items from other Restaurants?",
                                                  style: GoogleFonts.nunito(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 17,
                                                    color:
                                                        MyTheme.appbartextColor,
                                                  ),
                                                ),
                                              ),
                                              // message:
                                              //     "Sorry you cannot add items from 2 Restaurant",

                                              isDismissible: true,
                                              mainButton: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, right: 4),
                                                child: TextButton(
                                                  onPressed: () async {
                                                    await orderController
                                                        .removeAllFromRes(
                                                            restaurantModel.id);
                                                    CartModel cartModel = CartModel(
                                                        foodItem: foodItemModel
                                                            .id.obs,
                                                        foodName:
                                                            foodItemModel.name,
                                                        foodImage: foodItemModel
                                                            .image1,
                                                        foodPrice: double.parse(
                                                                foodItemModel
                                                                    .cost)
                                                            .obs,
                                                        restaurant:
                                                            restaurantModel.id,
                                                        user: "",
                                                        foodQuantity: 1.obs);
                                                    orderController.cartItems
                                                        .add(cartModel);
                                                    orderController
                                                        .cart(cartModel);
                                                    Get.back();
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "Remove",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                        color:
                                                            MyTheme.orangeColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ));
                                          } else {
                                            CartModel cartModel = CartModel(
                                                foodItem: foodItemModel.id.obs,
                                                foodName: foodItemModel.name,
                                                foodImage: foodItemModel.image1,
                                                foodPrice: double.parse(
                                                        foodItemModel.cost)
                                                    .obs,
                                                restaurant: restaurantModel.id,
                                                user: "",
                                                foodQuantity: 1.obs);
                                            orderController.cartItems
                                                .add(cartModel);
                                            orderController.cart(cartModel);
                                          }
                                        } else {
                                          if (orderController.orderEdit.any(
                                              (el) =>
                                                  el.foodItem ==
                                                      foodItemModel.id &&
                                                  el.restaurant ==
                                                      restaurantModel.id &&
                                                  el.foodQuantity.value == 0)) {
                                            OrderEditModel model =
                                                orderController.orderEdit
                                                    .firstWhere((el) =>
                                                        el.foodItem ==
                                                            foodItemModel.id &&
                                                        el.restaurant ==
                                                            restaurantModel.id);
                                            int v = controller.orderEdit
                                                .indexOf(model);
                                            controller.orderEdit[v].foodQuantity
                                                .value = 1;
                                            controller.orderEdit[v].foodPrice
                                                    .value =
                                                double.parse(
                                                    foodItemModel.cost);
                                          } else {
                                            OrderEditModel orderEditModel =
                                                OrderEditModel(
                                                    foodName:
                                                        foodItemModel.name,
                                                    orderId:
                                                        orderController.orderId,
                                                    id: -1,
                                                    foodItem:
                                                        foodItemModel.id.obs,
                                                    foodQuantity: 1.obs,
                                                    foodPrice: RxDouble(
                                                        double.parse(
                                                            foodItemModel
                                                                .cost)),
                                                    restaurant:
                                                        restaurantModel.id,
                                                    foodImage:
                                                        foodItemModel.image1,
                                                    isUpdated: false);
                                            orderController.orderEdit
                                                .add(orderEditModel);
                                          }
                                        }
                                      },
                                    ),
                                  ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: size.width * 0.25,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            foodItemModel.name,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: MyTheme.buttonbackgroundColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 29,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                foodItemModel.description,
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, top: 4),
                          child: Container(
                            width: size.width * 0.5,
                            child: Text(
                              (foodItemModel.stdServingSize ==
                                          'Not Applicable' ||
                                      foodItemModel.stdServingSize == 'Other')
                                  ? ''
                                  : foodItemModel.stdServingSize,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: MyTheme.buttonbackgroundColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            foodItemModel.dietType == "1"
                                ? SvgPicture.asset(
                                    "assets/images/vegan.svg",
                                    height: 20,
                                    width: 20,
                                  )
                                : Image.asset(
                                    ("assets/images/veg.png"),
                                    color: foodItemModel.dietType == "2"
                                        ? Color(0xffBC580B)
                                        : null,
                                    height: 20,
                                    width: 20,
                                  ),
                            SizedBox(
                              width: 10,
                            ),
                            ...List.generate(
                              double.parse(foodItemModel.spiceLevel).toInt(),
                              (index) => foodItemModel.category == 'Desserts'
                                  ? Container()
                                  : Image.asset(
                                      Assets.spice,
                                      color: color(index),
                                    ),
                            ),
                            Spacer(),
                            Text("\$ " + foodItemModel.cost,
                                style: GoogleFonts.inter(
                                  color: MyTheme.pricecolor,
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
