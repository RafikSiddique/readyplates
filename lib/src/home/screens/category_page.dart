/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates/src/home/home_controller.dart';
import 'package:readyplates/src/home/widgets/restaurant_card.dart';
import 'package:readyplates/utils/my_color.dart';

class CategoryPage extends GetView<HomeController> {
  final String category;
  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundcolor,
      appBar: AppBar(
        backgroundColor: MyTheme.backgroundcolor,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(FontAwesomeIcons.chevronLeft,
                color: MyTheme.appbartextColor),
            onPressed: () {
              Get.back();
            }),
        centerTitle: true,
        title: Text(
          category,
          style: TextStyle(
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: Obx(
        () => controller.restaurants.isNotEmpty &&
                controller.restaurants.first.id != -1 &&
                controller.restaurants.any((element) => element.types_of_cusine
                    .any((element) => element.toLowerCase() == category))
            ? Container(
                color: MyTheme.backgroundcolor,
                child: Column(
                  children: controller.restaurants
                      .where((element) => element.types_of_cusine
                          .any((element) => element.toLowerCase() == category))
                      .map(
                          (element) => RestaurantCard(restaurantModel: element.))
                      .toList(),
                ),
              )
            : Container(),
      ),
    );
  }
}
 */