import 'dart:math';

import 'package:get/get.dart';
import 'package:readyplates/modals/foog_item_model.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final List<FoodItemModel> foodItems = List.generate(
      20,
      (index) => FoodItemModel(
          id: Random().nextInt(20),
          name: "Food ${index + 1}",
          description: "Food Description ${index + 1}",
          image1: "",
          image2: "",
          diet_type: index.isEven ? "Veg" : "Non Veg",
          category: "",
          std_serving_size: "",
          other_serving_size: "",
          other_serving_cost: "",
          spice_level: Random().nextInt(5).toString(),
          cost: Random().nextInt(1000).toString(),
          restaurant: ""));
  List<String> bottomBarIcons = List.generate(5,
      (index) => "assets/images/BottomBar" + (index + 1).toString() + ".png");

  List<String> monthDate = List.generate(31, (index) => "${index + 1}");

  List<String> label = [
    "Home",
    "Location",
    "Orders",
    "Tell a Friend",
    "Profile"
  ];

  void onPageChange(int index) {
    currentIndex.value = index;
  }
}
