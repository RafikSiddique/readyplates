// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/order/screen/Order_cancel_page.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/imagewidget.dart';
import 'package:readyplates/widgets/order_widget.dart';

class PopUpMenuWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String path;
  final Color color;
  const PopUpMenuWidget(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.path,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      /* () {
                
              }, */
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ImagewidgetPage(
          imagePath: path, // '',
          width: 15,
          height: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text, //"Edit Order",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: color, // ,
              fontSize: 12),
        )
      ]),
    );
  }
}

class OrderPage extends GetView<OrderController> {
  final Function() goToShopping;
  OrderPage(this.goToShopping, {Key? key}) : super(key: key);

  void showTextMenu({
    required TapDownDetails details,
    required BuildContext context,
    required int orderId,
  }) {
    final RenderBox overlay = context.findRenderObject() as RenderBox;

    showMenu(
        context: context,
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.zero,
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          side: BorderSide(
            color: MyTheme.orderbordercolor,
          ),
        ),
        useRootNavigator: false,
        color: Colors.white,
        position: RelativeRect.fromRect(
            details.globalPosition & Size(40, 40), Offset.zero & overlay.size),
        items: <PopupMenuEntry>[
          PopupMenuItem(
              height: 20,
              onTap: null,
              child: PopUpMenuWidget(
                onTap: () {
                  //Get.to(() => BurgersupportingPage(restaurantModel: re));
                  // Get.to(() => OrderOption());
                },
                text: "Edit Order",
                path: Assets.notePencil,
                color: MyTheme.orderpopupcolor,
              )),
          PopupMenuDivider(
            height: 12,
          ),
          PopupMenuItem(
              height: 20,
              padding: EdgeInsets.zero,
              onTap: null,
              child: PopUpMenuWidget(
                onTap: () async {
                  await controller.updateStatus(orderId, 3);
                  Get.to(() => OrderCancelledPage());
                },
                path: Assets.checkCircle,
                text: "Cancel Order",
                color: MyTheme.orderpopupcolor,
                //color: Color(0xffF88020),
              )

              // Text("data")
              ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      initState: (state) {
        controller.getorder();
      },
      builder: (c) {
        return Scaffold(
          backgroundColor: MyTheme.backgroundcolor,
          appBar: AppBar(
            backgroundColor: MyTheme.backgroundcolor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Orders",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: MyTheme.appbartextColor),
              ),
            ),
            leading: Container(),
            automaticallyImplyLeading: false,
          ),
          body: controller.orderItems.length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: MediaQuery.of(context).size.width * 0.2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "No Orders at the moment",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Elevated(
                          width: MediaQuery.of(context).size.width,
                          text: "Order Now",
                          onTap: () {
                            goToShopping();
                          },
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.orderItems.any(
                              (element) => element.status == OrderState.placed))
                            Text("ACTIVE",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: MyTheme.dividermiddletext),
                                )),
                          SizedBox(
                            height: 10,
                          ),
                          ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: controller.orderItems
                                .where((p0) => p0.status == OrderState.placed)
                                .map((element) => OrderWidget(
                                          e: element,
                                          showMenu: (details) {
                                            showTextMenu(
                                                details: details,
                                                context: context,
                                                orderId: element.id);
                                          },
                                        ) /* Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(width: 10),
                                                Text("Order #${element.id}",
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color: MyTheme
                                                              .dividermiddletext),
                                                    )),
                                                GestureDetector(
                                                    onTapDown: (details) {
                                                      showTextMenu(
                                                        details: details,
                                                        context: context,
                                                        orderId: element.id,
                                                      );
                                                    },
                                                    child:
                                                        Icon(Icons.more_horiz)),
                                              ]),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ListView(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          children: element.orderitems
                                              .map(
                                                (e) => Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("${e.quantity} x",
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: MyTheme
                                                                  .buttonbackgroundColor),
                                                        )),
                                                    SizedBox(
                                                      width: 9,
                                                    ),
                                                    Text(e.menu.name,
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: MyTheme
                                                                  .dividermiddletext),
                                                        )),
                                                    Spacer(),
                                                    Text("\$${e.price}",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          textStyle: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color: MyTheme
                                                                  .dividermiddletext),
                                                        ))
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),

                                        // Container(
                                        //   height: 180,
                                        //   width: 180,

                                        //   // child: Image(
                                        //   //   image: AssetImage(Assets.qrCode),
                                        //   // ),
                                        // ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Table Reservation",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      // color: Color(0xff222831),
                                                      color: MyTheme
                                                          .buttonbackgroundColor),
                                                )),
                                            Text(element.no_of_table.toString(),
                                                style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: MyTheme
                                                          .buttonbackgroundColor),
                                                ))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(element.restaurant.res_name,
                                                style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: MyTheme
                                                          .buttonbackgroundColor),
                                                )),
                                            Text(
                                                controller.weekDays[
                                                        controller.selectedDate
                                                                .value.weekday -
                                                            1] +
                                                    ", " +
                                                    controller
                                                        .selectedDate.value.day
                                                        .toString() +
                                                    " " +
                                                    controller.months()[
                                                        controller.selectedDate
                                                                .value.month -
                                                            1] +
                                                    " " +
                                                    DateFormat("hh:mm a")
                                                        .format(controller
                                                            .selectedDate
                                                            .value),
                                                style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: MyTheme
                                                          .buttonbackgroundColor),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Container(
                                          child: Text(
                                            "Report at the restaurant and share PIN to initiate order",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.inter(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 17,
                                                color:
                                                    MyTheme.borderchangeColor),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (var i = 0;
                                                i < controller.otpFields.length;
                                                i++)
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xff00ADB5),
                                                      )),
                                                  width: 40,
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(8),
                                                  child: Text(
                                                    element.pin.toString()[i],
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ), */
                                    )
                                .toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (controller.anyInprogress())
                            Text(
                              "In progress".toUpperCase(),
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext),
                              ),
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: controller.orderItems
                                  .where((p0) =>
                                      p0.status == OrderState.inProgress)
                                  .map((e) => OrderWidget(
                                        e: e,
                                        showMenu: (p0) {
                                          showTextMenu(
                                              details: p0,
                                              context: context,
                                              orderId: e.id);
                                        },
                                      ))
                                  .toList()),
                          SizedBox(
                            height: 10,
                          ),
                          if (controller.anyPrevious())
                            Text(
                              "PREVIOUS COMPLETED ORDERS ",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext),
                              ),
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: controller.orderItems
                                  .where((p0) =>
                                      p0.status != OrderState.placed &&
                                      p0.status != OrderState.inProgress)
                                  .map((e) => OrderWidget(
                                        e: e,
                                        showMenu: (p0) {},
                                      ))
                                  .toList()),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}


/* 
 /* TextField(
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                controller:
                                                    controller.otpText[i],
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                focusNode:
                                                    controller.otpFields[i],
                                                maxLength: 1,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  hintText: (i + 1).toString(),
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    // borderRadius: BorderRadius.circular(6.0),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  if (value.length == 1) {
                                                    controller.otp.value +=
                                                        value;
                                                    if (i != 5) {
                                                      controller
                                                          .otpFields[i + 1]
                                                          .requestFocus();
                                                    } else {
                                                      if (controller
                                                              .otp.value ==
                                                          element.pin
                                                              .toString()) {
                                                      } else {
                                                        Get.snackbar(
                                                            "Incorrect OTP",
                                                            "Enter correct OTP");
                                                      } /*                controller.otp.value !=
                                                            element.pin
                                                                .toString();
                                                        Get.snackbar(
                                                            title, message); */
                                                    }
                                                  } else {
                                                    if (i != 0) {
                                                      controller.otp.value =
                                                          controller.otp.value
                                                              .substring(0, i);
                                                      controller
                                                          .otpFields[i - 1]
                                                          .requestFocus();
                                                    }
                                                  }
                                                },
                                              ), */ */