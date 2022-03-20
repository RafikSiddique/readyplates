import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/widgets/restaurant_card.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class ShopScreen extends StatefulWidget {
  static const id = "/shop";
  final bool isLoggedIn;
  ShopScreen({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<String> category = [
    'Drinks',
    'Burgers',
    'Pizza',
    'Seafood',
    'Steak',
    'Barbeque',
    'Fast Food',
    'Hawaiian',
  ];

  final List<String> categroyImg = [
    Assets.categoryDrinks,
    Assets.categoryBurger,
    Assets.categoryPizza,
    Assets.categorySeafood,
    Assets.categorySteak,
    Assets.categoryBurger2,
    Assets.categoryFastfood,
    Assets.categoryChinese,
  ];

  final HomeController controller = Get.find();

  @override
  void initState() {
    if (mounted) setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (controller.selectedCategory.value == "") {
          Navigator.canPop(context);
          return true;
        } else {
          controller.selectedCategory.value = "";
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.backgroundcolor,
        appBar: AppBar(
          backgroundColor: MyTheme.backgroundcolor,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(FontAwesomeIcons.chevronLeft,
                  color: MyTheme.appbartextColor),
              onPressed: () async {
                bool isLocationEnabled =
                    await Geolocator.isLocationServiceEnabled();
                if (isLocationEnabled) {
                  LocationPermission permission =
                      await Geolocator.requestPermission();
                  if (permission == LocationPermission.denied ||
                      permission == LocationPermission.deniedForever) {
                    await Geolocator.openAppSettings();
                  } else {
                    Position position = await Geolocator.getCurrentPosition();
                    LatLng latLng =
                        LatLng(position.latitude, position.longitude);
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => MapPage(
                            isHome: false,
                            isLoggedIn: widget.isLoggedIn,
                            latLng: latLng,
                          ),
                        ));
                  }
                }
              }),
          centerTitle: true,
          title: Text(
            'Nearby Restaurants',
            style: TextStyle(
              fontSize: 17,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        controller.search(value);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyTheme.hinttextColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search"),
                    )),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 17,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: Get.width * 0.55,
                        child: Row(
                          children: [
                            Icon(
                              Icons.gps_fixed,
                              size: 11,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                controller.address.value.toUpperCase(),
                                overflow: TextOverflow.visible,
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appbartextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.walking,
                          size: 11,
                          color: MyTheme.dividermiddletext,
                        ),
                        onPressed: () {
                          showGeneralDialog(
                            context: context,
                            transitionDuration: Duration(milliseconds: 200),
                            transitionBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (context, a, b) {
                              double groupValue =
                                  controller.selectedMiles.value;
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Text("Show Restaurants under"),
                                titleTextStyle: GoogleFonts.nunito(
                                  fontSize: 15,
                                  color: MyTheme.aboutlocatextcolor,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                ),
                                content: Container(
                                  height: Get.height * 0.4,
                                  width: Get.width * 0.8,
                                  child: StatefulBuilder(
                                      builder: (c, s) => Scrollbar(
                                            interactive: true,
                                            isAlwaysShown: true,
                                            radius: Radius.circular(15),
                                            hoverThickness: 5,
                                            thickness: 5,
                                            child: ListView(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              children: controller.milesList
                                                  .map((e) =>
                                                      RadioListTile<double>(
                                                        activeColor:
                                                            MyTheme.buttonColor,
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        4),
                                                        value: e,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .trailing,
                                                        title: Text(
                                                          "${e.toInt()} Miles",
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 15,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: MyTheme
                                                                .appbartextColor,
                                                          ),
                                                        ),
                                                        groupValue: groupValue,
                                                        onChanged:
                                                            (value) async {
                                                          s(() {
                                                            groupValue =
                                                                value ?? 15;
                                                          });
                                                        },
                                                      ))
                                                  .toList(),
                                            ),
                                          )),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  TextButton(
                                      onPressed: () async {
                                        await controller.setMiles(groupValue);
                                        Navigator.pop(context);
                                        await controller.getRestaurants();
                                      },
                                      child: Text("Done"))
                                ],
                              );
                            },
                          );
                        },
                        label: Obx(
                          () => Row(
                            children: [
                              Text(
                                "Under ${controller.selectedMiles.value.toInt()} mi",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.appbartextColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 10,
                                  color: MyTheme.dividermiddletext,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    padding: EdgeInsets.zero,
                    children: [
                      for (var i = 0; i < category.length; i++)
                        InkWell(
                          onTap: () {
                            if (controller.selectedCategory.value ==
                                category[i])
                              controller.selectedCategory.value = "";
                            else
                              controller.selectedCategory.value = category[i];
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      boxShadow:
                                          controller.selectedCategory.value ==
                                                  category[i]
                                              ? [
                                                  BoxShadow(
                                                      spreadRadius: 0.5,
                                                      blurRadius: 15,
                                                      offset: Offset(0, 2),
                                                      color: Color.fromRGBO(
                                                          255, 110, 66, 1))
                                                ]
                                              : [],
                                      //color: Color(0xffFCEBCD),
                                      color:
                                          controller.selectedCategory.value ==
                                                  category[i]
                                              ? MyTheme.backcolor.withOpacity(1)
                                              : MyTheme.shopboxcolor,

                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    height: media.size.height * 0.08,
                                    width: media.size.height * 0.08,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      categroyImg[i],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.038,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.038,
                                    ),
                                  )),
                              SizedBox(
                                height: 2,
                              ),
                              Text(category[i],
                                  style: GoogleFonts.montserrat(
                                      // fontFamily: "Montserrat",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.black))
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Near Me',
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Obx(() => controller.selectedCategory.value.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                controller.selectedCategory.value = "";
                              },
                              child: Container(
                                  child: Row(
                                children: [
                                  Text(
                                    'Clear Filters',
                                    style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.clear,
                                    size: 15,
                                  ),
                                ],
                              )),
                            )
                          : Container())
                    ],
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return Obx(
                      () => controller.restaurants.isNotEmpty
                          ? controller.restaurants.first.id != -1
                              ? Container(
                                  color: MyTheme.backgroundcolor,
                                  child: Column(
                                      children: controller
                                                  .selectedCategory.value ==
                                              ""
                                          ? controller.restaurants
                                              .map((element) => RestaurantCard(
                                                  controller: controller,
                                                  restaurantModel: element))
                                              .toList()
                                          : controller.restaurants.any(
                                                  (element) => element
                                                      .types_of_cusine
                                                      .any((element) =>
                                                          element.toLowerCase() ==
                                                          controller
                                                              .selectedCategory
                                                              .value
                                                              .toLowerCase()))
                                              ? controller.restaurants
                                                  .where((element) => element
                                                      .types_of_cusine
                                                      .any((element) => element.toLowerCase() == controller.selectedCategory.value.toLowerCase()))
                                                  .map((element) => RestaurantCard(controller: controller, restaurantModel: element))
                                                  .toList()
                                              : [Container()]),
                                )
                              : Center(
                                  child: CircularProgressIndicator.adaptive())
                          : Container(
                              padding: EdgeInsets.only(top: Get.height * 0.1),
                              alignment: Alignment.center,
                              child: Text(
                                "No Nearby restaurants found",
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                            ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
