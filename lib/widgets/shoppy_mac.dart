// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/food_item_model.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/snackbar.dart';

class ShooppymacPage extends StatelessWidget {
  final void Function() setStae;
  CartModel? cartModel;
  OrderEditModel? orderEditModel;
  final Editing isEditing;
  ShooppymacPage(
      {Key? key,
      this.cartModel,
      this.orderEditModel,
      this.isEditing = Editing.none,
      required this.setStae})
      : super(key: key);
  final controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                isEditing != Editing.none
                    ? getUrl(orderEditModel!.foodImage)
                    : cartModel!.foodImage,
                height: Get.width * 0.17,
                width: Get.width * 0.17,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              isEditing != Editing.none
                  ? orderEditModel!.foodQuantity.string
                  : cartModel!.foodQuantity.string,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 17,
                color: Color(0xff222831),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "x",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 17,
                color: Color(0xff222831),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEditing != Editing.none
                        ? orderEditModel!.foodName
                        : cartModel!.foodName,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0xff393E46),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    isEditing != Editing.none
                        ? "\$ ${(orderEditModel!.foodPrice.value / orderEditModel!.foodQuantity.value).toStringAsFixed(2)}"
                        : "\$ ${(cartModel!.foodPrice.value / cartModel!.foodQuantity.value).toStringAsFixed(2)}",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 13,
                      color: Color(0xff4E535A),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isEditing != Editing.confirmed)
                    InkWell(
                      onTap: () {
                        if (isEditing == Editing.none) {
                          if (cartModel!.foodQuantity.value != 1)
                          //TODO: REMOVE CONTAINER
                            controller.decrement(cartModel!.foodItem.value,
                                cartModel!.restaurant,
                                nextPage: Container()
                                );
                        } else {
                          print("decrement");
                          if (orderEditModel!.foodQuantity.value != 1)
                            controller
                                .decrementEdit(orderEditModel!.foodItem.value);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyTheme.borderColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Color(0xff393E46),
                          size: Get.width * 0.05,
                        ),
                      ),
                    ),
                  SizedBox(
                    width: Get.width * 0.013,
                  ),
                  InkWell(
                    onTap: () {
                      if (isEditing == Editing.none)
                      //TODO : Remove Container
                        controller.increment(

                            cartModel!.foodItem.value, cartModel!.restaurant, Container());
                      else
                        controller
                            .incrementEdit(orderEditModel!.foodItem.value);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyTheme.borderColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Color(0xff393E46),
                        size: Get.width * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.018,
                  ),
                  if (isEditing != Editing.confirmed)
                    InkWell(
                      onTap: () {
                        if (isEditing == Editing.none) {
                          if (controller.cartItems.length > 1) {
                            //TODO: Remove container
                            controller.decrement(cartModel!.foodItem.value,
                                cartModel!.restaurant,isRemoval:  true, nextPage: Container());
                            controller.calclateTotal(false);
                            setStae();
                          } else {
                            Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                              title: 'Warning',
                              message:
                                  'You should atleast have one item in cart for booking summary',
                              icon: FaIcon(
                                FontAwesomeIcons.timesCircle,
                                color: MyTheme.redColor,
                              ),
                            ));

                            // Get.showSnackbar(GetBar(
                            //   title: "Error",
                            //   message:
                            //       "You should atleast have one item in cart for booking summary",
                            //   duration: Duration(seconds: 2),
                            // ));
                          }
                        } else {
                          if (controller.orderEdit.length > 1) {
                            List<OrderEditModel> isAny0Quant = controller
                                .orderEdit
                                .where(
                                    (element) => element.foodQuantity.value > 0)
                                .toList();
                            if (isAny0Quant.length > 1) {
                              int v =
                                  controller.orderEdit.indexOf(orderEditModel!);
                              controller.orderEdit[v].foodQuantity.value = 0;
                              controller.orderEdit[v].foodPrice.value = 0;
                              controller.calclateTotal(true);
                              setStae();
                            } else {
                              Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                                title: 'Warning',
                                message:
                                    'You should atleast have one item in cart for booking summary',
                                icon: FaIcon(
                                  FontAwesomeIcons.timesCircle,
                                  color: MyTheme.redColor,
                                ),
                              ));
                              // Get.showSnackbar(GetBar(
                              //   title: "Error",
                              //   message:
                              //       "You should atleast have one item in cart for booking summary",
                              //   duration: Duration(seconds: 2),
                              // ));
                            }
                          } else {
                            Get.showSnackbar(MySnackBar.myLoadingSnackBar(
                              title: 'Warning',
                              message:
                                  'You should atleast have one item in cart for booking summary',
                              icon: FaIcon(
                                FontAwesomeIcons.timesCircle,
                                color: MyTheme.redColor,
                              ),
                            ));
                            // Get.showSnackbar(GetBar(
                            //   title: "Error",
                            //   message:
                            //       "You should atleast have one item in cart for booking summary",
                            //   duration: Duration(seconds: 2),
                            // ));
                          }
                        }
                      },
                      child: Image.asset(
                        Assets.delete,
                        height: Get.width * 0.05,
                        width: Get.width * 0.05,
                      ),
                    ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: MyTheme.devidercolor,
              indent: 10,
              endIndent: 10,
            )
          ]),
        )
      ]),
    );
  }
}
