import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      () => Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              cartModel.foodImage,
              height: 64,
              width: 64,
            ),
            Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 10,
            ),
            Obx(() => Text(cartModel.foodQuantity.string + ' x ',
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    color: Color(0xff222831)))),
            Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 28,
                // ),
                Text(cartModel.foodName,
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Color(0xff393E46))),
                SizedBox(
                  height: 5,
                ),
                Text("\$ ${cartModel.foodPrice}",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Color(0xff4E535A))),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                  width: 20,
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
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    if (controller.cartItems.length > 1) {
                      controller.decrement(
                          cartModel.foodItem.value, cartModel.restaurant, true);
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
            )
          ],
        ),
      ),
    );
  }
}
