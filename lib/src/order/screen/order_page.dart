// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
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
    required int restaurantId,
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
                onTap: () async {
                  RestaurantModel restaurantModel =
                      await controller.getSingleRestaurant(restaurantId);
                  Get.to(() =>
                      BurgersupportingPage(restaurantModel: restaurantModel));
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
          body: controller.active.isEmpty &&
                  controller.inProgress.isEmpty &&
                  controller.ended.isEmpty
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
                          if (controller.active.isNotEmpty)
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
                            children: controller.active
                                .map(
                                  (element) => OrderWidget(
                                    e: element,
                                    showMenu: (details) {
                                      showTextMenu(
                                          details: details,
                                          context: context,
                                          restaurantId: element.restaurant.id,
                                          orderId: element.id);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (controller.inProgress.isNotEmpty)
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
                              children: controller.inProgress
                                  .map((e) => OrderWidget(
                                        e: e,
                                        showMenu: (p0) {
                                          showTextMenu(
                                              details: p0,
                                              restaurantId: e.restaurant.id,
                                              context: context,
                                              orderId: e.id);
                                        },
                                      ))
                                  .toList()),
                          SizedBox(
                            height: 10,
                          ),
                          if (controller.ended.isNotEmpty)
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
                              children: controller.ended
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
