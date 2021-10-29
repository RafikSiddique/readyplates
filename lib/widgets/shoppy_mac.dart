import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';

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
            Spacer(),
            SizedBox(
              width: 10,
            ),
            Text(cartModel.foodQuantity.string,
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    color: Color(0xff222831))),
            SizedBox(
              width: 11,
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
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (cartModel.foodQuantity.value != 1)
                          controller.decrement(
                              cartModel.foodItem.value, cartModel.restaurant);
                      },
                      child: Text("-",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff393E46))),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        controller.increment(
                            cartModel.foodItem.value, cartModel.restaurant);
                      },
                      child: Text("+",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Color(0xff393E46))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    
                    controller.decrement(
                        cartModel.foodItem.value, cartModel.restaurant);
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
