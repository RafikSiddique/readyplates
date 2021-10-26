import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/my_color.dart';
// import 'package:readyplates/widgets/bottom_container.dart';
import 'package:readyplates/widgets/bottomcontainer.dart';

import 'package:readyplates/widgets/imagewidget.dart';
import 'package:readyplates/widgets/shoppy_mac.dart';

class BurgersupportingPage extends GetView<OrderController> {
  final RestaurantModel restaurantModel;
  static const id = "/burgersupportingPage";
  const BurgersupportingPage({Key? key, required this.restaurantModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //(0xffE5E5E5),
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Colors.white, //(0xffE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Booking Summmary',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            letterSpacing: -0.226667,
            //color: Color(0xff393E46),
            color: MyTheme.appbartextColor,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 4,
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ...controller.cartItems
                      .map((element) => ShooppymacPage(cartModel: element)),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 2,
                    color: MyTheme.devidercolor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                      TextwidgetPage(
                        text: "\$ 24.0",
                        color: MyTheme.appbartextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
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
                  ),
                  SizedBox(
                    height: 7,
                  ),
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
                      // Text("\$ 0.5",
                      //     style: TextStyle(
                      //         fontFamily: "Inter",
                      //         fontWeight: FontWeight.normal,
                      //         fontStyle: FontStyle.normal,
                      //         fontSize: 13,
                      //         color: Color(0xff393E46))),
                    ],
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
                        imagePath: "assets/images/ForkKnife.png",
                        height: 25,
                        width: 25,
                      ),

                      // Image.asset(
                      //   "assets/images/ForkKnife.png",
                      //   height: 25,
                      //   width: 25,
                      //   color: Color(0xff4E535A),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          restaurantModel.resName +
                              ", " +
                              (restaurantModel.address ?? ""),
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize: 13,
                            // color: Color(0xff4E535A)
                            color: MyTheme.dividermiddletext,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      ImagewidgetPage(
                        imagePath: "assets/images/clock.png",
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(
                        width: 10,
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
                ],
              ),
            ),
          ),
          Spacer(),
          Bottomcontainer(),
        ],
      ),
    );
  }
}
