import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/restaurant_model.dart';
// import 'package:readyplates/src/Order_Screens/Burger_support_page.dart';
import 'package:readyplates/src/Order_Screens/menu_page.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
// import 'package:readyplates/utils/routes.dart';
import 'package:readyplates/widgets/buuton.dart';

class RestaurantDetails extends StatelessWidget {
  final RestaurantModel restaurantModel;
  static const id = "/aboutlocation";
  RestaurantDetails({Key? key, required this.restaurantModel})
      : super(key: key);

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
                        ? AssetImage(Assets.ready)
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
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
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
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(restaurantModel.resName,
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
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
                                  image: AssetImage(Assets.clock),
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
                                  image: AssetImage(Assets.pinroundmap),
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
                          SizedBox(
                            height: 5,
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
                                image: AssetImage(Assets.spoon),
                              ),
                            ),
                            SizedBox(
                              width: 10,
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
                            SizedBox(
                              width: 7,
                            ),
                            Text("mins serving time",
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff71757B)))
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
                                children: Assets.gallery
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (c) =>
                                                        FullImage(path: e)));
                                          },
                                          child: Hero(
                                            tag: e,
                                            child: Material(
                                              type: MaterialType.transparency,
                                              child: Container(
                                                margin: EdgeInsets.all(4),
                                                height: 70,
                                                child: Image.asset(e),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList()),
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
                                image: AssetImage(Assets.clock),
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
                                        image: AssetImage(Assets.lessbutton),
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
                              final controller = Get.find<HomeController>();
                              controller.foodItems =
                                  [controller.defaultItem].obs;
                              controller
                                  .getFoodItems(restaurantModel.id.toString());
                              Get.find<OrderController>().getCart();
                              Get.toNamed(MenuPage.id,
                                  arguments: restaurantModel);
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
                              Get.back();
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
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
        )
      ],
    ));
  }
}

class FullImage extends StatelessWidget {
  final String path;
  const FullImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: path,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image.asset(
              path,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
