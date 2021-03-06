import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';
import 'package:readyplates/widgets/snackbar.dart';

class Bottomcontainer extends StatefulWidget {
  final RestaurantModel restaurantModel;
  final Editing isEditing;
  final Function() setState;
  const Bottomcontainer(
      {Key? key,
      required this.setState,
      required this.restaurantModel,
      required this.isEditing})
      : super(key: key);

  @override
  State<Bottomcontainer> createState() => _BottomcontainerState();
}

class _BottomcontainerState extends State<Bottomcontainer> {
  final controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //  height: 100,

      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(68, 68, 68, 0.22),
          offset: Offset(0, -2),
          blurRadius: 20,
          spreadRadius: 0,
        )
      ]),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: MyTheme.buttonbackgroundColor,
                    )),
                Obx(() => Text("\$" + controller.total.value.toStringAsFixed(2),
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: MyTheme.buttonbackgroundColor))),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Elevated(
                  backgroundColor: Colors.white,
                  text: "Add Items",
                  borderColor: MyTheme.bottomcontainercolor,
                  onTap: () async {
                    await Get.find<HomeController>()
                        .getFoodItems(widget.restaurantModel.id.toString());

                    if (widget.isEditing != Editing.none) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => MenuPage(
                              restaurantModel: widget.restaurantModel,
                              isEditing: widget.isEditing,
                              isAddItem: true,
                            ),
                          )).then((value) => setState(() {
                            widget.setState();
                          }));
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => MenuPage(
                            restaurantModel: widget.restaurantModel,
                            isEditing: widget.isEditing,
                            isAddItem: true,
                          ),
                        ),
                        (route) => route.settings.name == 'details',
                      );
                    }
                  },
                  width: size.width * 0.43,
                  padding: EdgeInsets.all(15),
                ),
                SizedBox(
                  width: 9,
                ),
                Elevated(
                  color: MyTheme.appbackgroundColor,
                  width: size.width * 0.43,
                  padding: EdgeInsets.all(15),
                  text: widget.isEditing != Editing.none ? "Confirm" : "Order",
                  onTap: () async {
                    if (widget.isEditing != Editing.none) {
                      if (controller.orderEdit.isNotEmpty &&
                          controller.orderEdit
                              .any((element) => element.foodQuantity.value > 0))
                        Get.find<OrderController>().editOrders();
                      else
                        Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                          title: 'Warning',
                          message:
                              'Please add atleast one item to complete the order',
                          icon: FaIcon(
                            FontAwesomeIcons.timesCircle,
                            color: MyTheme.redColor,
                          ),
                        ));

                      // Get.snackbar("Error",
                      //     "Please add atleast one item to complete the order");
                    } else {
                      if (controller.cartItems.isNotEmpty) {
                        await Get.find<OrderController>()
                            .order(widget.restaurantModel);
                      } else
                        Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                          title: 'Warning',
                          message:
                              'Please add atleast one item to complete the order',
                          icon: FaIcon(
                            FontAwesomeIcons.timesCircle,
                            color: MyTheme.redColor,
                          ),
                        ));
                      // Get.snackbar("Error",
                      //     "Please add atleast one item to complete the order");
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: Platform.isIOS ? 20 : 10,
          )
        ],
      ),
    );
  }
}
