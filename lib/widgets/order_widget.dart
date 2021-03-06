// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/feedback_page.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/home/screens/index.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/order/screen/booking_details.dart';
import 'package:readyplates/src/order/screen/tip_sucessfull_page.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/form_field.dart';
import 'package:readyplates/widgets/snackbar.dart';

class OrderWidget extends StatelessWidget {
  final OrderModelApi orderModel;

  final Function(TapDownDetails) showMenu;
  OrderWidget({Key? key, required this.orderModel, required this.showMenu})
      : super(key: key);
  OrderController controller = Get.find();

  Future<void> editOrder(BuildContext context) async {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox.square(
          dimension: Get.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox.square(
                  dimension: 100,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        MyTheme.borderchangeColor),
                  )),
            ],
          ),
        ),
      ),
    );
    RestaurantModel restaurantModel =
        await controller.getSingleRestaurant(orderModel.restaurant.id);

    controller.orderId = orderModel.id;

    controller.orderEdit.value = orderModel.orderitems
        .map((e) => OrderEditModel(
            foodName: e.menu.name,
            orderId: orderModel.id,
            id: e.id,
            foodItem: RxInt(e.menu.id),
            foodQuantity: RxInt(e.quantity),
            foodPrice: RxDouble(double.parse(e.price)),
            restaurant: orderModel.restaurant.id,
            foodImage: e.menu.image1,
            isUpdated: false))
        .toList();
    controller.calclateTotal(true);
    Navigator.pop(context);
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => BurgersupportingPage(
            restaurantModel: restaurantModel,
            isEditing: orderModel.status == 0
                ? Editing.unconfirmed
                : Editing.confirmed,
            orderModelApi: orderModel,
          ),
        ));
  }

  Widget bottomWidget(BuildContext context) {
    // double size = MediaQuery.of(context).size.width;
    switch (orderModel.status) {
      case OrderState.placed:
        return Column(
          children: [
            Container(
              child: Text(
                "Report at the restaurant and share PIN to initiate order",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: MyTheme.switchButtonColor,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < controller.otpFields.length; i++)
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xff00ADB5),
                          )),
                      width: 40,
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Text(
                        orderModel.pin.toString()[i],
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ))
              ],
            ),
          ],
        );
      case OrderState.inProgress:
        return Column(
          children: [
            Elevated(
              width: Get.width,
              text: "Modify Order",
              onTap: () async {
                editOrder(context);
              },
              backgroundColor: Colors.white,
              color: MyTheme.orangeColor,
              borderColor: MyTheme.orangeColor,
            ),
            SizedBox(
              height: 10,
            ),
            // Elevated(
            //   backgroundColor: Color(0xff44C4A1),
            //   text: "Complete Order",
            //   onTap: () {
            //     // if (orderModel.payment == "0" || orderModel.payment == "") {
            //     //   Navigator.push(
            //     //       context,
            //     //       CupertinoPageRoute(
            //     //         builder: (context) => PaymentPage(
            //     //           orderModelApi: orderModel,
            //     //           isOrderComplete: true,
            //     //         ),
            //     //       ));

            //     // } else{}

            //     if (orderModel.feedbackstat == "") {
            //       Navigator.push(
            //           context,
            //           CupertinoPageRoute(
            //             builder: (context) => FeedbackPage(
            //               e: orderModel,
            //               isComplete: true,
            //             ),
            //           ));
            //     } else {
            //       controller.updateStatus(orderModel.id, OrderState.completed);
            //     }
            //   },
            //   width: Get.width,
            // ),
          ],
        );
      case OrderState.Served:
        return Column(
          children: [
            // Elevated(
            //   width: Get.width,
            //   text: "Modify Order",
            //   onTap: () async {
            //     editOrder(context);
            //   },
            //   backgroundColor: Colors.white,
            //   color: Color(0xff44C4A1),
            //   borderColor: Color(0xff44C4A1),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Elevated(
              backgroundColor: MyTheme.orangeColor,
              color: MyTheme.appbackgroundColor,
              text: "Checkout -->",
              onTap: () async {
                // if (orderModel.payment == "0" || orderModel.payment == "") {
                //   Navigator.push(
                //       context,
                //       CupertinoPageRoute(
                //         builder: (context) => PaymentPage(
                //           orderModelApi: orderModel,
                //           isOrderComplete: true,
                //         ),
                //       ));

                // } else{}
                // await controller.updateStatus(
                //     orderModel.id, OrderState.completed);
                controller.tipAmountController.clear();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      buttonPadding: EdgeInsets.only(left: 13, right: 13),
                      actionsAlignment: MainAxisAlignment.center,
                      contentPadding:
                          EdgeInsets.only(left: 13, top: 20, bottom: 20),
                      actionsPadding: EdgeInsets.only(bottom: 5),
                      titlePadding: EdgeInsets.only(
                        left: 13,
                        top: 15,
                      ),
                      title: Text(
                        'Tip for Restaurant',
                        style: GoogleFonts.inter(
                          color: MyTheme.appbartextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      content: Text(
                        'Do you wish to add a tip?',
                        style: GoogleFonts.nunito(
                          color: MyTheme.appbartextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      actions: [
                        Elevated(
                          height: 44,
                          width: Get.width * 0.32,
                          backgroundColor: MyTheme.orangeColor,
                          color: MyTheme.appbackgroundColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          text: 'Yes',
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  buttonPadding:
                                      EdgeInsets.only(left: 13, right: 13),
                                  actionsAlignment: MainAxisAlignment.center,
                                  contentPadding: EdgeInsets.only(
                                      left: 13, top: 20, bottom: 20, right: 13),
                                  actionsPadding: EdgeInsets.only(bottom: 5),
                                  titlePadding: EdgeInsets.only(
                                    left: 13,
                                    top: 15,
                                  ),
                                  scrollable: true,
                                  title: Text(
                                    'Enter Tip Amount',
                                    style: GoogleFonts.inter(
                                      color: MyTheme.appbartextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  content: Container(
                                    // height: 50,
                                    child: AppFormField(
                                      toptext: '',
                                      controller:
                                          controller.tipAmountController,
                                      hintText: '\$20',
                                      inputType: TextInputType.phone,
                                    ),
                                  ),
                                  actions: [
                                    Elevated(
                                      height: 44,
                                      width: Get.width * 0.32,
                                      backgroundColor: MyTheme.orangeColor,
                                      color: MyTheme.appbackgroundColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      text: 'Confirm',
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      onTap: () {
                                        if (controller.tipAmountController.text
                                            .isNotEmpty) {
                                          Navigator.pop(context);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                buttonPadding: EdgeInsets.only(
                                                    right: 13, left: 13),
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                contentPadding: EdgeInsets.only(
                                                    left: 14.5,
                                                    top: 20,
                                                    bottom: 20,
                                                    right: 13),
                                                actionsPadding: EdgeInsets.only(
                                                    bottom: 5, left: 2),
                                                titlePadding: EdgeInsets.only(
                                                  left: 14.5,
                                                  top: 15,
                                                ),
                                                title: Text(
                                                  'Confirm Tip Amount',
                                                  style: GoogleFonts.inter(
                                                    color:
                                                        MyTheme.appbartextColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                                content: Text(
                                                  '\$${controller.tipAmountController.text} will be given as a tip, are you sure?',
                                                  style: GoogleFonts.nunito(
                                                    color:
                                                        MyTheme.appbartextColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                                actions: [
                                                  Elevated(
                                                    height: 44,
                                                    width: Get.width * 0.35,
                                                    backgroundColor:
                                                        MyTheme.orangeColor,
                                                    color: MyTheme
                                                        .appbackgroundColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    text: 'Confirm',
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    onTap: () async {
                                                      await controller.updateTip(
                                                          orderModel.id,
                                                          controller
                                                              .tipAmountController
                                                              .text);
                                                      await controller
                                                          .updateStatus(
                                                              orderModel.id,
                                                              OrderState
                                                                  .completed);
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                          builder: (context) =>
                                                              TipsucessfullPage(
                                                            orderModel:
                                                                orderModel,
                                                          ),
                                                        ),
                                                      );
                                                      controller
                                                          .tipAmountController
                                                          .clear();
                                                    },
                                                  ),
                                                  Elevated(
                                                    height: 44,
                                                    width: Get.width * 0.35,
                                                    backgroundColor: MyTheme
                                                        .appbackgroundColor,
                                                    color: MyTheme.orangeColor,
                                                    borderColor:
                                                        MyTheme.orangeColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    text: 'Cancel',
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    onTap: () {
                                                      Get.back();
                                                      controller
                                                          .tipAmountController
                                                          .clear();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          Get.showSnackbar(
                                              MySnackBar.myLoadingSnackBar(
                                            title: 'Tip',
                                            message: "Please add a tip amount",
                                            icon: Icon(
                                              Icons.error_outline_rounded,
                                              color: MyTheme.blueColor,
                                            ),
                                          ));
                                          // Get.snackbar(
                                          //   "Tip",
                                          //   "Please add amount",
                                          //   backgroundColor: Colors.white,
                                          // );
                                        } // await controller.updateStatus(
                                        //     orderModel.id,
                                        //     OrderState.completed);
                                        // Navigator.push(
                                        //     context,
                                        //     CupertinoPageRoute(
                                        //       builder: (context) =>
                                        //           FeedbackPage(
                                        //         e: orderModel,
                                        //         isComplete: true,
                                        //       ),
                                        //     ));
                                        // controller.tipAmountController.clear();
                                      },
                                    ),
                                    Elevated(
                                      height: 44,
                                      width: Get.width * 0.32,
                                      backgroundColor:
                                          MyTheme.appbackgroundColor,
                                      color: MyTheme.orangeColor,
                                      borderColor: MyTheme.orangeColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      text: 'Cancel',
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      onTap: () {
                                        Get.back();
                                        controller.tipAmountController.clear();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        Elevated(
                          height: 44,
                          width: Get.width * 0.32,
                          backgroundColor: MyTheme.appbackgroundColor,
                          color: MyTheme.orangeColor,
                          borderColor: MyTheme.orangeColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          text: 'No',
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          onTap: () async {
                            await controller.updateStatus(
                                orderModel.id, OrderState.completed);
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => TipsucessfullPage(
                                  orderModel: orderModel,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );

                // Navigator.push(
                //     context,
                //     CupertinoPageRoute(
                //       builder: (context) => FeedbackPage(
                //         e: orderModel,
                //         isComplete: true,
                //       ),
                //     ));

                // if (orderModel.feedbackstat == "") {
                //   Navigator.push(
                //       context,
                //       CupertinoPageRoute(
                //         builder: (context) => FeedbackPage(
                //           e: orderModel,
                //           isComplete: true,
                //         ),
                //       ));
                // } else {
                //   controller.updateStatus(orderModel.id, OrderState.Served);
                // }
              },
              width: Get.width,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      case OrderState.completed:
        return Column(
          children: [
            Elevated(
              color: MyTheme.appbackgroundColor,
              width: Get.width,
              text: "Order Again",
              onTap: () async {
                controller.cartItems.clear();
                orderModel.orderitems.forEach((e) {
                  controller.cartItems.add(CartModel(
                      user: "",
                      foodItem: e.menu.id.obs,
                      foodQuantity: e.quantity.obs,
                      foodName: e.menu.name,
                      foodImage: e.menu.image1,
                      foodPrice: double.parse(e.price).obs,
                      restaurant: orderModel.restaurant.id));
                  print('menu image 11111111111 ${e.menu.image1}');
                });
                RestaurantModel restaurantModel = await controller
                    .getSingleRestaurant(orderModel.restaurant.id);
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          BookingDetails(restaurantModel, Editing.none),
                    ),
                    (route) => route.settings.name == LandingPage.id);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Elevated(
              color: orderModel.feedbackstat == ""
                  ? MyTheme.orangeColor
                  : MyTheme.verifyTextColor,
              backgroundColor: Colors.white,
              width: Get.width,
              borderColor: orderModel.feedbackstat == ""
                  ? MyTheme.orangeColor
                  : MyTheme.verifyTextColor,
              text: "Give Feedback",
              onTap: () {
                if (orderModel.feedbackstat == "") {
                  Get.to(() => FeedbackPage(
                        e: orderModel,
                        isComplete: false,
                      ));
                } else {
                  Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                    title: 'Info',
                    message: "Feedback Already Provided",
                    icon: Icon(
                      Icons.error_outline_rounded,
                      color: MyTheme.blueColor,
                    ),
                  ));
                  // Get.showSnackbar(GetBar(
                  //   message: "Feedback Already Provided",
                  //   duration: Duration(seconds: 1),
                  // ));
                }
              },
            ),
          ],
        );
      case OrderState.cancelled:
        return Elevated(
          text: "Cancelled",
          backgroundColor: MyTheme.cancelOrderBackColor,
          color: MyTheme.cancelOrderTextColor,
          width: Get.width,
          onTap: () {},
        );

      default:
        return Elevated(
          color: MyTheme.appbackgroundColor,
          width: Get.width,
          text: "Order Again",
          onTap: () async {
            orderModel.orderitems.forEach((e) {
              controller.cartItems.add(CartModel(
                  user: "",
                  foodItem: e.menu.id.obs,
                  foodQuantity: e.quantity.obs,
                  foodName: e.menu.name,
                  foodImage: e.menu.image1,
                  foodPrice: double.parse(e.price).obs,
                  restaurant: orderModel.restaurant.id));
            });
            RestaurantModel restaurantModel =
                await controller.getSingleRestaurant(orderModel.restaurant.id);
            controller.selectedDate.value = DateTime.now();
            controller.numberOfPeople.value = 1;
            controller.globletime.value = DateTime.now();
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      BookingDetails(restaurantModel, Editing.none),
                ),
                (route) => route.settings.name == LandingPage.id);
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(188, 202, 224, 0.4),
                blurRadius: 4,
                offset: Offset(0, 2))
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                if (orderModel.status == OrderState.inProgress ||
                    orderModel.status == OrderState.placed)
                  Container(width: 20),
                Spacer(),
                Text("Order #${orderModel.id}",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.dividermiddletext),
                    )),
                Spacer(),
                if (orderModel.status == OrderState.placed)
                  GestureDetector(
                      child: Icon(
                        Icons.more_horiz,
                        size: 25,
                      ),
                      onTapDown: showMenu),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: orderModel.orderitems
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${e.quantity} x",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor),
                              )),
                          SizedBox(
                            width: 9,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(e.menu.name,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                          ),
                          Spacer(),
                          Text("\$${e.price}",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor),
                              ))
                        ],
                      ),
                    )
                    .toList()),
            SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Table Reservation",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          // color: Color(0xff222831),
                          color: MyTheme.buttonbackgroundColor),
                    )),
                if (orderModel.table != null)
                  FutureBuilder<int>(
                    future: controller.getAvailableTables(
                        orderModel.restaurant.id.toString(), orderModel.table!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Text(
                            "Table " +
                                snapshot.data.toString() +
                                ", " +
                                orderModel.no_of_people.toString() +
                                " People",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.buttonbackgroundColor,
                              ),
                            ));
                      }
                      return Container();
                    },
                  )
                else
                  Text(" ",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.buttonbackgroundColor,
                        ),
                      ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(orderModel.restaurant.res_name,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.buttonbackgroundColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Text(
                    orderModel.date +
                        " " +
                        DateFormat(DateFormat.HOUR_MINUTE).format(DateTime(
                            2021,
                            01,
                            01,
                            int.parse(orderModel.time.split(':').first),
                            int.parse(orderModel.time.split(':').last))),
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.buttonbackgroundColor),
                    ))
              ],
            ),
            SizedBox(height: 16),
            bottomWidget(context),
            SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
