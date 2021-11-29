import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/screens/category_page.dart';
import 'package:readyplates/src/home/widgets/restaurant_card.dart';
import 'package:readyplates/src/login/screens/mappage.dart';
import 'package:readyplates/utils/assets.dart';
import 'package:readyplates/utils/my_color.dart';

class ShopScreen extends StatelessWidget {
  static const id = "/shop";
  ShopScreen({Key? key}) : super(key: key);

  final List<String> category = [
    'Drinks',
    'Burger',
    'Pizza',
    'Seafood',
    'Steak',
    'Burger',
    'Fast Food',
    'Chinese',
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
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
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
                  LatLng latLng = LatLng(position.latitude, position.longitude);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapPage(isHome: false, latLng: latLng),
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
                    Icon(
                      Icons.gps_fixed,
                      size: 11,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child:
                          Text(controller.address.value.capitalize.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: MyTheme.appbartextColor,
                              )),
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
                          Get.to(() => CategoryPage(category: category[i]));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                //color: Color(0xffFCEBCD),
                                color: MyTheme.shopboxcolor.withOpacity(1),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              height: media.size.height * 0.08,
                              width: media.size.height * 0.08,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                categroyImg[i],
                                height:
                                    MediaQuery.of(context).size.height * 0.038,
                                width:
                                    MediaQuery.of(context).size.height * 0.038,
                              ),
                            ),
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
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Near Me',
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Obx(
                () => controller.restaurants.isNotEmpty &&
                        controller.restaurants.first.id != -1
                    ? Container(
                        color: MyTheme.backgroundcolor,
                        child: Column(
                          children: controller.restaurants
                              .map((element) =>
                                  RestaurantCard(restaurantModel: element))
                              .toList(),
                        ),
                      )
                    : controller.restaurants.isNotEmpty &&
                            controller.restaurants.first.id == -1
                        ? Center(child: CircularProgressIndicator.adaptive())
                        : Container(
                            padding: EdgeInsets.only(top: Get.height * 0.1),
                            alignment: Alignment.center,
                            child: Text(
                              "No Nearby restaurants found",
                              textScaleFactor: 1.5,
                              textAlign: TextAlign.center,
                            ),
                          ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
