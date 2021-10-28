import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/home_controller.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MapPage.id);
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
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: MyTheme.hinttextColor,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(230, 230, 230, 0.547886),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          iconSize: 16,
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: MyTheme.appbartextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                //height: MediaQuery.of(context).size.height * 0.2,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  padding: EdgeInsets.zero,
                  children: [
                    for (var i = 0; i < category.length; i++)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              //color: Color(0xffFCEBCD),
                              color: MyTheme.shopboxcolor,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            height: media.size.height * 0.06,
                            width: media.size.height * 0.06,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            child: Image.asset(
                              categroyImg[i],
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.height * 0.035,
                            ),
                          ),
                          Text(category[i])
                        ],
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 17,
                ),
                child: Container(
                  width: 342,
                  height: 14,
                  child: Row(
                    children: [
                      Container(
                        width: 11,
                        height: 11,
                        child: Image.asset(Assets.location),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '32nd Street, Long Beach, San Francisco',
                        style: TextStyle(
                          fontSize: 10,
                          color: MyTheme.appbartextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Near Me'),
              ),
              Obx(
                () => controller.restaurants.isNotEmpty &&
                        controller.restaurants.first.id != -1
                    ? Container(
                        color: Colors.white,
                        child: Column(
                          children: controller.restaurants
                              .map((element) =>
                                  RestaurantCard(restaurantModel: element))
                              .toList(),
                        ),
                      )
                    : Container(),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
