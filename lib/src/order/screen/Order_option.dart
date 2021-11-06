import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:readyplates/src/order/screen/Order_cancel_page.dart';
import 'package:readyplates/src/order/screen/order_option2.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class OrderOption extends StatelessWidget {
  static const id = "/OrderOption";
  const OrderOption({Key? key}) : super(key: key);

  Widget buildContainer() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 4,
        width: 4,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundcolor, // Colors.white,
      appBar: AppBar(
        backgroundColor: MyTheme.backgroundcolor,
        elevation: 0,
        centerTitle: true,
        title: Text("Orders",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: MyTheme.dividermiddletext,
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "ACTIVE",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: MyTheme.dividermiddletext,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 320, //280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(188, 202, 224, 0.45),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Container(width: 0),
                            Spacer(),
                            Text("Order #210403AS",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext,
                                  ),
                                )),
                            Spacer(),
                            buildContainer(),
                            SizedBox(
                              width: 3,
                            ),
                            buildContainer(),
                            SizedBox(
                              width: 3,
                            ),
                            buildContainer(),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 x",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.buttonbackgroundColor),
                            )),
                        SizedBox(
                          width: 9,
                        ),
                        Text("Sloppy Mac",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            )),
                        Spacer(),
                        Text("\$12.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 x",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.buttonbackgroundColor),
                            )),
                        SizedBox(
                          width: 9,
                        ),
                        Text("Fries",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            )),
                        Spacer(),
                        Text("\$3.00",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Table Reservation",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.buttonbackgroundColor,
                              ),
                            )),
                        Text("10.00 AM",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.buttonbackgroundColor,
                              ),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sloppy Joe, Kondhwa",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.buttonbackgroundColor,
                              ),
                            )),
                        Text("25th Sep",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.buttonbackgroundColor,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Elevated(
                      text: "Modify Order ",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.orderoptionbuttoncolor,
                      width: MediaQuery.of(context).size.width,
                      onTap: () {},
                      borderColor:
                          MyTheme.orderoptionbuttoncolor, // Color(0xff222831),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Elevated(
                        text: " Complete Order",
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        onTap: () {
                          Get.to(() => OrderOption2());
                        },
                        borderColor: MyTheme.orderoptionbuttoncolor,
                        backgroundColor: MyTheme.orderoptionbuttoncolor,
                      ),
                    ),
                    SizedBox(height: 0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
