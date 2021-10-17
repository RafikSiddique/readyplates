import 'package:flutter/material.dart';
// import 'package:readyplates/widgets/bottom_container.dart';
import 'package:readyplates/widgets/bottomcontainer.dart';

import 'package:readyplates/widgets/imagewidget.dart';
import 'package:readyplates/widgets/shoppy_mac.dart';

class BurgersupportingPage extends StatelessWidget {
  const BurgersupportingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Booking Summmary',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            letterSpacing: -0.226667,
            color: Color(0xff393E46),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 390,

              //  color: Color(0xffFFFFFF),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    ShooppymacPage(),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xffE4E4E4),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ShooppymacPage(),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xffE4E4E4),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TOTAL :",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                color: Color(0xff393E46))),
                        TextwidgetPage(
                          text: "\$ 24.0",
                          color: Color(0xff393E46),
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("EXTRAS :",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                color: Color(0xff393E46))),
                        SizedBox(
                          width: 16,
                        ),
                        TextwidgetPage(
                          text: "Cheese",
                          color: Color(0xff393E46),
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        TextwidgetPage(
                            text: "1 X \$ 0.5",
                            color: Color(0xff393E46),
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TAX ",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                color: Color(0xff393E46))),
                        SizedBox(
                          width: 48,
                        ),
                        TextwidgetPage(
                          text: "CGST",
                          color: Color(0xff4E535A),
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        TextwidgetPage(
                          text: "\$ 0.5",
                          color: Color(0xff393E46),
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 78,
                        ),

                        TextwidgetPage(
                          text: "IGST",
                          color: Color(0xff4E535A),
                          fontWeight: FontWeight.w400,
                        ),

                        Spacer(),
                        TextwidgetPage(
                          text: "\$ 0.5",
                          color: Color(0xff393E46),
                          fontWeight: FontWeight.w500,
                        ),
                        // Text("\$ 0.5",
                        //     style: TextStyle(
                        //         fontFamily: "Inter",
                        //         fontWeight: FontWeight.normal,
                        //         fontStyle: FontStyle.normal,
                        //         fontSize: 13,
                        //         color: Color(0xff393E46))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      //indent: 18,
                      //endIndent: 18,
                      thickness: 2,
                      color: Color(0xffE4E4E4),
                    ),
                    Row(
                      children: [
                        ImagewidgetPage(
                          imagePath: "assets/images/ForkKnife.png",
                          height: 25,
                          width: 25,
                        ),

                        // Image.asset(
                        //   "assets/images/ForkKnife.png",
                        //   height: 25,
                        //   width: 25,
                        //   color: Color(0xff4E535A),
                        // ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "Sloppy Joe Burgers, Kondhwa Budruk,Parge,\nNagar,Pune,411048",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                color: Color(0xff4E535A))),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        ImagewidgetPage(
                          imagePath: "assets/images/clock.png",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "Sunday, 25th, September 2021, 10:00 AM \nPAX: 6 Tables X 2",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                                color: Color(0xff4E535A))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Bottomcontainer(),
        ],
      ),
    );
  }
}