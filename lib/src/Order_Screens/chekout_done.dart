import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/src/Order_Screens/Payment_page.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/landing_page.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class Chekoutdone extends StatelessWidget {
  final OrderModelApi orderModelApi;
  final bool isComplete;
  const Chekoutdone(
      {Key? key, required this.orderModelApi, required this.isComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return WillPopScope(
      onWillPop: () async {
        controller.currentIndex.value = 0;
        controller.getRestaurants();

        Get.offAllNamed(LandingPage.id);
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("We are waiting for you",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        //color: Color(0xff393E46),
                        color: MyTheme.appbartextColor,
                      ),
                    )),
                SizedBox(height: 4),
                Text("Your order #${orderModelApi.id} is complete ",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.appbartextColor,
                      ),
                    )),
                SizedBox(height: 81),
                Container(
                  height: 276,
                  child: Image(
                    image: AssetImage(Assets.checkOutDone),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Elevated(
                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    text: "Pay Later",
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    onTap: () async {
                      await Get.find<OrderController>()
                          .updatePayment(orderModelApi.id, 0);
                      await Get.find<OrderController>().getorder();
                      Get.offAllNamed(LandingPage.id);
                      controller.currentIndex.value = 2;
                      controller.onPageChanged(controller.currentIndex.value);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Elevated(
                    width: MediaQuery.of(context).size.width,
                    text: "Pay Now",
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    onTap: () {
                      Get.to(() => PaymentPage(
                            orderModelApi: orderModelApi,
                            isOrderComplete: isComplete,
                          ));
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
