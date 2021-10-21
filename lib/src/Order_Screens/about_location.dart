import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/restaurant_list.dart';
import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/Order_Screens/Shop_page.dart';
import 'package:readyplates/utils/my_color.dart';
// import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/widgets/buuton.dart';

class Aboutlocation extends StatelessWidget {
  final RestaurantModel restaurantModel = Get.arguments;
  static const id = "/aboutlocation";
  Aboutlocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    return Scaffold(
        body: Stack(
      children: [
        Align(
          child: Container(
            alignment: Alignment.topCenter,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (restaurantModel.bio.first.food1 == ""
                        ? AssetImage("assets/images/ready.png")
                        : NetworkImage(restaurantModel.bio.first.food1))
                    as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DraggableScrollableSheet(
              maxChildSize: size.height > 800 ? 0.9 : 0.6,
              minChildSize: 0.5,
              initialChildSize: size.height > 800 ? 0.6 : 0.5,
              builder:
                  (BuildContext contex, ScrollController scrollcontroller) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                    border: Border.all(color: MyTheme.hinttextColor),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(230, 230, 230, 0.547886),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollcontroller,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(restaurantModel.resName,
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      color: MyTheme.appbartextColor,
                                    ),
                                  )),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 13.6,
                                width: 13.6,
                                child: Image(
                                  image: AssetImage('assets/images/clock.png'),
                                ),
                              ),
                              SizedBox(
                                width: 6.7,
                              ),
                              Text(
                                "Open",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.aboutlocatextcolor,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text("(Closes at 10:00 Pm)",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.dividermiddletext),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 14,
                                width: 11,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/pinroundmap.png'),
                                ),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text("Kondhwa Budruk",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.dividermiddletext),
                                  )),
                              SizedBox(
                                width: 61,
                              ),
                              FaIcon(
                                FontAwesomeIcons.walking,
                                size: 11,
                                color: MyTheme.dividermiddletext,
                              ),
                              Text(
                                "   15 mins",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: MyTheme.dividermiddletext),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "About us",
                            style: GoogleFonts.inter(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Founded in 1954, Burger King is the second largest fast food hamburger chain in the world. The original Home of the Whopper, our commitment to premium ingredients, signature recipes, and family-friendly dining experiences is what has defined our brand for more than 50 successful years",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: MyTheme.dividermiddletext),
                          ),
                          SizedBox(
                            height: 25.67,
                          ),
                          Row(children: [
                            Container(
                              height: 15.93,
                              width: 15.13,
                              child: Image(
                                image: AssetImage('assets/images/spoon.png'),
                              ),
                            ),
                            Text(
                              restaurantModel.bio.first.servingTime == ""
                                  ? "Undefined Serving time"
                                  : restaurantModel.bio.first.servingTime,
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.dividermiddletext),
                            ),
                          ]),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Gallery",
                            style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.dividermiddletext),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery1.png')),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery2.png')),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery1.png')),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  height: 78,
                                  // width: 94,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/gallery2.png')),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(children: [
                            Text(
                              "Events ",
                              style: GoogleFonts.inter(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.buttonbackgroundColor),
                            ),
                            Container(
                              height: 13.6,
                              width: 13.6,
                              child: Image(
                                image: AssetImage('assets/images/clock.png'),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 21,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "MAY",
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.aboutlocatextcolors),
                                  ),
                                  Text(
                                    "12",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.appbartextColor),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "All you can eat Buffet",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.appbartextColor),
                                  ),
                                  Text(
                                    "Starts at 6:00 PM",
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.appbartextColor),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 24,
                                      width: 56,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/lessbutton.png'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "A unique concept of live grill, fabulous buffet menu perfect for large groups. Has this wide variety of smoky dishes and desserts to choose from.",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff71757B)),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xff71757B),
                          ),
                          SizedBox(
                            height: 29,
                          ),
                          Elevated(
                            text: 'Proceed to Menu',
                            width: MediaQuery.of(context).size.width,
                            onTap: () {
                              Get.toNamed(ShopPage.id);
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Elevated(
                            text: "Schedule for later",
                            width: media.size.width,
                            backgroundColor: Colors.white,
                            borderColor: MyTheme.buttonbackgroundColor,
                            onTap: () {
                              Get.toNamed(BurgersupportingPage.id);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    ));
  }
}
