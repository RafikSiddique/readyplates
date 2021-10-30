import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class OrderOption2 extends StatelessWidget {
  static const id = "/OrderOption2";
  const OrderOption2({Key? key}) : super(key: key);

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
                        Text("2 x",
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
                        Text("\$24.00",
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
                        Text("2 x",
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
                        Text("\$6.00",
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
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.buttonbackgroundColor,
                              ),
                            )),
                        Text("25th Sep",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
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
                      text: "Pay at Restaurant",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.buttonbackgroundColor,
                      width: MediaQuery.of(context).size.width,
                      onTap: () {},
                      borderColor: Colors.black, // Color(0xff222831),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Elevated(
                        text: " Pay via App",
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        onTap: () {},
                        borderColor: MyTheme.buttonbackgroundColor,
                        backgroundColor: MyTheme.buttonbackgroundColor,
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
