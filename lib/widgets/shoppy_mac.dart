import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class ShooppymacPage extends StatelessWidget {
  final CartModel cartModel;
  ShooppymacPage({Key? key, required this.cartModel}) : super(key: key);
  final controller = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                cartModel.foodImage,
                height: 64,
                width: 64,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              cartModel.foodQuantity.string,
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
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartModel.foodName,
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
                    "\$ ${cartModel.foodPrice}",
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
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (cartModel.foodQuantity.value != 1)
                        controller.decrement(
                            cartModel.foodItem.value, cartModel.restaurant);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyTheme.borderColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.remove, color: Color(0xff393E46)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.increment(
                          cartModel.foodItem.value, cartModel.restaurant);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyTheme.borderColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.add, color: Color(0xff393E46)),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.cartItems.length > 1) {
                        controller.decrement(cartModel.foodItem.value,
                            cartModel.restaurant, true);
                      } else {
                        Get.showSnackbar(GetBar(
                          title: "Error",
                          message:
                              "You should atleast have one item in cart for booking summary",
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child: Image.asset(
                      Assets.delete,
                      height: 16,
                      width: 16,
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
