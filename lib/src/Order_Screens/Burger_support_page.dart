import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

import 'package:readyplates/widgets/bottomcontainer.dart';

import 'package:readyplates/widgets/imagewidget.dart';
import 'package:readyplates/widgets/shoppy_mac.dart';

class BurgersupportingPage extends GetView<OrderController> {
  final RestaurantModel restaurantModel;

  static const id = "/burgersupportingPage";
  const BurgersupportingPage({
    Key? key,
    required this.restaurantModel,
  }) : super(key: key);

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
          style: TextStyle(
            fontFamily: 'Inter',
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
              padding: EdgeInsets.only(left: 15, top: 14, right: 9),
              child: Column(
                children: [
                  ...controller.cartItems
                      .map((element) => ShooppymacPage(cartModel: element)),
                  SizedBox(
                    height: 11,
                  ),
<<<<<<< HEAD
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TOTAL :",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              color: MyTheme.appbartextColor,
                            )),
                        TextwidgetPage(
                          text: "\$ " + controller.calclateTotal().toString(),
                          color: MyTheme.appbartextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
=======
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TOTAL :",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 13,
                            color: MyTheme.appbartextColor,
                          )),
                      Obx(() => TextwidgetPage(
                            text: "\$ " + controller.total.value.toString(),
                            color: MyTheme.appbartextColor,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
>>>>>>> 78f3a9a67d7d3cfd0118b1ab4ea70df19855f421
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TAX ",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              color: MyTheme.appbartextColor,
                            )),
                        SizedBox(
                          width: 48,
                        ),
                        TextwidgetPage(
                          text: "CGST",
                          color: MyTheme.devidercolor,
                          fontWeight: FontWeight.normal,
                        ),
                        Spacer(),
                        TextwidgetPage(
                          text: "\$ 0.5",
                          color: MyTheme.appbartextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
<<<<<<< HEAD
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        TextwidgetPage(
                          text: "IGST",
                          color: MyTheme.devidercolor,
                          fontWeight: FontWeight.normal,
                        ),
                        Spacer(),
                        TextwidgetPage(
                          text: "\$ 0.5",
                          color: MyTheme.appbartextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
=======
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 78,
                      ),
                      TextwidgetPage(
                        text: "IGST",
                        color: MyTheme.dividermiddletext,
                        fontWeight: FontWeight.w400,
                      ),
                      Spacer(),
                      TextwidgetPage(
                        text: "\$ 0.5",
                        color: MyTheme.appbartextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
>>>>>>> 78f3a9a67d7d3cfd0118b1ab4ea70df19855f421
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
                          style: TextStyle(
                            fontFamily: "Inter",
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
