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
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class OrderWidget extends StatelessWidget {
  final OrderModelApi orderModel;

  final Function(TapDownDetails) showMenu;
  OrderWidget({Key? key, required this.orderModel, required this.showMenu})
      : super(key: key);
  OrderController controller = Get.find();

  Widget bottomWidget(BuildContext context) {
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
                    color: MyTheme.borderchangeColor),
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
                Get.dialog(
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                RestaurantModel restaurantModel = await controller
                    .getSingleRestaurant(orderModel.restaurant.id);
                //  String userId = await SharedPreferenceHelper().getUserId();
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
                Get.back();
                Get.to(() => BurgersupportingPage(
                      restaurantModel: restaurantModel,
                      isEditing: true,
                      orderModelApi: orderModel,
                    ));
              },
              backgroundColor: Colors.white,
              color: Color(0xff44C4A1),
              borderColor: Color(0xff44C4A1),
            ),
            SizedBox(
              height: 10,
            ),
            Elevated(
              backgroundColor: Color(0xff44C4A1),
              text: "Complete Order",
              onTap: () {
                if (orderModel.payment == "0") {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PaymentPage(
                          orderModelApi: orderModel,
                          isOrderComplete: true,
                        ),
                      ));
                } else {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => FeedbackPage(e: orderModel),
                      ));
                }
              },
              width: Get.width,
            ),
          ],
        );
      case OrderState.cancelled:
        return Elevated(
          text: "Cancelled",
          backgroundColor: MyTheme.buttonColor,
          width: Get.width,
          onTap: () {},
        );
      case OrderState.completed:
        return Column(
          children: [
            Elevated(
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
                RestaurantModel restaurantModel = await controller
                    .getSingleRestaurant(orderModel.restaurant.id);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BurgersupportingPage(
                          restaurantModel: restaurantModel, isEditing: false),
                    ),
                    (route) => route.settings.name == LandingPage.id);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Elevated(
              backgroundColor: Colors.white,
              width: Get.width,
              borderColor: Color(0xff222831),
              text: "Give Feedback",
              onTap: () {
                Get.to(() => FeedbackPage(
                      e: orderModel,
                    ));
              },
            ),
          ],
        );
      default:
        return Elevated(
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => BurgersupportingPage(
                      restaurantModel: restaurantModel, isEditing: false),
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
                // Container(width: 0),
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
                            snapshot.data.toString() +
                                " Table for " +
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
                  Text(
                      "Awaiting table from restaurant" +
                          " Table for " +
                          orderModel.no_of_people.toString() +
                          " People",
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
