import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/src/order/screen/order_option2.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class OrderWidget extends StatelessWidget {
  final OrderModelApi e;
  final Function(TapDownDetails) showMenu;
  OrderWidget({Key? key, required this.e, required this.showMenu})
      : super(key: key);

  final OrderController controller = Get.find();

  Widget bottomWidget() {
    switch (e.status) {
      case OrderState.placed:
        return Column(
          children: [
            Container(
              child: Text(
                "Report at the restaurant and share PIN to initiate order",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: MyTheme.borderchangeColor),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < controller.otpFields.length; i++)
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xff00ADB5),
                          )),
                      width: 40,
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Text(
                        e.pin.toString()[i],
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ))
              ],
            ),
          ],
        );
      case OrderState.inProgress:
        return Elevated(
          width: Get.width,
          text: "Edit Order",
          onTap: () {
            //Get.to(() => OrderOption2());
          },
        );
      case OrderState.completed:
      case OrderState.cancelled:
        return Elevated(
          width: Get.width,
          text: " Order Again",
          onTap: () {
            //   Get.to(() => OrderOption2());
          },
        );
      default:
        return Elevated(
          width: Get.width,
          text: "Order Again",
          onTap: () {
            //  Get.to(() => OrderOption2());
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(188, 202, 224, 0.4),
                blurRadius: 4,
                offset: Offset(0, 2))
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                // Container(width: 0),
                Spacer(),
                Text("Order #${e.id}",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.dividermiddletext),
                    )),
                Spacer(),
                GestureDetector(
                    child: Icon(
                      Icons.more_horiz,
                      size: 25,
                    ),
                    onTapDown: showMenu),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: e.orderitems
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${e.quantity} x",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor),
                              )),
                          SizedBox(
                            width: 9,
                          ),
                          Text(e.menu.name,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor),
                              )),
                          Spacer(),
                          Text("\$${e.price}",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.buttonbackgroundColor),
                              ))
                        ],
                      ),
                    )
                    .toList()),
            SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Table Reservation",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          // color: Color(0xff222831),
                          color: MyTheme.buttonbackgroundColor),
                    )),
                Text(
                    e.no_of_table.toString() +
                        " x Table for " +
                        e.no_of_people.toString() +
                        " People",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.buttonbackgroundColor),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.restaurant.res_name,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.buttonbackgroundColor),
                    )),
                Text(
                    e.date +
                        " " +
                        DateFormat(DateFormat.HOUR_MINUTE).format(DateTime(
                            2021,
                            01,
                            01,
                            int.parse(e.time.split(':').first),
                            int.parse(e.time.split(':').last))),
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.buttonbackgroundColor),
                    ))
              ],
            ),
            SizedBox(height: 16),
            bottomWidget(),
            SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
