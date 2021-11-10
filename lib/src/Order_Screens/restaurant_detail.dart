import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates/models/bio.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/Order_Screens/menu_page.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
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
    Bio bio = restaurantModel.bio.first;
    List<String> images = [
      bio.entrance,
      bio.front_fascia_day,
      bio.front_fascia_night,
      bio.street_view,
      bio.ambience1,
      bio.ambience2,
      bio.ambience3,
      bio.ambience4,
      bio.food1,
      bio.food2,
      bio.food3,
      bio.food4,
      bio.cv19prec1,
      bio.cv19prec2,
      bio.cv19prec3,
      bio.cv19prec4
    ];

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
                    physics: BouncingScrollPhysics(),
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
                              Text("(Closes at ${restaurantModel.end_time})",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        //  overflow: TextOverflow.ellipsis,
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
                              Container(
                                width: 200,
                                child: Text(restaurantModel.address,
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: MyTheme.dividermiddletext),
                                    )),
                              ),
                              SizedBox(
                                width: 61,
                              ),
                              FaIcon(
                                FontAwesomeIcons.walking,
                                size: 11,
                                color: MyTheme.dividermiddletext,
                              ),
                              Text(
                                "  15 mins",
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
                            restaurantModel.bio.first.description,
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
                                  : restaurantModel.bio.first.servingTime +
                                      " Minutes",
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.dividermiddletext),
                            ),
                          ]),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gallery",
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.dividermiddletext),
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(4)),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      isDismissible: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10))),
                                      context: context,
                                      builder: (context) {
                                        return Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(10))),
                                          child: GridView.count(
                                              physics: BouncingScrollPhysics(),
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5,
                                              children: [
                                                for (var i = 0;
                                                    i < images.length;
                                                    i++)
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context, FullImage.id,
                                                          arguments: [
                                                            images[i],
                                                            i + 99
                                                          ]);
                                                    },
                                                    child: Hero(
                                                      tag: i + 99,
                                                      child: Material(
                                                        type: MaterialType
                                                            .transparency,
                                                        child: SizedBox.square(
                                                          dimension:
                                                              media.size.width *
                                                                  0.25,
                                                          child: Image.network(
                                                            images[i],
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Image
                                                                  .asset(Assets
                                                                      .categoryBurger);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                              ]),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "View All",
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.dividermiddletext),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(children: [
                              for (var i = 0; i < images.length; i++)
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (c) => FullImage(
                                            heroTag: i,
                                            path: images[i],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: i,
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 70,
                                            child: Image.network(
                                              images[i],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ]),
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
                                    bio.recurring_event_date,
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.aboutlocatextcolors),
                                  ),
                                  // Text(
                                  //   "May",
                                  //   style: GoogleFonts.inter(
                                  //       fontSize: 13,
                                  //       fontWeight: FontWeight.w500,
                                  //       fontStyle: FontStyle.normal,
                                  //       color: MyTheme.aboutlocatextcolors),
                                  // ),
                                  // Text(
                                  //   "12",
                                  //   style: GoogleFonts.inter(
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w500,
                                  //       fontStyle: FontStyle.normal,
                                  //       color: MyTheme.appbartextColor),
                                  // )
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
                                    "Starts at ${bio.event_start} ",
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
                            bio.event_desc,
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
  static const id = "/full";
  final String path;
  final int heroTag;
  const FullImage({Key? key, required this.path, required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: heroTag,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: InteractiveViewer(
              child: Image.network(
                path,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
