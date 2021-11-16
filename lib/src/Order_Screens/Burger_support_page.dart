import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

import 'package:readyplates/widgets/bottomcontainer.dart';

import 'package:readyplates/widgets/imagewidget.dart';
import 'package:readyplates/widgets/shoppy_mac.dart';

class BurgersupportingPage extends GetView<OrderController> {
  final RestaurantModel restaurantModel;
  final bool isEditing;
  final OrderModelApi? orderModelApi;
  static const id = "/burgersupportingPage";
  const BurgersupportingPage({
    Key? key,
    required this.restaurantModel,
    this.isEditing = false,
    this.orderModelApi,
  })  : assert(isEditing ? orderModelApi != null : true),
        super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundcolor,
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: MyTheme.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Booking Summmary',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // SizedBox(
          //   height: 4,
          // ),
          Card(
            elevation: 4,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            shadowColor: Color.fromRGBO(0, 0, 0, 0.25),

            // shadowColor: ,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isEditing)
                    ...orderModelApi!.orderitems.map((e) => ShooppymacPage(
                          cartApiModel: CartApiModel(
                              id: 0,
                              user: orderModelApi!.id,
                              restaurant: orderModelApi!.restaurant.id,
                              foodItem: CartFood(id: e.id, name: ""),
                              foodImage: "e",
                              foodQuantity: e.quantity,
                              foodPrice: double.parse(e.price)),
                        ))
                  else
                    ...controller.cartItems
                        .map((element) => ShooppymacPage(cartModel: element)),
                  SizedBox(
                    height: 11,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TOTAL :",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                color: MyTheme.appbartextColor,
                              )),
                          Obx(() => Text(
                                "\$ " + controller.total.value.toString(),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: MyTheme.appbartextColor,
                                ),
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sales Tax: ".toUpperCase(),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              color: MyTheme.appbartextColor,
                            )),
                        Text(
                          "\$ 0.5",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 13,
                            color: MyTheme.appbartextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    //indent: 18,
                    //endIndent: 18,
                    thickness: 2,
                    color: MyTheme.devidercolor,
                  ),
                  Row(
                    children: [
                      ImagewidgetPage(
                        imagePath: Assets.forkKnife,
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                            restaurantModel.resName +
                                ", " +
                                (restaurantModel.address),
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              // color: Color(0xff4E535A)
                              color: MyTheme.dividermiddletext,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      ImagewidgetPage(
                        imagePath: Assets.clock,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                          controller.weekDays[
                                  controller.selectedDate.value.weekday - 1] +
                              ", " +
                              controller.selectedDate.value.day.toString() +
                              " " +
                              controller.months()[
                                  controller.selectedDate.value.month - 1] +
                              " " +
                              DateFormat("hh:mm a")
                                  .format(controller.selectedDate.value) +
                              "\n" +
                              "PAX: ${controller.numberOfPeople} Tables X ${controller.numberOfTable}",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize: 13,
                            color: MyTheme.dividermiddletext,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Bottomcontainer(
            restaurantModel: restaurantModel,
          ),
        ],
      ),
    );
  }
}
