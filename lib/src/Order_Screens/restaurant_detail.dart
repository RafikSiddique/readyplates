import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates/models/bio.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/src/Order_Screens/index.dart';
import 'package:readyplates/src/Order_Screens/menu_page.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/order/orders_controller.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';
import 'package:readyplates/widgets/buuton.dart';

class RestaurantDetails extends StatefulWidget {
  final RestaurantModel restaurantModel;
  // static const id = "/aboutlocation";
  late HomeController controller;
  RestaurantDetails({
    Key? key,
    required this.restaurantModel,
    //required this.controller,
  }) : super(key: key) {
    bool isReg = Get.isRegistered<HomeController>();
    if (!isReg) {
      controller = Get.put(HomeController());
    } else {
      controller = Get.find<HomeController>();
    }
  }

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Size size = media.size;
    Bio bio = widget.restaurantModel.bio.first;
    List<String> dates = bio.recurring_event_date.split('-');
    String month = dates[1].length == 1 ? "0${dates[1]}" : dates[1];
    String day = dates[2].length == 1 ? "0${dates[2]}" : dates[2];

    DateTime eventDate = DateTime.parse(dates[0] + month + day);
    print(eventDate);
    List<String> images = [
      bio.street_view,
      bio.entrance,
      bio.front_fascia_day,
      bio.front_fascia_night,
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
                image: (widget.restaurantModel.bio.first.food1 == ""
                        ? AssetImage(Assets.ready)
                        : NetworkImage(widget.restaurantModel.bio.first.food1))
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
                    physics: BouncingScrollPhysics(),
                    controller: scrollcontroller,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 16, right: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.restaurantModel.resName,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.orangeColor,
                                ),
                              )),

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
                              Text(
                                  "(Closes at ${widget.restaurantModel.end_time})",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(widget.restaurantModel.address,
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          // overflow: TextOverflow.ellipsis,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: MyTheme.dividermiddletext),
                                    )),
                              ),
                              SizedBox(
                                width: 51,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: FaIcon(
                                  FontAwesomeIcons.walking,
                                  size: 11,
                                  color: MyTheme.dividermiddletext,
                                ),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                double.parse(widget.restaurantModel.address2)
                                        .toStringAsFixed(2) +
                                    " mi",
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
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: MyTheme.buttonbackgroundColor),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.restaurantModel.bio.first.description,
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: MyTheme.dividermiddletext),
                          ),
                          SizedBox(
                            height: 24,
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
                              widget.restaurantModel.bio.first.servingTime == ""
                                  ? "Undefined Serving time"
                                  : widget.restaurantModel.bio.first
                                          .servingTime +
                                      " Minutes",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: MyTheme.dividermiddletext),
                            ),
                          ]),
                          SizedBox(
                            height: 20,
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
                                                          Radius.circular(30))),
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
                                                      Navigator.push(
                                                          context,
                                                          CupertinoPageRoute(
                                                              builder: (c) =>
                                                                  FullImage(
                                                                    imageModel:
                                                                        ImageModel(
                                                                            i,
                                                                            images),
                                                                  )));
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
                          // SizedBox(
                          //   height: 9,
                          // ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              for (var i = 0; i < images.length; i++)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (c) => FullImage(
                                                  imageModel:
                                                      ImageModel(i, images),
                                                )));
                                  },
                                  child: Hero(
                                    tag: images[i],
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 2, right: 2),
                                          height: 70,
                                          child: Image.network(images[i]),
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
                              height: 11.6,
                              width: 11.6,
                              child: Image(
                                image: AssetImage(Assets.clock),
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      bio.event_desc == ""
                                          ? "--"
                                          : DateFormat(DateFormat.ABBR_MONTH)
                                              .format(eventDate),
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: MyTheme.aboutlocatextcolors),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      bio.event_desc == ""
                                          ? "--"
                                          : DateFormat(DateFormat.DAY)
                                              .format(eventDate),
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: MyTheme.appbartextColor),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    bio.event_name == ''
                                        ? 'No upcoming events'
                                        : bio.event_name,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.appbartextColor),
                                  ),
                                  Text(
                                    bio.event_desc == ""
                                        ? "No upcoming events"
                                        : "Starts at ${bio.event_start} ",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.appbartextColor),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Container(
                                      height: 24,
                                      width: 56,
                                      child: isVisible == false
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Color(0xffF94510),
                                                  )),
                                              height: 24,
                                              width: 56,
                                              child: Center(
                                                child: Text(
                                                  'MORE',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    fontStyle: FontStyle.normal,
                                                    color: Color(0xffF94510),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ))
                                          : Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Color(0xffF94510),
                                                  )),
                                              height: 24,
                                              width: 56,
                                              child: Center(
                                                child: Text(
                                                  'LESS',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    fontStyle: FontStyle.normal,
                                                    color: Color(0xffF94510),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
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
                          Visibility(
                            visible: isVisible,
                            child: Text(
                              bio.event_desc == "" ? "" : bio.event_desc,
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff71757B)),
                            ),
                          ),

                          Divider(
                            thickness: 1,
                            color: Color(0xff71757B),
                          ),
                          SizedBox(
                            height: 29,
                          ),
                          Elevated(
                            color: MyTheme.appbackgroundColor,
                            text: 'Proceed to Menu',
                            width: MediaQuery.of(context).size.width,
                            onTap: () {
                              // final controller = Get.find<HomeController>();
                              widget.controller.foodItems =
                                  [widget.controller.defaultItem].obs;
                              widget.controller.getFoodItems(
                                  widget.restaurantModel.id.toString());
                              Get.find<OrderController>().getCart();
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => MenuPage(
                                        restaurantModel:
                                            widget.restaurantModel),
                                  ));
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Elevated(
                            text: "Schedule for later",
                            width: media.size.width,
                            backgroundColor: Colors.white,
                            borderColor: MyTheme.orangeColor,
                            onTap: () {
                              Get.back();
                            },
                          ),

                          // if (Platform.isIOS)
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
          ),
        )
      ],
    ));
  }
}

class ImageModel {
  final int currentIndex;
  final List<String> images;

  ImageModel(this.currentIndex, this.images);
}

class FullImage extends StatefulWidget {
  final ImageModel imageModel;
  const FullImage({Key? key, required this.imageModel}) : super(key: key);

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  PageController get pageController =>
      PageController(initialPage: widget.imageModel.currentIndex);

  late int currentIndex = widget.imageModel.currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            controller: pageController,
            children: widget.imageModel.images
                .map(
                  (e) => Hero(
                    tag: e,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: InteractiveViewer(
                          child: Image.network(
                            e,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
                widget.imageModel.images.length,
                (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 7,
                      width: index == this.currentIndex ? 15 : 7,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: index == this.currentIndex
                              ? Colors.grey
                              : Color(0xffE0E0E0),
                          borderRadius: BorderRadius.circular(10)),
                    )),
          ),
        ),
        SizedBox.square(
          dimension: 10,
        )
      ],
    ));
  }
}
